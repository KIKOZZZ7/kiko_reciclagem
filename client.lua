ESX = nil

local E_KEY = 38
local PlayerData = {}

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.Trigger, function(obj) ESX = obj end)
		Wait(0)
	end
	PlayerData = ESX.GetPlayerData()
end)

if Config.BlipRoupa then
	entrarservico = false
else
	entrarservico = true
end


local IsBox = false
local object = nil

CreateThread(function()

    while true do
        local time = 1000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
 


        for v, k in pairs(Config.ComecarTrabalho) do
			if entrarservico  then
            local dist = #(coords - k)

            if dist < 5.0 and not IsBox then
    
                time = 0
				DrawMarker(2, k.x, k.y, k.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 0,0, 215, 222, false, false, false, true, false, false, false)
            end
		
            if dist < 1.2 and not IsBox then
                ESX.ShowHelpNotification(Config.Mensagem1)
                if IsControlJustPressed(0, 51) then
					Animation()
					exports['progressBars']:startUI(3000, Config.Progressbar1)
					Wait(3000)
                    PegarCaixa()
					AnimationStop()
                end
            end    
        end
	end

        for v, k in pairs(Config.EntregarTrabalho) do
            local dist = #(coords - k)

            if dist < 5.0 and IsBox then
                time = 0
				DrawMarker(2, k.x, k.y, k.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 0,0, 215, 222, false, false, false, true, false, false, false)
            end

            if dist < 1.2 and IsBox then
                ESX.ShowHelpNotification(Config.Mensagem2)
                if IsControlJustPressed(0, 51) then
                    GuardarBox()
					AnimationStop()
                end
            end
        end
        Wait(time)
    end

end)

function Animation()
    local ped = PlayerPedId()
    RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    washingActive = true
    Citizen.Wait(100)
    FreezeEntityPosition(ped, true)
    TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
end

function AnimationStop()
	local ped = PlayerPedId()
		ClearPedTasks(ped)
		FreezeEntityPosition(ped, false)
		washingActive = false
		
	end

local vestido = false
local spam = false


function OpenReciclagemActionsMenu()
	local elements = {
		{label = 'Roupa Civil',       value = 'cloakroom2'},
		{label = 'Roupa Trabalho',      value = 'cloakroom'},

	}

	if Config.EnablePlayerManagement and ESX.PlayerData.job and ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'kiko_actions', {
		title    = ('Roupeiro'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' or data.current.value == 'roupachefe' then
			menu.close()
			setUniform(data.current.value, playerPed)
			entrarservico  = true
		elseif data.current.value == 'cloakroom2' then
			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
			entrarservico  = false
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'kiko_actions_menu'
		CurrentActionMsg  = ('Abrir Menu')
		CurrentActionData = {}
	end)
end




function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
			else
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		else
			if Config.Uniforms[job].female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
			else
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		end
	end)
end

Citizen.CreateThread(
    function()
        while true do
            local esperar = 1500

            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)

			if Config.BlipRoupa then
                local trocarRoupa =
                    GetDistanceBetweenCoords(
                    pos.x,
                    pos.y,
                    pos.z,
                    Config.Locations["trocarRoupa"].coords.x,
                    Config.Locations["trocarRoupa"].coords.y,
                    Config.Locations["trocarRoupa"].coords.z,
                    true
                )
                if trocarRoupa < 10.0 and trocarRoupa > 1.5 then
                    esperar = 5
                    DrawMarker(2,Config.Locations["trocarRoupa"].coords.x,Config.Locations["trocarRoupa"].coords.y,Config.Locations["trocarRoupa"].coords.z,0.0,0.0,0.0,0.0,0.0,0.0,0.3,0.2,0.15,Config.corBlips["blip"].x,Config.corBlips["blip"].y,Config.corBlips["blip"].z,222,false,false,false,true,false,false,false)
               end
                if trocarRoupa < 1.5 then
                    esperar = 5
                    DrawText3D(
                        Config.Locations["trocarRoupa"].coords.x,
                        Config.Locations["trocarRoupa"].coords.y,
                        Config.Locations["trocarRoupa"].coords.z,
                        "~g~E~w~ - Trocar Roupa"
                    )
                    if IsControlJustReleased(0, E_KEY) then
                        OpenReciclagemActionsMenu()
                    end
                end
        	end

            Citizen.Wait(esperar)
        end
    end
)




function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


function GuardarBox()
	local distrair  = true
    ESX.Game.DeleteObject(object)
    IsBox = false
	exports['zcmg_notificacao']:Alerta("", Config.Not1, 4500, 'informacao')
    TriggerServerEvent('zcmg_kiko_reciclagem:dar_item',distrair)
	distrair = false
end

function PegarCaixa()
    IsBox = true
    local ped = PlayerPedId()

    CarregarObjeto("anim@heists@box_carry@","idle","hei_prop_heist_box",50,28422)
end

function CarregarObjeto(dict,anim,prop,flag,hand,pos1,pos2,pos3,pos4,pos5,pos6)
	local ped = PlayerPedId()
    local playerPed = PlayerPedId()

	RequestModel(GetHashKey(prop))
	while not HasModelLoaded(GetHashKey(prop)) do
		Citizen.Wait(10)
	end

	if pos1 then
		local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
		object = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
		SetEntityCollision(object,false,false)
		AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,hand),pos1,pos2,pos3,pos4,pos5,pos6,true,true,false,true,1,true)
	else
		CarregarAnim(dict)
		TaskPlayAnim(ped,dict,anim,3.0,3.0,-1,flag,0,0,0,0)
		local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
		object = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
		SetEntityCollision(object,false,false)
		AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,hand),0.0,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
	end
	Citizen.InvokeNative(0xAD738C3085FE7E11,object,true,true)

    CreateThread(function()
		while IsBox do
    
			RequestAnimDict('anim@heists@box_carry@')
			while not HasAnimDictLoaded('anim@heists@box_carry@') do
	    		Citizen.Wait(50)
			end
			local animData = { dict = 'anim@heists@box_carry@', name = 'idle' }
			
			local playerPed = PlayerPedId()
			if IsPedWalking(playerPed) then
				animData.name = 'walk'
			elseif IsPedRunning(playerPed) or IsPedSprinting(playerPed) then
				animData.name = 'run'
			end
			
			if not IsEntityPlayingAnim(playerPed, animData.dict, animData.name, 3) then
				TaskPlayAnim(playerPed, animData.dict, animData.name, 0.5, 10.0, -1, 1 | 16 | 32, 0.0, false, false, false)
				N_0x2208438012482a1a(playerPed, 0, 1)
			end
			
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1

			DisableControlAction(0, Keys['R'], true) -- Reload
			DisableControlAction(0, Keys['SPACE'], true) -- Jump
			DisableControlAction(0, Keys['Q'], true) -- Cover
			DisableControlAction(0, Keys['TAB'], true) -- Select Weapon
			DisableControlAction(0, Keys['F'], true) -- Also 'enter'?

			DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth

			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			DisableControlAction(0, Keys['F1'], true) -- Disable phone
			DisableControlAction(0, Keys['F2'], true) -- Inventory
			DisableControlAction(0, Keys['F3'], true) -- Animations
			DisableControlAction(0, Keys['F6'], true) -- Job

			DisableControlAction(0, Keys['V'], true) -- Disable changing view
			DisableControlAction(0, Keys['C'], true) -- Disable looking behind
			DisableControlAction(2, Keys['P'], true) -- Disable pause screen
            DisableControlAction(0, Keys['LEFTSHIFT'], true)

			Citizen.Wait(0)
		end
    end)    
end

function CarregarAnim(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
end
