local utils = {}

local open = io.open

-- read the contents of a file
function utils.read_file(path)
    local file = open(path, "rb")
    if not file then return nil end
    local content = file:read "*a"
    file:close()
    return content
end

-- writes a buffer to disk
function utils.write_file(path, data)
    local file = open(path, "wb")
    if not file then return end
    file:write(data)
    file:close()
end

function utils.kickPlayer(player, reason)
    util.executeCommand(string.format("kickclient %i %s", player:getentitynumber(), reason))    
end

function utils.getTableSize(table)
    local count = 0
    for _ in pairs(table) do count = count + 1 end
    return count
end

function utils.tell(player, message, ...)
    player:tell(
        string.format(
            "^0[^7%s^0]^7: %s", settingshandler.settings.sayName, 
            string.format(message, ...)
        )
    )
end

return utils