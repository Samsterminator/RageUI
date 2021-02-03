-- ModoRP - AmmuNation Stores

--> Create Menus
local mainMenu = RageUI.CreateMenu("", "WEAPONS", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub") 
local subMenu =  RageUI.CreateMenu("", "MELEE WEAPONS", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")
local meleeMenu =  RageUI.CreateMenu("", "MELEE WEAPONS", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")
local handMenu =  RageUI.CreateMenu("", "HANDGUNS", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")
local shotMenu =  RageUI.CreateMenu("", "SHOTGUNS", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")
local mgMenu =  RageUI.CreateMenu("", "SMG AND LMG", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")
local riflMenu =  RageUI.CreateMenu("", "RIFLES", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")
local otherMenu =  RageUI.CreateMenu("", "Other WEAPONS", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")

--> Glare and Setup
mainMenu:DisplayGlare(false)
mainMenu.Closed = function()
    print('Closed Showcase Menu')
end
mainMenu.EnableMouse = true
mainMenu.onIndexChange = function(Index)
    print(Index)
end

--> Add Glare
subMenu:DisplayGlare(true)

--> Add Page Counter
subMenu:DisplayPageCounter(true)

--> Delete? Gay parent data

local ParentData = {mom = 0, dad = 0}
local index = {
    checkbox = false,
    list = 2,
    heritage = 0.5,
    slider = 50,
    sliderprogress = 50,
    grid = {
        default = { x = 0.5, y = 0.5 },
        horizontal = { x = 0.5 },
        vertical = { y = 0.5 },
    },
    percentage = 0.5,
    color = {
        primary = { 1, 5 },
        secondary = { 1, 5 }
    },
}

--> Menus
local player = source
local ped = GetPlayerPed(player)

Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(1.0)
        RageUI.IsVisible(mainMenu, function()
	    RageUI.Button('Melee', "Close combat, non firearms.", {}, true, {onSelected = function() print("hey") end}, meleeMenu);
		RageUI.Button('Handguns', "Cheap,  easy to hide and small caliber firearms.", {}, true, {onSelected = function() print("HELLO WORLD !") end}, handMenu);
		RageUI.Button('Shotguns', "For close encounters and mass destruction.", {}, true, {onSelected = function() print("HELLO WORLD !") end}, shotMenu);
		RageUI.Button('SMG & LMGs', "Run and gun or supressive fire.", {}, true, {onSelected = function() print("HELLO WORLD !") end}, mgMenu);
		RageUI.Button('Rifles', "High accuracy and high damage weaponry.", {}, true, {onSelected = function() print("HELLO WORLD !") end}, riflMenu);
		RageUI.Button('Other', "Very dangerous weapons", {RightLabel = RageUI.BadgeStyle.Lock}, true, {onSelected = function() print("HELLO WORLD !") end}, otherMenu);
        end, function()end)
       
        -- Melee Weapons
        RageUI.IsVisible(meleeMenu, function()
            RageUI.Button('Crowbar', "Close combat, non firearms.", {RightLabel = "$100"}, true, {onSelected = TriggerServerEvent('BuyCrowbar', source)}, meleeMenu);
            RageUI.Button('Golf Club', "test", {RightLabel = "$100"}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_GOLFCLUB"), 255, false)}, meleeMenu);
            RageUI.Button('Knuckle Duster', "Cheap,  easy to hide and small caliber firearms.", {RightLabel = "$100"}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNUCKLE"), 255, false)}, meleeMenu);
            RageUI.Button('Hammer', "Cheap,  easy to hide and small caliber firearms.", {RightLabel = "$100"}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HAMMER"), 255, false)}, meleeMenu);
            RageUI.Button('Knife', "Cheap,  easy to hide and small caliber firearms.", {RightLabel = "$100"}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNIFE"), 255, false)}, meleeMenu);
            RageUI.Button('Switch Blade', "Cheap,  easy to hide and small caliber firearms.", {RightLabel = "$100"}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SWITCHBLADE"), 255, false)}, meleeMenu);
            RageUI.Button('Machete', "Cheap,  easy to hide and small caliber firearms.", {RightLabel = "$100"}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHETE"), 255, false)}, meleeMenu);
        end, function() end)

        -- Handguns
        RageUI.IsVisible(handMenu, function()
            RageUI.Button('Flare Gun', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLAREGUN"), 255, false)}, meleeMenu);
            RageUI.Button('Stun Gun', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 255, false)}, meleeMenu);
            RageUI.Button('SNS Pistol', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"), 255, false)}, meleeMenu);
            RageUI.Button('Pistol', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 255, false)}, meleeMenu);
            RageUI.Button('Combat Pistol', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 255, false)}, meleeMenu);
            RageUI.Button('Pistol .50', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), 255, false)}, meleeMenu);
            RageUI.Button('Heavy Pistol', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), 255, false)}, meleeMenu);
            RageUI.Button('Heavy Revolver', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER"), 255, false)}, meleeMenu);
            RageUI.Button('AP Pistol', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 255, false)}, meleeMenu);
            RageUI.Button('Vintage Pistol', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), 255, false)}, meleeMenu);
        end, function() end)

        -- Shotguns
        RageUI.IsVisible(shotMenu, function()
            RageUI.Button('Double Barrel', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Sawed Off', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Pump Shotgun', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Bullpup Shotgun', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Heavy Shotgun', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Assault Shotgun', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
        end, function() end)

         -- SMG and LMG
         RageUI.IsVisible(mgMenu, function()
            RageUI.Button('Micro SMG', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Machine Pistol', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('SMG', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Assault SMG', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Combat PDW', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Gun Sweeper', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Machine Gun', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Combat Machine Gun', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
        end, function() end)

        -- Rifles
        RageUI.IsVisible(riflMenu, function()
            RageUI.Button('Compact Rifle', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Assault Rifle', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Carbine', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Advanced Rifle', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Special Carbine', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Bullpup Rifle', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Marksman Rifle', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Sniper Rifle', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Heavy Sniper Rifle', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
        end, function() end)

        -- Other weapons
        RageUI.IsVisible(otherMenu, function()
            RageUI.Button('Flare', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Molotov', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Firework Launcher', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Grenade', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
            RageUI.Button('Sticky Bomb', "", {}, true, {onSelected = GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 255, false)}, meleeMenu);
        end, function() end)
    end
end)


--> Create markers
local maxDistance = 15.0
local interactDistance = 0.5
local markersTable = {
    { X = 22.74, Y = -1107.17,    Z = 29.79 },
    { X = -1305.54, Y = -395.04,    Z = 36.69 },
    { X = 252.0,  Y = -50.0,    Z = 70.0 },
    { X = -661.0,    Y = -934.0, Z = 21.0 },
    { X = 841.0,    Y = -1033.0, Z = 28.0 },
    { X = 809.0, Y = -2157.0, Z = 29.0 }
}

Citizen.CreateThread(function()
    while true do
        local pedX, pedY, pedZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        for k, _ in pairs(markersTable) do
            local distance = Vdist(pedX, pedY, pedZ, markersTable[k].X, markersTable[k].Y, markersTable[k].Z)
            if distance <= maxDistance then
                DrawMarker(1, markersTable[k].X, markersTable[k].Y, markersTable[k].Z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, 0, 0, 0, 0, nil, nil, 0)
                if distance <= interactDistance then
                    BeginTextCommandDisplayHelp("STRING")
                    AddTextComponentSubstringPlayerName("Press ~INPUT_PICKUP~ to shop")
                    EndTextCommandDisplayHelp(0, 0, 1, -1)
                    if IsControlJustPressed(1, 38) then -- E
                         RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
                          print("E pressed")
                          
                    end
                else
                    -- print("fuckoff")
                    RageUI.CloseAll() -- close menu if u walk away
                    
                end
            end
        end
        Citizen.Wait(0)
    end
end)