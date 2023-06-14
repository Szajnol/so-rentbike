ESX = exports["es_extended"]:getSharedObject()

-- blipy
local bliprent = {
    {title="Wypożyczalnia Rowerów", colour=0, id=226, x = 197.0491, y = -930.7761, z = 30.6864}, 
}

Citizen.CreateThread(function()
     for _, info in pairs(bliprent) do
       info.blip = AddBlipForCoord(info.x, info.y, info.z)
       SetBlipSprite(info.blip, info.id)
       SetBlipDisplay(info.blip, 4)
       SetBlipScale(info.blip, 0.7)
       SetBlipColour(info.blip, info.colour)
       SetBlipAsShortRange(info.blip, true)
       BeginTextCommandSetBlipName("STRING")
       AddTextComponentString(info.title)
       EndTextCommandSetBlipName(info.blip)
       Citizen.Wait(0)
     end
end)


RegisterNetEvent("sokey:rentbike")
AddEventHandler("sokey:rentbike", function()
    TriggerServerEvent("sokey:money")
end)

Citizen.CreateThread(function()
  exports.qtarget:AddTargetModel({"a_f_o_soucent_01"}, {
    options = {
      {
        event = "sokey:rentbike",
        icon = "fas fa-box-circle-check",
        label = "Rower",
        num = 1
      },
    },
    distance = 2
  })

  RequestModel(GetHashKey("a_f_o_soucent_01"))
  while not HasModelLoaded(GetHashKey("a_f_o_soucent_01")) do
    Wait(10)
  end

  local Ped = CreatePed(0, "a_f_o_soucent_01", 197.0491, -930.7761, 30.6864, 328.9742, false, true)
  FreezeEntityPosition(Ped, true)
end)
  
