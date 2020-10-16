
local sv_carDense = 0.5
Citizen.CreateThread(function()	
	while true do	

		SetVehicleDensityMultiplierThisFrame(sv_carDense)
		SetPedDensityMultiplierThisFrame(1.0)
	    SetParkedVehicleDensityMultiplierThisFrame(1.0)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
		
		Citizen.Wait(3)
	end
end)

Citizen.CreateThread(function() 

	while true do 

		TriggerServerEvent("resources:server:getplayers")
		Citizen.Wait(60*1000)
	end

end)

RegisterNetEvent("resources:client:getplayers")
AddEventHandler("resources:client:getplayers", function(players)
	
	if players <= 0.01 then 
		sv_carDense = 0.01
	else
		sv_carDense = players
	end
		
end)
