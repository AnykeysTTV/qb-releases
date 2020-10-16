QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

-- Oxy Run
RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.PlayerData.money.cash >= Config.StartOxyPayment then
		Player.Functions.RemoveMoney('cash', Config.StartOxyPayment)
		
		TriggerClientEvent("oxydelivery:startDealing", source)
	else
		TriggerClientEvent('QBCore:Notify', src, "You dont have enough money to start an oxy run")
	end
end)

RegisterServerEvent('oxydelivery:receiveBigRewarditem')
AddEventHandler('oxydelivery:receiveBigRewarditem', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.AddItem(Config.BigRewarditem, 1)
end)

RegisterServerEvent('oxydelivery:receiveoxy')
AddEventHandler('oxydelivery:receiveoxy', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    pay = math.floor(Config.Payment / 2)
	Player.Functions.AddMoney('cash',pay)
	Player.Functions.AddItem("oxy", Config.OxyAmount)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["oxy"], 'add')

    TriggerClientEvent('QBCore:Notify', src, "You were handed $ "..pay.. " and some oxy!")
	---TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'success', text = 'You were handed $'..Config.Payment.. 'and some oxy!', length = 10000})
end)

RegisterServerEvent('oxydelivery:receivemoneyyy')
AddEventHandler('oxydelivery:receivemoneyyy', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	
	TriggerClientEvent('QBCore:Notify', src, "You were handed $ "..Config.Payment)
	--TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'success', text = 'You were handed $'..Config.Payment, length = 10000})

	Player.Functions.AddMoney('cash',Config.Payment)
end)
