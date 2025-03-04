local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('dissasembly:low')
AddEventHandler('dissasembly:low', function()
   local src = source
   local Player = QBCore.Functions.GetPlayer(src)
   if Player.Functions.GetItemByName(Config.LowEndItem) ~= nil and Player.Functions.GetItemByName(Config.LowEndItem).amount >= 1 then
        if Config.Inventory == "qb" then 
	   Player.Functions.RemoveItem(Config.LowEndItem, 1)
	   Player.Functions.AddItem(Config.LowDissasemblyItem, Config.LowDissasemblyItemAmount)
	   Player.Functions.AddItem(Config.LowDissasemblyItem2, Config.LowDissasemblyItem2Amount)
           TriggerClientEvent("QBCore:Notify", src, "You successfully dissasemblied lowend radio!", "success")
	   TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LowEndItem], "remove")
	   TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LowDissasemblyItem], "add")
	   TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LowDissasemblyItem2], "add")
        elseif Config.Inventory == "ox" then
           ox_inventory:RemoveItem(src, Config.LowEndItem, 1)	
           exports.ox_inventory:AddItem(src, Config.LowDissasemblyItem, Config.LowDissasemblyItemAmount) 
	   exports.ox_inventory:AddItem(src, Config.LowDissasemblyItem2, Config.LowDissasemblyItem2Amount) 
           TriggerClientEvent("QBCore:Notify", src, "You successfully dissasemblied lowend radio!", "success")		
        elseif Config.Inventory == "custom" then
           print('Add you custom inventory at Cx_StealrRadios/server/sv_stealradio.lua:18')
        end	
    else
      TriggerClientEvent("QBCore:Notify", src, "You don't have an lowend radio in your bag!", "error")
   end
end)

RegisterServerEvent('dissasembly:high')
AddEventHandler('dissasembly:high', function(src)
   local src = source
   local Player = QBCore.Functions.GetPlayer(src)
   if Player.Functions.GetItemByName(Config.HighEndItem) ~= nil and Player.Functions.GetItemByName(Config.HighEndItem).amount >= 1 then
        if Config.Inventory == "qb" then 
	   Player.Functions.RemoveItem(Config.HighEndItem, 1)
	   Player.Functions.AddItem(Config.LowDissasemblyItem, Config.LowDissasemblyItemAmount)
	   Player.Functions.AddItem(Config.LowDissasemblyItem2, Config.LowDissasemblyItem2Amount)
           TriggerClientEvent("QBCore:Notify", src, "You successfully dissasemblied highend radio!", "success")
	   TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HighEndItem], "remove")
	   TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HighDissasemblyItem], "add")
	   TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HighDissasemblyItem2], "add")
        elseif Config.Inventory == "ox" then
           ox_inventory:RemoveItem(src, Config.HighEndItem, 1)	
           exports.ox_inventory:AddItem(src, Config.LowDissasemblyItem, Config.LowDissasemblyItemAmount) 
	   exports.ox_inventory:AddItem(src, Config.LowDissasemblyItem2, Config.LowDissasemblyItem2Amount) 
           TriggerClientEvent("QBCore:Notify", src, "You successfully dissasemblied highend radio!", "success")		
        elseif Config.Inventory == "custom" then
           print('Add you custom inventory at Cx_StealrRadios/server/sv_stealradio.lua:18')
        end			
    else
        TriggerClientEvent("QBCore:Notify", src, "You don't have an highend radio in your bag!", "error")
   end
end)
