print("^6Thank you for using " .. GetCurrentResourceName() .. ".\n^6Check out more awesome Resources and scripts, ^2Github.com/Flyyrin")
if not Config.vSync then
    print("^3".. GetCurrentResourceName() .. " is ^1not using vSync^3, You can change this in the Config file.")
else
    print("^3".. GetCurrentResourceName() .. " is ^2using vSync^3, You can change this in the Config file.")
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
            print("^6Recource: ^3" .. GetCurrentResourceName() .. " was stopped! so i DeActivated the blackout.")
        end
    end
end)

AddEventHandler('playerConnecting', function(user, set)
    if not Config.vSync then
        if Config.Enable_Debug then
            print("^1[Debug]^3: " .. user .." is ^2joining ^3with Blackout set to: " .. tostring(blackout) .. ".")
        end
    else
        if Config.Enable_Debug then
            local blackout = TriggerEvent("flyyrin:vSync_blackOut_state")
            print("^1[Debug]^3: " .. user .." is ^2joining ^3with Blackout set to: " .. tostring(blackout) .. ".")
        end
    end
end)

AddEventHandler('playerDropped', function (reason)
    if not Config.vSync then
        if Config.Enable_Debug then
            print("^1[Debug]^3: " .. GetPlayerName(source) .." ^1left ^3with Blackout set to: " .. tostring(blackout) .. ". ^5Reason: " .. reason)
        end
    else
        if Config.Enable_Debug then
            local blackout = TriggerEvent("flyyrin:vSync_blackOut_state")
            print("^1[Debug]^3: " .. GetPlayerName(source) .." ^1left ^3with Blackout set to: " .. tostring(blackout) .. ". ^5Reason: " .. reason)
        end
    end
end)
    
AddEventHandler("flyyrin:togle_blackout", function(player)
    blackout = not blackout
    if blackout then
        if Config.Enable_Debug then
            print("^1[Debug]^3: ^3Blackout set to: " .. tostring(blackout) .. " By: " .. player .. ".")
        end
        if Config.Sounds then
            TriggerClientEvent('flyyrin:blackout_sound', -1, true)
        end
        Wait(2000)
        TriggerClientEvent('flyyrin:blackout_active', -1, '')
        Wait(10000)    
        if Config.messages then    
            TriggerClientEvent('flyyrin:blackout_message', -1, true)   
        end 
    else
        if Config.messages then    
            TriggerClientEvent('flyyrin:blackout_message', -1, false)
        end    
        Wait(5000)
        if Config.Enable_Debug then
            print("^1[Debug]^3: ^3Blackout set to: " .. tostring(blackout) .. " By: " .. player .. ".")
        end
        if Config.Sounds then
            TriggerClientEvent('flyyrin:blackout_sound', -1, false)
        end
        Wait(2000)
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