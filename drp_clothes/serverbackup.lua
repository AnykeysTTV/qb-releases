ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function checkExistenceClothes(cid, cb)
--    exports.ghmattimysql:execute("SELECT cid FROM character_current WHERE cid = @cid LIMIT 1;", {["cid"] = cid}, function(result)
        local exists = result and result[1] and true or false
        cb(exists)
end

local function checkExistenceFace(cid, cb)
--    exports.ghmattimysql:execute("SELECT cid FROM character_face WHERE cid = @cid LIMIT 1;", {["cid"] = cid}, function(result)
        local exists = result and result[1] and true or false
        cb(exists)
end

RegisterServerEvent("raid_clothes:insert_character_current")
AddEventHandler("raid_clothes:insert_character_current",function(data)
    if not data then return end
    local src = source
    local user = ESX.GetPlayerFromId(source)
    local characterId = user:getCurrentCharacter().id
    if not characterId then return end
    checkExistenceClothes(characterId, function(exists)
        local values = {
            ["cid"] = characterId,
            ["model"] = json.encode(data.model),
            ["drawables"] = json.encode(data.drawables),
            ["props"] = json.encode(data.props),
            ["drawtextures"] = json.encode(data.drawtextures),
            ["proptextures"] = json.encode(data.proptextures),
        }

        if not exists then
            local cols = "cid, model, drawables, props, drawtextures, proptextures"
            local vals = "@cid, @model, @drawables, @props, @drawtextures, @proptextures"

--            exports.ghmattimysql:execute("INSERT INTO character_current ("..cols..") VALUES ("..vals..")", values, function()
            return
        end

        local set = "model = @model,drawables = @drawables,props = @props,drawtextures = @drawtextures,proptextures = @proptextures"
--        exports.ghmattimysql:execute("UPDATE character_current SET "..set.." WHERE cid = @cid", values)
    end)
end)

RegisterServerEvent("raid_clothes:insert_character_face")
AddEventHandler("raid_clothes:insert_character_face",function(data)
    if not data then return end
    local src = source

    local user = ESX.GetPlayerFromId(source)
    local characterId = user:getCurrentCharacter().id

    if not characterId then return end

    checkExistenceFace(characterId, function(exists)
        if data.headBlend == "null" or data.headBlend == nil then
            data.headBlend = '[]'
        else
            data.headBlend = json.encode(data.headBlend)
        end
        local values = {
            ["cid"] = characterId,
            ["hairColor"] = json.encode(data.hairColor),
            ["headBlend"] = data.headBlend,
            ["headOverlay"] = json.encode(data.headOverlay),
            ["headStructure"] = json.encode(data.headStructure),
        }

        if not exists then
            local cols = "cid, hairColor, headBlend, headOverlay, headStructure"
            local vals = "@cid, @hairColor, @headBlend, @headOverlay, @headStructure"

--            exports.ghmattimysql:execute("INSERT INTO character_face ("..cols..") VALUES ("..vals..")", values, function()
            return
        end

        local set = "hairColor = @hairColor,headBlend = @headBlend, headOverlay = @headOverlay,headStructure = @headStructure"
--        exports.ghmattimysql:execute("UPDATE character_face SET "..set.." WHERE cid = @cid", values )
    end)
end)

RegisterServerEvent("raid_clothes:get_character_face")
AddEventHandler("raid_clothes:get_character_face",function(pSrc)
    local src = (not pSrc and source or pSrc)
    local user = ESX.GetPlayerFromId(source)
    local characterId = user:getCurrentCharacter().id

    if not characterId then return end

--    exports.ghmattimysql:execute("SELECT cc.model, cf.hairColor, cf.headBlend, cf.headOverlay, cf.headStructure FROM character_face cf INNER JOIN character_current cc on cc.cid = cf.cid WHERE cf.cid = @cid", {['cid'] = characterId}, function(result)
        if (result ~= nil and result[1] ~= nil) then
            local temp_data = {
                hairColor = json.decode(result[1].hairColor),
                headBlend = json.decode(result[1].headBlend),
                headOverlay = json.decode(result[1].headOverlay),
                headStructure = json.decode(result[1].headStructure),
            }
            local model = tonumber(result[1].model)
            if model == 1885233650 or model == -1667301416 then
                TriggerClientEvent("raid_clothes:setpedfeatures", src, temp_data)
            end
        else
            TriggerClientEvent("raid_clothes:setpedfeatures", src, false)
        end
end)

RegisterServerEvent("raid_clothes:get_character_current")
AddEventHandler("raid_clothes:get_character_current",function(pSrc)
    local src = (not pSrc and source or pSrc)
    local user = ESX.GetPlayerFromId(source)
    local characterId = user:getCurrentCharacter().id

    if not characterId then return end

--    exports.ghmattimysql:execute("SELECT * FROM character_current WHERE cid = @cid", {['cid'] = characterId}, function(result)
        local temp_data = {
            model = result[1].model,
            drawables = json.decode(result[1].drawables),
            props = json.decode(result[1].props),
            drawtextures = json.decode(result[1].drawtextures),
            proptextures = json.decode(result[1].proptextures),
        }
        TriggerClientEvent("raid_clothes:setclothes", src, temp_data,0)
end)

RegisterServerEvent("raid_clothes:retrieve_tats")
AddEventHandler("raid_clothes:retrieve_tats", function(pSrc)
    local src = (not pSrc and source or pSrc)
	local user = ESX.GetPlayerFromId(source)
    local char = user:getCurrentCharacter()
--	exports.ghmattimysql:execute("SELECT * FROM playersTattoos WHERE identifier = @identifier", {['identifier'] = char.id}, function(result)
        if(#result == 1) then
			TriggerClientEvent("raid_clothes:settattoos", src, json.decode(result[1].tattoos))
		else
			local tattooValue = "{}"
--			exports.ghmattimysql:execute("INSERT INTO playersTattoos (identifier, tattoos) VALUES (@identifier, @tattoo)", {['identifier'] = char.id, ['tattoo'] = tattooValue})
			TriggerClientEvent("raid_clothes:settattoos", src, {})
		end
end)

RegisterServerEvent("raid_clothes:set_tats")
AddEventHandler("raid_clothes:set_tats", function(tattoosList)
	local src = source
	local user = ESX.GetPlayerFromId(source)
    local char = user:getCurrentCharacter()
--	exports.ghmattimysql:execute("UPDATE playersTattoos SET tattoos = @tattoos WHERE identifier = @identifier", {['tattoos'] = json.encode(tattoosList), ['identifier'] = char.id})
end)


RegisterServerEvent("raid_clothes:get_outfit")
AddEventHandler("raid_clothes:get_outfit",function(slot)
end)

RegisterServerEvent("raid_clothes:set_outfit")
AddEventHandler("raid_clothes:set_outfit",function(slot, name, data)
end)


RegisterServerEvent("raid_clothes:remove_outfit")
AddEventHandler("raid_clothes:remove_outfit",function(slot)
end)


RegisterServerEvent("clothing:checkIfNew")
AddEventHandler("clothing:checkIfNew", function()
end)

RegisterServerEvent("clothing:checkMoney")
AddEventHandler("clothing:checkMoney", function(menu,askingPrice)
    local src = source
    local target = ESX.GetPlayerFromId(source)

--    if not askingPrice
--    then
--        askingPrice = 0
--    end

--    if (tonumber(target:getCash()) >= askingPrice) then
--        target:removeMoney(askingPrice)
--        TriggerClientEvent("DoShortHudText",src, "You Paid $"..askingPrice,8)
        TriggerClientEvent("raid_clothes:hasEnough",src,menu)
--    else
--        TriggerClientEvent("DoShortHudText",src, "You need $"..askingPrice.." + Tax.",2)
--    end
end)