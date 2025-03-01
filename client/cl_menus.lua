local QBCore = exports['qb-core']:GetCoreObject()
CreateThread(function() 
    exports[Config.TargetExport]:AddBoxZone("radiod", Config.DissasemblyLocation, 20, 20,  {
      name = "radiod",
      heading = 0,
      debugPoly = false,
    }, {
      options = {
        {
          type = "client",
          event = "radio:disassembly",
          icon = "fas fa-barcode",
          label = Lang:t("target.target_disassembly_label"),
        }
      },
      distance = 2.0,
    })
end)

RegisterNetEvent('radio:disassembly', function()
    exports[Config.MenuExport]:openMenu({
        {
            id = 1,
            header = "Radio Disassembly",
            txt = ""
        },
        {
            id = 2,
            header = "Disassembly Lowend Radio",
            txt = "Take apart lowend radio",
	    isServer = false,
            params = {
                event = "dessembly:stepotwo",
            }
        },
        {
            id = 3,
            header = "Disassembly Highend Radio",
            txt = "Take apart highend radio",
	    isServer = false,
            params = {
                event = "dessembly:stepone",
            }
        },
        {
            id = 4,
            header = "< Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
    })
end)

RegisterNetEvent("dessembly:stepone")
AddEventHandler("dessembly:stepone", function(source)
   local src = source
   local ped = GetPlayerPed(-1)
   stealAnimationMenus() 
   QBCore.Functions.Progressbar("steal_radio", Lang:t("progbar.progbar_dessembly_high"), Config.UnscrewTime, false, true, {
       disableMovement = true,
       disableCarMovement = true,
       disableMouse = false,
       disableCombat = true,
   }, {}, {}, {}, function() -- Done
       stealAnimationMenus() 
       local success = exports[Config.GameScript]:StartLockPickCircle(Config.Circles,Config.CircleTime)
       if success then
          TriggerServerEvent('dissasembly:high', src) 
          ClearPedTasks(ped)
       else
	  QBCore.Functions.Notify(Lang:t("progbar.progbar_cancel"), "error")
       end
   end)
end)

RegisterNetEvent("dessembly:stepotwo")
AddEventHandler("dessembly:stepotwo", function(source)
   local src = source
   local ped = GetPlayerPed(-1)
   stealAnimationMenus() 
   QBCore.Functions.Progressbar("steal_radio", Lang:t("progbar.progbar_dessembly_low"), Config.UnscrewTime, false, true, {
       disableMovement = true,
       disableCarMovement = true,
       disableMouse = false,
       disableCombat = true,
   }, {}, {}, {}, function() -- Done
       stealAnimationMenus() 
       local success = exports[Config.GameScript]:StartLockPickCircle(Config.Circles,Config.CircleTime)
       if success then
          TriggerServerEvent('dissasembly:low', src) 
          ClearPedTasks(ped)
       else
	  QBCore.Functions.Notify(Lang:t("progbar.progbar_cancel"), "error")
       end
   end)
end)

function LoadAnimDict(dict) if not HasAnimDictLoaded(dict) then RequestAnimDict(dict) while not HasAnimDictLoaded(dict) do Wait(1) end end end
function stealAnimationMenus() 
   local ped = GetPlayerPed(-1) 
   LoadAnimDict("mini@repair") 
   TaskPlayAnim(ped, "mini@repair", "fixing_a_ped", 2.0, 8.0, -1, 50, 1, 0, 0, 0) 
end