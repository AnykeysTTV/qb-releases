local keys = {
	[1] = {label = "Red Decryption Key", itemName = "decryption_key_red", colorId = 1},
	[2] = {label = "Green Decryption Key", itemName = "decryption_key_green", colorId = 6},
	[3] = {label = "Blue Decryption Key", itemName = "decryption_key_blue", colorId = 2},
}

local activeKeys = {}
local keysUsed = 0
local delayKeyChange = false
local weaponDropped = false

local heistId = 0

local dropItems = {
	{itemName = "weapon_microsmg", label = "Micro SMG", chance = 64},
	{itemName = "weapon_smg", label = "SMG", chance = 64},
	{itemName = "weapon_smg_mk2", label = "SMG Mk II", chance = 8},
	{itemName = "weapon_assaultsmg", label = "Assault SMG", chance = 32},
	{itemName = "weapon_combatpdw", label = "Combat PDW", chance = 32},
	{itemName = "weapon_machinepistol", label = "Machine Pistol", chance = 64},
	{itemName = "weapon_minismg", label = "Mini SMG", chance = 64},
	{itemName = "weapon_assaultrifle", label = "Assault Rifle", chance = 16},
	{itemName = "weapon_assaultrifle_mk2", label = "Assault Rifle Mk II", chance = 8},
	{itemName = "weapon_carbinerifle", label = "Carbine Rifle", chance = 16},
	{itemName = "weapon_carbinerifle_mk2", label = "Carbine Rifle Mk II", chance = 8},
	{itemName = "weapon_advancedrifle", label = "Advanced Rifle", chance = 16},
	{itemName = "weapon_specialcarbine", label = "Special Carbine", chance = 16},
	{itemName = "weapon_specialcarbine_mk2", label = "Special Carbine Mk II", chance = 8},
	{itemName = "weapon_bullpuprifle", label = "Bullpup Rifle", chance = 16},
	{itemName = "weapon_bullpuprifle_mk2", label = "Bullpup Rifle Mk II", chance = 8},
	{itemName = "weapon_compactrifle", label = "Compact Rifle", chance = 16},

	{itemName = "weapon_pistol_mk2", label = "Pistol Mk II", chance = 32},
	{itemName = "weapon_combatpistol", label = "Combat Pistol", chance = 32},
	{itemName = "weapon_appistol", label = "AP Pistol", chance = 32},
	{itemName = "weapon_snspistol_mk2", label = "SNS Pistol Mk II", chance = 16},
	{itemName = "weapon_heavypistol", label = "Heavy Pistol", chance = 32},
	{itemName = "weapon_marksmanpistol", label = "Marksman Pistol", chance = 32},
	{itemName = "weapon_revolver", label = "Heavy Revolver", chance = 32},
	{itemName = "weapon_revolver_mk2", label = "Heavy Revolver Mk II", chance = 16},

	{itemName = "weapon_pumpshotgun", label = "Pump Shotgun", chance = 32},
	{itemName = "weapon_pumpshotgun_mk2", label = "Pump Shotgun Mk II", chance = 16},
	{itemName = "weapon_sawnoffshotgun", label = "Sawed-Off Shotgun", chance = 32},
	{itemName = "weapon_assaultshotgun", label = "Assault Shotgun", chance = 32},
	{itemName = "weapon_bullpupshotgun", label = "Bullpup Shotgun", chance = 32},
	{itemName = "weapon_musket", label = "Musket", chance = 32},
	{itemName = "weapon_heavyshotgun", label = "Heavy Shotgun", chance = 32},
	{itemName = "weapon_dbshotgun", label = "Double Barrel Shotgun", chance = 32},
	{itemName = "weapon_autoshotgun", label = "Sweeper Shotgun", chance = 32},
}

local totalChances = 0
local pickupLocations = 415

local activeDrops = {}
local dropIds = 0

Citizen.CreateThread(function()
	for i = 1, #dropItems do
		totalChances = totalChances + dropItems[i].chance
	end
end)

RegisterServerEvent('op-guns:wonHacking')
AddEventHandler('op-guns:wonHacking', function()
	local src = source
	local user = exports["op-base"]:GetUserFromId(src)

	if user and user.character.id then
		local inventoryName = "character-" .. user.character.id
		local chipSlot = exports["op-framework"]:GetItemWithName(inventoryName, "chip")

		if chipSlot then
			delayKeyChange = true

			TriggerClientEvent('chatMessage', source, "FIRST", keys[activeKeys[1]].colorId, keys[activeKeys[1]].label)
			TriggerClientEvent('chatMessage', source, "SECOND", keys[activeKeys[2]].colorId, keys[activeKeys[2]].label)
			TriggerClientEvent('chatMessage', source, "THIRD", keys[activeKeys[3]].colorId, keys[activeKeys[3]].label)
		else
			TriggerEvent('op-anitcheat:banClient', src, 5)
		end
	end
end)

