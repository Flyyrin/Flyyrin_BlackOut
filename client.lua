text = "Hi"

Locations = {
	["PowerPlant_Tank"] = {
		position = { x = 2747.54, y = 1573.05, z = 50.69 },
	},
	["loc2"] = {
		position = { x = 1961.24, y = 3749.46, z = 32.34 },
	},
}


-- Code
Citizen.CreateThread(function()
    while true do
        local E_key = 38
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        local loc = Locations["PowerPlant_Tank"].position
        Citizen.Wait(1)
        if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc.x, loc.y, loc.z, 2) then 
            helpMessage("Press ~INPUT_PICKUP~ to Togle power switch.")
            if IsControlJustReleased(1, E_key) then
                notify("Power Disabled.")
            end
        end
    end
end)

--Functions
function msg(name,text)
    TriggerEvent("chatMessage", name , {255,0,0}, text)
end

function helpMessage(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0,0,0,-1)
end

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end


notify(text)