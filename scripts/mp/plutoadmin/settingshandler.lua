local settingshandler = {  }

local settingsFile = utils.read_file("settings.json")

if settingsFile == nil or string.len( settingsFile ) == 0 then
    util.print("Error: settings.json is empty!")
else
    -- expose settings
    settingshandler.settings = json.decode(settingsFile)
end

return settingshandler
