---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Dylan Malandain.
--- DateTime: 20/12/2019 19:07
---
RegisterNetEvent('LSPDGSetPed')
AddEventHandler('LSPDGSetPed', function(ped)
    print("setped:", ped)
    cunt = ped
end)

print("^1 RageUI - testing file is started. ^0")

local lspdGarage = RageUI.CreateMenu("LSPD", "VEHICLE GARAGE")
local subMenu =  RageUI.CreateSubMenu(lspdGarage, "A TITLE", "A SUB TITLE")

lspdGarage:DisplayGlare(false)
lspdGarage.Closed = function()
    print('Closed Showcase Menu')
end
lspdGarage.EnableMouse = true
lspdGarage.onIndexChange = function(Index)
    print(Index)
end

--> This will show the glare on the submenu : 
subMenu:DisplayGlare(true)

--> This will show the page counter on the submenu :
subMenu:DisplayPageCounter(true)

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

local description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"

Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(1.0)

        RageUI.IsVisible(lspdGarage, function(ped)

            RageUI.List('List Item', {
                { Name = "Crown Vic", Value = "police" },
                { Name = "Interceptor", Value = "police3" },
                { Name = "Buffalo", Value = "police2" },
                { Name = "Unmarked", Value = "police4" },
                { Name = "Insurgent", Value = "riot" },
            }, index.list, description, {}, true, {
                onListChange = function(Index, Item)
                    index.list = Index;
                    Visual.Subtitle("onListChange", 100)
                end,
                onSelected = function(Index, Item)
                    Visual.Subtitle("onSelected", 100)
                    --
                    local vehname = Item.Value
                    local vehhash = GetHashKey(vehname)
                    RequestModel(vehname)
                    
                    local fuck = ped
                    local pedCoords = GetEntityCoords(cunt)
                    
                    
                    local spawnSpot = vector3(436.38, -996.59, 25.38)
                    print("debug:", vehname, vehhash, pedCoords, spawnSpot)
                    spawnedveh = CreateVehicle(vehhash, spawnSpot, 180.3, true, 0)
                    print("spawnedveh:", spawnedveh)
                    SetPedIntoVehicle(cunt, spawnedveh, -1)
                    print("fuckoff", cunt, spawnedveh)

                end,
            })

            RageUI.UISliderHeritage('Heritage Item', index.heritage, description, {
                onSliderChange = function(Float, Index)
                    index.heritage = Index;
                    lspdGarage.TitleScale = Float
                end,
                onSelected = function(Float, Index)
                    Visual.Subtitle("onSelected", 100)
                end
            })

            RageUI.Separator("Paco is the best.")

            RageUI.Slider('Slider Item', index.slider, 100, description, true, {}, true, {
                onSliderChange = function(Index)
                    index.slider = Index
                    Visual.Subtitle("onSliderChange", 100)
                end,
                onSelected = function(Index)
                    Visual.Subtitle("onSelected", 100)
                end
            })

            RageUI.SliderProgress('SliderProgress Item', index.sliderprogress, 100, description, {
                ProgressBackgroundColor = { R = 255, G = 0, B = 0, A = 200 },
                ProgressColor = { R = 0, G = 255, B = 0, A = 255 },
            }, true, {
                onSliderChange = function(Index)
                    index.sliderprogress = Index
                    Visual.Subtitle("onSliderChange", 100)
                end,
                onSelected = function(Index)
                    Visual.Subtitle("onSelected", 100)
                end
            })

            RageUI.Button('SubMenu', "Description here", {}, true, {onSelected = function() print("HELLO WORLD !") end}, subMenu);

            RageUI.Button('Simple Bouton with background colour', "Description here", { RightLabel = "", Color = { HightLightColor = { 0, 155, 0, 150 }, BackgroundColor = { 38, 85, 150, 160 } }}, true, {onSelected = function() print("HELLO WORLD !") end});

        end, function()

            RageUI.Grid(index.grid.default.x, index.grid.default.y, 'Top Text', 'Bottom Text', 'Left Text', 'Right Text', {
                onSelected = function(IndexX, IndexY, X, Y)

                end,
                onPositionChange = function(IndexX, IndexY, X, Y)
                    Visual.Subtitle(string.format('x = %s, y = %s', X, Y), 1000)
                    index.grid.default.x = IndexX
                    index.grid.default.y = IndexY
                end
            }, 1)

            RageUI.GridHorizontal(index.grid.horizontal.x, 'Left Text', 'Right Text', {
                onSelected = function(IndexX, IndexY, X, Y)

                end,
                onPositionChange = function(IndexX, IndexY, X, Y)
                    index.grid.horizontal.x = IndexX
                end
            }, 2)

            RageUI.GridVertical(index.grid.vertical.y, 'Top Text', 'Bottom Text', {
                onSelected = function(IndexX, IndexY, X, Y)

                end,
                onPositionChange = function(IndexX, IndexY, X, Y)
                    index.grid.vertical.y = IndexY
                end
            }, 3)

            RageUI.PercentagePanel(index.percentage, 'Header Text', 'Min Text', 'Max Text', {
                onSelected = function(Percentage)

                end,
                onProgressChange = function(Percentage)
                    index.percentage = Percentage
                end
            }, 4)

            RageUI.ColourPanel("Couleur de Paco", RageUI.PanelColour.HairCut, index.color.primary[1], index.color.primary[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    index.color.primary[1] = MinimumIndex
                    index.color.primary[2] = CurrentIndex
                end
            }, 6, {
                Seperator = { Text = "/" }
            })

            RageUI.ColourPanel("Couleur de paco secondaire", RageUI.PanelColour.HairCut, index.color.secondary[1], index.color.secondary[2], {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    index.color.secondary[1] = MinimumIndex
                    index.color.secondary[2] = CurrentIndex
                end
            }, 6)
        end)

        --> SubMenu : 
        RageUI.IsVisible(subMenu, function()
            --> EXEMPLE ON HOW TO USE HERITAGE WINDOW : 
            RageUI.Window.Heritage(ParentData['mom'], ParentData['dad'])

            --> your logic here ... 
        end, function() end)
    end
end)

RegisterNetEvent('OpenLSPDGarageMenu')
AddEventHandler('OpenLSPDGarageMenu', function(ped)
    RageUI.Visible(lspdGarage, not RageUI.Visible(lspdGarage))
    ped = ped
    print("pedlols", ped)
end)