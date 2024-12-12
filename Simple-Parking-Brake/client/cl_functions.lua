function RenderIndicator(x,y ,width,height,scale, text, r,g,b,a)
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

function IsPedInLandVehicle(ped)
    return not IsPedInAnyPlane(ped) and not IsPedInAnyHeli(ped) and not IsPedInAnyBoat(ped) and not IsPedInAnySub(ped) and IsPedInAnyVehicle(ped, false)
end