#QB-CORE/SHARED/ITEMS.LUA

#OLDQBCore
    ["c_radiokit"] 				 = {["name"] = "c_radiokit", 				["label"] = "Removal Kit", 			["weight"] = 1500, 		["type"] = "item", 		["image"] = "c_radiokit.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true, ["combinable"] = nil,   ["description"] = ""},
    ["lowendradio"] 				 = {["name"] = "lowendradio", 				["label"] = "Shitty Radio", 			["weight"] = 2500, 		["type"] = "item", 		["image"] = "lowendradio.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true, ["combinable"] = nil,   ["description"] = ""},
    ["highendradio"] 				 = {["name"] = "highendradio", 				["label"] = "Premium Radio", 			["weight"] = 3500, 		["type"] = "item", 		["image"] = "highendradio.png", 		["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true, ["combinable"] = nil,   ["description"] = ""},

#NEWQBCore
    c_radiokit 				 = {name = 'c_radiokit', 				label = 'Removal Kit', 			weight = 1500, 		type = 'item', 		image = 'c_radiokit.png', 		unique = true, 	useable = true, 	shouldClose = true, combinable = nil,   description = ''},
    lowendradio 				 = {name = 'lowendradio', 				label = 'Shitty Radio', 			weight = 2500, 		type = 'item', 		image = 'lowendradio.png', 		unique = true, 	useable = true, 	shouldClose = true, combinable = nil,   description = ''},
    highendradio 				 = {name = 'highendradio', 				label = 'Premium Radio', 			weight = 3500, 		type = 'item', 		image = 'highendradio.png', 		unique = true, 	useable = true, 	shouldClose = true, combinable = nil,   description = ''},

#Ox_Inventory
['c_radiokit'] = {
    label = 'Removal Kit',
    weight = 1500,
    stack = false,
    close = true,
    description = 'A kit containing tools for removing devices',
    client = {
        image = 'c_radiokit.png',
        event = 'stealradio:target'
    }
},

['lowendradio'] = {
    label = 'Shitty Radio',
    weight = 2500,
    stack = false,
    close = true,
    description = 'A low-end, barely functional radio',
    client = {
        event = 'radio:disassembly'
    }
},

['highendradio'] = {
    label = 'Premium Radio',
    weight = 3500,
    stack = false,
    close = true,
    description = 'A high-quality radio with excellent reception',
    client = {
        event = 'radio:disassembly'
    }
},

#REQUIREMENTS
QB-LOCK - https://github.com/Nathan-FiveM/qb-lock
QB-POLICEJOB - https://github.com/qbcore-framework/qb-policejob
QB-MENU - https://github.com/qbcore-framework/qb-menu
QB-TARGET - https://github.com/qbcore-framework/qb-target
