local currentPing = 0

# WARNA TEXT
function DrawTextOnScreen(text, x, y)
    SetTextFont(4)
    SetTextScale(0, 0.4)
    SetTextDropShadow(1, 0, 0, 0, 255)
    if currentPing < 60 then
        SetTextColour(255, 255, 255, 255)
    else
        SetTextColour(255, 0, 0, 255)
    end
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end

RegisterNetEvent('updatePing')
AddEventHandler('updatePing', function(ping)
    currentPing = ping
end)

Citizen.CreateThread(function()
    while true do
        TriggerServerEvent('PingUpdate')
        Citizen.Wait(100)
    end
end)

# POSISI TEXT
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        DrawTextOnScreen('PING KAMU:~g~ '..currentPing, 0.16, 0.88)
    end
end)
