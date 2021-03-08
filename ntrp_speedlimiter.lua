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
   local speed1        = 15.0 
   local speed2        = 25.0
   local speed3        = 35.0
   local speed4        = 45.0
   local speed5        = 55.0
   local speed6        = 65.0
   local speed7        = 75.0
   local speed8        = 100.0
   local speed9        = 200.0
   local resetspeed = 99999.9
   local speeddivider = 2.237

 if not IsPedInAnyBoat(GetPlayerPed(-1)) and not IsPedInAnyPlane(GetPlayerPed(-1)) and not IsPedInAnyHeli(GetPlayerPed(-1)) then

   ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'startmenu',
		{
			title    = '🚦Speedlimiter',
			align    = 'top-right',
			elements = {
                                {label = 'Reset Speed', value = 'click9'},
				{label = 'Set at 15 MPH', value = 'click1'},
				{label = 'Set at 25 MPH', value = 'click2'},
				{label = 'Set at 35 MPH', value = 'click3'},
				{label = 'Set at 45 MPH', value = 'click4'},
				{label = 'Set at 55 MPH', value = 'click5'},
                                {label = 'Set at 65 MPH', value = 'click6'},
                                {label = 'Set at 75 MPH', value = 'click7'},
                                {label = 'Set at 100 MPH', value = 'click8'},
                                {label = 'Close', value = 'closemenu'}
			}
		},
		function(data, menu)
                               if data.current.value == 'click1' then		
				 PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
			         SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed1/speeddivider )
                                 ESX.ShowNotification('~b~Maximum~w~ speed set to ~y~'..speed1..' ~w~MPH') 
                              
                                                 
			end
		if data.current.value == 'click2' then
		
				PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
				SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed2/speeddivider )
                                ESX.ShowNotification('~b~Maximum~w~ speed set to ~y~'..speed2..' ~w~MPH') 
                                                 
			
                                              end
		if data.current.value == 'click3' then
				
				PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
				SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed3/speeddivider )
                                ESX.ShowNotification('~b~Maximum~w~ speed set to ~y~'..speed3..' ~w~MPH') 
			end
		if data.current.value == 'click4' then
				
				PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
				SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed4/speeddivider )
                                ESX.ShowNotification('~b~Maximum~w~ speed set to ~y~'..speed4..' ~w~MPH') 
			end
		if data.current.value == 'click5' then
				
				  PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
				  SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed5/speeddivider )
                                  ESX.ShowNotification('~b~Maximum~w~ speed set to ~y~'..speed5..' ~w~MPH') 
                       		end
                               if data.current.value == 'click6' then
				
				  PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
			          SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), speed6/speeddivider )
                                  ESX.ShowNotification('~b~Maximum~w~ speed set to ~y~'..speed6..' ~w~MPH') 
                       		end
                                if data.current.value == 'click7' then
				
				  PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
			          SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false),  speed7/speeddivider )
                                  ESX.ShowNotification('~b~Maximum~w~ speed set to ~y~'..speed7..' ~w~MPH') 
                       		end
                                if data.current.value == 'click8' then
				
				  PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
			          SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false),  speed8/speeddivider )
                                  ESX.ShowNotification('~b~Maximum~w~ speed set to ~y~'..speed8..' ~w~MPH') 

                       		end
                                if data.current.value == 'click9' then
				
			          PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
			          SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false),  speed9/speeddivider )
                                  ESX.ShowNotification('~g~SUCCESS ~w~: Maximum speed has been ~r~reset!')

                       		end
	                   	if data.current.value == 'closemenu' then
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

if TruckId and GetPedInVehicleSeat(TruckId, -1) == ped then
 
             if Config.NoWeaponWheel then
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
  local TruckId    =  GetVehiclePedIsIn(ped, false)


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
