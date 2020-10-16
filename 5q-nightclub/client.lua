--------------------------------
------- Created by Hbmsupra ----
-------------------------------- 

QBCore = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    end
end)

isLoggedIn = false
local PlayerJob = {}


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and QBCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerJob.name == "nightclub" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["hbcarspawnnightclub"].coords.x, Config.Locations["hbcarspawnnightclub"].coords.y, Config.Locations["hbcarspawnnightclub"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["hbcarspawnnightclub"].coords.x, Config.Locations["hbcarspawnnightclub"].coords.y, Config.Locations["hbcarspawnnightclub"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["hbcarspawnnightclub"].coords.x, Config.Locations["hbcarspawnnightclub"].coords.y, Config.Locations["hbcarspawnnightclub"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["hbcarspawnnightclub"].coords.x, Config.Locations["hbcarspawnnightclub"].coords.y, Config.Locations["hbcarspawnnightclub"].coords.z, "~g~E~w~ - Guardar Veiculo")
                        else
                            DrawText3D(Config.Locations["hbcarspawnnightclub"].coords.x, Config.Locations["hbcarspawnnightclub"].coords.y, Config.Locations["hbcarspawnnightclub"].coords.z, "~g~E~w~ - Veiculos")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                hbVehicleSpawnnightclub()
                                Menu.hidden = not Menu.hidden
                            end
                        end
                        Menu.renderGUI()
                    end 
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and QBCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerJob.name == "nightclub" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashnightclub"].coords.x, Config.Locations["stashnightclub"].coords.y, Config.Locations["stashnightclub"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashnightclub"].coords.x, Config.Locations["stashnightclub"].coords.y, Config.Locations["stashnightclub"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashnightclub"].coords.x, Config.Locations["stashnightclub"].coords.y, Config.Locations["stashnightclub"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashnightclub"].coords.x, Config.Locations["stashnightclub"].coords.y, Config.Locations["stashnightclub"].coords.z, "~g~E~w~ - Armario ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "nightclubtash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "nightclubtash")
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

function hbVehicleSpawnnightclub()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garagem"
    ClearMenu()
    Menu.addButton("Veiculos", "VehicleListnightclub", nil)
    Menu.addButton("Fechar Menu", "closeMenuFull", nil) 
end

function TakeOutVehiclenightclub(vehicleInfo)
    local coords = Config.Locations["hbcarspawnnightclub"].coords
    QBCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "NC"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 0,0,0)
        SetVehicleCustomSecondaryColour(veh, 0,0,0)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function VehicleListnightclub(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Veiculos:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehiclenightclub", k, "Garagem", " Motor: 100%", " Carroçaria: 100%", " Comb: 100%")
    end
        
    Menu.addButton("Voltar", "hbVehicleSpawnnightclub",nil)
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

Citizen.CreateThread(function()
    while true do
        local inRange = false
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        for loc,_ in pairs(Config.Teleports) do
            for k, v in pairs(Config.Teleports[loc]) do
                local dist = GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true)

                if dist < 2 then
                    inRange = true
                    DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)

                    if dist < 1 then
                        DrawText3Ds(v.x, v.y, v.z, '~g~E~w~ Abrir Porta')
                        if IsControlJustReleased(0, 51) then
                            if k == 1 then
                                SetEntityCoords(ped, Config.Teleports[loc][2].x, Config.Teleports[loc][2].y, Config.Teleports[loc][2].z)
                            elseif k == 2 then
                                SetEntityCoords(ped, Config.Teleports[loc][1].x, Config.Teleports[loc][1].y, Config.Teleports[loc][1].z)
                            end
                            ResetTeleport()
                        end
                    end
                end
            end
        end

        if not inRange then
            Citizen.Wait(1000)
        end

        Citizen.Wait(3)
    end
end)

ResetTeleport = function()
    SetTimeout(1000, function()
        JustTeleported = false
    end)
end

-- Function for 3D text:
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

-- Blip on map for nightclub Location:
Citizen.CreateThread(function()
	for k,v in ipairs(Config.nightclubLocation)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, Config.nightclubBlipSprite)
		SetBlipDisplay(blip, Config.nightclubBlipDisplay)
		SetBlipScale  (blip, Config.nightclubBlipScale)
		SetBlipColour (blip, Config.nightclubBlipColour)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.nightclubBlipNameOnMap)
		EndTextCommandSetBlipName(blip)
	end
end)

