local i18n, _i18n = {}, {}

local l10ns = {}
local en = "en_US"
local replaceArgs = require("text_utils").replaceArgs
local file_utils = require("file_utils")
local colors = require("colors")

local function setLang(locale)
    local l10n = file_utils.isModuleAvailable("i18n." .. locale)
    l10ns[en] = require("i18n.en_US")
    if l10n == nil then
        _i18n.locale = en
    else
        l10ns[locale] = require("i18n." .. locale)
        _i18n.locale = locale
    end
end

function _i18n:msg(key, args)
    local output_msg = l10ns[_i18n.locale][key] or l10ns[en][key]
    if not output_msg then
        return "<" .. key .. ">"
    end

    args = args or {}

    for k, v in pairs(colors) do
        args[k] = v
    end

    return replaceArgs(output_msg, args or {})
end

function _i18n:msgEmpty(key, args)
    local output_msg = l10ns[_i18n.locale][key] or l10ns[en][key]
    if not output_msg then
        return ""
    end

    args = args or {}

    for k, v in pairs(colors) do
        args[k] = v
    end

    return replaceArgs(output_msg, args or {})
end

function _i18n:print(key, args)
    print(I18n:msg(key, args))
end

function _i18n:printErrOrWarning(warn, msg)
    local template = warn and "warning" or "error"
    io.stderr:write(I18n:msg(template .. "-template", { [template] = msg }))
    io.stderr:write("\n")
end

function i18n.loadMsg(locale)
    setLang(locale)
    return _i18n
end

return i18n
