function openMenu(trigger, isServer, params, time, text)
    SendNUIMessage({
        action = "open",
        text = text,
        time = time
    })
    local time2 = time - 1 -- Math here to break the loop when the time goes up.
    Citizen.SetTimeout(time, function()
        time2 = time + 1
    end)
    while time > time2 do
        if IsControlJustPressed(1, 246) then -- Press Y
            if isServer == true then
                TriggerServerEvent(trigger, params) -- Trigger executated when you press Y
                SendNUIMessage({close = true})
                break
            else 
                TriggerEvent(trigger, params)
                SendNUIMessage({close = true})
                break
            end
        elseif IsControlJustPressed(1, 249) then -- Press N
            SendNUIMessage({close = true}) -- Nothing happens here
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
