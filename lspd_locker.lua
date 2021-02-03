---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Dylan Malandain.
--- DateTime: 20/12/2019 19:07
---
RegisterNetEvent( "SetPDRank" )
AddEventHandler('SetPDRank', function(pdrank)
    Citizen.CreateThread(function()
        lolpdrank = pdrank
        print("pdrank bro:", pdrank)
        print("lolpdrank:", lolpdrank)
    end)
  end)

print("^1 RageUI - testing file is started. ^0")



local lockerMenu = RageUI.CreateMenu("YOUR TITLE", "YOU SUB TITLE")
local subMenu =  RageUI.CreateSubMenu(lockerMenu, "A TITLE", "A SUB TITLE")

lockerMenu:DisplayGlare(false)
lockerMenu.Closed = function()
    print('Closed Showcase Menu')
end
lockerMenu.EnableMouse = true
lockerMenu.onIndexChange = function(Index)
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

        RageUI.IsVisible(lockerMenu, function()

            RageUI.Button('Basic Items', description, {}, true, {
                onHovered = function()
                    Visual.Subtitle("onHovered", 100)
                end,
                onSelected = function()
                    --Visual.Subtitle("onSelected", 100)
                    TriggerEvent("LSPDUniform", lolpdrank)
                    print("welcome officer, pd rank:", lolpdrank)
                end,
            });

            RageUI.Checkbox('Checkbox', description, index.checkbox, {}, {
                onChecked = function()
                    Visual.Subtitle("onChecked", 100)
                    lockerMenu.TitleFont = 7
                end,
                onUnChecked = function()
                    Visual.Subtitle("onUnChecked", 100)
                    lockerMenu.TitleFont = 1
                end,
                onSelected = function(Index)
                    index.checkbox = Index
                    --- Logic on selected items
                end
            })

            RageUI.List('List Item', {
                { Name = "Paco", Value = 1 },
                { Name = "Is", Value = 2 },
                { Name = "Awesome", Value = 60 },
                { Name = "Bro", Value = 50 },
            }, index.list, description, {}, true, {
                onListChange = function(Index, Item)
                    index.list = Index;
                    Visual.Subtitle("onListChange", 100)
                end,
                onSelected = function(Index, Item)
                    Visual.Subtitle("onSelected", 100)
                end,
            })


          

        end, function()

         
          

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




RegisterNetEvent('OpenLockerMenu')
AddEventHandler('OpenLockerMenu', function()
    RageUI.Visible(lockerMenu, not RageUI.Visible(lockerMenu))
end)