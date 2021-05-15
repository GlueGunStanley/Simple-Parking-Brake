local engaged = false
local firstTime = true


Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()

        if IsControlJustReleased(0, 76) then
            engaged = not engaged
            firstTime = true
        end
    end
end)

Citizen.CreateThread(function()
    ped, veh = PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), true)
    local oldEngaged = true
    while true do
        Wait(0)

        
        if not engaged then
            ped, veh = PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), true)
            firstTime = false
            DisableControlAction(0, 71, false)
            DisableControlAction(0, 72, false)
            EnableControlAction(0, 71, true)
            EnableControlAction(0, 72, true)
            SetVehicleBrake(veh, false)
        end

        if engaged then
            local ped, veh = PlayerPedId(), GetVehiclePedIsIn(ped, true)
            
            if firstTime then
                firstTime = false
                BringVehicleToHalt(veh, 50, 50, -1)
                DisableControlAction(0, 71, true)
                DisableControlAction(0, 72, true)
            end
            
            --[[
            if oldEngaged ~= engaged then
               BringVehicleToHalt(veh, 50, 50, 0)
            end]]

            

            SetVehicleBrake(veh, true)
        end
        ped, veh = PlayerPedId(), GetVehiclePedIsIn(ped, true)
        oldEngaged = engaged
    end
end)