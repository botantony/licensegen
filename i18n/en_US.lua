local colors = require("i18n._color")
return {
	-- config errors
	["config-unsupported-key"] = colors.red
		.. "Error"
		.. colors.reset
		.. ": key `$key$` uses unsupported type $type$ (use number or string)!\n",
	["config-unsupported-value"] = colors.red
		.. "Error"
		.. colors.reset
		.. ": value `$value$` uses unsupported type $type$ (use number or string)!\n",
	-- invalid aliases
	["error-invalid-alias-key"] = colors.red
		.. "Error"
		.. colors.reset
		.. ": invalid alias key `$key$` with value `$value$!\nKey and value must be strings!\n",
	["error-invalid-alias-value"] = colors.red
		.. "Error"
		.. colors.reset
		.. ": invalid alias value `$value$` with key `$key$`!\nKey and value must be strings!\n",
	-- overlapping licenses
	["warning-overlapping-licenses"] = colors.yellow
		.. "Warning"
		.. colors.reset
		.. ": because names of the licenses are case-insensitive, these $type$ licenses are overlapping: $first$ and $second",
	["license-type-custom"] = "custom",
	["license-type-standard"] = "standard",
	-- license list
	["license-list-custom-licenses"] = "Custom licenses:",
	["license-list-overwrites"] = "$license$ (overwrites standard license)",
	["license-list-overwritten"] = "$license$ (overwritten by custom license)",
	["license-list-standard-licenses"] = "Standard licenses:",
	-- help
	["cli-help"] = [==[Small tool for generating license files
USAGE:

	licensegen [OPTIONS] [LICENSE] [ARGUMENTS]

OPTIONS:

	-h,     --help        Show this help
	-a,     --aliases     Show aliases
	--list, --licenses    List all licenses
	--cfg,  --config      Show config directory

ARGUMENTS:

Replace arguments must be set in the following format: `--<arg>=<text>`, f.e. `--owner=username` or `--owner="Your Full Name"`. All arguments (with some exceptions) can be set in config and overwritten by CLI parameters.

There are some specific arguments that may be set automatically:
	aliases       Sets aliases for licenses (table, check `--aliases` for the full list)
	filename      Name of the output file (`LICENSE` by default)
	licensename   License type you want to use (only for config file)
	owner         Owner of the project (name of the current user by default)
	project       Name of the project (name of the current directory by default)
	workdir       Full path to the project
	year          Current year

List of arguments that are reserved:]==],
	["cli-help-cfg-only"] = "These arguments can be set only via config file:",
	["cli-aliases"] = "List of all aliases to different licenses. You can set your own aliases or rewrite existing ones in config file:",
	-- config path
	["cli-config-directory"] = [==[Full path to the config directory: $dir$$slash$
Config file: $dir$$slash$config.lua
Directory with custom licenses: $dir$$slash$licenses$slash$]==],
	["error-unknown-license"] = colors.red
		.. "Error"
		.. colors.reset
		.. ": unknown license `$name$`. Maybe you were looking for a different license with similar name:\n",
	["error-no-license-name"] = colors.red .. "Error" .. colors.reset .. ": no license name was provided!\n",
	["warning-unfilled-argument"] = colors.yellow
		.. "Warning"
		.. colors.reset
		.. ": argument `$arg$` was not replaced!\n",
	["error-open-file"] = colors.red .. "An error occured during opening file `$path$`!\n" .. colors.reset,
	-- note formatting
	["note-format"] = colors.blue .. "Note" .. colors.reset .. ": $note$",
	-- done
	["done"] = colors.green .. "DONE!" .. colors.reset,
}
