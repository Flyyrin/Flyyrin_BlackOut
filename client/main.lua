Citizen.CreateThread(function()
    while true do
        local E_key = 38
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        local loc = Config.Locations["PowerPlant_Tank"].position
        Citizen.Wait(1)
        if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc.x, loc.y, loc.z, 2) then 
            helpMessage("Press ~INPUT_PICKUP~ to Togle power switch.")
            if IsControlJustReleased(1, E_key) then
                local player_name = GetPlayerName(PlayerId())
                if not Config.vSync then
                    TriggerServerEvent("flyyrin:togle_blackout", player_name)
                else
                    TriggerServerEvent("flyyrin:vSync_togle_blackOut", player_name)
                end
            end
        end
    end
end)

RegisterNetEvent('flyyrin:message')
RegisterNetEvent('flyyrin:blackout_active')
RegisterNetEvent('flyyrin:blackout_not_active')

AddEventHandler('playerSpawned', function()
    if not Config.vSync then
        TriggerServerEvent('flyyrin:sync_blackout')
    else
        --vSync will Sync?
    end
end)

AddEventHandler('flyyrin:message', function(text)
    msg("[Togle]",text)
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        local blackout = TriggerServerEvent("flyyrin:request_blackout_state", "")
        if blackout then
            if not Config.vSync then
                SetArtificialLightsState(false)
            else
                --vSync Stuff Active
            end
        end
    end
end)

AddEventHandler('flyyrin:blackout_active', function()
    if not Config.vSync then
        SetArtificialLightsState(true)
    else
        --vSync stuff Active
    end
end)

AddEventHandler('flyyrin:blackout_not_active', function()
    if not Config.vSync then
        SetArtificialLightsState(false)
    else
        --vSync stuff Not Ative
    end
end)



