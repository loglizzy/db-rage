local services = loadstring(game:HttpGet('https://raw.githubusercontent.com/loglizzy/db-rage/main/loader.lua'))()

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local Workspace = game:GetService('Workspace')
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local best = services['best mode']

do -- auto mode
    local skill = ReplicatedStorage.Remote.RequestSkill
    local mode = ReplicatedStorage.Remote.Mode
    
    spawn(function()
        while wait() do
            local current = best()
            if player.Status.ModeActive.Value ~= current[1] then
                skill:InvokeServer('Modes', current[3])
                
                mode:InvokeServer('Transform', false, 'Normal')
            end
        end
    end)
end
