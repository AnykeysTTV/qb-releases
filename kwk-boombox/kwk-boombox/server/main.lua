local speakers = {}

local coords = {}
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateUseableItem("hifi", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('kwk-boombox:place', source)
	
end)

RegisterServerEvent('kwk-boombox:loadSpeaker')
AddEventHandler('kwk-boombox:loadSpeaker', function(speaker)
    speakers[speaker.speaker] = speaker
    speakers[speaker.speaker].switch = false
    speakers[speaker.speaker].volchange = false
    speakers[speaker.speaker].volval = 100
    speaker.switch = false
    speaker.volchange = false
    speaker.volval = 100
    TriggerClientEvent('kwk-boombox:loadSpeakerClient', -1, speaker)
end)

local id = 0

RegisterServerEvent('kwk-boombox:removeSpeaker')
AddEventHandler('kwk-boombox:removeSpeaker', function(speaker)
    id = id - 1
    TriggerClientEvent("kwk-boombox:removeClient", -1, speaker)
end)


RegisterServerEvent('kwk-boombox:placedSpeaker')
AddEventHandler('kwk-boombox:placedSpeaker', function(spawncoords, speakerid)
    id = id + 1
    local speaker = {}
    speaker.speakerid = speakerid
    speaker.coords = spawncoords
    speaker.speaker = id
    table.insert(speakers, speaker)
    TriggerClientEvent('kwk-boombox:loadSpeakerClient', -1, speaker)
end)

RegisterServerEvent('kwk-boombox:joined')
AddEventHandler('kwk-boombox:joined', function()
    local src = source
    for i=1, #speakers do
        --print(speakers[i].coords)
        --print(speakers[i].speaker)
        --print(speakers[i].volchange)
        --print(speakers[i].videoStatus)
        --print(speakers[i].time)
    end
    TriggerClientEvent("kwk-boombox:joined", src, speakers)
end)



RegisterServerEvent('kwk-boombox:switchVideo')
AddEventHandler('kwk-boombox:switchVideo', function(id, videoStatus, time)
    local src = source
    TriggerClientEvent("kwk-boombox:switchVideoClient", -1, id, videoStatus, time)
    speakers[id].switch = true
    speakers[id].videoStatus = videoStatus
    speakers[id].time = time - speakers[id].time
end)



RegisterServerEvent('kwk-boombox:changeVol')
AddEventHandler('kwk-boombox:changeVol', function(id, vol)
    local src = source
    speakers[id].volval = vol
    TriggerClientEvent("kwk-boombox:changeVolClient", -1, id, vol)
end)