engaged = false

local function setPB(engaged)
    ped, veh = PlayerPedId(), GetVehiclePedIsIn(ped, false)
    SetVehicleHandbrake(veh, engaged)
end

RegisterNetEvent("Super:PBrake:GetPB")
AddEventHandler("Super:PBrake:GetPB", function(eng)
    engaged = eng
    setPB(engaged)
end)

local function dispPark(eng)
    ped = PlayerPedId()
    if eng and IsPedInLandVehicle(ped) then
        RenderIndicator(_SUPERPB.config.park.x, _SUPERPB.config.park.y, 1.0, 1.0, 0.45, "(PARK)", 255, 0, 0, 200)
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        DisableControlAction(0, _SUPERPB.config.key)
        dispPark(engaged)
        if IsControlJustReleased(0, _SUPERPB.config.key) or IsDisabledControlJustPressed(0, _SUPERPB.config.key) and IsPedInLandVehicle(ped) then
            engaged = not engaged
            setPB(engaged)
            TriggerServerEvent("Super:PBrake:SetPB", engaged)
        end
    end
end)
