local QBCore = exports['qb-core']:GetCoreObject()
local StoleRadio = false
local AlertSend = false

if Config.Command then
   RegisterCommand(Config.RegisterCommand, function()
       if StoleRadio then
          QBCore.Functions.Notify(Lang:t("error.error_cooldown"), "error")
       else
          TriggerEvent('stealradio:stepone')
       end
   end)
end

RegisterNetEvent("stealradio:stepone")
AddEventHandler("stealradio:stepone", function(source)
   local src = source
   local ped = GetPlayerPed(-1)
   local invehicle = IsPedInAnyVehicle(ped)
   if invehicle then
        TriggerServerEvent('stealradio:remove:item', src)
        callPolice()
        stealAnimation()
	QBCore.Functions.Progressbar("steal_radio", Lang:t("progbar.progbar_unscrew"), Config.UnscrewTime, false, true, {
	    disableMovement = true,
	    disableCarMovement = true,
	    disableMouse = false,
	    disableCombat = true,
        }, {}, {}, {}, function() -- Done
	    local success = exports[Config.GameScript]:StartLockPickCircle(Config.Circles,Config.CircleTime)	    
	    if success then
               TriggerEvent('stealradio', src) 
               QBCore.Functions.Notify(Lang:t("progbar.progbar_success_unscrew"), "success")
	    else
	       QBCore.Functions.Notify(Lang:t("progbar.progbar_cancel"), "error")
            end
	end)
   else
       QBCore.Functions.Notify(Lang:t("error.error_notinvehicle"),"error")
   end
end)

RegisterNetEvent("stealradio")
AddEventHandler("stealradio", function(source)
   local src = source
   local ped = GetPlayerPed(-1)
   local invehicle = IsPedInAnyVehicle(ped)
   if invehicle then
        stealAnimation()
	QBCore.Functions.Progressbar("steal_radio", Lang:t("progbar.progbar_remove"), Config.RemovalTime, false, true, {
	    disableMovement = true,
	    disableCarMovement = true,
	    disableMouse = false,
	    disableCombat = true,
        }, {}, {}, {}, function() -- Done
	    local success = exports[Config.GameScript]:StartLockPickCircle(Config.Circles,Config.CircleTime)
	    if success then
               StoleRadio = true
               TriggerEvent('stealradiotimeout') 
               rewardLoad()
               QBCore.Functions.Notify(Lang:t("progbar.progbar_success_radio"), "success")
	    else
	       QBCore.Functions.Notify(Lang:t("progbar.progbar_cancel"), "error")
            end
	end)
   else
       QBCore.Functions.Notify(Lang:t("error.error_notinvehicle"),"error")
   end
end)

RegisterNetEvent("stealradiotimeout")
AddEventHandler("stealradiotimeout", function()
    --Wait(Config.StealTimeout)
    --StoleRadio = false
    SetTimeout(Config.StealTimeout, function()
        StoleRadio = false
    end)
end)

RegisterNetEvent("stealradio:target")
AddEventHandler("stealradio:target", function()
   if StoleRadio then
      QBCore.Functions.Notify(Lang:t("error.error_cooldown"), "error")
   else
      TriggerEvent('stealradio:stepone')
   end
end)

function rewardLoad()
   local src = source
   local chance = Config.HighEndRewardChance
   if math.random() <= chance then
       TriggerServerEvent('stealradio:reward:highend', src)
   else
       TriggerServerEvent('stealradio:reward:lowend', src)
   end
end

function callPolice()
   if Config.NotifyPolice then      
      if not AlertSend then
         local chance = Config.AlertChance
         if GetClockHours() >= 1 and GetClockHours() <= 6 then
            chance = Config.PoliceNightAlertChance
         end
         if math.random() <= chance then
            TriggerServerEvent('police:server:policeAlert', Lang:t("police.police_notify"))
         end
         AlertSend = true
         SetTimeout(Config.Cooldown, function()
            AlertSend = false
         end)
      end
   end
end