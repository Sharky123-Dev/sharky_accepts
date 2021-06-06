ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


function openMenu(trigger, isServer, params, time, text)
    SendNUIMessage({
        action = "open",
        text = text,
        time = time
    })
    if IsControlJustPressed(1, 246) then
        if isServer == true then
            TriggerServerEvent(trigger, params)
        else 
            TriggerEvent(trigger, params)
        end
    else if isControljustPressed(1, 249) then 
        print("Nop")
    end
end

if Config.Debug then 
    RegisterCommand("debugaccept", function()
    openMenu("chat:addMessage", false, {color = {255, 255, 255}, multiline = true, args = { GetPlayerName(PlayerId()), "Hello, this is the message that will show in chat" }}, 2000, "Testeo")
    end, false)
end