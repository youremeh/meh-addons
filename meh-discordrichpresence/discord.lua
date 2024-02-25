local AppID = ''

local LargeImageName = ''
local LargeImageHoverText = ''

local SmallImageName = ''
local SmallImageHoverText = ''

local DiscordButtons = {
    {index = 0, name = 'Join our Discord', url = ''},
    {index = 1, name = 'Connect to Server', url = 'https://cfx.re/join/'}
}

--[[
    Set default Discord Rich Presence
    Options: all, custom, hide
]]
local WhichPresence = 'all'
local CustomText = 'Roleplaying'

local TranslateHeading = {
    [0] = 'North', [1] = 'North West',
    [2] = 'West', [3] = 'South West',
    [4] = 'South', [5] = 'South East',
    [6] = 'East', [7] = 'North East',
    [8] = 'North'
}

local TranslateZones = {
    ['AIRP'] = 'Los Santos International Airport',  ['ALAMO'] = 'Alamo Sea',
    ['ALTA'] = 'Alta',                              ['ARMYB'] = 'Fort Zancudo',
    ['BANHAMC'] = 'Banham Canyon Dr',               ['BANNING'] = 'Banning',
    ['BEACH'] = 'Vespucci Beach',                   ['BHAMCA'] = 'Banham Canyon',
    ['BRADP'] = 'Braddock Pass',                    ['BRADT'] = 'Braddock Tunnel',
    ['BURTON'] = 'Burton',                          ['CALAFB'] = 'Calafia Bridge',
    ['CANNY'] = 'Raton Canyon',                     ['CCREAK'] = 'Cassidy Creek',
    ['CHAMH'] = 'Chamberlain Hills',                ['CHIL'] = 'Vinewood Hills',
    ['CHU'] = 'Chumash',                            ['CMSW'] = 'Chiliad Mountain State Wilderness',
    ['CYPRE'] = 'Cypress Flats',                    ['DAVIS'] = 'Davis',
    ['DELBE'] = 'Del Perro Beach',                  ['DELPE'] = 'Del Perro',
    ['DELSOL'] = 'La Puerta',                       ['DESRT'] = 'Grand Senora Desert',
    ['DOWNT'] = 'Downtown',                         ['DTVINE'] = 'Downtown Vinewood',
    ['EAST_V'] = 'East Vinewood',                   ['EBURO'] = 'El Burro Heights',
    ['ELGORL'] = 'El Gordo Lighthouse',             ['ELYSIAN'] = 'Elysian Island',
    ['GALFISH'] = 'Galilee',                        ['GOLF'] = 'GWC and Golfing Society',
    ['GRAPES'] = 'Grapeseed',                       ['GREATC'] = 'Great Chaparral',
    ['HARMO'] = 'Harmony',                          ['HAWICK'] = 'Hawick',
    ['HORS'] = 'Diamond Casino And Resort',         ['HUMLAB'] = 'Humane Labs and Research',
    ['ISHEIST'] = 'Cayo Perico',                    ['JAIL'] = 'Bolingbroke Penitentiary',
    ['KOREAT'] = 'Little Seoul',                    ['LACT'] = 'Land Act Reservoir',
    ['LAGO'] = 'Lago Zancudo',                      ['LDAM'] = 'Land Act Dam',
    ['LEGSQU'] = 'Legion Square',                   ['LMESA'] = 'La Mesa',
    ['LOSPUER'] = 'La Puerta',                      ['MIRR'] = 'Mirror Park',
    ['MORN'] = 'Morningwood',                       ['MOVIE'] = 'Richards Majestic',
    ['MTCHIL'] = 'Mount Chiliad',                   ['MTGORDO'] = 'Mount Gordo',
    ['MTJOSE'] = 'Mount Josiah',                    ['MURRI'] = 'Murrieta Heights',
    ['NCHU'] = 'North Chumash',                     ['NOOSE'] = 'N.O.O.S.E',
    ['OCEANA'] = 'Pacific Ocean',                   ['PALCOV'] = 'Paleto Cove',
    ['PALETO'] = 'Paleto Bay',                      ['PALFOR'] = 'Paleto Forest',
    ['PALHIGH'] = 'Palomino Highlands',             ['PALMPOW'] = 'Palmer-Taylor Power Station',
    ['PBLUFF'] = 'Pacific Bluffs',                  ['PBOX'] = 'Pillbox Hill',
    ['PROCOB'] = 'Procopio Beach',                  ['RANCHO'] = 'Rancho',
    ['RGLEN'] = 'Richman Glen',                     ['RICHM'] = 'Richman',
    ['ROCKF'] = 'Rockford Hills',                   ['RTRAK'] = 'Redwood Lights Track',
    ['SANAND'] = 'San Andreas',                     ['SANCHIA'] = 'San Chianski Mountain Range',
    ['SANDY'] = 'Sandy Shores',                     ['SKID'] = 'Mission Row',
    ['SLAB'] = 'Stab City',                         ['STAD'] = 'Maze Bank Arena',
    ['STRAW'] = 'Strawberry',                       ['TATAMO'] = 'Tataviam Mountains',
    ['TERMINA'] = 'Terminal',                       ['TEXTI'] = 'Textile City',
    ['TONGVAH'] = 'Tongva Hills',                   ['TONGVAV'] = 'Tongva Valley',
    ['VCANA'] = 'Vespucci Canals',                  ['VESP'] = 'Vespucci',
    ['VINE'] = 'Vinewood',                          ['WINDF'] = 'Ron Alternates Wind Farm',
    ['WVINE'] = 'West Vinewood',                    ['ZANCUDO'] = 'Zancudo River',
    ['ZP_ORT'] = 'Port of South Los Santos',        ['ZQ_UAR'] = 'Davis Quartz'
}

