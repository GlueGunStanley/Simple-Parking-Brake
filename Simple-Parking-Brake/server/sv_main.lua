ParkingBrakeEngaged = {}

RegisterNetEvent("sv:SyncState")
AddEventHandler("sv:SyncState", function(netId, bool)
    ParkingBrakeEngaged[netId] = bool
    TriggerClientEvent("cl:SyncState", -1, netId, bool)
end)

RegisterNetEvent("baseevents:leftVehicle")
AddEventHandler("baseevents:leftVehicle", function(veh, seat, name)
    if seat ~= -1 then return end
    TriggerClientEvent("EnterExitListener", source, veh, false)
end)

RegisterNetEvent("baseevents:enteredVehicle")
AddEventHandler("baseevents:enteredVehicle", function(veh, seat, name)
    if seat ~= -1 then return end
    TriggerClientEvent("EnterExitListener", source, veh, true)
end)
