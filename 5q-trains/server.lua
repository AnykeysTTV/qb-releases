QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent("RequestTrain")
AddEventHandler("RequestTrain",function()
	TriggerClientEvent("AskForTrainConfirmed", source)
end)