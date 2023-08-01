ESX = exports["es_extended"]:getSharedObject()

BikeRentPeds = {
    {x = 232.56,  y = -859.44,  z = 29.92-1, h = 163.76},
    {x = 245.92,  y = -580.68,  z = 43.24-1, h = 72.08},
    {x = -504.68,  y = -256.68,  z = 35.68-1, h = 212.44},
    {x = -1808.6,  y = -1189.52,  z = 13.0-1, h = 233.76},
    {x = -820.56,  y = -1214.12,  z = 6.92-1, h = 48.24},
    {x = -234.84,  y = -978.52,  z = 29.28-1, h = 74.24},
    {x = 2011.32,  y = 3765.76,  z = 32.2-1, h = 119.48},
    {x = 122.76,  y = 6406.36,  z = 31.36-1, h = 315.76},
}

Citizen.CreateThread(function()
	for i,v in pairs(BikeRentPeds) do
		local blip = AddBlipForCoord(v.x,v.y,v.z)

		SetBlipSprite (blip, 226)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 0)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName("Wypożyczalnia rowerów")
		EndTextCommandSetBlipName(blip)


		modelHash = `a_m_y_epsilon_01`
		RequestModel(modelHash)
		while not HasModelLoaded(modelHash) do
			Wait(1)
		end
		local thisPed = CreatePed(26, modelHash, v.x, v.y, v.z, v.h, false, false)
		Citizen.Wait(100)
		SetEntityAsMissionEntity(thisPed, true, true)
		FreezeEntityPosition(thisPed, true)
		SetEntityInvincible(thisPed, true)
		TaskSetBlockingOfNonTemporaryEvents(thisPed, true)
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
end)

