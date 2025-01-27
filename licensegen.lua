package.path = debug.getinfo(1, "S").source:match("^@(.*/)") .. "?.lua;" .. package.path
local version = "1.2.0"
local config = require("cfg") -- also defines I18n
local text_utils = require("text_utils")
local table_utils = require("table_utils")
local file_utils = require("file_utils")
local metadata = require("metadata")
local show_meta = false

local licensesHashMap = { standard = {}, custom = {} }

for license, _ in pairs(config.customLicenses) do
	if licensesHashMap.custom[license:lower()] then
		I18n:printErrOrWarning(
			true,
			I18n:msg("warning-overlapping-licenses", {
				type = I18n:msg("license-type-custom"),
				first = licensesHashMap.custom[license:lower()],
				second = license,
			})
		)
	end
	licensesHashMap.custom[license:lower()] = license
end

for license, _ in pairs(config.licenses) do
	if licensesHashMap.standard[license:lower()] then
		I18n:printErrOrWarning(
			true,
			I18n:msg("warning-overlapping-licenses", {
				type = I18n:msg("license-type-standard"),
				first = licensesHashMap.standard[license:lower()],
				second = license,
			})
		)
	end
	licensesHashMap.standard[license:lower()] = true
end

-- set default variables
config.filename = config.filename or "LICENSE"
config.year = config.year or os.date("%Y")
config.project = config.project or config.workdir:match(".*/([^/]+)$")
config.owner = config.owner or (os.getenv("USERNAME") or os.getenv("USER") or os.getenv("LOGNAME"))
config.licensename = config.licensename or nil

-- do not change values of these config variables
local configConstants = {
	["licenses"] = true,
	["licensesDir"] = true,
	["customLicensesDir"] = true,
	["customLicenses"] = true,
	["cfg"] = true,
	-- this can be changes only via config file
	["locale"] = true,
	["aliases"] = true,
}

-- process args
for i = 1, #arg do
	if arg[i] == "-h" or arg[i] == "--help" then
		I18n:print("cli-help")
		for k, _ in table_utils.spairs(configConstants) do
			if k ~= "locale" and k ~= "aliases" then
				print("	" .. k)
			end
		end
		I18n:print("cli-help-cfg-only")
		for k, _ in table_utils.spairs({ locale = 1, aliases = 1 }) do
			if k ~= "locale" or k ~= "aliases" then
				print("	" .. k)
			end
		end
		os.exit()
	elseif arg[i] == "--list" or arg[i] == "--licenses" then
		if table_utils.size(config.customLicenses) ~= 0 then
			I18n:print("license-list-custom-licenses")
		end
		for license, _ in table_utils.spairs(config.customLicenses) do
			io.stdout:write("	")
			if licensesHashMap.standard[license:lower()] then
				I18n:print("license-list-overwrites", { license = license })
			else
				print(license)
			end
		end
		print(I18n:msg("license-list-standard-licenses"))
		for license, _ in table_utils.spairs(config.licenses) do
			io.stdout:write("	")
			if licensesHashMap.custom[license:lower()] then
				I18n:print("license-list-overwritten", { license = license })
			else
				print(license)
			end
		end
		os.exit()
	elseif arg[i] == "--cfg" or arg[i] == "--config" then
		I18n:print("cli-config-directory", { dir = config.cfg, slash = file_utils.slash })
		os.exit()
	elseif arg[i] == "-a" or arg[i] == "--aliases" then
		print(I18n:msg("cli-aliases"))
		for k, v in table_utils.spairs(config.aliases) do
			print("	" .. k .. " -> " .. v)
		end
		os.exit()
	elseif arg[i]:match("^%-%-%a+%=.+") then
		local argument, value = arg[i]:match("^%-%-(%a+)%=(.+)")
		if not configConstants[argument] and argument ~= "licensename" then
			if argument == "file" then
				argument = "filename"
			end
			if argument == "user" or argument == "username" or argument == "organization" then
				argument = "owner"
			end
			if argument == "workdir" then
				value = file_utils.expandPath(value)
			end
			config[argument] = value
		end
	elseif arg[i] == "-v" or arg[i] == "--version" then
		print(version)
		os.exit()
	elseif arg[i] == "-i" or arg[i] == "--info" then
		show_meta = true
	else
		config.licensename = arg[i]
		local arg_lower = config.licensename:lower()
		if config.aliases[arg_lower] then
			config.licensename = config.aliases[arg_lower]
			arg_lower = config.licensename:lower()
		end
		if not licensesHashMap.custom[arg_lower] and not licensesHashMap.standard[arg_lower] then
			local similarity = {}
			for k, _ in pairs(config.customLicenses) do
				similarity[k] = text_utils.distance(k:lower(), arg_lower)
			end
			for k, _ in pairs(config.licenses) do
				if not similarity[k] then
					similarity[k] = text_utils.distance(k:lower(), arg_lower)
				end
			end
			I18n:printErrOrWarning(false, I18n:msg("error-unknown-license", { name = config.licensename }))
			local counter = 0
			for name, _ in
				table_utils.spairs(similarity, function(t, a, b)
					return t[a] > t[b]
				end)
			do
				if counter >= 5 then
					break
				end
				counter = counter + 1
				io.stderr:write("	" .. name .. "\n")
			end
			os.exit()
		end
	end
