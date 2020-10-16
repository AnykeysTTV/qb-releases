QBCore = nil

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)


RegisterNetEvent("ms:getplate")
AddEventHandler("ms:getplate", function()
    local nvehicle = QBCore.Functions.GetClosestVehicle()
    local vehicle = GetVehicleNumberPlateText(nvehicle)
    print(vehicle)
end)

RegisterCommand("test123", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local nearbyv = GetEntityCoords(vehicle)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local putDist = GetDistanceBetweenCoords(pos, nearbyv)
    print(vehicle)
    print(putDist)
end)

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        
        Citizen.Wait(1)
    end
end

 function checknearby()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    local vehicleplate =  GetVehicleNumberPlateText(vehicle)
    local nearbyv = GetEntityCoords(vehicle)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local putDist = GetDistanceBetweenCoords(pos, nearbyv)
    loadAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
    TaskPlayAnim(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, 12000, 0, 0, false, false, false)    
        Skillbar.Start({
        duration = math.random(100, 1000),
        pos = math.random(10, 30),
        width = math.random(10, 20),
    },function()
        QBCore.Functions.Notify("License Plate Stolen,  Plate : ".. vehicleplate , "success", 2500)
        SetVehicleNumberPlateText(vehicle, "")
        TriggerServerEvent('QBCore:Server:AddItem', "license_plate", 1)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end)
end

function replaceplate()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    local vehicleplate =  GetVehicleNumberPlateText(vehicle)
    local nearbyv = GetEntityCoords(vehicle)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local putDist = GetDistanceBetweenCoords(pos, nearbyv)
    loadAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
    TaskPlayAnim(GetPlayerPed(-1), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, 12000, 0, 0, false, false, false)    
        Skillbar.Start({
        duration = math.random(100, 1000),
        pos = math.random(10, 30),
        width = math.random(10, 20),
    },function()
        SetVehicleNumberPlateText(vehicle, vehicleplate1)
        TriggerServerEvent('QBCore:Server:RemoveItem', "license_plate", 1)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end)
end
RegisterNetEvent("ms:removeplate")
AddEventHandler("ms:removeplate", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    vehicleplate1 =  GetVehicleNumberPlateText(vehicle)
    local test = 0
    local nearbyv = GetEntityCoords(vehicle)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local putDist = GetDistanceBetweenCoords(pos, nearbyv)
    if putDist <= 3 then
    checknearby()
    QBCore.Functions.Notify("No Vehicle Nearby" , "error", 2500)
    end
end)



RegisterNetEvent("ms:placeplate")
AddEventHandler("ms:placeplate", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local vehicleplate =  GetVehicleNumberPlateText(vehicle)
    local nearbyv = GetEntityCoords(vehicle)
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local putDist = GetDistanceBetweenCoords(pos, nearbyv)
    if putDist <= 3 then
    replaceplate()
    else
        QBCore.Functions.Notify("No Vehicle Nearby" , "error", 2500)
    end
end)

