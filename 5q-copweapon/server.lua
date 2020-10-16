
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

ESX.RegisterUsableItem('mask', function(source)
 	TriggerClientEvent('esx_copweapon:mask',source)
end)
