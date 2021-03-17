repeat wait() until game:IsLoaded()
local services = {}

local requirements = {
    'https://raw.githubusercontent.com/loglizzy/db-rage/main/modules/best-mode.lua'
}
for i,v in pairs(requirements) do
    local content = loadstring(game:HttpGet(v))()
    services[content.Name] = content.Function
end

return services
