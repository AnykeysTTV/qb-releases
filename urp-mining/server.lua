QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('urp-mining:getItemNew')
AddEventHandler('urp-mining:getItemNew', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local randomItem = Config.Items[math.random(1, #Config.Items)]
    if math.random(0, 100) <= Config.ChanceToGetItem then
        Player.Functions.AddItem(randomItem, math.random(3,10))   ----chnage these to give different amounts once completed mining
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem], 'add')
    end
end)


---price of items to sell

local ItemList = {
    ["metalscrap"] = math.random(100, 250),
    ["plastic"] = math.random(200, 350),
    --["ironore"] = math.random(300, 500),
}

RegisterServerEvent('urp-mining:sell')
AddEventHandler('urp-mining:sell', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "sold-items")
        TriggerClientEvent('QBCore:Notify', src, "You have sold your items")
    end
end)