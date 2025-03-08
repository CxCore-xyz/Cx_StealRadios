local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.RadioRemovalItem, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('stealradio:target', src)
end)

RegisterServerEvent('stealradio:reward:lowend')
AddEventHandler('stealradio:reward:lowend', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Inventory == "qb" then 
        Player.Functions.AddItem(Config.LowEndItem, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LowEndItem], "add")
    elseif Config.Inventory == "ox" then
        exports.ox_inventory:AddItem(src, Config.LowEndItem, 1) 
    elseif Config.Inventory == "custom" then
        print('Add you custom inventory at Cx_StealrRadios/server/sv_stealradio.lua:18')
    end
end)

RegisterServerEvent('stealradio:reward:highend')
AddEventHandler('stealradio:reward:highend', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Inventory == "qb" then 
        Player.Functions.AddItem(Config.HighEndItem, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HighEndItem], "add")
    elseif Config.Inventory == "ox" then
        exports.ox_inventory:AddItem(src, Config.HighEndItem, 1) 
    elseif Config.Inventory == "custom" then
        print('Add you custom inventory at Cx_StealrRadios/server/sv_stealradio.lua:33')
    end		
end)

RegisterServerEvent('stealradio:remove:item')
AddEventHandler('stealradio:remove:item', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Inventory == "qb" then 
        Player.Functions.AddItem(Config.RadioRemovalItem, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RadioRemovalItem], "remove")
    elseif Config.Inventory == "ox" then
        ox_inventory:RemoveItem(src, Config.RadioRemovalItem, 1)
    elseif Config.Inventory == "custom" then
        print('Add you custom inventory at Cx_StealrRadios/server/sv_stealradio.lua:47')
    end	
end)

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
	Citizen.Wait(5000)
        print('^2>>-----------------^4CxCore^2----------------<<')
	print('^4Cx_StealRadios ^0(Created By CxCore)')
        print('^1Discord : ^0https://discord.gg/CcVQHbJCSH')
        print('^5Discord #2 : ^0https://dsc.gg/CxCCore')
        print('^2>>-----------------^4CxCore^2----------------<<')
   end
end)
