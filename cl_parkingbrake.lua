local engaged = false
local firstTime = true


Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()

        if IsControlJustReleased(0, 76) then
            engaged = not engaged
            SetVehicleHandbrake(veh, engaged)
            -- firstTime = true
        end
    end
end)


Citizen.CreateThread(function()
    ped, veh = PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), true)
    local oldEngaged = true
    while true do
        Wait(0)

        SetVehicleHandbrake(veh, engaged)
        SetVehicleBrake(veh, engaged)
        
    end
end)