end

if not config.licensename then
	I18n:printErrOrWarning(false, I18n:msg("error-no-license-name"))
	I18n:print("cli-help")
	for k, _ in table_utils.spairs(configConstants) do
		if k ~= "locale" and k ~= "aliases" then
			print("	" .. k)
		end
	end
	I18n:print("cli-help-cfg-only")
	for k, _ in table_utils.spairs({ locale = 1, aliases = 1 }) do
		if k ~= "locale" or k ~= "aliases" then
			print("	" .. k)
		end
	end
	os.exit(1)
end

if show_meta then
	local curr_meta = metadata[config.licensename]
	print(curr_meta["title"])
	print("SPDX-ID: " .. curr_meta["spdx-id"] .. "\n")
	I18n:print("description-" .. config.licensename)
	print()
	I18n:print("usage-header")
	for k, v in table_utils.spairs(curr_meta["using"]) do
		I18n:print("metadata-format", { label = k, desc = v })
	end
	print()
	-- permissions
	I18n:print("permissions-header")
	for k, _ in table_utils.spairs(curr_meta["permissions"]) do
		local perm_label = I18n:msg("permissions-" .. k)
		local perm_desc = I18n:msg("permissions-" .. k .. "-verbose")
		I18n:print("metadata-format", { label = perm_label, desc = perm_desc })
	end
	print()
	-- conditions
	I18n:print("conditions-header")
	for k, _ in table_utils.spairs(curr_meta["conditions"]) do
		local perm_label = I18n:msg("conditions-" .. k)
		local perm_desc = I18n:msg("conditions-" .. k .. "-verbose")
		I18n:print("metadata-format", { label = perm_label, desc = perm_desc })
	end
	print()
	-- limitations
	I18n:print("limitations-header")
	for k, _ in table_utils.spairs(curr_meta["limitations"]) do
		local perm_label = I18n:msg("limitations-" .. k)
		local perm_desc = I18n:msg("limitations-" .. k .. "-verbose")
		I18n:print("metadata-format", { label = perm_label, desc = perm_desc })
	end
	print()
	-- print note (if present)
	local curr_note = I18n:msgEmpty("note-" .. config.licensename)
	if curr_note and curr_note ~= "" then
		I18n:print("note-format", { note = curr_note })
	end
	os.exit()
end

-- process license file
local filepath = (licensesHashMap.custom[config.licensename:lower()] and config.customLicensesDir or config.licensesDir)
filepath = filepath .. file_utils.slash .. config.licensename .. ".txt"
local licenseFile = io.open(filepath, "r")

if not licenseFile then
	I18n:printErrOrWarning(false, I18n:msg("error-open-file", { path = filepath }))
	os.exit(1)
end

local outputText = licenseFile:read("*a")
licenseFile:close()

local replace = {}
for k, v in pairs(config) do
	if not configConstants[k] then
		replace[k] = v
	end
end

outputText = text_utils.replaceArgs(outputText, replace)

if outputText:match("%$[^%s]+%$") then
	for argument in string.gmatch(outputText, "%$[^%s]+%$") do
		I18n:printErrOrWarning(true, I18n:msg("warning-unfilled-argument", { arg = argument }))
	end
end

filepath = config.workdir .. file_utils.slash .. config.filename

local outputFile = io.open(filepath, "w")
if not outputFile then
	I18n:printErrOrWarning(false, I18n:msg("error-open-file", { path = filepath }))
	os.exit(1)
end

outputFile:write(outputText)
outputFile:close()

local note = I18n:msgEmpty("note-" .. config.licensename:lower())
if note and note ~= "" then
	I18n:print("note-format", { note = note })
	print("\n")
end

I18n:print("done")
