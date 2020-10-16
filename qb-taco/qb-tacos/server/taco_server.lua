QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('qb-taco:server:start:black')
AddEventHandler('qb-taco:server:start:black', function()
    local src = source
    
    TriggerClientEvent('qb-taco:start:black:job', src)
end)

RegisterServerEvent('qb-taco:server:reward:money')
AddEventHandler('qb-taco:server:reward:money', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    Player.Functions.AddMoney("cash", Config.PaymentTaco, "taco-reward-money")
    TriggerClientEvent('QBCore:Notify', src, "Taco delivered! Go back to the taco shop for a new delivery")
end)

QBCore.Functions.CreateCallback('qb-tacos:server:GetConfig', function(source, cb)
    cb(Config)
end)

RegisterServerEvent('qb-tacos:server:get:stuff')
AddEventHandler('qb-tacos:server:get:stuff', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player ~= nil then
        Player.Functions.AddItem("taco-box", 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['taco-box'], "add")
    end
end)

QBCore.Functions.CreateCallback('qb-taco:server:get:ingredient', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("lettuce")
    local meat = Ply.Functions.GetItemByName("meat")
    if lettuce ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-taco:server:get:tacobox', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local box = Ply.Functions.GetItemByName("taco-box")
    if box ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-taco:server:get:tacos', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local taco = Ply.Functions.GetItemByName('taco')
    if taco ~= nil then
        cb(true)
    else
        cb(false)
    end
end)