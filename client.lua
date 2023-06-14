ESX = exports["es_extended"]:getSharedObject()

-- blipy
local bliprent = {
    {title="blip", colour=31, id=446, x = 163.91775512695, y = -1684.4605712891, z = 29.132194519043}, 
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

  local Ped = CreatePed(0, "a_f_o_soucent_01", 182.7479, -1601.5354, 29.2778, 294.2403, false, true)
  FreezeEntityPosition(Ped, true)
end)
  
