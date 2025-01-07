-- Load config
local config = {}

local file_utils = require("file_utils")

local function getConfigPath()
	local osType = file_utils.osType
	if osType == "windows" then
		return os.getenv("LOCALAPPDATA") .. file_utils.slash .. "licensegen"
	else
		return os.getenv("HOME") .. "/.config/licensegen"
	end
end

local function getLocale(customLocale)
	local locale, _ = os.getenv("LANG"):match("([^.]*).*")
	locale = customLocale or locale
	local file = file_utils.isModuleAvailable("i18n." .. locale)
	if not file then
		locale = "en_US"
	end
	return locale
end

local function getLicenses(dir)
	local files = {}
	if not file_utils.directoryExists(dir) then
		return {}
	end
	for _, v in pairs(file_utils.getListOfFiles(dir)) do
		local file, ext = v:match("(.*)%.([%a]+)$")
		if ext == "txt" then
			files[file] = true
		end
	end
	return files
end

local function standardLicensesPath()
	local path = file_utils.getScriptDir() .. "licenses"
	local err
	if not file_utils.directoryExists(path) then
		local datafile = require("datafile").path
		path, err = datafile("licenses/bsd-4-clause.txt", "r")
		if path then
			path = path:match("(.*" .. file_utils.slash .. ")")
		else
			io.stderr:write("Error: " .. err)
			path = nil
		end
	end
	return path
end

config.cfg = getConfigPath()
config.customLicensesDir = config.cfg .. file_utils.slash .. "licenses"
config.customLicenses = getLicenses(config.customLicensesDir)
config.licensesDir = standardLicensesPath()
config.licenses = getLicenses(config.licensesDir)
config.workdir = os.getenv("PWD")
config.aliases = {
	["afl"] = "afl-3.0",
	["apgl"] = "apgl-3.0",
	["apache"] = "apache-2.0",
	["artistic"] = "artistic-2.0",
	["blueoak"] = "blueoak-1.0.0",
	["bsd-4"] = "bsd-4-clause",
	["bsl"] = "bsl-1.0",
	["cc0"] = "cc0-1.0",
	["cecil"] = "cecil-2.1",
	["ecl"] = "ecl-2.0",
	["gfdl"] = "gfdl-1.3",
	["lppl"] = "lppl-1.3c",
	["mpl"] = "mpl-2.0",
	["mulanpsl"] = "mulanpsl-2.0",
	["odbl"] = "odbl-1.0",
	["ofl"] = "ofl-1.0",
	["osl"] = "osl-3.0",
	["upl"] = "upl-1.0",
}

local fullConfigPath = config.cfg .. file_utils.slash .. "config.lua"
local oldPackagePath = package.path
package.path = config.cfg .. file_utils.slash .. "?.lua;" .. file_utils.getScriptDir() .. file_utils.slash .. "?.lua"
if file_utils.fileExists(fullConfigPath) then
	local lua_cfg = require("config")
	local getLocaleArg = "en_US"
	if lua_cfg.locale and type(lua_cfg.locale) == "string" then
		getLocaleArg = getLocale(lua_cfg.locale)
	end
	config.locale = getLocale(getLocaleArg)
	I18n = require("i18n").loadMsg(config.locale)
	local function mergeAliases(t1, t2)
		local output = {}
		for k, v in pairs(t1) do
			if type(k) ~= "string" then
				I18n:printErrOrWarning(
					false,
					I18n:msg("error-invalid-alias-key", { key = tostring(k), value = tostring(v) })
				)
				io.stderr:write(I18n:msg("error-invalid-alias-string-type"))
				io.stderr:write("\n")
			elseif type(v) ~= "string" then
				I18n:printErrOrWarning(
					false,
					I18n:msg("error-invalid-alias-value", { key = tostring(k), value = tostring(v) })
				)
				io.stderr:write(I18n:msg("error-invalid-alias-string-type"))
				io.stderr:write("\n")
			else
				output[k] = v:lower()
			end
		end
		for k, v in pairs(t2) do
			if type(k) ~= "string" then
				I18n:printErrOrWarning(
					false,
					I18n:msg("error-invalid-alias-key", { key = tostring(k), value = tostring(v) })
				)
				io.stderr:write(I18n:msg("error-invalid-alias-string-type"))
				io.stderr:write("\n")
			elseif type(v) ~= "string" then
				I18n:printErrOrWarning(
					false,
					I18n:msg("error-invalid-alias-value", { key = tostring(k), value = tostring(v) })
				)
				io.stderr:write(I18n:msg("error-invalid-alias-string-type"))
				io.stderr:write("\n")
			else
				output[k] = v:lower()
			end
		end
		return output
	end

	for k, v in pairs(lua_cfg) do
		if type(k) == "string" or type(k) == "number" then
			if k == "aliases" then
				if type(v) == "table" then
					config.aliases = mergeAliases(v, config.aliases)
				end
			elseif type(v) == "string" or type(v) == "number" then
				config[k] = config[k] or v
			else
				I18n:printErrOrWarning(
					false,
					I18n:msg("config-unsupported-value", { type = type(v), value = tostring(v) })
				)
			end
		else
			I18n:printErrOrWarning(false, I18n:msg("config-unsupported-key", { type = type(k), key = tostring(k) }))
		end
	end
else
	config.locale = getLocale()
	I18n = require("i18n").loadMsg(config.locale)
end
package.path = oldPackagePath

return config
