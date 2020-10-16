QBCore = nil

Citizen.CreateThread(function()
  while QBCore == nil do
   TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
    Citizen.Wait(0)
  end
end)


local start = false
local inGas = false
local mask = false

RegisterNetEvent('QBCore_copweapon:mask')
AddEventHandler('QBCore_copweapon:mask', function()
  print(mask)
  if mask == false then
    SetPedComponentVariation(GetPlayerPed(-1), 1, 38, 0, 2)
    mask = true
  else
    SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 2)
    mask = false
  end
end)

function stunGun()
  local playerPed = GetPlayerPed(-1)
  RequestAnimSet("move_m@drunk@verydrunk")
  while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
    Citizen.Wait(0)
  end
  DoScreenFadeOut(800)
  SetPedMinGroundTimeForStungun(GetPlayerPed(-1), 15000)
  SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)
  SetTimecycleModifier("spectator5")
  SetPedIsDrunk(playerPed, true)
  Wait(15000)
  SetPedMotionBlur(playerPed, true)
  DoScreenFadeIn(800)
  Wait(60000)
  DoScreenFadeOut(800)
  Wait(1000)
  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(playerPed, 0)
  SetPedIsDrunk(playerPed, false)
  SetPedMotionBlur(playerPed, false)
  DoScreenFadeIn(800)
end

function caPique()
  start = true
    SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, true)
    if mask == false then
      local playerPed = GetPlayerPed(-1)
      RequestAnimSet("move_p_m_zero_slow")
      while not HasAnimSetLoaded("move_p_m_zero_slow") do
        Citizen.Wait(0)
      end
      SetPedMovementClipset(playerPed, "move_p_m_zero_slow", true)
      SetPedMotionBlur(playerPed, true)
      SetTimecycleModifier("prologue_ending_fog")
    end
    Citizen.Wait(10000)
    ClearEntityLastDamageEntity(GetPlayerPed(-1))
    SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
  start=false
end


Citizen.CreateThread(function()
   while true
    do
       if HasPedBeenDamagedByWeapon(GetPlayerPed(-1),-37975472,0) then
         Citizen.Wait(2)
         if start == false then
           caPique()
        end
        inGas = true
      else
        if mask == true then
          inGas = false
        end
        if inGas==true then
          inGas = false
          local playerPed = GetPlayerPed(-1)
          SetEntityHealth(playerPed, 140)
          SetTimecycleModifier("spectator9")
          Citizen.Wait(30000)
          ResetScenarioTypesEnabled()
          ClearTimecycleModifier()
          ResetPedMovementClipset(playerPed, 0)
          SetPedMotionBlur(playerPed, false)      
        end
      end
      if IsPedBeingStunned(GetPlayerPed(-1)) then
        stunGun()
      end
      SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
      ClearEntityLastDamageEntity(GetPlayerPed(-1))
      Citizen.Wait(1)
   end

end)
