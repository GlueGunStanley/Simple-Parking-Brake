ParkingBrakeEngaged = {}
InVehicle = false
Engaged = false

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if not InVehicle then goto loopend end
        ToggleIndicator(Engaged)
        if not IsControlJustReleased(0, Config.Settings.keybind) then goto loopend end
        local ped = PlayerPedId()
        if not IsPedInLandVehicle(ped) or not IsPedDriver(ped) then goto loopend end
        local netId = NetworkGetNetworkIdFromEntity(GetVehiclePedIsIn(ped, false))
        local bool = not (ParkingBrakeEngaged[netId] or false)
        ParkingBrakeEngaged[netId] = bool
        Engaged = bool
        SetVehicleHandbrake(GetVehiclePedIsIn(ped, false), bool)
        TriggerServerEvent("sv:SyncState", netId, bool)
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
