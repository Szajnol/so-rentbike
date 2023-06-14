ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("sokey:money")
AddEventHandler("sokey:money", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()
    local price = 50
    print("działa? działa!")
    if kasa > price then
        local pojazd = CreateVehicle("bmx", 182.0972, -1598.3026, 29.2959, 36.5682, false, false)
        else
        ESX.showNotification("Nie masz wystarczająco pieniędzy")
    end
end)