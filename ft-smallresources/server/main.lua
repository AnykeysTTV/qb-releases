-- add this code to end of youre file
local carDense = 1.0
RegisterServerEvent("resources:server:getplayers")
AddEventHandler("resources:server:getplayers", function()
    local dens = 1.0/ (#QBCore.Functions.GetPlayers() + 1)
    if dens ~= carDense then 
    TriggerClientEvent("resources:client:getplayers", -1, dens)
    print("Auto density updated :".. tostring(dens))    
    carDense = dens
    end
end)