local services = loadstring(game:HttpGet('https://raw.githubusercontent.com/loglizzy/db-rage/main/loader.lua'))()

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local Workspace = game:GetService('Workspace')
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local charge = ReplicatedStorage.Remotes.Training.Charge

do -- auto mode
    local best_mode = services['best mode']
    
    local skill = ReplicatedStorage.Remote.RequestSkill
    local mode = ReplicatedStorage.Remote.Mode
    
    spawn(function()
        while wait() do
            local current = best_mode()
            if player.Status.ModeActive.Value ~= current[1] then
                skill:InvokeServer('Modes', current[3])
                
                mode:InvokeServer('Transform', false, 'Normal')
            end
        end
    end)
end

do -- auto farm
    local next_farm = services['next farm']
    
    local modes = require(game.ReplicatedStorage["_replicationFolder"].SkillRequirements).Modes
    local finish = ReplicatedStorage.Remotes.Training.ChargeFinish
    
    
    local defense = ReplicatedStorage.Remotes.Training.Defense
    local blast = ReplicatedStorage.Remote.KiBlast
    local combat = ReplicatedStorage.Remotes.Training.Combat
    
    
    spawn(function()
        while wait(.2) do
            local ki = player.Status.Energy
            local stat = next_farm()
            
            if ki.Value < 10 then
                if player.Character and player.Character:FindFirstChild('Humanoid') then
                    player.Character.Humanoid.Health = 0
                end
            end
            
            if stat == 1 then
                combat:InvokeServer()
            elseif stat == 2 then
                blast:InvokeServer()
            elseif stat == 3 then
                defense:InvokeServer()
            end
        end
    end)
end
