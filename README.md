[![GitHub License](https://img.shields.io/github/license/botantony/licensegen)](https://spdx.org/licenses/BSD-4-Clause.html)
[![LuaRocks](https://img.shields.io/luarocks/v/botantony/licensegen)](https://luarocks.org/modules/botantony/licensegen)
[![GitHub Tag](https://img.shields.io/github/v/tag/botantony/licensegen)](https://github.com/botantony/licensegen/tags)

[English (Default)](README.md) • [Русский](readme_i18n/ru.md)

Small Lua-based utility that generates license file in your current directory.

[![Licensegen demo](https://asciinema.org/a/05VjCIvSHRufPjatfqNhREZfT.svg)](https://asciinema.org/a/05VjCIvSHRufPjatfqNhREZfT)

## Installation
### LuaRocks
Use the following command:
```console
sudo luarocks install licensegen
```

### Manual
1. Clone this project
2. (optional) Add directory of this project to your `$PATH` variable
3. Use `licensegen` or `lua licensegen.lua`

## Usage
```console
licensegen <licensename> --<arg1>=<val1> --<arg2>=<val2> ...
```

There are also some options that do not create license file but output useful information:
- `-h` or `--help` - Show help page
- `-v` or `--version` - Show version
- `-a` or `--aliases` - Show aliases
- `-i` or `--info` - Show detailed info about the license
- `--list` or `--licenses` - List all licenses
- `--cfg` or `--config` - Show config directory

Replace arguments must be set in the following format: `--<arg>=<text>`, f.e. `--owner=username` or `--owner="Your Full Name"`. All arguments (with some exceptions) can be set in config and overwritten by CLI parameters.

There are some specific arguments that may be set automatically:
- aliases - Sets aliases for licenses (table, check `--aliases` for the full list)
- filename - Name of the output file (`LICENSE` by default)
- licensename -License type you want to use (only for config file)
- owner - Owner of the project (name of the current user by default)
- project - Name of the project (name of the current directory by default)
- workdir - Full path to the project
- year - Current year

## Config
If a user creates `~/.config/licensegen/` directory (for Unix) or `%LOCALAPPDATA\licensegen\` folder, `config.lua` from can be used to set default default values. For example:
```lua
return {
    owner = "My Name",
    aliases = {
        bsd = "bsd-4-clause",
    },
}
```
This config file sets `My Name` as default `$owner$` variable and `bsd` is now an aliase to `bsd-4-clause`.

## Custom licenses
While creating a custom license is [generally a bad idea](https://ben.balter.com/2016/08/01/why-you-shouldnt-write-your-own-open-source-license/), this project doesn't list all existing licenses that you might need to use. In this case you can create folder `licenses` in config directory and copy text of license template with `.txt` extension. Keep in mind that "custom" licenses have higher priority over the "standard" ones.

## License source
All licenses were taken from [choosealicense.com](https://github.com/github/choosealicense.com) repo.
