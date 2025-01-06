local colors = {}

local esc = string.char(27, 91)

colors.reset = esc .. "0m"
colors.red = esc .. tostring(31) .. "m"
colors.green = esc .. tostring(32) .. "m"
colors.yellow = esc .. tostring(33) .. "m"
colors.blue = esc .. tostring(34) .. "m"

return colors
