local QBCore = exports['qb-core']:GetCoreObject()

local trashData = {}
local binData = {}
local meterData = {}

local hasSearchedTrash = false
local hasSearchedTrashBin = false
local hasSearchedMeter = false

RegisterServerEvent('meh-search:server:searchTrashCan')
AddEventHandler('meh-search:server:searchTrashCan', function(canPosition)
    local src = source
    local canPosition = tostring(canPosition)
    if not trashData[canPosition] then trashData[canPosition] = {hasSearchedTrash = false} end
    if not trashData[canPosition].hasSearchedTrash then
        TriggerClientEvent('meh-search:client:searchTrashCan', src, canPosition)
    else
        QBCore.Functions.Notify(src, Config.TrashTranslate[1], 'error', 1000 * Config.NotifyDuration)
    end
end)

RegisterServerEvent('meh-search:server:searchTrashBin')
AddEventHandler('meh-search:server:searchTrashBin', function(binPos)
    local src = source
    local binPosition = tostring(binPos)
    if not binData[binPosition] then binData[binPosition] = {hasSearchedTrashBin = false} end
    if not binData[binPosition].hasSearchedTrashBin then
        TriggerClientEvent('meh-search:client:searchTrashBin', src, binPosition)
    else
        QBCore.Functions.Notify(src, Config.TrashTranslate[2], 'error', 1000 * Config.NotifyDuration)
    end
end)

RegisterServerEvent('meh-search:server:searchMeter')
AddEventHandler('meh-search:server:searchMeter', function(meterPos)
    local src = source
    local meterPosition = tostring(meterPos)
    if not meterData[meterPosition] then meterData[meterPosition] = {hasSearchedMeter = false} end
    if not meterData[meterPosition].hasSearchedMeter then
        TriggerClientEvent('meh-search:client:searchMeter', src, meterPosition)
    else
        QBCore.Functions.Notify(src, Config.TrashTranslate[3], 'error', 1000 * Config.NotifyDuration)
    end
end)

RegisterServerEvent('meh-search:server:giveCanItems')
AddEventHandler('meh-search:server:giveCanItems', function(canPosition)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ChanceToFindItems = math.random(1,100)
    if ChanceToFindItems <= Config.LowTierItemChance then
        local item = Config.LowTierItems[math.random(1, #Config.LowTierItems)]
        local amt = math.random(Config.LowTierAmountMinChance, Config.LowTierAmountMaxChance)
        Player.Functions.AddItem(item, amt)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
    elseif ChanceToFindItems >= Config.HighTierItemChance then
        local item = Config.HighTierItems[math.random(1, #Config.HighTierItems)]
        local amt = math.random(Config.HighTierAmountMinChance, Config.HighTierAmountMaxChance)
        Player.Functions.AddItem(item, amt)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
    end
    trashData[canPosition].hasSearchedTrash = true
    Wait(1000 * 60 * Config.TrashRefillTime)
    trashData[canPosition].hasSearchedTrash = false
end)

RegisterServerEvent('meh-search:server:giveBinItems')
AddEventHandler('meh-search:server:giveBinItems', function(binPosition)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.TrashBinItems[math.random(1, #Config.TrashBinItems)]
    local amt = math.random(Config.TrashBinAmountMin, Config.TrashBinAmountMax)
    Player.Functions.AddItem(item, amt)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
    binData[binPosition].hasSearchedTrashBin = true
    Wait(1000 * 60 * Config.BinRefillTime)
    binData[binPosition].hasSearchedTrashBin = false
end)

RegisterServerEvent('meh-search:server:giveMoney')
AddEventHandler('meh-search:server:giveMoney', function(meterPosition)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amt = math.random(Config.ParkingMeterCashAmountMin, Config.ParkingMeterCashAmountMax)
    Player.Functions.AddMoney('cash', amt)
    meterData[meterPosition].hasSearchedMeter = true
    Wait(1000 * 60 * Config.ParkingMeterRefillTime)
    meterData[meterPosition].hasSearchedMeter = false
end)