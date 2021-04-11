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

function message_player(message_text)--https://docs.fivem.net/natives/?_0x1CCD9A37359072CF
    local txd = "CHAR_LS_TOURIST_BOARD"
    --https://wiki.gtanet.work/index.php?title=Notification_Pictures

    -- Add the notification text
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(message_text)

    -- Set the notification icon, title and subtitle.
    local title = "Department of Water & Power"
    local subtitle = "Global Message"
    local iconType = 1
    local flash = false -- Flash doesn't seem to work no matter what.
    EndTextCommandThefeedPostMessagetext(txd, txd, flash, iconType, title, subtitle)

    -- Draw the notification
    local showInBrief = true
    local blink = false -- blink doesn't work when using icon notifications.
    EndTextCommandThefeedPostTicker(blink, showInBrief)
end