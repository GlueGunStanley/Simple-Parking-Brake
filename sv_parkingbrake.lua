--[[
    Use for networking which cars have the PB on for other players.
]]

local parkedVehs = {}

RegisterNetEvent("Super:PBrake:SetPB")
AddEventHandler("Super:PBrake:SetPB", function(bool)
    local vehID = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(source, false))

    parkedVehs[vehID] = bool and true or nil
end)

RegisterNetEvent("Super:PBrake:GetPB")
AddEventHandler("Super:PBrake:GetPB", function()
    local vehID = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(source, false))

    TriggerClientEvent("Super:PBrake:GetPB", parkedVehs[vehID] and true or false)

end)