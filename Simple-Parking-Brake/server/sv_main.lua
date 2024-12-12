local parkedVehs = {}

RegisterNetEvent("Super:PBrake:SetPB")
AddEventHandler("Super:PBrake:SetPB", function(bool)
    local vehID = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(GetPlayerPed(source), false))

    parkedVehs[vehID] = bool and true or false
end)

RegisterNetEvent("Super:PBrake:GetPB")
AddEventHandler("Super:PBrake:GetPB", function()
    local vehID = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(GetPlayerPed(source), false))

    TriggerClientEvent("Super:PBrake:GetPB", source, parkedVehs[vehID])

end)

RegisterNetEvent("baseevents:leftVehicle")
AddEventHandler("baseevents:leftVehicle", function(curVeh, seat, name)
    TriggerClientEvent("Super:PBrake:GetPB", source, false)
end)

RegisterNetEvent("baseevents:enteredVehicle")
AddEventHandler("baseevents:enteredVehicle", function(veh, seat, name)
    vehID = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(GetPlayerPed(source), false))
    TriggerClientEvent("Super:PBrake:GetPB", source, parkedVehs[vehID])
end)