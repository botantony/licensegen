local utils = {}

function utils.replaceArgs(text, args)
    for k, v in pairs(args) do
        text = text:gsub("%$" .. tostring(k) .. "%$", tostring(v))
    end
    return text
end

-- Jaro-Winkler distance algorithm
function utils.distance(s1, s2)
    local math_max, math_min = math.max, math.min
    if s1 == s2 then
        return 1.0
    end

    local s1len, s2len = #s1, #s2

    if s1len == 0 or s2len == 0 then
        return 0.0
    end

    local maxDist = math.floor(math_max(s1len, s2len) / 2) - 1
    local hashS1, hashS2 = {}, {}
    local matches, transpositions = 0, 0

    for i = 1, s1len do
        local start = math_max(1, i - maxDist)
        local stop = math_min(s2len, i + maxDist)
        for j = start, stop do
            if not hashS2[j] and s1:sub(i, i) == s2:sub(j, j) then
                hashS1[i], hashS2[j] = true, true
                matches = matches + 1
                break
            end
        end
    end

    if matches == 0 then
        return 0.0
    end

    local k = 1

    for i = 1, s1len do
        if hashS1[i] then
            while not hashS2[k] do
                k = k + 1
            end
            if s1:sub(i, i) ~= s2:sub(k, k) then
                transpositions = transpositions + 1
            end
            k = k + 1
        end
    end

    local jaroSim = (matches / s1len + matches / s2len + (matches - transpositions / 2) / matches) / 3
    local weight = 0.1
    local prefixLen = 0

    for i = 1, math_min(s1len, s2len, 4) do
        if s1:sub(i, i) == s2:sub(i, i) then
            prefixLen = prefixLen + 1
        else
            break
        end
    end

    return jaroSim + (prefixLen * weight * (1 - jaroSim))
end

return utils
