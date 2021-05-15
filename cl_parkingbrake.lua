local engaged = false

Citizen.CreateThread(function()
    while true do
        Wait(50)
        local ped = PlayerPedId()

        if IsControlJustPressed(0, 76) then
            engaged = not engaged
        end
    end
end)

Citizen.CreateThread(function()
    local ped, veh = PlayerPedId(), GetVehiclePedIsIn(ped, true)
    while true do
        Wait(0)

        if oldEngaged ~= engaged then
            DisableControlAction(0, 71, false)
            EnableControlACtion(0, 71, true)
        end

        if engaged then
            local ped, veh = PlayerPedId(), GetVehiclePedIsIn(ped, true)


            for i = 0, #GetVehicleNumberOfWheels(veh) do
                SetVehicleWheelBrakePressure(veh, i, 100)
                DisableControlAction(0, 71, true)
            end
        end
        local oldEngaged = engaged
    end
end)