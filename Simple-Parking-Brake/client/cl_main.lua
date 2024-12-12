Engaged = false

Citizen.CreateThread(function()
    while true do
        Wait(0)
        ToggleIndicator(Engaged)
        if IsControlJustReleased(0, Config.Settings.keybind) and IsPedInLandVehicle(PlayerPedId()) then
            Engaged = not Engaged
            setPB(Engaged)
            TriggerServerEvent("Super:PEngaged:SetPB", Engaged)
        end
    end
end)

RegisterNetEvent("GetParkingEngaged")
AddEventHandler("GetParkingEngaged", function()
end)
