ParkingBrakeEngaged = {}
InVehicle = false
Engaged = false

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if not InVehicle then goto loopend end
        ToggleIndicator(Engaged)
        if not IsControlJustReleased(0, Config.Settings.keybind) then goto loopend end
        if not IsPedInLandVehicle(ped) and not IsPedDriver(ped) then goto loopend end
        Engaged = not Engaged
        SetVehicleParkingBrake(Engaged)
        TriggerServerEvent("sv:SyncState", GetNetIdFromVehicle(GetVehiclePedIsIn(ped, false)), Engaged)
        ::loopend::
    end
end)

RegisterNetEvent("EnterExitListener")
AddEventHandler("EnterExitListener", function(veh, bool)
    InVehicle = bool
end)

RegisterNetEvent("cl:SyncState")
AddEventHandler("cl:SyncState", function(netId, bool)
    ParkingBrakeEngaged[netId] = bool
end)
