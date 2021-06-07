function openMenu(trigger, isServer, params, time, text)
    SendNUIMessage({
        action = "open",
        text = text,
        time = time
    })
    local time2 = time - 1
    Citizen.SetTimeout(time, function()
        time2 = time + 1
    end)
    while time > time2 do
        if IsControlJustPressed(1, 246) then
            if isServer == true then
                TriggerServerEvent(trigger, params)
                SendNUIMessage({close = true})
                break
            else 
                TriggerEvent(trigger, params)
                SendNUIMessage({close = true})
                break
            end
        elseif IsControlJustPressed(1, 249) then 
            SendNUIMessage({close = true})
            break
        end
        Wait(1)
    end
end

if Config.Debug then 
    RegisterCommand("debugaccept", function()
        openMenu("chat:addMessage", false, {color = {255, 255, 255}, multiline = true, args = { GetPlayerName(PlayerId()), "Hello, this is the message that will show in chat" }}, 2000,"Testing")
    end, false)
end
