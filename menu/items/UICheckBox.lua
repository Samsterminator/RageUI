RageUI.CheckboxStyle = {
    Tick = 1,
    Cross = 2
}

local function StyleCheckBox(Selected, Checked, Box, BoxSelect)
    if Selected then
        if Checked then
            RageUI.RenderSprite(RageUI.Settings.Items.Checkbox.Dictionary, RageUI.Settings.Items.Checkbox.Textures[Box], RageUI.CurrentMenu.X + RageUI.Settings.Items.Checkbox.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Checkbox.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Checkbox.Width, RageUI.Settings.Items.Checkbox.Height)
        else
            RageUI.RenderSprite(RageUI.Settings.Items.Checkbox.Dictionary, RageUI.Settings.Items.Checkbox.Textures[1], RageUI.CurrentMenu.X + RageUI.Settings.Items.Checkbox.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Checkbox.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Checkbox.Width, RageUI.Settings.Items.Checkbox.Height)
        end
    else
        if Checked then
            RageUI.RenderSprite(RageUI.Settings.Items.Checkbox.Dictionary, RageUI.Settings.Items.Checkbox.Textures[BoxSelect], RageUI.CurrentMenu.X + RageUI.Settings.Items.Checkbox.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Checkbox.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Checkbox.Width, RageUI.Settings.Items.Checkbox.Height)
        else
            RageUI.RenderSprite(RageUI.Settings.Items.Checkbox.Dictionary, RageUI.Settings.Items.Checkbox.Textures[3], RageUI.CurrentMenu.X + RageUI.Settings.Items.Checkbox.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Checkbox.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Checkbox.Width, RageUI.Settings.Items.Checkbox.Height)
        end
    end
end

local function CheckBoxLockBadgeColor(Selected)
    if Selected then
        return 0, 0, 0, 255
    else
        return 163, 159, 148, 255
    end
end

---Checkbox
---@param Label string
---@param Description string
---@param Checked boolean
---@param Enabled boolean
---@param Callback function
---@return nil
---@public
function RageUI.Checkbox(Label, Description, Checked, Style, Callback)
    if RageUI.CurrentMenu ~= nil then
        if RageUI.CurrentMenu() then

            ---@type number
            local Option = RageUI.Options + 1

            if RageUI.CurrentMenu.Pagination.Minimum <= Option and RageUI.CurrentMenu.Pagination.Maximum >= Option then

                ---@type number
                local Selected = RageUI.CurrentMenu.Index == Option

                ---@type number
                local Hovered = false

                if not RageUI.CurrentMenu.SafeZoneSize then
                    RageUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if RageUI.CurrentMenu.Safezone then
                        RageUI.CurrentMenu.SafeZoneSize = RageUI.GetSafeZoneBounds()

                        ScreenDrawPositionBegin(76, 84)
                        ScreenDrawPositionRatio(0, 0, 0, 0)
                    end
                end

                Hovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.CurrentMenu.SafeZoneSize.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Rectangle.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Button.Rectangle.Height)

                if Hovered and not Selected then
                    RageUI.RenderRectangle(RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Rectangle.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Button.Rectangle.Height, 255, 255, 255, 20)

                    if RageUI.CurrentMenu.Controls.Click.Active then
                        RageUI.CurrentMenu.Index = Option
                        RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Error)
                        RageUI.CurrentMenu.Controls.Click.Active = false
                    end
                end

                if Selected then
                    RageUI.RenderSprite(RageUI.Settings.Items.Button.SelectedSprite.Dictionary, RageUI.Settings.Items.Button.SelectedSprite.Texture, RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.SelectedSprite.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.SelectedSprite.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Button.SelectedSprite.Height)
                end

                if type(Style) == "table" then

                    if Style.Enabled == true or Style.Enabled == nil then

                        if Selected then
                            RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)
                        else
                            RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 245, 245, 245, 255)
                        end
                    else
                        ---@type table
                        local LeftBadge = RageUI.BadgeStyle.Lock

                        ---@type number
                        local LeftBadgeOffset = ((LeftBadge == RageUI.BadgeStyle.None or tonumber(LeftBadge) == nil) and 0 or 27)

                        if Selected then
                            RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X + LeftBadgeOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)
                        else
                            RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X + LeftBadgeOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 163, 159, 148, 255)
                        end
                        if LeftBadge ~= RageUI.BadgeStyle.None and tonumber(LeftBadge) ~= nil then
                            RageUI.RenderSprite(RageUI.GetBadgeDictionary(LeftBadge, Selected), RageUI.GetBadgeTexture(LeftBadge, Selected), RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.LeftBadge.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.LeftBadge.Width, RageUI.Settings.Items.Button.LeftBadge.Height, nil, CheckBoxLockBadgeColor(Selected))
                        end
                    end

                    if Style.Style ~= nil then
                        if Style.Style == RageUI.CheckboxStyle.Tick then
                            StyleCheckBox(Selected, Checked, 2, 4)
                        elseif Style.Style == RageUI.CheckboxStyle.Cross then
                            StyleCheckBox(Selected, Checked, 5, 6)
                        else
                            StyleCheckBox(Selected, Checked, 2, 4)
                        end
                    else
                        StyleCheckBox(Selected, Checked, 2, 4)
                    end

                    if Selected and (RageUI.CurrentMenu.Controls.Select.Active or (Hovered and RageUI.CurrentMenu.Controls.Click.Active)) and (Style.Enabled == true or Style.Enabled == nil) then
                        RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Select)
                        Checked = not Checked
                    end

                    if Selected and (RageUI.CurrentMenu.Controls.Select.Active or (Hovered and RageUI.CurrentMenu.Controls.Click.Active)) and (Style.Enabled == false) then
                        RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Error)
                        Checked = false
                    end

                else
                    error("UICheckBox Style is not a `table`")
                end

                --[[
                if Enabled == true or Enabled == nil then
                    if Selected then
                        RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)
                    else
                        RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 245, 245, 245, 255)
                    end
                else
                    RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 163, 159, 148, 255)
                end
                ]]--

                RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.Items.Button.Rectangle.Height

                if Selected and RageUI.CurrentMenu.Description ~= Description then
                    RageUI.CurrentMenu.Description = Description or ""

                    local DescriptionLineCount = RageUI.GetLineCount(RageUI.CurrentMenu.Description, RageUI.CurrentMenu.X + RageUI.Settings.Items.Description.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Description.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Description.Text.Scale, 255, 255, 255, 255, nil, false, false, RageUI.Settings.Items.Description.Background.Width + RageUI.CurrentMenu.WidthOffset)

                    if DescriptionLineCount > 1 then
                        RageUI.CurrentMenu.DescriptionHeight = RageUI.Settings.Items.Description.Background.Height * DescriptionLineCount
                    else
                        RageUI.CurrentMenu.DescriptionHeight = RageUI.Settings.Items.Description.Background.Height + 7
                    end
                end

                Callback(Hovered, Selected, ((RageUI.CurrentMenu.Controls.Select.Active or (Hovered and RageUI.CurrentMenu.Controls.Click.Active)) and Selected), Checked)
            end

            RageUI.Options = RageUI.Options + 1
        end
    end
end