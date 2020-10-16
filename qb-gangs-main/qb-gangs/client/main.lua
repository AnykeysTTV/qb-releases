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
local PlayerGang = {}


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerGang = QBCore.Functions.GetPlayerData().gang
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate')
AddEventHandler('QBCore:Client:OnGangUpdate', function(GangInfo)
    PlayerGang = GangInfo
end)

-- Code
function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Ballas

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and QBCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "ballas" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnballas"].coords.x, Config.Locations["ogcarspawnballas"].coords.y, Config.Locations["ogcarspawnballas"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawnballas"].coords.x, Config.Locations["ogcarspawnballas"].coords.y, Config.Locations["ogcarspawnballas"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnballas"].coords.x, Config.Locations["ogcarspawnballas"].coords.y, Config.Locations["ogcarspawnballas"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["ogcarspawnballas"].coords.x, Config.Locations["ogcarspawnballas"].coords.y, Config.Locations["ogcarspawnballas"].coords.z, "~g~E~w~ - Store The Vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawnballas"].coords.x, Config.Locations["ogcarspawnballas"].coords.y, Config.Locations["ogcarspawnballas"].coords.z, "~g~E~w~ - Remove A Vehicle")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                ogVehicleSpawnBallas()
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
            if PlayerGang.name == "ballas" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashballas"].coords.x, Config.Locations["stashballas"].coords.y, Config.Locations["stashballas"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashballas"].coords.x, Config.Locations["stashballas"].coords.y, Config.Locations["stashballas"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashballas"].coords.x, Config.Locations["stashballas"].coords.y, Config.Locations["stashballas"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashballas"].coords.x, Config.Locations["stashballas"].coords.y, Config.Locations["stashballas"].coords.z, "~g~E~w~ - Use The Stash Here ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            print('nonce')
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "ballastash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "ballastash")
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

----TheFamily-----

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and QBCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "thefamily" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnTheFamily"].coords.x, Config.Locations["ogcarspawnTheFamily"].coords.y, Config.Locations["ogcarspawnTheFamily"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawnTheFamily"].coords.x, Config.Locations["ogcarspawnTheFamily"].coords.y, Config.Locations["ogcarspawnTheFamily"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnTheFamily"].coords.x, Config.Locations["ogcarspawnTheFamily"].coords.y, Config.Locations["ogcarspawnTheFamily"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["ogcarspawnTheFamily"].coords.x, Config.Locations["ogcarspawnTheFamily"].coords.y, Config.Locations["ogcarspawnTheFamily"].coords.z, "~g~E~w~ - Store The Vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawnTheFamily"].coords.x, Config.Locations["ogcarspawnTheFamily"].coords.y, Config.Locations["ogcarspawnTheFamily"].coords.z, "~g~E~w~ - Remove A Vehicle")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                ogVehicleSpawnTheFamily()
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
            if PlayerGang.name == "thefamily" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashthefamily"].coords.x, Config.Locations["stashthefamily"].coords.y, Config.Locations["stashthefamily"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashthefamily"].coords.x, Config.Locations["stashthefamily"].coords.y, Config.Locations["stashthefamily"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashthefamily"].coords.x, Config.Locations["stashthefamily"].coords.y, Config.Locations["stashthefamily"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashthefamily"].coords.x, Config.Locations["stashthefamily"].coords.y, Config.Locations["stashthefamily"].coords.z, "~g~E~w~ - Use The Stash Here ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "thefamilystash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "thefamilystash")
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

-------Vagos Gang-------

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and QBCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "vagos" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnVagos"].coords.x, Config.Locations["ogcarspawnVagos"].coords.y, Config.Locations["ogcarspawnVagos"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawnVagos"].coords.x, Config.Locations["ogcarspawnVagos"].coords.y, Config.Locations["ogcarspawnVagos"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnVagos"].coords.x, Config.Locations["ogcarspawnVagos"].coords.y, Config.Locations["ogcarspawnVagos"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["ogcarspawnVagos"].coords.x, Config.Locations["ogcarspawnVagos"].coords.y, Config.Locations["ogcarspawnVagos"].coords.z, "~g~E~w~ - Store The Vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawnVagos"].coords.x, Config.Locations["ogcarspawnVagos"].coords.y, Config.Locations["ogcarspawnVagos"].coords.z, "~g~E~w~ - Remove A Vehicle")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                ogVehicleSpawnVagos()
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
            if PlayerGang.name == "vagos"  then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashVagos"].coords.x, Config.Locations["stashVagos"].coords.y, Config.Locations["stashVagos"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashVagos"].coords.x, Config.Locations["stashVagos"].coords.y, Config.Locations["stashVagos"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashVagos"].coords.x, Config.Locations["stashVagos"].coords.y, Config.Locations["stashVagos"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashVagos"].coords.x, Config.Locations["stashVagos"].coords.y, Config.Locations["stashVagos"].coords.z, "~g~E~w~ - Use The Stash Here ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "Vagostash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "Vagostash")
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

