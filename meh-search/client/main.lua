local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    if Config.EnableTrashCans then
        exports['qb-target']:AddTargetModel(Config.TrashCans, {
            options = {
                {
                    label = Config.TrashTranslate[7],
                    icon = 'fas fa-trashcan',
                    targeticon = 'fas fa-eye',
                    action = function()
                        local playerPos = GetEntityCoords(PlayerPedId())
                        local closestTrashcan = 0
                        for _, canModel in pairs(Config.TrashCans) do
                            closestTrashcan = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 1.0, GetHashKey(canModel), false, false, false)
                            if closestTrashcan ~= 0 then break end
                        end
                        if closestTrashcan ~= 0 then
                            local canPosition = GetEntityCoords(closestTrashcan)
                            TriggerServerEvent('meh-search:server:searchTrashCan', canPosition)
                        else
                            QBCore.Functions.Notify(Config.TrashTranslate[4], 'error', 1000 * Config.NotifyDuration)
                        end
                    end
                }
            }
        })
    end
    if Config.EnableTrashBins then
        exports['qb-target']:AddTargetModel(Config.TrashBins, {
            options = {
                {
                    label = Config.TrashTranslate[8],
                    icon = 'fas fa-trashcan',
                    targeticon = 'fas fa-eye',
                    action = function()
                        local playerPos = GetEntityCoords(PlayerPedId())
                        local closestTrashbin = 0
                        for _, binModel in pairs(Config.TrashBins) do
                            closestTrashbin = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 1.0, GetHashKey(binModel), false, false, false)
                            if closestTrashbin ~= 0 then break end
                        end
                        if closestTrashbin ~= 0 then
                            local binPosition = GetEntityCoords(closestTrashbin)
                            TriggerServerEvent('meh-search:server:searchTrashBin', binPosition)
                        else
                            QBCore.Functions.Notify(Config.TrashTranslate[5], 'error', 1000 * Config.NotifyDuration)
                        end
                    end
                }
            }
        })
    end
    if Config.EnableParkingMeters then
        exports['qb-target']:AddTargetModel(Config.ParkingMeters, {
            options = {
                {
                    label = Config.TrashTranslate[9],
                    icon = 'fas fa-trashcan',
                    targeticon = 'fas fa-eye',
                    action = function()
                        local playerPos = GetEntityCoords(PlayerPedId())
                        local closestParkingMeter = 0
                        for _, meterModel in pairs(Config.ParkingMeters) do
                            closestParkingMeter = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 1.0, GetHashKey(meterModel), false, false, false)
                            if closestParkingMeter ~= 0 then break end
                        end
                        if closestParkingMeter ~= 0 then
                            local meterPos = GetEntityCoords(closestParkingMeter)
                            TriggerServerEvent('meh-search:server:searchMeter', meterPos)
                        else
                            QBCore.Functions.Notify(Config.TrashTranslate[6], 'error', 1000 * Config.NotifyDuration)
                        end
                    end
                }
            }
        })
    end
end)

RegisterNetEvent('meh-search:client:searchTrashCan')
AddEventHandler('meh-search:client:searchTrashCan', function(canPosition)
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 1000 * Config.SearchTrashCanTime, false)
    QBCore.Functions.Progressbar('searching_trashcan', Config.TrashTranslate[10], 1000 * Config.SearchTrashCanTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
        }, {}, {}, {}, function()
            TriggerServerEvent('meh-search:server:giveCanItems', canPosition)
            ClearPedTasks(PlayerPedId())
        end, function()
            ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('meh-search:client:searchTrashBin')
AddEventHandler('meh-search:client:searchTrashBin', function(binPosition)
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 1000 * Config.SearchTrashBinTime, false)
    QBCore.Functions.Progressbar('searching_trashbin', Config.TrashTranslate[11], 1000 * Config.SearchTrashBinTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
        }, {}, {}, {}, function()
            TriggerServerEvent('meh-search:server:giveBinItems', binPosition)
            ClearPedTasks(PlayerPedId())
        end, function()
            ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('meh-search:client:searchMeter')
AddEventHandler('meh-search:client:searchMeter', function(meterPosition)
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 1000 * Config.SearchParkingMeterTime, false)
    QBCore.Functions.Progressbar('searching_meter', Config.TrashTranslate[12], 1000 * Config.SearchParkingMeterTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
        }, {}, {}, {}, function()
            TriggerServerEvent('meh-search:server:giveMoney', meterPosition)
            ClearPedTasks(PlayerPedId())
        end, function()
            ClearPedTasks(PlayerPedId())
    end)
end)