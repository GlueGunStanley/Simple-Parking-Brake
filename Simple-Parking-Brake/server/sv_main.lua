ParkingBrakeEngaged = {}

RegisterNetEvent("SetParkingBrake")
AddEventHandler("SetParkingBrake", function(netId, bool)
end)

RegisterNetEvent("baseevents:leftVehicle")
AddEventHandler("baseevents:leftVehicle", function(curVeh, seat, name)
    TriggerClientEvent("GetParkingBrake", source)
end)

RegisterNetEvent("baseevents:enteredVehicle")
AddEventHandler("baseevents:enteredVehicle", function(veh, seat, name)
    TriggerClientEvent("GetParkingBrake", source)
end)