local function SRP(txt) SetRichPresence(txt) end
CreateThread(function()
    SetDiscordAppId(AppID)
    SetDiscordRichPresenceAsset(LargeImageName)
    SetDiscordRichPresenceAssetText(LargeImageHoverText)
    SetDiscordRichPresenceAssetSmall(SmallImageName)
    SetDiscordRichPresenceAssetSmallText(SmallImageHoverText)
    while true do
        local PlayerPedID = PlayerPedId()
        local PlayerID = PlayerId()
        local x,y,z = table.unpack(GetEntityCoords(PlayerPedID, true))
        local GetStreetNameAtCoord = GetStreetNameAtCoord(x, y, z)
        local GetStreetNameFromHashKey = GetStreetNameFromHashKey(GetStreetNameAtCoord)
        local GetNameOfZone = TranslateZones[GetNameOfZone(x,y,z)] or 'San Andreas'
        local GetHeading = TranslateHeading[math.floor((GetEntityHeading(PlayerID) + 22.5) / 45.0)]
        local GetEntitySpeed = GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedID))
        local GetCurrentSpeed = math.ceil(GetEntitySpeed * 2.236936)
        local GetLabelText = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedID))))
        if GetLabelText == 'NULL' then GetLabelText = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedID))) end
        if GetLabelText == 'CARNOTFOUND' then GetLabelText = '' end
        Wait(5000)
        if WhichPresence == 'all' then
            if GetStreetNameAtCoord then
                if IsPedOnFoot(PlayerPedID) and not IsEntityInWater(PlayerPedID) then
                    if IsPedStill(PlayerPedID) then
                        SRP('Standing on '..GetStreetNameFromHashKey..' ['..GetNameOfZone..']')
                    elseif IsPedWalking(PlayerPedID) then
                        SRP('Walking '..GetHeading..' on '..GetStreetNameFromHashKey..' ['..GetNameOfZone..']')
                    elseif IsPedRunning(PlayerPedID) then
                        SRP('Running '..GetHeading..' on '..GetStreetNameFromHashKey..' ['..GetNameOfZone..']')
                    elseif IsPedSprinting(PlayerPedID) then
                        SRP('Sprinting '..GetHeading..' on '..GetStreetNameFromHashKey..' ['..GetNameOfZone..']')
                    end
                elseif GetVehiclePedIsUsing(PlayerPedID) and not IsPedOnFoot(PlayerPedID) and not IsPedInAnyHeli(PlayerPedID) and not IsPedInAnyPlane(PlayerPedID) and not IsPedInAnyBoat(PlayerPedID) and not IsPedInAnySub(PlayerPedID) then
                    if GetCurrentSpeed < 2 then
                        SRP('Parked on '..GetStreetNameFromHashKey..' ['..GetNameOfZone..'] in a '..GetLabelText)
                    else
                        SRP('Driving '..GetHeading..' on '..GetStreetNameFromHashKey..' ['..GetNameOfZone..'] in a '..GetLabelText)
                    end
                elseif IsPedInAnyHeli(PlayerPedID) or IsPedInAnyPlane(PlayerPedID) then
                    if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedID)) or GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedID)) > 5.0 then
                        SRP('Flying near '..GetStreetNameFromHashKey..' ['..GetNameOfZone..'] in a '..GetLabelText)
                    else
                        SRP('Landed on '..GetStreetNameFromHashKey..' ['..GetNameOfZone..'] in a '..GetLabelText)
                    end
                elseif IsEntityInWater(PlayerPedID) then
                    SRP('Swimming near '..GetNameOfZone)
                elseif IsPedInAnyBoat(PlayerPedID) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedID)) then
                    SRP('Boating near '..GetNameOfZone..' in a '..GetLabelText)
                elseif IsPedInAnySub(PlayerPedID) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedID)) then
                    SRP('Diving in a submersible')
                end
            end
        elseif WhichPresence == 'custom' then
            SRP(CustomText)
        elseif WhichPresence == 'hide' then
            SRP('Roleplaying')
        else
            SRP('WhichPresence is not set properly: '..WhichPresence)
        end
    end
end)

local StartDiscordPresence = true
AddEventHandler('playerSpawned', function()
    if StartDiscordPresence then
        for _, v in pairs(DiscordButtons) do SetDiscordRichPresenceAction(v.index, v.name, v.url) end
        StartDiscordPresence = false
    end
end)

RegisterCommand('discord', function(args)
    local option = args[1]
    local ctext = args[2]
    if option == 'show' then
        WhichPresence = 'all'
    elseif option == 'hide' then
        WhichPresence = 'false'
    elseif option == 'custom' then
        WhichPresence = 'custom'
        CustomText = ctext
    end
end, false)

TriggerEvent('chat:addSuggestion', '/discord', 'Set your Discord Rich Presence status', {{name="options", help="show/hide/custom"}})