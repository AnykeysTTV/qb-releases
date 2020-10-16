QBCore = nil

bandana = false

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('qb_bandana:bloodsbandana')
AddEventHandler('qb_bandana:bloodsbandana', function()
   local ad = "missheist_agency2ahelmet"
   local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   loadAnimDict( ad )
   loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedPropIndex(GetPlayerPed(-1), 0, 14, 3, 2)
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedProp(GetPlayerPed(-1), 0, -1, 0, 2)
	end
end)

RegisterNetEvent('qb_bandana:greenbandana')
AddEventHandler('qb_bandana:greenbandana', function()
   local ad = "missheist_agency2ahelmet"
   local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   loadAnimDict( ad )
   loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedPropIndex(GetPlayerPed(-1), 0, 14, 0, 2)
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedProp(GetPlayerPed(-1), 0, -1, 0, 2)
	end
end)

RegisterNetEvent('qb_bandana:ballasbandana')
AddEventHandler('qb_bandana:ballasbandana', function()
   local ad = "missheist_agency2ahelmet"
   local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   loadAnimDict( ad )
   loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedPropIndex(GetPlayerPed(-1), 0, 14, 4, 2)
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedProp(GetPlayerPed(-1), 0, -1, 0, 2)
	end
end)

RegisterNetEvent('qb_bandana:vagosbandana')
AddEventHandler('qb_bandana:vagosbandana', function()
   local ad = "missheist_agency2ahelmet"
   local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   loadAnimDict( ad )
   loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedPropIndex(GetPlayerPed(-1), 0, 14, 7, 2)
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedProp(GetPlayerPed(-1), 0, -1, 0, 2)
	end
end)

RegisterNetEvent('qb_bandana:cripsbandana')
AddEventHandler('qb_bandana:cripsbandana', function()
   local ad = "missheist_agency2ahelmet"
   local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   loadAnimDict( ad )
   loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedPropIndex(GetPlayerPed(-1), 0, 14, 2, 2)
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedProp(GetPlayerPed(-1), 0, -1, 0, 2)
	end
end)

RegisterNetEvent('qb_bandana:whitebandana')
AddEventHandler('qb_bandana:whitebandana', function()
   local ad = "missheist_agency2ahelmet"
   local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   loadAnimDict( ad )
   loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedPropIndex(GetPlayerPed(-1), 0, 14, 1, 2)
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedProp(GetPlayerPed(-1), 0, -1, 0, 2)
	end
end)

RegisterNetEvent('qb_bandana:blackbandana')
AddEventHandler('qb_bandana:blackbandana', function()
   local ad = "missheist_agency2ahelmet"
   local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   loadAnimDict( ad )
   loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedPropIndex(GetPlayerPed(-1), 0, 14, 3, 2)
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedProp(GetPlayerPed(-1), 0, -1, 0, 2)
	end
end)

RegisterNetEvent('qb_bandana:orangebandana')
AddEventHandler('qb_bandana:orangebandana', function()
   local ad = "missheist_agency2ahelmet"
   local ads = "mp_masks@standard_car@ds@"
   local player = PlayerPedId()
   loadAnimDict( ad )
   loadAnimDict( ads )
	if not bandana then
	RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	bandana = true
	SetPedPropIndex(GetPlayerPed(-1), 0, 14, 6, 2)
	elseif bandana then
	bandana = false
	RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedProp(GetPlayerPed(-1), 0, -1, 0, 2)
	end
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end