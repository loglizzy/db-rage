local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

local k = require(ReplicatedStorage["_replicationFolder"].SkillRequirements).Modes
local c = Players.LocalPlayer.Stats
local d = require(ReplicatedStorage["_replicationFolder"].ModeMultipliers)

local function s(t)
    local o = 0
    local c = {c.Attack.Value, c.Ki.Value,  c.Agility.Value, c.ZenkaiBoost.Value}
    
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
                    l = {n, m, i}
                end
            elseif s({v[2],v[3],v[4],v[5]}) then
                l = {n, m, i} --
            end
        end
    end
    return l
end

return {Name = 'best mode', Function = main}