RegisterServerEvent('op-guns:useDecryptionKey')
AddEventHandler('op-guns:useDecryptionKey', function(itemName)
	local src = source
	local user = exports["op-base"]:GetUserFromId(src)

	if itemName ~= "decryption_key_red" and itemName ~= "decryption_key_green" and itemName ~= "decryption_key_blue" then
		return
	end

	if user and user.character.id then
		local inventoryName = "character-" .. user.character.id
		local keySlot = exports["op-framework"]:GetItemWithName(inventoryName, itemName)

		if keySlot and exports["op-framework"]:ClearSlotId(inventoryName, keySlot, 1, src) then
			delayKeyChange = true

			if keys[activeKeys[keysUsed + 1]].itemName == itemName then
				keysUsed = keysUsed + 1

				if keysUsed == 3 then
					TriggerClientEvent('op-guns:hackingMinigame', src)
				else
					TriggerClientEvent('notification', src, "Correct key!")
				end
			else
				TriggerClientEvent('notification', src, "Wrong key!", 2)
			end
		end
	end
end)

AddEventHandler('op-guns:createHeistLoop', function()
	heistId = heistId + 1

	local thisId = heistId

	Citizen.CreateThread(function()
		keysUsed = 0
		weaponDropped = false

		local key1 = math.random(3)
		local key2
		local key3

		while not key2 or not key3 do
			local possibleKey = math.random(3)

			if not key2 and possibleKey ~= key1 then
				key2 = possibleKey
			end

			if possibleKey ~= key1 and possibleKey ~= key2 then
				key3 = possibleKey
			end

			Citizen.Wait(0)
		end

		activeKeys = {key1, key2, key3}
	end)

	Citizen.Wait(300000)

	if heistId == thisId then
		if delayKeyChange then
			Citizen.Wait(300000)
			delayKeyChange = false
		end

		if heistId == thisId then
			TriggerEvent('op-guns:createHeistLoop')
		end
	end
end)

RegisterServerEvent('op-guns:obtainDrops')
AddEventHandler('op-guns:obtainDrops', function()
	TriggerClientEvent('op-guns:obtainDrops', source, activeDrops)
end)

RegisterServerEvent('op-guns:pickUpDrop')
AddEventHandler('op-guns:pickUpDrop', function(dropId)
	local src = source

	if activeDrops[dropId] then
		local user = exports["op-base"]:GetUserFromId(src)

		if user and user.character.id then
			local inventoryName = "character-" .. user.character.id
			local drillSlot = exports["op-framework"]:GetItemWithName(inventoryName, "drill")

			if drillSlot and exports["op-framework"]:ClearSlotId(inventoryName, drillSlot, 1, src) then
				local dropData = activeDrops[dropId]

				activeDrops[dropId] = nil

				exports["op-framework"]:AddItem(inventoryName, dropData.itemName, 1, false, src)

				TriggerClientEvent('notification', src, "Picked up " .. dropData.label)
				TriggerClientEvent('op-guns:manipulateDrop', -1, dropId)
			end
		end
	end
end)

RegisterServerEvent('op-guns:hackingCompleted')
AddEventHandler('op-guns:hackingCompleted', function()
	local src = source

	if not weaponDropped then
		weaponDropped = true

		local itemLottery = math.random(totalChances)
		local loopedThrough = 0
		local item

		for i = 1, #dropItems do
			loopedThrough = loopedThrough + dropItems[i].chance

			if itemLottery <= loopedThrough then
				item = dropItems[i]

				break
			end
		end

		if item then
			dropIds = dropIds + 1
			activeDrops[dropIds] = {pickupLocation = math.random(pickupLocations), itemName = item.itemName, label = item.label}

			TriggerClientEvent('op-guns:manipulateDrop', -1, dropIds, activeDrops[dropIds])
			TriggerClientEvent('op-guns:createBlipOnDrop', src, dropIds, item.label)
			TriggerEvent('op-guns:createHeistLoop')
		end
	end
end)

TriggerEvent('op-guns:createHeistLoop')
