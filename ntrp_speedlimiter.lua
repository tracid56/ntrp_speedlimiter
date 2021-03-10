ESX = nil
menuOpen = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

		Citizen.Wait(0)
 end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
       
       local ped = GetPlayerPed(-1)       
       local playerCoords  =  GetEntityCoords(ped)
       local TruckId       =  GetVehiclePedIsIn(ped, false)
       local driverPed                   = GetPedInVehicleSeat(TruckId, -1)
 
 if IsControlJustPressed(0, Config.Key) and GetPedInVehicleSeat(TruckId, -1) == ped then 
                          
                           Speedlimiter()

      end
    end
end)


function Speedlimiter() 
   menuOpen = true
   local ped             = GetPlayerPed(-1)   
   local TruckId       =  GetVehiclePedIsIn(ped, false)
   local speeddivider = 2.237

 if not IsPedInAnyBoat(GetPlayerPed(-1)) and not IsPedInAnyPlane(GetPlayerPed(-1)) and not IsPedInAnyHeli(GetPlayerPed(-1)) then

   ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'startmenu',
		{
			title    = '🚦Speedlimiter',
			align    = 'top-right',
			elements = {
        {label = 'Reset Speed', value = '999.9'},
				{label = 'Set at 25 MPH', value = '25.0'},
				{label = 'Set at 35 MPH', value = '35.0'},
				{label = 'Set at 45 MPH', value = '45.0'},
				{label = 'Set at 55 MPH', value = '55.0'},
        {label = 'Set at 65 MPH', value = '65.0'},
        {label = 'Set at 75 MPH', value = '75.0'},
        {label = 'Set at 100 MPH', value = '100.0'},
        {label = 'Close', value = 'closemenu'}
			}
		},
		function(data, menu)
			PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
			 SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), data.current.value/speeddivider )
      ESX.ShowNotification('~b~Maximum~w~ speed set to ~y~'..data.current.value..' ~w~MPH') 

		  if data.current.test == 'closemenu' then
        ESX.UI.Menu.CloseAll()
			end
      menuOpen = nil
			menu.close()
		end,
    function(data, menu)
      menuOpen = nil
			menu.close()
    end)
end
end

Citizen.CreateThread(function() -- Driver Ped no Drive By
 while true do 
  Citizen.Wait(1)
    local ped        = GetPlayerPed(-1)
    local driverPed         = GetPedInVehicleSeat(TruckId , -1)
    local TruckId   	    =  GetVehiclePedIsIn(ped, false)

  if TruckId and GetPedInVehicleSeat(TruckId, -1) ==  ped then
    if Config.NoWeapons then
      SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true)
      DisableControlAction(0, 37, true) -- Weapon wheel
      DisableControlAction(0, 106, true) -- Weapon wheel
      if IsDisabledControlJustPressed(2, 37) then
		    --SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true) 	
      end
      if IsDisabledControlJustPressed(0, 106) then 
		    SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true)
      end
    end
    if VehCamOff then
      DisableControlAction(0, 80, true) -- no cin cam
      SetFollowPedCamViewMode(1)
    end
    if menuOpen then
      DisableControlAction(0, 42, true) 
      DisableControlAction(0, 43, true) 
   end               
  end
 end
end)

TriggerEvent('chat:addSuggestion', '/cam.off', 'Turn off or Lock Cinematic Cam', {
    { name="Vehicle Cam", help="/cam.off " }
})

TriggerEvent('chat:addSuggestion', '/cam.on', 'Turn On or Unlock Cinematic Cam', {
    { name="Vehicle Cam", help="/cam.on" }
})

RegisterCommand("cam.off", function()
 
  local ped        = GetPlayerPed(-1)
  local TruckId   	    =  GetVehiclePedIsIn(ped, false)

N_0x5db8010ee71fdef2(TruckId)
SetFollowPedCamViewMode(1)
ESX.ShowNotification('~b~Vehicle Cam :~y~ OFF') 
 Citizen.Wait(30)
VehCamOff = true
end)

RegisterCommand("cam.on", function()
ESX.ShowNotification('~b~Vehicle Cam :~y~ ON') 
VehCamOff = nil
 Citizen.Wait(30)
end)

menuOpen = nil
