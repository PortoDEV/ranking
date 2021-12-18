-----------------------------------------------------------------------------------------------------------------------------------------
-- THE CONECTION
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vSERVER = Tunnel.getInterface('ranking')
-----------------------------------------------------------------------------------------------------------------------------------------
-- THE OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rank', function() 
    if vSERVER.checkFac() then
        SetNuiFocus(true, true)
        SendNUIMessage({ open = true })
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE THE NUI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeNUI", function(data, cb)
    SetNuiFocus(false, false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVE INITIAL INFOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("giveInitial", function(data, cb)
    local infos = vSERVER.returnInfos()
    SendNUIMessage({ table = infos })
end)
