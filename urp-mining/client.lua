--------------------
-- QBCore Core Stuff --
--------------------
QBCore = nil

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
end)


---------------
-- Variables --
---------------
local mining = false


---------------------
-- Citizen Threads --
---------------------

Citizen.CreateThread(function()
    Citizen.CreateThread(function()
        while true do
            local sleep = 250
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Sell, true) <= 3.0 then
                sleep = 0
                helpText(Strings['e_sell'])
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('urp-mining:sell')
                end
            end
            Wait(sleep)
        end
    end)
    while true do
        local closeTo = 0
        for k, v in pairs(Config.MiningPositions) do
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.coords, true) <= 2.5 then
                closeTo = v
                break
            end
        end
        
        if type(closeTo) == 'table' then
            while GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), closeTo.coords, true) <= 2.5 do
                local counter = 0
                Wait(0)
                helpText(Strings['press_mine'])
                if IsControlJustReleased(0, 38) then
                    local player, distance = QBCore.Functions.GetClosestPlayer()
                    if distance == -1 or distance >= 4.0 then
                        mining = true
                        SetEntityCoords(PlayerPedId(), closeTo.coords)
                        SetEntityHeading(PlayerPedId(), closeTo.heading)
                        FreezeEntityPosition(PlayerPedId(), true)

                        local model = loadModel(GetHashKey(Config.Objects['pickaxe']))
                        local axe = CreateObject(model, GetEntityCoords(PlayerPedId()), true, false, false)
                        AttachEntityToEntity(axe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, true, true, true, 0, true)

                        while mining do
                            Wait(0)
                            SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'))
                            helpText(Strings['mining_info'])
                            DisableControlAction(0, 24, true)
                            if IsDisabledControlJustReleased(0, 24) then
                                local dict = loadDict('melee@hatchet@streamed_core')
                                TaskPlayAnim(PlayerPedId(), dict, 'plyr_rear_takedown_b', 8.0, -8.0, -1, 2, 0, false, false, false)
                                local timer = GetGameTimer() + 800
                                while GetGameTimer() <= timer do Wait(0) DisableControlAction(0, 24, true) end
                                ClearPedTasks(PlayerPedId())

                                TriggerEvent('urp-minigame:show')
                                TriggerEvent('urp-minigame:start', FinishMinigame)

                            elseif IsControlJustReleased(0, 194) then
                                DeleteObject(axe)
                                FreezeEntityPosition(PlayerPedId(), false)
                                break
                            end
                        end
                        mining = false
                        DeleteObject(axe)
                        FreezeEntityPosition(PlayerPedId(), false)
                    else
                        QBCore.Functions.Notify(Strings['someone_close'], "error")
                    end
                end
            end
        end
        Wait(250)
    end
end)


loadModel = function(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end

loadDict = function(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

helpText = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end



Citizen.CreateThread(function()
    local blip = AddBlipForCoord(282.53, 2847.5, 43.64)
	SetBlipSprite(blip, 500)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Mining Sell")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(2992.77, 2750.64, 42.78)
	SetBlipSprite(blip, 527)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Mining")
    EndTextCommandSetBlipName(blip)
end)

function FinishMinigame(faults)
    if faults == 0 then
        TriggerServerEvent('urp-mining:getItemNew')
    else
        QBCore.Functions.Notify("You missed the rocks "..faults.." times", "error")
    end
end