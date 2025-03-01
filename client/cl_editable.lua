local QBCore = exports['qb-core']:GetCoreObject()

function LoadAnimDict(dict) if not HasAnimDictLoaded(dict) then RequestAnimDict(dict) while not HasAnimDictLoaded(dict) do Wait(1) end end end
function stealAnimation() 
   local ped = GetPlayerPed(-1) 
   LoadAnimDict("mini@repair") 
   TaskPlayAnim(ped, "mini@repair", "fixing_a_ped", 2.0, 8.0, -1, 50, 1, 0, 0, 0) 
end