-------Marabunta Gang-------

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and QBCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerGang.name == "marabunta" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnMarabunta"].coords.x, Config.Locations["ogcarspawnMarabunta"].coords.y, Config.Locations["ogcarspawnMarabunta"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawnMarabunta"].coords.x, Config.Locations["ogcarspawnMarabunta"].coords.y, Config.Locations["ogcarspawnMarabunta"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawnMarabunta"].coords.x, Config.Locations["ogcarspawnMarabunta"].coords.y, Config.Locations["ogcarspawnMarabunta"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locations["ogcarspawnMarabunta"].coords.x, Config.Locations["ogcarspawnMarabunta"].coords.y, Config.Locations["ogcarspawnMarabunta"].coords.z, "~g~E~w~ - Store The Vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawnMarabunta"].coords.x, Config.Locations["ogcarspawnMarabunta"].coords.y, Config.Locations["ogcarspawnMarabunta"].coords.z, "~g~E~w~ - Remove A Vehicle")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                            else
                                ogVehicleSpawnMarabunta()
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
            if PlayerGang.name == "marabunta" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashMarabunta"].coords.x, Config.Locations["stashMarabunta"].coords.y, Config.Locations["stashMarabunta"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stashMarabunta"].coords.x, Config.Locations["stashMarabunta"].coords.y, Config.Locations["stashMarabunta"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stashMarabunta"].coords.x, Config.Locations["stashMarabunta"].coords.y, Config.Locations["stashMarabunta"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stashMarabunta"].coords.x, Config.Locations["stashMarabunta"].coords.y, Config.Locations["stashMarabunta"].coords.z, "~g~E~w~ - Use The Stash Here ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "Marabuntastash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "Marabuntastash")
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


function ogVehicleSpawnBallas()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicle", "VehicleListBallas", nil)
    Menu.addButton("Close menu", "closeMenuFull", nil) 
end

function ogVehicleSpawnVagos()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicle", "VehicleListVagos", nil)
    Menu.addButton("Close menu", "closeMenuFull", nil) 
end

function ogVehicleSpawnMarabunta()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicle", "VehicleListMarabunta", nil)
    Menu.addButton("Close menu", "closeMenuFull", nil) 
end

function ogVehicleSpawnTheFamily()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicle", "VehicleListTheFamily", nil)
    Menu.addButton("Close menu", "closeMenuFull", nil) 
end


function VehicleListBallas(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicle:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehicleBallas", k, "Garage", " Engine: 100%", " Body: 100%", " Fuel: 100%")
    end
        
    Menu.addButton("Return", "ogVehicleSpawnBallas",nil)
end


function VehicleListVagos(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicle:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehicleVagos", k, "Garage", " Engine: 100%", " Body: 100%", " Fuel: 100%")
    end
        
    Menu.addButton("Return", "ogVehicleSpawnVagos",nil)
end


function VehicleListMarabunta(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicle:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehicleMarabunta", k, "Garage", " Engine: 100%", " Body: 100%", " Fuel: 100%")
    end
        
    Menu.addButton("Return", "ogVehicleSpawnMarabunta",nil)
end


function VehicleListTheFamily(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicle:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehicleTheFamily", k, "Garage", " Engine: 100%", " Body: 100%", " Fuel: 100%")
    end
        
    Menu.addButton("Return", "ogVehicleSpawnTheFamily",nil)
end

function TakeOutVehicleBallas(vehicleInfo)
    local coords = Config.Locations["ogcarspawnballas"].coords
    QBCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "OG"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 108,11,184)
        SetVehicleCustomSecondaryColour(veh, 108,11,184)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function TakeOutVehicleVagos(vehicleInfo)
    local coords = Config.Locations["ogcarspawnVagos"].coords
    QBCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "OG"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 179,176,37)
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

function TakeOutVehicleTheFamily(vehicleInfo)
    local coords = Config.Locations["ogcarspawnTheFamily"].coords
    QBCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "OG"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 0, 50, 0)
        SetVehicleCustomSecondaryColour(veh, 0, 0, 0)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function TakeOutVehicleMarabunta(vehicleInfo)
    local coords = Config.Locations["ogcarspawnMarabunta"].coords
    QBCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "OG"..tostring(math.random(1000, 9999)))
        local color = GetIsVehiclePrimaryColourCustom(veh)
        SetVehicleCustomPrimaryColour(veh, 0, 65, 188)
        SetVehicleCustomSecondaryColour(veh, 0, 65, 188)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

--End Of The Script

--Released On World Of Scripts By SBRULEZ#6969