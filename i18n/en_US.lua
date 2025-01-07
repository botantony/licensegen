return {
	-- config errors
	["error-template"] = "$red$Error$reset$: $error$",
	["config-unsupported-key"] = "key `$key$` uses unsupported type $type$ (use number or string)!",
	["config-unsupported-value"] = "value `$value$` uses unsupported type $type$ (use number or string)!",
	-- invalid aliases
	["error-invalid-alias-key"] = "invalid alias key `$key$` with value `$value$!",
	["error-invalid-alias-value"] = "invalid alias value `$value$` with key `$key$`!",
	["error-invalid-alias-string-type"] = "Key and value must be strings!",
	-- overlapping licenses
	["warning-template"] = "$yellow$Warning$reset$: $warning$",
	["warning-overlapping-licenses"] = "because names of the licenses are case-insensitive, these $type$ licenses are overlapping: $first$ and $second",
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
	["error-unknown-license"] = "unknown license `$name$`. Maybe you were looking for a different license with similar name:",
	["error-no-license-name"] = "no license name was provided!",
	["warning-unfilled-argument"] = "argument `$arg$` was not replaced!",
	["error-open-file"] = "An error occured during opening file `$path$`!",
	-- note formatting
	["note-format"] = "$blue$Note$reset$: $note$",
	-- done
	["done"] = "$green$DONE!$reset$",
}
