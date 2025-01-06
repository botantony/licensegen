package.path = debug.getinfo(1, "S").source:match("^@(.*/)") .. "?.lua;" .. package.path
local config = require("cfg") -- also defines I18n
local text_utils = require("text_utils")
local table_utils = require("table_utils")
local file_utils = require("file_utils")
local notes = require("i18n." .. config.locale .. "_notes")

local licensesHashMap = { standard = {}, custom = {} }

for license, _ in pairs(config.customLicenses) do
	if licensesHashMap.custom[license:lower()] then
		io.stderr:write(I18n:msg("warning-overlapping-licenses", {
			type = I18n:msg("license-type-custom"),
			first = licensesHashMap.custom[license:lower()],
			second = license,
		}))
	end
	licensesHashMap.custom[license:lower()] = license
end

for license, _ in pairs(config.licenses) do
	if licensesHashMap.standard[license:lower()] then
		io.stderr:write(I18n:msg("warning-overlapping-licenses", {
			type = I18n:msg("license-type-standard"),
			first = licensesHashMap.standard[license:lower()],
			second = license,
		}))
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
		print(I18n:msg("cli-help"))
		for k, _ in table_utils.spairs(configConstants) do
			if k ~= "locale" and k ~= "aliases" then
				print("	" .. k)
			end
		end
		print(I18n:msg("cli-help-cfg-only"))
		for k, _ in table_utils.spairs({ locale = 1, aliases = 1 }) do
			if k ~= "locale" or k ~= "aliases" then
				print("	" .. k)
			end
		end
		os.exit()
	elseif arg[i] == "--list" or arg[i] == "--licenses" then
		if table_utils.size(config.customLicenses) ~= 0 then
			print(I18n:msg("license-list-custom-licenses"))
		end
		for license, _ in table_utils.spairs(config.customLicenses) do
			io.stdout:write("	")
			if licensesHashMap.standard[license:lower()] then
				I18n:msg("license-list-overwrites", { license = license })
			else
				print(license)
			end
		end
		print(I18n:msg("license-list-default-licenses"))
		for license, _ in table_utils.spairs(config.licenses) do
			io.stdout:write("	")
			if licensesHashMap.custom[license:lower()] then
				I18n:msg("license-list-overwritten", { license = license })
			else
				print(license)
			end
		end
		os.exit()
	elseif arg[i] == "--cfg" or arg[i] == "--config" then
		print(I18n:msg("cli-config-directory", { dir = config.cfg, slash = file_utils.slash }))
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
			io.stderr:write(I18n:msg("error-unknown-license", { name = config.licensename }))
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
	io.stderr:write(I18n:msg("error-no-license-name"))
	print(I18n:msg("cli-help"))
	for k, _ in table_utils.spairs(configConstants) do
		if k ~= "locale" and k ~= "aliases" then
			print("	" .. k)
		end
	end
	print(I18n:msg("cli-help-cfg-only"))
	for k, _ in table_utils.spairs({ locale = 1, aliases = 1 }) do
		if k ~= "locale" or k ~= "aliases" then
			print("	" .. k)
		end
	end
	os.exit(1)
end

-- process license file
local filepath = (licensesHashMap.custom[config.licensename:lower()] and config.customLicensesDir or config.licensesDir)
filepath = filepath .. file_utils.slash .. config.licensename .. ".txt"
local licenseFile = io.open(filepath, "r")

if not licenseFile then
	io.stderr:write(I18n:msg("error-open-file", { path = filepath }))
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
		io.stderr:write(I18n:msg("warning-unfilled-argument", { arg = argument }))
	end
end

filepath = config.workdir .. file_utils.slash .. config.filename

local outputFile = io.open(filepath, "w")
if not outputFile then
	io.stderr:write(I18n:msg("error-open-file", { path = filepath }))
	os.exit(1)
end

outputFile:write(outputText)
outputFile:close()

if notes[config.licensename:lower()] then
	print(I18n:msg("note-format", { note = notes[config.licensename:lower()] }))
	print("\n")
end

print(I18n:msg("done"))
