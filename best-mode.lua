local k = require(game.ReplicatedStorage["_replicationFolder"].SkillRequirements).Modes
local c = game.Players.LocalPlayer.Stats
c = {c.Attack.Value, c.Ki.Value,  c.Agility.Value, c.ZenkaiBoost.Value}
local d = require(game.ReplicatedStorage["_replicationFolder"].ModeMultipliers)

local function s(t)
    local o = 0
    for i,v in pairs(t) do
        if v <= c[i] then
            o = o + 1
        end
    end
    
    return o == 4
end

local function main()
    local l
    for i,v in pairs(k) do
        local n = v[1]
        local m = d[n]
    
        if n and m then
            if l then
                if l[2] < m and s({v[2],v[3],v[4],v[5]}) then
                    l = {n, i}
                end
            elseif s({v[2],v[3],v[4],v[5]}) then
                l = {n, i}
            end
        end
    end
    return l
end

return {Name = 'best mode', Function = main}
