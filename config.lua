Config = {}

--Locations Settings
Config.DissasemblyLocation = vector3(1343.317, 4391.5581, 44.515762) -- Location where you can take apart radios for materials

--Item Settings
Config.RadioRemovalItem = "c_radiokit" -- Item wich will trigger radio stealing action

--Inventory Settings
Config.Inventory = "qb" -- For now only qb/ox/custom inventories

--Dissasembly HighEnd Settings
Config.HighDissasemblyItem = "copper" -- When you dissasembly highend radio this will be your reward
Config.HighDissasemblyItem2 = "iron" -- When you dissasembly highend radio this will be your reward
Config.HighDissasemblyItemAmount = 5 -- The amount you will receive after dissasembly
Config.HighDissasemblyItem2Amount = 3 -- The amount you will receive after dissasembly

--Dissasembly LowEnd Settings
Config.LowDissasemblyItem = "steel" -- When you dissasembly lowend radio this will be your reward
Config.LowDissasemblyItem2 = "plastic" -- When you dissasembly lowend radio this will be your reward
Config.LowDissasemblyItemAmount = 5 -- The amount you will receive after dissasembly
Config.LowDissasemblyItem2Amount = 3 -- The amount you will receive after dissasembly

--Reward Settings
Config.HighEndRewardChance = 0.20 -- Chance of getting high end radio item
Config.LowEndItem = "lowendradio" -- Low end radio item
Config.HighEndItem = "highendradio" -- High end radio item

--Command Settings
Config.Command = false -- Set it too true if you want to use command
Config.RegisterCommand = "stealradio" -- The command wich triggers the action of stealing radio

--Timeout/Time Settings
Config.RemovalTime = math.random(5000,10000) -- Time wich will take to remove the radio
Config.UnscrewTime = math.random(2500,5000) -- Time wich will take to unscrew the screws
Config.StealTimeout = 10000 -- Timeout for when you can steal other radio 10000/10seconds

--Police Notify Settings
Config.NotifyPolice = true -- Want the police to be notified then make it true
Config.Cooldown = 10000 -- 10 seconds
Config.AlertChance = 0.07 -- Chance of alerting police during the day
Config.PoliceNightAlertChance = 0.03 -- Chance of alerting police at night (time:01-06)

--Minigame Settings
Config.Circles = 5 -- Max circles
Config.CircleTime = 20 -- Time settings for circles

--Exports Setting
Config.TargetExport = "qb-target" -- Target export
Config.MenuExport = "qb-menu" -- Menu export
Config.GameScript = "qb-lock" -- Minigame export
