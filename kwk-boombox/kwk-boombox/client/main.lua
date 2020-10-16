local cacheSpeaker = {}
local placedSpeaker = {}
local placedSpeakerCoords = nil
local onSongPick = false
local currentId = nil

Citizen.CreateThread(
	function()
		while QBCore == nil do
			if (Config.UsingESX) then
				TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)  
			end
			Citizen.Wait(0)
		end
	end
)

AddEventHandler(
	"onResourceStop",
	function(resource)
		if resource == GetCurrentResourceName() then
			SetNuiFocus(false, false)
		end
	end
)



Citizen.CreateThread(function()
	while not NetworkIsSessionStarted() do Wait(0) end

	TriggerServerEvent("kwk-boombox:joined")
end)



RegisterNUICallback("loadServer",function(data, cb)
	local plyrcoords, forward = GetEntityCoords(PlayerPedId()), GetEntityForwardVector(PlayerPedId())
	local spawncoords = (plyrcoords + forward * 1.0)

	local tempTable = {
		[1] = {id = data.id, coords = cacheSpeaker[currentId].coords, time = data.time, speaker = currentId, startTime = data.time, speakerid = cacheSpeaker[currentId].speakerid}
	}
		TriggerServerEvent("kwk-boombox:loadSpeaker", tempTable[1])
end)


RegisterNetEvent("kwk-boombox:loadSpeakerClient")
AddEventHandler("kwk-boombox:loadSpeakerClient", function(speaker)
	cacheSpeaker[speaker.speaker] = speaker
end)


RegisterNetEvent("kwk-boombox:joined")
AddEventHandler("kwk-boombox:joined", function(speaker)
	cacheSpeaker = speaker
end)

RegisterNetEvent("kwk-boombox:removeClient")
AddEventHandler("kwk-boombox:removeClient", function(speaker)
	cacheSpeaker[speaker] = nil
	SendNUIMessage({close = true})
end)

local speaker
local started = false
local playing
local onSwitch = false
local onVolChange = false
local volchange = 0
local videoStatus = "play"
local newTime = 0

RegisterNUICallback("switchVideo",function(data, cb)
	onSwitch = true
	videoStatus = data.videoStatus
	newTime = data.pausedTime
end)

RegisterNUICallback("changeVol",function(data, cb)
	onVolChange = true
	volchange = data.vol
end)

RegisterNetEvent("kwk-boombox:switchVideoClient")
AddEventHandler("kwk-boombox:switchVideoClient", function(id, videoStatus, time)
	cacheSpeaker[id].switch = true
	cacheSpeaker[id].videoStatus = videoStatus
	cacheSpeaker[id].time = time - cacheSpeaker[id].time
end)

RegisterNetEvent("kwk-boombox:changeVolClient")
AddEventHandler("kwk-boombox:changeVolClient", function(id, vol)
	cacheSpeaker[id].volval = vol
	cacheSpeaker[id].volchange = true
end)

local vol = 100

Citizen.CreateThread(function()
	while true do
		local wait = 100
		local plyr = PlayerPedId()
		local plyrcoords = GetEntityCoords(plyr)

		if #cacheSpeaker > 0 then
			for k, v in pairs(cacheSpeaker) do
                local dist = #(v.coords - plyrcoords)
                
                if v.id ~= nil then
                    
					if dist < 20.0 then

						vol = v.volval - (dist * 5)

						if not v.playing then

							v.playing = true

							playing = k

							SendNUIMessage({start = true, time = v.time, id = v.id, videoStatus = v.videoStatus, startTime = v.startTime})

							videoStatus = v.videoStatus

						elseif playing == k and onSwitch then

							TriggerServerEvent("kwk-boombox:switchVideo", k, videoStatus, newTime)

							onSwitch = false

						elseif playing == k and v.switch then

							v.switch = false

							SendNUIMessage({switch = true, videoStatus = v.videoStatus, time = v.time})

						elseif playing == k and onVolChange then

							TriggerServerEvent("kwk-boombox:changeVol", k, volchange)

							onVolChange = false

						elseif playing == k and v.volchange then

							v.volchange = false

						end

					elseif dist > 20.0 and playing == k and v.playing then

						SendNUIMessage({type = "reset"})

						v.playing = false

						SendNUIMessage({close = true})

					end

					

					if playing == k and v.playing then

						if IsPedInAnyVehicle(plyr, false) then

							vol = vol / 5

						end

						SendNUIMessage({volume = vol, setVol = true, volval = v.volval})

					end

				end

			end

		end

		Wait(wait)

	end

end)



Citizen.CreateThread(function()

	while true do

		Wait(1)

		if #cacheSpeaker > 0 then

			for k, v in pairs(cacheSpeaker) do



				if #(v.coords - GetEntityCoords(PlayerPedId())) < 2.0 then

					local fixedCoords = vector3(v.coords.x, v.coords.y, v.coords.z - 1.5)

					currentId = v.speaker

					HelpText(Config["translations"].pickUp, fixedCoords)



					if IsControlJustPressed(0, 38) then

						SetNuiFocus(true, true)

						SendNUIMessage({type = "openSpeaker"})

					end

					if IsControlJustPressed(0, 47) then

						TriggerServerEvent("kwk-boombox:removeSpeaker", currentId)

						SendNUIMessage({type = "reset"})

						print(v.speakerid)

						DeleteEntity(v.speakerid)

						while DoesEntityExist(v.speakerid) do

							Wait(0)

							DeleteEntity(v.speakerid)

						end

						started = false

						placedSpeakerCoords = nil

					end

				end

			end

		end

	end

end)


RegisterNetEvent("kwk-boombox:place")
AddEventHandler("kwk-boombox:place", function()
	local plyrcoords, forward = GetEntityCoords(PlayerPedId()), GetEntityForwardVector(PlayerPedId())
	local spawncoords = (plyrcoords + forward * 1.0)
	tooClose = false
	if #cacheSpeaker > 0 then
		for k, v in pairs(cacheSpeaker) do
			if #(plyrcoords - v.coords) < 40.0 then
				tooClose = true
			end
		end
		if not tooClose then
			speaker = CreateObject(1729911864, spawncoords, true, true, true)
			FreezeEntityPosition(speaker, true)
			SetEntityAsMissionEntity(speaker)
			SetEntityCollision(speaker, false, true)
			PlaceObjectOnGroundProperly(speaker)
			TriggerServerEvent("kwk-boombox:placedSpeaker", spawncoords, speaker)
			SetEntityHeading(speaker, GetEntityHeading(PlayerPedId()))
		else
			ESX.ShowNotification(Config["translations"].tooClose, false, false)
		end
	else
		speaker = CreateObject(1729911864, spawncoords, true, true, true)
		FreezeEntityPosition(speaker, true)
		SetEntityAsMissionEntity(speaker)
		SetEntityCollision(speaker, false, true)
		PlaceObjectOnGroundProperly(speaker)
		TriggerServerEvent("kwk-boombox:placedSpeaker", spawncoords, speaker)
		SetEntityHeading(speaker, GetEntityHeading(PlayerPedId()))
	end
end)



RegisterNUICallback("escape",function(data, cb)
	SetNuiFocus(false, false)
end)



HelpText = function(msg, coords)
    if not coords or not Config.Enable3DText then
        AddTextEntry(GetCurrentResourceName(), msg)
        DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
    else
        DrawText3D(coords, string.gsub(msg, "~INPUT_CONTEXT~", "~r~[~w~E~r~]~w~"), 0.35)
    end
end



DrawText3D = function(coords, text, scale)
    coords = coords + vector3(0.0, 0.0, 1.2)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 41, 41, 125)
end

