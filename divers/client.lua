-----------------------------
------ By Sam - 0.01 ms -----
------- Rodéo Scripts -------
--- Vend Script pas chère ---
--- discord.gg/XeDSqUGcks ---
-----------------------------

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

--- FOUILLE (NE PAS TOUCHER) ---
local Items = {}      
local Armes = {}    
local ArgentSale = {} 

local PlayerData = {}

local function MarquerJoueur()
	local ped = GetPlayerPed(ESX.Game.GetClosestPlayer())
	local pos = GetEntityCoords(ped)
	local target, distance = ESX.Game.GetClosestPlayer()
	if distance <= 4.0 then
	DrawMarker(2, pos.x, pos.y, pos.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 1, nil, nil, 0)
end
end

local function getPlayerInv(player)
	Items = {}
	Armes = {}
	ArgentSale = {}
	
	ESX.TriggerServerCallback('rodeoo:getOtherPlayerData', function(data)
		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(ArgentSale, {
					label    = ESX.Math.Round(data.accounts[i].money),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})
	
				break
			end
		end
	
		for i=1, #data.weapons, 1 do
			table.insert(Armes, {
				label    = ESX.GetWeaponLabel(data.weapons[i].name),
				value    = data.weapons[i].name,
				right    = data.weapons[i].ammo,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end
	
		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(Items, {
					label    = data.inventory[i].label,
					right    = data.inventory[i].count,
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end
	end, GetPlayerServerId(player))
	end


--- MENU ---

local open = false 
local mainMenu = RageUI.CreateMenu('Menu Divers', 'Rodeo Scripts')
local subMenu = RageUI.CreateSubMenu(mainMenu, "Menu Divers", "Rodeo Scripts")
local subMenu2 = RageUI.CreateSubMenu(mainMenu, "Menu Divers", "Rodeo Scripts")
local subMenu3 = RageUI.CreateSubMenu(mainMenu, "Menu Divers", "Rodeo Scripts")
local fouille = RageUI.CreateSubMenu(mainMenu, "Menu Divers", "Rodeo Scripts")
mainMenu.Closed = function()
  open = false
end


local CheckboxState = false
local CheckboxState2 = false
local CheckboxState3 = false

--- FUNCTION OPENMENU ---

function MenuDivers()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu,function() 

			local id = GetPlayerServerId(PlayerId())

			RageUI.Separator("~h~Vous êtes l'ID:  ~r~"..id.."")

			local name = GetPlayerName(PlayerId())

			RageUI.Separator("~h~Votre Nom Steam:  ~b~"..name.."")

			RageUI.Button("Intéraction sur une Personne", nil, {RightLabel = "→→→"}, true , {
				onSelected = function()
				end
			}, subMenu3)

			RageUI.Button("Touche du Serveur", nil, {RightLabel = "→→→"}, true , {
				onSelected = function()
				end
			}, subMenu)

			RageUI.Button("Optimisations des couleurs", nil, {RightLabel = "→→→"}, true , {
				onSelected = function()
				end
			}, subMenu2)

			RageUI.Checkbox("Cacher la Minimap", nil, CheckboxState, {}, {
                onChecked = function()
					DisplayRadar(false)
					DisplayHud(false)
					CheckboxState = true
                end,
                onUnChecked = function()
					DisplayRadar(true)
					DisplayHud(true)
                    CheckboxState = false
                end,
            })

            RageUI.Checkbox("Mode Cinématique", nil, CheckboxState2, {}, {
                onChecked = function()
					hasCinematic = not hasCinematic
					SendNUIMessage({openCinema = true})
					DisplayRadar(false)
					cinematique = true
					CheckboxState2 = true
					--end
                end,
                onUnChecked = function()
					SendNUIMessage({openCinema = false})
					DisplayRadar(true)
					cinematique = false
                    CheckboxState2 = false
                end,
            })

			RageUI.Separator(CouleurRandom.."~h~→→ discord.gg/XeDSqUGcks~s~"..CouleurRandom.." ←←")

		   end)

		   --- SubMenu1 ---

		   RageUI.IsVisible(subMenu,function() 

			RageUI.Separator("~h~↓ "..CouleurRandom.."Touches ~s~↓")

			RageUI.Button("Téléphone", nil, {RightLabel = "F1"}, true , {
				onSelected = function()
				end
			})

			RageUI.Button("Radio", nil, {RightLabel = "F2"}, true , {
				onSelected = function()
				end
			})

			RageUI.Button("Menu Divers", nil, {RightLabel = "F3"}, true , {
				onSelected = function()
				end
			})

			RageUI.Button("Menu Personel", nil, {RightLabel = "F5"}, true , {
				onSelected = function()
				end
			})

			RageUI.Button("Menu Métier", nil, {RightLabel = "F6"}, true , {
				onSelected = function()
				end
			})

			RageUI.Button("Menu Fouiller", nil, {RightLabel = "F7"}, true , {
				onSelected = function()
				end
			})

			RageUI.Button("Menu Sim", nil, {RightLabel = "F9"}, true , {
				onSelected = function()
				end
			})

			RageUI.Button("Menu Props", nil, {RightLabel = "F10"}, true , {
				onSelected = function()
				end
			})

		end)

		--- SubMenu2 ---

		RageUI.IsVisible(subMenu2,function() 

			RageUI.Button("Normal", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					SetTimecycleModifier('SetTimecycleModifier("")')
				end
			})

			RageUI.Button("Améliorées", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					SetTimecycleModifier("Forest")
				end
			})

			RageUI.Button("Noir/Blanc", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					SetTimecycleModifier("rply_saturation_neg")
				end
			})

			RageUI.Button("Effet Caméra", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					SetTimecycleModifier("scanline_cam")
				end
			})

			RageUI.Button("Thème Sobre", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					SetTimecycleModifier("yell_tunnel_nodirect")
				end
			})

			RageUI.Button("Thème Sombre", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					SetTimecycleModifier("MP_Arena_theme_night")
				end
			})

		end)

		--- SubMenu3 ---

		RageUI.IsVisible(subMenu3,function() 

			RageUI.Separator("~h~↓ "..CouleurRandom.."Intéraction ~s~↓")

			RageUI.Button("Porter sur le Dos", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					ExecuteCommand("porter")--/porterqui faut rajouter sur votre serveur !
					ExecuteCommand("carry")--/carry
				end
			})

			RageUI.Button("Prendre en Otage", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					ExecuteCommand("otage")--/otage qui faut rajouter sur votre serveur !
				end
			})

			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

			if closestDistance <= 3.0 then 
				RageUI.Button("Fouiller", nil, {RightLabel = "→"}, true, {
					onActive = function()
						if closestPlayer ~= -1 then
							MarquerJoueur()
						end
					end,
					onSelected = function() 
						if closestDistance <= 5.0 then 
							getPlayerInv(closestPlayer)
							ExecuteCommand("me fouille l'individu")	
						end
					end,
				}, fouille)
			else
				RageUI.Button("Fouiller", "~r~Personnes aux Alentours !", {RightLabel = ">"}, false, {
					onSelected = function() 
					end
				})
			end
		end)

		-------------------------------------------------------------------------------------------------------

		--- Menu Fouille --

		RageUI.IsVisible(fouille,function() 

			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
			RageUI.Separator("↓ ~r~Argent(s) sale(s) ~s~↓")
			for k,v  in pairs(ArgentSale) do
				RageUI.Button("Argent sale :", nil, {RightLabel = "~g~"..v.label.."$"}, true, {
					onSelected = function() 
						local combien = KeyboardInput("Combien ?", '' , '', 8)
						if tonumber(combien) > v.amount then
							RageUI.Popup({message = "~r~quantité invalide"})
						else
							TriggerServerEvent('rodeoo:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
						end
						RageUI.GoBack()
					end
				})
			end
	
			RageUI.Separator("↓ ~r~Objet(s) ~s~↓")
			for k,v  in pairs(Items) do
				RageUI.Button(v.label, nil, {RightLabel = "~g~x"..v.right}, true, {
					onSelected = function() 
						local combien = KeyboardInput("Combien ?", '' , '', 8)
						if tonumber(combien) > v.amount then
							RageUI.Popup({message = "~r~quantité invalide"})
						else
							TriggerServerEvent('rodeoo:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
						end
						RageUI.GoBack()
					end
				})
			end

			RageUI.Separator("↓ ~r~Arme(s) ~s~↓")

			for k,v  in pairs(Armes) do
				RageUI.Button(v.label, nil, {RightLabel = "com ~g~"..v.right.. " ~s~munitions"}, true, {
					onSelected = function() 
						local combien = KeyboardInput("Combien ?", '' , '', 8)
						if tonumber(combien) > v.amount then
							RageUI.Popup({message = "~r~quantité invalide"})
						else
							TriggerServerEvent('rodeoo:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
						end
						RageUI.GoBack()
					end
				})
			end
		
		end)
		
		 Wait(0)
		end
	 end)
  end
end

-- OUVERTURE DU MENU --

Keys.Register('F4', 'F4', 'Ouvrir le Menu Divers', function()
    MenuDivers()
end)

--- Couleur ---

Citizen.CreateThread(function()
	while true do 
	   Citizen.Wait(400)
	   if CouleurRandom == "~b~" then CouleurRandom = "~r~" else CouleurRandom = "~b~" end 
   end 
end)


------------------------
---- PORTER / OTAGE ----
------------------------


local piggyBackInProgress = false
local holdingHostageInProgress, beingHeldHostage, holdingHostage = false, false
local takeHostageAnimNamePlaying, takeHostageAnimDictPlaying, takeHostageControlFlagPlaying = '', '', 0

local hostageAllowedWeapons = {
	'WEAPON_PISTOL',
	'WEAPON_PISTOL_MK2',
	'WEAPON_COMBATPISTOL',
	'WEAPON_PISTOL50',
	'WEAPON_SNSPISTOL',
	'WEAPON_SNSPISTOL_MK2',
	'WEAPON_HEAVYPISTOL',
	'WEAPON_VINTAGEPISTOL',
	'WEAPON_REVOLVER',
	'WEAPON_REVOLVER_MK2',
	'WEAPON_DOUBLEACTION',
	'WEAPON_APPISTOL'
}

function releaseHostage()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

	if closestDistance ~= -1 and closestDistance <= 3 then
		local target = GetPlayerServerId(closestPlayer)

		local lib = 'reaction@shove'
		local anim1 = 'shove_var_a'
		local lib2 = 'reaction@shove'
		local anim2 = 'shoved_back'
		local distans = 0.11
		local distans2 = -0.24
		local height = 0.0
		local spin = 0.0
		local length = 100000
		local controlFlagMe = 120
		local controlFlagTarget = 0
		local animFlagTarget = 1
		local attachFlag = false

		TriggerServerEvent('cmg3_animations:sync', lib, lib2, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget, attachFlag)
	end
end

function killHostage()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

	if closestDistance ~= -1 and closestDistance <= 3 then
		local target = GetPlayerServerId(closestPlayer)

		local lib = 'anim@gangops@hostage@'
		local anim1 = 'perp_fail'
		local lib2 = 'anim@gangops@hostage@'
		local anim2 = 'victim_fail'
		local distans = 0.11
		local distans2 = -0.24
		local height = 0.0
		local spin = 0.0
		local length = 0.2
		local controlFlagMe = 168
		local controlFlagTarget = 0
		local animFlagTarget = 1
		local attachFlag = false

		TriggerServerEvent('cmg3_animations:sync', lib, lib2, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget, attachFlag)
	end
end

RegisterCommand('porter', function(source, args)
    local plyPed = PlayerPedId()

    if not piggyBackInProgress then
        piggyBackInProgress = true
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestDistance ~= -1 and closestDistance <= 3 then
            local target = GetPlayerServerId(closestPlayer)

            local lib = 'anim@arena@celeb@flat@paired@no_props@'
            local anim1 = 'piggyback_c_player_a'
            local anim2 = 'piggyback_c_player_b'
            local distans = -0.07
            local distans2 = 0.0
            local height = 0.45
            local length = 100000
            local spin = 0.0
            local controlFlagMe = 49
            local controlFlagTarget = 33
            local animFlagTarget = 1

            TriggerServerEvent('cmg2_animations:sync', lib, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget)
        end
    else
        piggyBackInProgress = false
        ClearPedSecondaryTask(plyPed)
        DetachEntity(plyPed, true, false)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestDistance ~= -1 and closestDistance <= 3 then
            local target = GetPlayerServerId(closestPlayer)
            TriggerServerEvent('cmg2_animations:stop', target)
        end
    end
end, false)

RegisterCommand('otage', function()
    local plyPed = PlayerPedId()
    local currentWeapon = GetSelectedPedWeapon(plyPed)
    local canTakeHostage, foundWeapon = false, false

    ClearPedSecondaryTask(plyPed)
    DetachEntity(plyPed, true, false)

    for i = 1, #hostageAllowedWeapons do
        if currentWeapon == hostageAllowedWeapons[i] then
            canTakeHostage = true
            foundWeapon = hostageAllowedWeapons[i]
        end
    end

    if not foundWeapon then
        for i = 1, #hostageAllowedWeapons do
            if HasPedGotWeapon(plyPed, hostageAllowedWeapons[i], false) then
                if GetAmmoInPedWeapon(plyPed, hostageAllowedWeapons[i]) > 0 then
                    canTakeHostage = true
                    foundWeapon = hostageAllowedWeapons[i]
                    break
                end
            end
        end
    end

    if canTakeHostage then
        if not holdingHostageInProgress then
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

            if closestDistance ~= -1 and closestDistance <= 3 then
                local target = GetPlayerServerId(closestPlayer)

                if IsPlayerDead(closestPlayer) then
                    ESX.ShowNotification('~r~Action Impossible~s~ : Vous ne pouvez porter ce joueur !')
                else
                    local lib = 'anim@gangops@hostage@'
                    local anim1 = 'perp_idle'
                    local lib2 = 'anim@gangops@hostage@'
                    local anim2 = 'victim_idle'
                    local distans = 0.11
                    local distans2 = -0.24
                    local height = 0.0
                    local spin = 0.0
                    local length = 100000
                    local controlFlagMe = 49
                    local controlFlagTarget = 49
                    local animFlagTarget = 50
                    local attachFlag = true

                    SetCurrentPedWeapon(plyPed, foundWeapon, true)
                    holdingHostageInProgress = true
                    holdingHostage = true
                    TriggerServerEvent('cmg3_animations:sync', lib, lib2, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget, attachFlag)
                end
            else
                ESX.ShowNotification('Aucun joueur à proximité !')
            end
        end
    else
        ESX.ShowNotification('Vous avez besoin d\'un pistolet de combat ou un pistolet pour prendre un otage !')
    end
end)

RegisterNetEvent('cmg2_animations:syncTarget')
AddEventHandler('cmg2_animations:syncTarget', function(targetId, animationLib, animation2, distans, distans2, height, length, spin, controlFlag)
	local target = GetPlayerFromServerId(targetId)

	if target == PlayerId() or target < 1 then
		return
	end

	local plyPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)

	piggyBackInProgress = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end

	spin = spin or 180.0

	AttachEntityToEntity(plyPed, targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)

	if controlFlag == nil then
		controlFlag = 0
	end

	TaskPlayAnim(plyPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('cmg2_animations:syncMe')
AddEventHandler('cmg2_animations:syncMe', function(animationLib, animation, length, controlFlag, animFlag)
	local plyPed = PlayerPedId()
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end

	Citizen.Wait(500)

	if controlFlag == nil then
		controlFlag = 0
	end

	TaskPlayAnim(plyPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	Citizen.Wait(length)
end)

RegisterNetEvent('cmg2_animations:cl_stop')
AddEventHandler('cmg2_animations:cl_stop', function()
	local plyPed = PlayerPedId()
	piggyBackInProgress = false
	ClearPedSecondaryTask(plyPed)
	DetachEntity(plyPed, true, false)
end)

RegisterNetEvent('cmg3_animations:syncTarget')
AddEventHandler('cmg3_animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length, spin, controlFlag, animFlagTarget, attach)
	local plyPed = PlayerPedId()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	if holdingHostageInProgress then
		holdingHostageInProgress = false
	else
		holdingHostageInProgress = true
	end

	beingHeldHostage = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end

	if spin == nil then
		spin = 180.0
	end

	if attach then
		AttachEntityToEntity(plyPed, targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	end
	
	if controlFlag == nil then
		controlFlag = 0
	end

	if animation2 == 'victim_fail' then
		SetEntityHealth(plyPed, 0)
		DetachEntity(plyPed, true, false)
		TaskPlayAnim(plyPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
		beingHeldHostage = false
		holdingHostageInProgress = false
	elseif animation2 == 'shoved_back' then
		holdingHostageInProgress = false
		DetachEntity(plyPed, true, false)
		TaskPlayAnim(plyPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
		beingHeldHostage = false
	else
		TaskPlayAnim(plyPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	end

	takeHostageAnimNamePlaying = animation2
	takeHostageAnimDictPlaying = animationLib
	takeHostageControlFlagPlaying = controlFlag
end)

RegisterNetEvent('cmg3_animations:syncMe')
AddEventHandler('cmg3_animations:syncMe', function(animationLib, animation, length, controlFlag, animFlag)
	local plyPed = PlayerPedId()

	ClearPedSecondaryTask(plyPed)
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end

	if controlFlag == nil then
		controlFlag = 0
	end

	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	takeHostageAnimNamePlaying = animation
	takeHostageAnimDictPlaying = animationLib
	takeHostageControlFlagPlaying = controlFlag

	if animation == 'perp_fail' then
		SetPedShootsAtCoord(plyPed, 0.0, 0.0, 0.0, 0)
		holdingHostageInProgress = false
	elseif animation == 'shove_var_a' then
		Citizen.Wait(900)
		ClearPedSecondaryTask(plyPed)
		holdingHostageInProgress = false
	end
end)

RegisterNetEvent('cmg3_animations:cl_stop')
AddEventHandler('cmg3_animations:cl_stop', function()
	local plyPed = PlayerPedId()

	holdingHostageInProgress = false
	beingHeldHostage = false
	holdingHostage = false

	ClearPedSecondaryTask(plyPed)
	DetachEntity(plyPed, true, false)
end)

Citizen.CreateThread(function()
	while true do
		if (holdingHostage or beingHeldHostage) and takeHostageAnimDictPlaying ~= '' and takeHostageAnimNamePlaying ~= '' then
			Citizen.Wait(0)
		else
			Wait(1500)
		end

		if (holdingHostage or beingHeldHostage) and takeHostageAnimDictPlaying ~= '' and takeHostageAnimNamePlaying ~= '' then
			while not IsEntityPlayingAnim(PlayerPedId(), takeHostageAnimDictPlaying, takeHostageAnimNamePlaying, 3) do
				TaskPlayAnim(PlayerPedId(), takeHostageAnimDictPlaying, takeHostageAnimNamePlaying, 8.0, -8.0, 100000, takeHostageControlFlagPlaying, 0, false, false, false)
				Citizen.Wait(0)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		if piggyBackInProgress then
			Citizen.Wait(10)
		else
			Wait(1500)
		end

		if piggyBackInProgress then
			--DisableControlAction(0, 21, true) -- INPUT_SPRINT
			--DisableControlAction(0, 22, true) -- INPUT_JUMP
			--DisableControlAction(0, 24, true) -- INPUT_ATTACK
			--DisableControlAction(0, 44, true) -- INPUT_COVER
			--DisableControlAction(0, 45, true) -- INPUT_RELOAD
			--DisableControlAction(0, 140, true) -- INPUT_MELEE_ATTACK_LIGHT
			--DisableControlAction(0, 141, true) -- INPUT_MELEE_ATTACK_HEAVY
			--DisableControlAction(0, 142, true) -- INPUT_MELEE_ATTACK_ALTERNATE
			--DisableControlAction(0, 143, true) -- INPUT_MELEE_BLOCK
			--DisableControlAction(0, 144, true) -- PARACHUTE DEPLOY
			--DisableControlAction(0, 145, true) -- PARACHUTE DETACH
			--DisableControlAction(0, 243, true) -- INPUT_ENTER_CHEAT_CODE
			--DisableControlAction(0, 257, true) -- INPUT_ATTACK2
			--DisableControlAction(0, 263, true) -- INPUT_MELEE_ATTACK1
			--DisableControlAction(0, 264, true) -- INPUT_MELEE_ATTACK2
			--DisableControlAction(0, 73, true) -- INPUT_X
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		if holdingHostage or beingHeldHostage then
			Wait(0)
		else
			Wait(1500)
		end

		if holdingHostage then
			local plyPed = PlayerPedId()
			local plyCoords = GetEntityCoords(plyPed)

			if IsEntityDead(plyPed) then
				holdingHostage = false
				holdingHostageInProgress = false

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3 then
					local target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent('cmg3_animations:stop', target)
				end

				Citizen.Wait(100)
				releaseHostage()
			end

			DisableControlAction(0, 24, true) -- disable attack
			DisableControlAction(0, 25, true) -- disable aim
			DisableControlAction(0, 47, true) -- disable weapon
			DisableControlAction(0, 58, true) -- disable weapon
			DisablePlayerFiring(plyPed, true)

			ESX.Game.Utils.DrawText3D(plyCoords, 'Appuyer sur [G] pour relâcher, [H] pour tuer', 0.5)

			if IsDisabledControlJustPressed(0, 47) then
				holdingHostage = false
				holdingHostageInProgress = false

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3 then
					local target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent('cmg3_animations:stop', target)
				end

				Citizen.Wait(100)
				releaseHostage()
			elseif IsDisabledControlJustPressed(0, 74) then
				holdingHostage = false
				holdingHostageInProgress = false

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestDistance ~= -1 and closestDistance <= 3 then
					local target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent('cmg3_animations:stop', target)
				end

				killHostage()
			end
		end

		if beingHeldHostage then
			DisableControlAction(0, 21, true) -- disable sprint
			DisableControlAction(0, 24, true) -- disable attack
			DisableControlAction(0, 25, true) -- disable aim
			DisableControlAction(0, 47, true) -- disable weapon
			DisableControlAction(0, 58, true) -- disable weapon
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 142, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 75, true) -- disable exit vehicle
			DisableControlAction(27, 75, true) -- disable exit vehicle
			DisableControlAction(0, 22, true) -- disable jump
			DisableControlAction(0, 32, true) -- disable move up
			DisableControlAction(0, 268, true)
			DisableControlAction(0, 33, true) -- disable move down
			DisableControlAction(0, 269, true)
			DisableControlAction(0, 34, true) -- disable move left
			DisableControlAction(0, 270, true)
			DisableControlAction(0, 35, true) -- disable move right
			DisableControlAction(0, 271, true)
		end
	end
end)
