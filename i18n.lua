local i18n, _i18n = {}, {}

local l10ns = {}
local en = "en_US"
local replaceArgs = require("text_utils").replaceArgs

local function setLang(locale)
	local sep = package.config:sub(1, 1)
	local l10n = io.open("i18n" .. sep .. locale .. ".lua", "r")
	l10ns[en] = require("i18n.en_US")
	if l10n == nil then
		_i18n.locale = en
	else
		l10n:close()
		l10ns[locale] = require("i18n." .. locale)
		_i18n.locale = locale
	end
end

function _i18n:msg(key, args)
	local output_msg = l10ns[_i18n.locale][key] or l10ns[en][key]
	if not output_msg then
		return "<" .. key .. ">"
	end

	return replaceArgs(output_msg, args or {})
end

function i18n.loadMsg(locale)
	setLang(locale)
	return _i18n
end

return i18n
