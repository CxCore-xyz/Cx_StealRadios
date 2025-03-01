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
	Player.Functions.AddItem(Config.LowEndItem, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LowEndItem], "add")
end)

RegisterServerEvent('stealradio:reward:highend')
AddEventHandler('stealradio:reward:highend', function()
	local src = source
        local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(Config.HighEndItem, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HighEndItem], "add")
end)

RegisterServerEvent('stealradio:remove:item')
AddEventHandler('stealradio:remove:item', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(Config.RadioRemovalItem, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RadioRemovalItem], "remove")
end)
