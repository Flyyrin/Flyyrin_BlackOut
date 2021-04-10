print("^6Thank you for using " .. GetCurrentResourceName() .. ".\n^6Check out more awesome Resources and scripts, ^2Github.com/Flyyrin")
if not Config.vSync then
    print(GetCurrentResourceName() .. " is ^1not using vSync^7, You can change this in the Config file.")
else
    print(GetCurrentResourceName() .. " is ^2using vSync^7, You can change this in the Config file.")
end
-----------
local blackout = false

RegisterServerEvent("flyyrin:console_print")
RegisterServerEvent("flyyrin:togle_blackout")
RegisterServerEvent("flyyrin:request_blackout_state")
RegisterServerEvent("flyyrin:sync_blackout")

AddEventHandler("flyyrin:console_print", function(text)
    print(text)
end)


AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        if blackout then
            print("^6Recource: " .. GetCurrentResourceName() .. " was stopped! so i DeActivated the blackout.")
        end
    end
end)

AddEventHandler('playerConnecting', function(user, set)
    if not Config.vSync then
        print("^1[Debug]^7: " .. user .." is ^2joining with Blackout set to: " .. tostring(blackout) .. ".")
    else
        local blackout = TriggerEvent("flyyrin:vSync_blackOut_state")
        print("^1[Debug]^7: " .. user .." is ^2joining with Blackout set to: " .. tostring(blackout) .. ".")
    end
end)

AddEventHandler('playerDropped', function (reason)
    if not Config.vSync then
        print("^1[Debug]^7: " .. GetPlayerName(source) .." ^1left ^7with Blackout set to: " .. tostring(blackout) .. ". ^5Reason: " .. reason)
    else
        local blackout = TriggerEvent("flyyrin:vSync_blackOut_state")
        print("^1[Debug]^7: " .. GetPlayerName(source) .." ^1left ^7with Blackout set to: " .. tostring(blackout) .. ". ^5Reason: " .. reason)
    end
end)
    
AddEventHandler("flyyrin:togle_blackout", function(player)
    blackout = not blackout
    if blackout then
        if Config.Enable_Debug then
            print("^1[Debug]^7: Blackout set to: " .. tostring(blackout) .. " By: " .. player .. ".")
        end
            TriggerClientEvent('flyyrin:blackout_active', -1, '')
    else
        if Config.Enable_Debug then
            print("^1[Debug]^7: Blackout set to: " .. tostring(blackout) .. " By: " .. player .. ".")
        end
        TriggerClientEvent('flyyrin:blackout_not_active', -1, '')
    end
end)

AddEventHandler("flyyrin:request_blackout_state", function()
    return blackout
end)

AddEventHandler("flyyrin:sync_blackout", function()
    if blackout then
        TriggerClientEvent('flyyrin:blackout_active', -1, '')
    else
        TriggerClientEvent('flyyrin:blackout_not_active', -1, '')
    end
end)