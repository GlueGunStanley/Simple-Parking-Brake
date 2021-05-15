_KILL = false


local function createLock(engaged)
    Citizen.CreateThread(function()
        print("MADE", engaged)
        while true do
            Wait(0)
            if _KILL == true then
                _KILL = false
                break
            end
            local ped, veh = PlayerPedId(), GetVehiclePedIsIn(ped, true)
            
                              
            DisableControlAction(0, 71, true)
            DisableControlAction(0, 72, true)

            BringVehicleToHalt(veh, 10, 3, 0)

            for i = 0, GetVehicleNumberOfWheels(veh) do
                SetVehicleWheelBrakePressure(veh, i, 1000)
            end
        end
    end)
end

AddEventHandler("Super:PBrake", function(engaged)
    local ped, veh = PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), true)
    local oldEngaged = true
    
    _KILL = true
    Wait(500)
    print("CALLED", engaged)
    if engaged then
        createLock(engaged)
    else
        --Citizen.CreateThread(function()
            --[[while true do
                Wait(0)
                if _KILL then
                    _KILL = false
                    break
                end]]
            
                DisableControlAction(0, 71, false)
                DisableControlAction(0, 72, false)
                EnableControlAction(0, 71, true)
                EnableControlAction(0, 72, true)
                for i = 0, GetVehicleNumberOfWheels(veh) do
                    SetVehicleWheelBrakePressure(veh, i, 0)
                end
            --end
        --end)
    end

end)

Citizen.CreateThread(function()
    local engaged = false

    while true do
        Wait(0)
        local ped = PlayerPedId()

        if IsControlJustReleased(0, 76) then
            engaged = not engaged
            TriggerEvent("Super:PBrake", engaged)
        end
    end
end)

