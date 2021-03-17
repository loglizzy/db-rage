repeat wait() until game:IsLoaded()

local services = {}

local success, err = pcall(function()
    local requirements = {
    'https://raw.githubusercontent.com/loglizzy/db-rage/main/best-mode.lua'
}
    
    for i,v in pairs(requirements) do
        local content = loadstring(game:HttpGet(v))()
        
        services[content.Name] = content.Function
    end
end)

if succcess then
  return requirements
else
  return err
end
