local engaged = false

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
    print("Get PB", engaged)
end)

function dispPark(eng)
    if eng and GetVehiclePedIsIn(ped, false) == engVeh then
        drawTxt(0.580, 1.240, 1.0, 1.0, 0.45, "(PARK)", 255, 0, 0, 200)
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()

        if IsControlJustReleased(0, 76) then
            engaged = not engaged
            engVeh  = GetVehiclePedIsIn(ped, false)
            TriggerServerEvent("Super:PBrake:SetPB", engaged)
        end
    end
end)


Citizen.CreateThread(function()
    ped= PlayerPedId()
    local oldEngaged = true
    while true do
        Wait(0)
        --if not engaged then SetVehicleWheelieState(veh, 65) end
        dispPark(engaged)
        SetVehicleHandbrake(engVeh, engaged)
        SetVehicleBrake(engVeh, engaged)
        
    end
end)