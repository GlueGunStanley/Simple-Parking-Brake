Citizen.CreateThread(function()
    local engaged = false
    while true do
        Wait(50)
        local ped = PlayerPedId()

        if IsControlJustPressed(0, 76) then
            engaged = not engaged
        end
    end
end)