AddEventHandler('playerConnecting', function()
    local name = GetPlayerName(source)
    local id = GetPlayerIdentifier(source)
    if name and id then TriggerEvent('bot:SendToDiscord', 'Player Connecting', name..' ('..id..') is connecting to the server') end
end)

AddEventHandler('playerDropped', function(Reason)
    local name = GetPlayerName(source)
    local id = GetPlayerIdentifier(source)
    if name and id then TriggerEvent('bot:SendToDiscord', 'Player Disconnected', name..' ('..id..') left the server ('..Reason..')') end
end)

RegisterServerEvent('bot:playerDied')
AddEventHandler('bot:playerDied', function(Message, Weapon)
    if Weapon then Message = Message .. ' [' .. Weapon .. ']' end
    TriggerEvent('bot:SendToDiscord', 'Player Death', Message)
end)

--  TriggerEvent('bot:SendToDiscord', 'TITLE', 'MESSAGE')
RegisterServerEvent('bot:SendToDiscord')
AddEventHandler('bot:SendToDiscord', function(Name, Message)
    if Message == nil or Message == '' then return nil end
    PerformHttpRequest('webhook link here', function() end, 'POST', json.encode({username = Name, content = '```\n'..Message..'```'}), {['Content-Type'] = 'application/json'})
end)

--	TriggerEvent('bot:SendToDiscordStaff', 'TITLE', 'MESSAGE')
RegisterServerEvent('bot:SendToDiscordStaff')
AddEventHandler('bot:SendToDiscordStaff', function(Name, Message)
    if Message == nil or Message == '' then return nil end
    PerformHttpRequest('webhook link here', function() end, 'POST', json.encode({username = Name, content = '```\n'..Message..'```'}), {['Content-Type'] = 'application/json'})
end)