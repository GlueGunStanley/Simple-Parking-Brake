function SetVehicleParkingBrake(bool)
    if not bool then return end
    SetVehicleHandBrake(GetVehiclePedIsIn(PlayerPedId(), false), bool)
end

function ToggleIndicator()
    if not Engaged then return end
    if not IsPedInLandVehicle(PlayerPedId()) then return end
    RenderIndicator()
end

local x, y = Config.Settings.pos.x, Config.Settings.pos.y
local r, g, b, a = Config.Settings.color.r, Config.Settings.color.g, Config.Settings.color.b, Config.Settings.color.a
local scale = Config.Settings.scale
function RenderIndicator()
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString("(PARK)")
    DrawText(x - 1.0/2, y - 1.0/2 + 0.005)
end

function IsPedInLandVehicle(ped)
    if not ped then return end
    return not IsPedInAnyPlane(ped) and not IsPedInAnyHeli(ped) and not IsPedInAnyBoat(ped) and not IsPedInAnySub(ped) and IsPedInAnyVehicle(ped, false)
end

function GetNetIdFromVehicle(veh)
    if not veh then return end
    return VehToNet(veh)
end