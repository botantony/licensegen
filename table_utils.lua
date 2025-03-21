local utils = {}

function utils.size(tbl)
    local i = 0
    for _, _ in pairs(tbl) do
        i = i + 1
    end
    return i
end

function utils.spairs(t, order)
    local keys = {}

    for k in pairs(t) do
        keys[#keys + 1] = k
    end

    if order then
        table.sort(keys, function(a, b)
            return order(t, a, b)
        end)
    else
        table.sort(keys)
    end

    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

return utils
