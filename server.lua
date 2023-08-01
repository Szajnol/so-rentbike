ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("so-bike:money")
AddEventHandler("so-bike:money", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()
    local price = 25
    if money >= price then
        xPlayer.removeInventoryItem('money', price)
    else
        ESX.showNotification("Nie masz wystarczająco pieniędzy")
    end
end)
