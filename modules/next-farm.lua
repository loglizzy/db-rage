local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local c = Players.LocalPlayer.Stats

local k = require(ReplicatedStorage["_replicationFolder"].SkillRequirements).Modes
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

local function t()
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
                l = {n, m, i}
            end
        end
    end
    return l
end

local function main()
    local e = k[t()[3]+1]
    local q = {e[2], e[3],  e[4]}
    
    local c = {c.Attack.Value, c.Ki.Value,  c.Agility.Value}
    local r = {q[1] - c[1], q[2] - c[2], q[3] - c[3]}
    
    for i,v in pairs(r) do
        if v > 0 then
            return i
        end
    end
end

return {Name = 'next farm', Function = main}
