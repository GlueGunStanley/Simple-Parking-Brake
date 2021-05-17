engaged = false

local function setPB(engaged)
    ped, veh = PlayerPedId(), GetVehiclePedIsIn(ped, false)
    SetVehicleHandbrake(veh, engaged)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent("Super:PBrake:GetPB")
AddEventHandler("Super:PBrake:GetPB", function(eng)
    engaged = eng
    setPB(engaged)
end)

local function dispPark(eng)
    ped = PlayerPedId()
    if eng and IsPedInAnyVehicle(ped, true) then
        drawTxt(_SUPERPB.config.park.x, _SUPERPB.config.park.y, 1.0, 1.0, 0.45, "(PARK)", 255, 0, 0, 200)
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        DisableControlAction(0, _SUPERPB.config.key)
        dispPark(engaged)
        if IsControlJustReleased(0, _SUPERPB.config.key) or IsDisabledControlJustPressed(0, _SUPERPB.config.key) and not IsPedInAnyPlane(ped) and not IsPedInAnyHeli(ped) and not IsPedInAnyBoat(ped) and not IsPedInAnySub(ped) then
            engaged = not engaged
            engVeh  = GetVehiclePedIsIn(ped, false)
            setPB(engaged)
            TriggerServerEvent("Super:PBrake:SetPB", engaged)
        end
    end
end)