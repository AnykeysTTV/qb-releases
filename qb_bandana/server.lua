QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateUseableItem('bloodsbandana', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('qb_bandana:bloodsbandana', source)
end)

QBCore.Functions.CreateUseableItem('greenbandana', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('qb_bandana:greenbandana', source)
end)

QBCore.Functions.CreateUseableItem('ballasbandana', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('qb_bandana:ballasbandana', source)
end)

QBCore.Functions.CreateUseableItem('vagosbandana', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('qb_bandana:vagosbandana', source)
end)

QBCore.Functions.CreateUseableItem('cripsbandana', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('qb_bandana:cripsbandana', source)
end)

QBCore.Functions.CreateUseableItem('whitebandana', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('qb_bandana:whitebandana', source)
end)

QBCore.Functions.CreateUseableItem('blackbandana', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('qb_bandana:blackbandana', source)
end)

QBCore.Functions.CreateUseableItem('orangebandana', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('qb_bandana:orangebandana', source)
end)