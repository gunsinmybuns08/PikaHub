--YOU ARE NOT PERMITTED TO USE THIS UI LIBRARY!


local library = { }

local player = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local mouse = player:GetMouse()
local gui

local dragging
local dragInput
local dragStart
local startPos

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

library.theme = {
    fontsize = 15,
    font = Enum.Font.Code,
    background = "rbxassetid://6880496154",
    backgroundcolor = Color3.fromRGB(20, 20, 20),
    tabstextcolor = Color3.fromRGB(230, 230, 230),
    bordercolor = Color3.fromRGB(60, 60, 60),
    accentcolor = Color3.fromRGB(28, 56, 139),
    accentcolor2 = Color3.fromRGB(16, 31, 78),
    outlinecolor = Color3.fromRGB(60, 60, 60),
    outlinecolor2 = Color3.fromRGB(0, 0, 0),
    sectorcolor = Color3.fromRGB(30, 30, 30),
    toptextcolor = Color3.fromRGB(255, 255, 255),
    topcolor = Color3.fromRGB(30, 30, 30),
    topcolor2 = Color3.fromRGB(12, 12, 12),
    buttoncolor = Color3.fromRGB(49, 49, 49),
    buttoncolor2 = Color3.fromRGB(39, 39, 39),
    itemscolor = Color3.fromRGB(200, 200, 200)
}

function library:CreateWindow(name, size, hidebutton)
    local window = { }
    
    window.name = name or "New Window"
    window.size = UDim2.fromOffset(size.X, size.Y) or UDim2.fromOffset(492, 598)
    window.hidebutton = hidebutton or Enum.KeyCode.RightShift
    window.theme = library.theme

    window.SelectedTab = nil

    window.Main = Instance.new("ScreenGui", game.CoreGui)
    window.Main.Name = name
    if syn then
        syn.protect_gui(window.Main)
    end

    game:GetService("UserInputService").InputBegan:Connect(function(key)
        if key.KeyCode == window.hidebutton then
            window.Main.Enabled = not window.Main.Enabled
        end
    end)

    local dragstart = function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            gui = window.Frame
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end

    local dragend = function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end

    window.Frame = Instance.new("Frame", window.Main)
    window.Frame.Name = "main"
    window.Frame.Position = UDim2.fromScale(0.5, 0.5)
    window.Frame.BorderColor3 = window.theme.bordercolor
    window.Frame.Size = window.size
    window.Frame.BackgroundColor3 = window.theme.backgroundcolor
    window.Frame.AnchorPoint = Vector2.new(0.5, 0.5)

    window.BlackOutline = Instance.new("Frame", window.Frame)
    window.BlackOutline.Name = "blackline"
    window.BlackOutline.ZIndex = 0
    window.BlackOutline.Size = window.size + UDim2.fromOffset(4, 4)
    window.BlackOutline.BorderSizePixel = 0
    window.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
    window.BlackOutline.Position = UDim2.fromOffset(-2, -2)

    window.TopBar = Instance.new("Frame", window.Frame)
    window.TopBar.Name = "top"
    window.TopBar.Size = UDim2.fromOffset(window.size.X.Offset, 20)
    window.TopBar.BorderSizePixel = 0
    window.TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    window.TopBar.InputBegan:Connect(dragstart)
    window.TopBar.InputChanged:Connect(dragend)

    window.TopGradient = Instance.new("UIGradient", window.TopBar)
    window.TopGradient.Rotation = 90
    window.TopGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, window.theme.topcolor), ColorSequenceKeypoint.new(1.00, window.theme.topcolor2) })

    window.NameLabel = Instance.new("TextLabel", window.TopBar)
    window.NameLabel.TextColor3 = window.theme.toptextcolor
    window.NameLabel.Text = window.name
    window.NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    window.NameLabel.Font = window.theme.font
    window.NameLabel.Name = "title"
    window.NameLabel.Position = UDim2.fromOffset(6, 0)
    window.NameLabel.BackgroundTransparency = 1
    window.NameLabel.Size = UDim2.fromOffset(194, 19)
    window.NameLabel.TextSize = window.theme.fontsize

    window.Line2 = Instance.new("Frame", window.Frame)
    window.Line2.Name = "line"
    window.Line2.Position = UDim2.fromOffset(0, 20)
    window.Line2.Size = UDim2.fromOffset(window.size.X.Offset, 1)
    window.Line2.BorderSizePixel = 0
    window.Line2.BackgroundColor3 = window.theme.accentcolor

    window.TabList = Instance.new("Frame", window.Frame)
    window.TabList.Name = "tablist"
    window.TabList.BackgroundTransparency = 1
    window.TabList.Position = UDim2.fromOffset(0, 21)
    window.TabList.Size = UDim2.fromOffset(window.size.X.Offset, 19)
    window.TopBar.Size = UDim2.fromOffset(window.TopBar.Size.X.Offset, window.TopBar.Size.Y.Offset + window.TabList.Size.Y.Offset)
    window.TabList.BorderSizePixel = 0
    window.TabList.BackgroundColor3 = Color3.new(0.09803921568, 0.09803921568, 0.09803921568)

    window.TabList.InputBegan:Connect(dragstart)
    window.TabList.InputChanged:Connect(dragend)

    window.BlackLine = Instance.new("Frame", window.Frame)
    window.BlackLine.Name = "blackline"
    window.BlackLine.Size = UDim2.fromOffset(window.size.X.Offset, 1)
    window.BlackLine.BorderSizePixel = 0
    window.BlackLine.ZIndex = 9
    window.BlackLine.BackgroundColor3 = window.theme.outlinecolor2
    window.BlackLine.Position = UDim2.fromOffset(0, window.TabList.Position.Y.Offset) + UDim2.fromOffset(0, window.TabList.AbsoluteSize.Y - 1)

    if window.theme.background then
        window.BackgroundImage = Instance.new("ImageButton", window.Frame)
        window.BackgroundImage.Name = "navigation"
        window.BackgroundImage.BackgroundTransparency = 1
        window.BackgroundImage.LayoutOrder = 10
        window.BackgroundImage.ScaleType = Enum.ScaleType.Stretch
        window.BackgroundImage.Position = window.BlackLine.Position + UDim2.fromOffset(0, 1)
        window.BackgroundImage.Size = UDim2.fromOffset(window.size.X.Offset, window.size.Y.Offset - 40)
        window.BackgroundImage.Image = window.theme.background
    end

    window.Line = Instance.new("Frame", window.Frame)
    window.Line.Name = "line"
    window.Line.Position = UDim2.fromOffset(0, 0)
    window.Line.Size = UDim2.fromOffset(60, 1)
    window.Line.BorderSizePixel = 0
    window.Line.BackgroundColor3 = window.theme.accentcolor

    window.ListLayout = Instance.new("UIListLayout", window.TabList)
    window.ListLayout.FillDirection = Enum.FillDirection.Horizontal
    window.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    window.OpenedColorPickers = { }

    function window:CreateTab(name)
        local tab = { }
        tab.name = name or ""

        local textservice = game:GetService("TextService")
        local size = textservice:GetTextSize(tab.name, window.theme.fontsize, window.theme.font, Vector2.new(200,300))

        tab.TabButton = Instance.new("TextButton", window.TabList)
        tab.TabButton.TextColor3 = window.theme.tabstextcolor
        tab.TabButton.Text = tab.name
        tab.TabButton.AutoButtonColor = false
        tab.TabButton.Font = window.theme.font
        tab.TabButton.BackgroundTransparency = 1
        tab.TabButton.Size = UDim2.fromOffset(size.X + 15, 16)
        tab.TabButton.Name = tab.name
        tab.TabButton.TextSize = window.theme.fontsize

        tab.TabPage = Instance.new("ScrollingFrame", window.Frame)
        tab.TabPage.Name = tab.name:gsub(" ", "") .. "page"
        tab.TabPage.ScrollBarThickness = 0
        tab.TabPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
        tab.TabPage.ScrollingDirection = "Y"
		tab.TabPage.Position = UDim2.new(0,0,0.0019470076076686, 39)
		tab.TabPage.Size = UDim2.fromOffset(window.size.X.Offset, window.size.Y.Offset - 39)
        tab.TabPage.BackgroundTransparency = 1

        game:GetService("RunService").RenderStepped:Connect(function()
            tab.TabPage.Visible = (window.SelectedTab == tab.TabButton)
            if window.SelectedTab ~= tab.TabButton and tab.TabButton.TextColor3 == window.theme.accentcolor then
                tab.TabButton.TextColor3 = Color3.fromRGB(230, 230, 230)
            end
            if window.SelectedTab and window.SelectedTab.TextColor3 ~= window.theme.accentcolor then
                window.SelectedTab.TextColor3 = window.theme.accentcolor
            end
        end)

        local block = false
        function tab:SelectTab()
            repeat 
                wait()
            until block == false

            block = true
            window.SelectedTab = tab.TabButton
            window.Line:TweenSizeAndPosition(UDim2.fromOffset(size.X + 15, 1), UDim2.new(0, (tab.TabButton.AbsolutePosition.X - window.Frame.AbsolutePosition.X), 0, 0) + (window.BlackLine.Position - UDim2.fromOffset(0, 1)), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.1)
            wait(0.2)
            block = false
        end
    

        tab.TabButton.MouseButton1Down:Connect(function()
            tab:SelectTab()
        end)

        if not window.SelectedTab then
            tab:SelectTab()
        end

        tab.SectorsLeft = { }
        tab.SectorsRight = { }

        function tab:CreateSector(name,side)
            local sector = { }
            sector.name = name or ""
            sector.side = side or "left"
            
            sector.Main = Instance.new("Frame", tab.TabPage) 
            sector.Main.Name = sector.name:gsub(" ", "") .. "Sector"
            sector.Main.BorderColor3 = window.theme.outlinecolor
            sector.Main.ZIndex = 2
            sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, 20)
            sector.Main.BackgroundColor3 = window.theme.sectorcolor

            sector.Line = Instance.new("Frame", sector.Main)
            sector.Line.Name = "line"
            sector.Line.ZIndex = 2
            sector.Line.Size = UDim2.fromOffset(sector.Main.Size.X.Offset + 2, 1)
            sector.Line.BorderSizePixel = 0
            sector.Line.Position = UDim2.fromOffset(-1, -1)
            sector.Line.BackgroundColor3 = window.theme.accentcolor

            sector.BlackOutline = Instance.new("Frame", sector.Main)
            sector.BlackOutline.Name = "blackline"
            sector.BlackOutline.ZIndex = 1
            sector.BlackOutline.Size = sector.Main.Size + UDim2.fromOffset(4, 4)
            sector.BlackOutline.BorderSizePixel = 0
            sector.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
            sector.BlackOutline.Position = UDim2.fromOffset(-2, -2)
            sector.Main:GetPropertyChangedSignal("Size"):Connect(function()
                sector.BlackOutline.Size = sector.Main.Size + UDim2.fromOffset(4, 4)
            end)

            local size = textservice:GetTextSize(sector.name, 13, window.theme.font, Vector2.new(2000, 2000))
            sector.Label = Instance.new("TextLabel", sector.Main)
            sector.Label.AnchorPoint = Vector2.new(0,0.5)
            sector.Label.Position = UDim2.fromOffset(12, -1)
            sector.Label.Size = UDim2.fromOffset(math.clamp(textservice:GetTextSize(sector.name, 13, window.theme.font, Vector2.new(200,300)).X + 10, 0, sector.Main.Size.X.Offset), size.Y)
            sector.Label.BackgroundTransparency = 1
            sector.Label.BorderSizePixel = 0
            sector.Label.ZIndex = 4
            sector.Label.Text = sector.name
            sector.Label.TextColor3 = Color3.new(1,1,2552/255)
            sector.Label.TextStrokeTransparency = 1
            sector.Label.Font = window.theme.font
            sector.Label.TextSize = 13

            sector.LabelBackFrame = Instance.new("Frame", sector.Label)
            sector.LabelBackFrame.Name = "labelframe"
            sector.LabelBackFrame.ZIndex = 3
            sector.LabelBackFrame.Size = UDim2.fromOffset(sector.Label.Size.X.Offset, 10)
            sector.LabelBackFrame.BorderSizePixel = 0
            sector.LabelBackFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            sector.LabelBackFrame.Position = UDim2.fromOffset(0, 6)

            sector.Items = Instance.new("Frame", sector.Main) 
            sector.Items.Name = "items"
            sector.Items.ZIndex = 2
            sector.Items.BackgroundTransparency = 1
            sector.Items.Size = UDim2.fromOffset(170, 140)
            sector.Items.AutomaticSize = Enum.AutomaticSize.Y
            sector.Items.BorderSizePixel = 0

            sector.ListLayout = Instance.new("UIListLayout", sector.Items)
            sector.ListLayout.FillDirection = Enum.FillDirection.Vertical
            sector.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            sector.ListLayout.Padding = UDim.new(0, 10)

            sector.ListPadding = Instance.new("UIPadding", sector.Items)
            sector.ListPadding.PaddingTop = UDim.new(0, 10)
            sector.ListPadding.PaddingLeft = UDim.new(0, 6)
            sector.ListPadding.PaddingRight = UDim.new(0, 6)

            function sector:AddButton(text, callback)
                local button = { }
                button.text = text or ""
                button.callback = callback or function() end

                button.Main = Instance.new("TextButton", sector.Items)
                button.Main.BorderSizePixel = 0
                button.Main.Text = ""
                button.Main.AutoButtonColor = false
                button.Main.Name = "button"
                button.Main.ZIndex = 4
                button.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 14)
                button.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                button.Main.MouseButton1Down:Connect(button.callback)

                button.Gradient = Instance.new("UIGradient", button.Main)
                button.Gradient.Rotation = 90
                button.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, window.theme.buttoncolor), ColorSequenceKeypoint.new(1.00, window.theme.buttoncolor2) })

                button.Outline = Instance.new("Frame", button.Main)
                button.Outline.Name = "blackline"
                button.Outline.ZIndex = 3
                button.Outline.Size = button.Main.Size + UDim2.fromOffset(2, 2)
                button.Outline.BorderSizePixel = 0
                button.Outline.BackgroundColor3 = window.theme.outlinecolor
                button.Outline.Position = UDim2.fromOffset(-1, -1)

                button.BlackOutline = Instance.new("Frame", button.Main)
                button.BlackOutline.Name = "blackline"
                button.BlackOutline.ZIndex = 2
                button.BlackOutline.Size = button.Main.Size + UDim2.fromOffset(4, 4)
                button.BlackOutline.BorderSizePixel = 0
                button.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                button.BlackOutline.Position = UDim2.fromOffset(-2, -2)

                button.Label = Instance.new("TextLabel", button.Main)
                button.Label.Name = "Label"
                button.Label.BackgroundTransparency = 1
                button.Label.Position = UDim2.new(0, -1, 0, 0)
                button.Label.ZIndex = 4
                button.Label.AutomaticSize = Enum.AutomaticSize.XY
                button.Label.Font = window.theme.font
                button.Label.Text = " " .. button.text
                button.Label.TextColor3 = window.theme.itemscolor
                button.Label.TextSize = 13
                button.Label.TextStrokeTransparency = 1
                button.Label.TextXAlignment = Enum.TextXAlignment.Left

                button.BlackOutline.MouseEnter:Connect(function()
                    button.Outline.BackgroundColor3 = window.theme.accentcolor
                    button.BlackOutline.BackgroundColor3 = window.theme.accentcolor
                    button.Outline.BackgroundTransparency = 0.4
                    button.BlackOutline.BackgroundTransparency = 0.5
                end)
                button.BlackOutline.MouseLeave:Connect(function()
                    button.Outline.BackgroundColor3 = window.theme.outlinecolor
                    button.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                    button.Outline.BackgroundTransparency = 0
                    button.BlackOutline.BackgroundTransparency = 0
                end)

                sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, sector.ListLayout.AbsoluteContentSize.Y + 18)
                tab.TabPage.CanvasSize = sector.Main.Size

                return button
            end

            function sector:AddLabel(text)
                local label = { }

                label.Main = Instance.new("TextLabel", sector.Items)
                label.Main.Name = "Label"
                label.Main.BackgroundTransparency = 1
                label.Main.Position = UDim2.new(0, -1, 0, 0)
                label.Main.ZIndex = 4
                label.Main.AutomaticSize = Enum.AutomaticSize.XY
                label.Main.Font = window.theme.font
                label.Main.Text = text
                label.Main.TextColor3 = window.theme.itemscolor
                label.Main.TextSize = 13
                label.Main.TextStrokeTransparency = 1
                label.Main.TextXAlignment = Enum.TextXAlignment.Left

                function label:Set(value)
                    label.Main.Text = value
                end

                sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, sector.ListLayout.AbsoluteContentSize.Y + 18)
                tab.TabPage.CanvasSize = sector.Main.Size

                return label
            end
            
            function sector:AddToggle(text,default, callback)
                local toggle = { }
                toggle.text = text or ""
                toggle.default = default or false
                toggle.callback = callback or function(value) end
                
                toggle.value = toggle.default

                toggle.Main = Instance.new("TextButton", sector.Items)
                toggle.Main.Name = "toggle"
                toggle.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggle.Main.BorderColor3 = window.theme.outlinecolor
                toggle.Main.BorderSizePixel = 0
                toggle.Main.Size = UDim2.fromOffset(10, 10)
                toggle.Main.AutoButtonColor = false
                toggle.Main.ZIndex = 4 
                toggle.Main.Font = Enum.Font.SourceSans
                toggle.Main.Text = ""
                toggle.Main.TextColor3 = Color3.fromRGB(0, 0, 0)
                toggle.Main.TextSize = 14

                toggle.Outline = Instance.new("Frame", toggle.Main)
                toggle.Outline.Name = "outline"
                toggle.Outline.ZIndex = 3
                toggle.Outline.Size = toggle.Main.Size + UDim2.fromOffset(2, 2)
                toggle.Outline.BorderSizePixel = 0
                toggle.Outline.BackgroundColor3 = window.theme.outlinecolor
                toggle.Outline.Position = UDim2.fromOffset(-1, -1)

                toggle.BlackOutline = Instance.new("Frame", toggle.Main)
                toggle.BlackOutline.Name = "blackline"
                toggle.BlackOutline.ZIndex = 2
                toggle.BlackOutline.Size = toggle.Main.Size + UDim2.fromOffset(4, 4)
                toggle.BlackOutline.BorderSizePixel = 0
                toggle.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                toggle.BlackOutline.Position = UDim2.fromOffset(-2, -2)
                
                toggle.Gradient = Instance.new("UIGradient", toggle.Main)
                toggle.Gradient.Rotation = (22.5 * 13)
                toggle.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(45, 45, 45)) })

                toggle.Label = Instance.new("TextLabel", toggle.Main)
                toggle.Label.Name = "Label"
                toggle.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggle.Label.BackgroundTransparency = 1
                toggle.Label.Position = UDim2.fromOffset(toggle.Main.AbsoluteSize.X + 10, -2)
                toggle.Label.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 71, toggle.BlackOutline.Size.Y.Offset)
                toggle.Label.Font = window.theme.font
                toggle.Label.ZIndex = 2
                toggle.Label.Text = toggle.text
                toggle.Label.TextColor3 = window.theme.itemscolor
                toggle.Label.TextSize = 13
                toggle.Label.TextStrokeTransparency = 1
                toggle.Label.TextXAlignment = Enum.TextXAlignment.Left

                toggle.CheckedFrame = Instance.new("Frame", toggle.Main)
                toggle.CheckedFrame.ZIndex = 4
                toggle.CheckedFrame.BorderSizePixel = 0
                toggle.CheckedFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Color3.fromRGB(204, 0, 102)
                toggle.CheckedFrame.Size = toggle.Main.Size

                toggle.Gradient2 = Instance.new("UIGradient", toggle.CheckedFrame)
                toggle.Gradient2.Rotation = (22.5 * 13)
                toggle.Gradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, window.theme.accentcolor2), ColorSequenceKeypoint.new(1.00, window.theme.accentcolor) })

                toggle.Items = Instance.new("Frame", toggle.Main)
                toggle.Items.Name = "\n"
                toggle.Items.ZIndex = 3
                toggle.Items.Size = UDim2.fromOffset(60, toggle.BlackOutline.AbsoluteSize.Y)
                toggle.Items.BorderSizePixel = 0
                toggle.Items.BackgroundTransparency = 1
                toggle.Items.BackgroundColor3 = Color3.new(0, 0, 0)
                toggle.Items.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 71, -2)

                toggle.ListLayout = Instance.new("UIListLayout", toggle.Items)
                toggle.ListLayout.FillDirection = Enum.FillDirection.Horizontal
                toggle.ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
                toggle.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                toggle.ListLayout.Padding = UDim.new(0, 6)

                toggle.ListPadding = Instance.new("UIPadding", toggle.Items)
                toggle.ListPadding.PaddingTop = UDim.new(0, 2)
                toggle.ListPadding.PaddingRight = UDim.new(0, 2)

                function toggle:Set(value) 
                    toggle.value = value
                    toggle.CheckedFrame.Visible = value
                    pcall(toggle.callback, value) 
                end
                toggle:Set(toggle.default)

                function toggle:AddKeybind(default)
                    local keybind = { }

                    keybind.default = default or "None"
                    keybind.value = keybind.default

                    local text = toggle.defaultkeybind == "None" and "[None]" or "[" .. keybind.default.Name .. "]"
                    local size = textservice:GetTextSize(text, 13, window.theme.font, Vector2.new(2000, 2000))

                    keybind.Main = Instance.new("TextButton", toggle.Items)
                    keybind.Main.Name = "keybind"
                    keybind.Main.BackgroundTransparency = 1
                    keybind.Main.BorderSizePixel = 0
                    keybind.Main.ZIndex = 2
                    keybind.Main.Size = UDim2.fromOffset(size.X + 2, size.Y)
                    keybind.Main.Text = text
                    keybind.Main.Font = window.theme.font
                    keybind.Main.TextColor3 = Color3.fromRGB(136, 136, 136)
                    keybind.Main.TextSize = 13
                    keybind.Main.TextXAlignment = Enum.TextXAlignment.Right
                    keybind.Main.MouseButton1Down:Connect(function()
                        keybind.Main.Text = "..."
                    end)

                    game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                        if not gameProcessed then
                            if keybind.Main.Text == "..." then
                                if input.UserInputType == Enum.UserInputType.Keyboard then
                                    keybind.Main.Text = "[" .. input.KeyCode.Name .. "]"
                                    keybind.value = input.KeyCode
                                else
                                    keybind.Main.Text = "[None]"
                                    keybind.value = "None"
                                end
                            else
                                if keybind.value ~= "None" and input.KeyCode == keybind.value then
                                    toggle:Set(not toggle.CheckedFrame.Visible)
                                end
                            end
                        end
                    end)

                    return keybind
                end

                function toggle:AddColorpicker(default,callback)
                    local colorpicker = { }

                    colorpicker.callback = callback or function() end
                    colorpicker.default = default or Color3.fromRGB(255, 255, 255)
                    colorpicker.value = colorpicker.default

                    colorpicker.Main = Instance.new("Frame", toggle.Items)
                    colorpicker.Main.ZIndex = 6
                    colorpicker.Main.BorderSizePixel = 0
                    colorpicker.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    colorpicker.Main.Size = UDim2.fromOffset(16, 10)

                    colorpicker.Gradient = Instance.new("UIGradient", colorpicker.Main)
                    colorpicker.Gradient.Rotation = 90

                    local clr = Color3.new(math.clamp(colorpicker.value.R / 1.7, 0, 1), math.clamp(colorpicker.value.G / 1.7, 0, 1), math.clamp(colorpicker.value.B / 1.7, 0, 1))
                    colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, colorpicker.value), ColorSequenceKeypoint.new(1.00, clr) })

                    colorpicker.Outline = Instance.new("Frame", colorpicker.Main)
                    colorpicker.Outline.Name = "outline"
                    colorpicker.Outline.ZIndex = 5
                    colorpicker.Outline.Size = colorpicker.Main.Size + UDim2.fromOffset(2, 2)
                    colorpicker.Outline.BorderSizePixel = 0
                    colorpicker.Outline.BackgroundColor3 = window.theme.outlinecolor
                    colorpicker.Outline.Position = UDim2.fromOffset(-1, -1)
    
                    colorpicker.BlackOutline = Instance.new("Frame", colorpicker.Main)
                    colorpicker.BlackOutline.Name = "blackline"
                    colorpicker.BlackOutline.ZIndex = 4
                    colorpicker.BlackOutline.Size = colorpicker.Main.Size + UDim2.fromOffset(4, 4)
                    colorpicker.BlackOutline.BorderSizePixel = 0
                    colorpicker.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                    colorpicker.BlackOutline.Position = UDim2.fromOffset(-2, -2)

                    colorpicker.BlackOutline.MouseEnter:Connect(function()
                        colorpicker.Outline.BackgroundColor3 = window.theme.accentcolor
                        colorpicker.BlackOutline.BackgroundColor3 = window.theme.accentcolor
                        colorpicker.Outline.BackgroundTransparency = 0.4
                        colorpicker.BlackOutline.BackgroundTransparency = 0.5
                    end)
                    colorpicker.BlackOutline.MouseLeave:Connect(function()
                        if not window.OpenedColorPickers[colorpicker.MainPicker] then
                            colorpicker.Outline.BackgroundColor3 = window.theme.outlinecolor
                            colorpicker.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                            colorpicker.Outline.BackgroundTransparency = 0
                            colorpicker.BlackOutline.BackgroundTransparency = 0
                        end
                    end)

                    colorpicker.MainPicker = Instance.new("Frame", colorpicker.Main)
                    colorpicker.MainPicker.Name = "picker"
                    colorpicker.MainPicker.ZIndex = 100
                    colorpicker.MainPicker.Visible = false
                    window.OpenedColorPickers[colorpicker.MainPicker] = false
                    colorpicker.MainPicker.Size = UDim2.fromOffset(160, 178)
                    colorpicker.MainPicker.BorderSizePixel = 0
                    colorpicker.MainPicker.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    colorpicker.MainPicker.Position = UDim2.fromOffset(-colorpicker.MainPicker.AbsoluteSize.X + colorpicker.Main.AbsoluteSize.X, 15)

                    colorpicker.Outline2 = Instance.new("TextButton", colorpicker.MainPicker)
                    colorpicker.Outline2.AutoButtonColor = false
                    colorpicker.Outline2.Name = "outline"
                    colorpicker.Outline2.ZIndex = 99
                    colorpicker.Outline2.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(2, 2)
                    colorpicker.Outline2.BorderSizePixel = 0
                    colorpicker.Outline2.BackgroundColor3 = window.theme.outlinecolor
                    colorpicker.Outline2.Position = UDim2.fromOffset(-1, -1)
    
                    colorpicker.BlackOutline2 = Instance.new("Frame", colorpicker.MainPicker)
                    colorpicker.BlackOutline2.Name = "blackline"
                    colorpicker.BlackOutline2.ZIndex = 98
                    colorpicker.BlackOutline2.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(4, 4)
                    colorpicker.BlackOutline2.BorderSizePixel = 0
                    colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                    colorpicker.BlackOutline2.Position = UDim2.fromOffset(-2, -2)

                    colorpicker.hue = Instance.new("ImageLabel", colorpicker.MainPicker)
                    colorpicker.hue.ZIndex = 101
                    colorpicker.hue.Position = UDim2.new(0,5,0,5)
                    colorpicker.hue.Size = UDim2.new(0,150,0,150)
                    colorpicker.hue.Image = "rbxassetid://4155801252"
                    colorpicker.hue.ScaleType = Enum.ScaleType.Stretch
                    colorpicker.hue.BackgroundColor3 = Color3.new(1,0,0)
                    colorpicker.hue.BorderColor3 = window.theme.outlinecolor2

                    colorpicker.hueselectorpointer = Instance.new("ImageLabel", colorpicker.MainPicker)
                    colorpicker.hueselectorpointer.ZIndex = 101
                    colorpicker.hueselectorpointer.BackgroundTransparency = 1
                    colorpicker.hueselectorpointer.BorderSizePixel = 0
                    colorpicker.hueselectorpointer.Position = UDim2.new(0, 0, 0, 0)
                    colorpicker.hueselectorpointer.Size = UDim2.new(0, 7, 0, 7)
                    colorpicker.hueselectorpointer.Image = "rbxassetid://6885856475"

                    colorpicker.selector = Instance.new("TextLabel", colorpicker.MainPicker)
                    colorpicker.selector.ZIndex = 100
                    colorpicker.selector.Position = UDim2.new(0,5,0,163)
                    colorpicker.selector.Size = UDim2.new(0,150,0,10)
                    colorpicker.selector.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    colorpicker.selector.BorderColor3 = window.theme.outlinecolor2
                    colorpicker.selector.Text = ""
        
                    colorpicker.gradient = Instance.new("UIGradient", colorpicker.selector)
                    colorpicker.gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1,0,0)), ColorSequenceKeypoint.new(0.25,Color3.new(1,0,1)), ColorSequenceKeypoint.new(0.5,Color3.new(0,1,1)), ColorSequenceKeypoint.new(0.75,Color3.new(1,1,0)), ColorSequenceKeypoint.new(1,Color3.new(1,0,0))})

                    colorpicker.pointer = Instance.new("Frame", colorpicker.selector)
                    colorpicker.pointer.ZIndex = 101
                    colorpicker.pointer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    colorpicker.pointer.Position = UDim2.new(0,0,0,0)
                    colorpicker.pointer.Size = UDim2.new(0,2,0,10)
                    colorpicker.pointer.BorderColor3 = Color3.fromRGB(255, 255, 255)

                    function colorpicker:RefreshSelector()
                        local pos = math.clamp((mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X, 0, 1)
                        colorpicker.color = 1 - pos
                        colorpicker.pointer:TweenPosition(UDim2.new(pos, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
                        colorpicker.hue.BackgroundColor3 = Color3.fromHSV(1 - pos, 1, 1)
                    end

                    function colorpicker:RefreshHue()
                        local x = (mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X
                        local y = (mouse.Y - colorpicker.hue.AbsolutePosition.Y) / colorpicker.hue.AbsoluteSize.Y
                        colorpicker.hueselectorpointer:TweenPosition(UDim2.new(math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 0.945 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 0, math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 0.855 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
                        colorpicker:Set(Color3.fromHSV(colorpicker.color, math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 1 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 1 - (math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 1 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y)))
                    end

                    function colorpicker:Set(value)
                        local color = Color3.new(math.clamp(value.r, 0, 1), math.clamp(value.g, 0, 1), math.clamp(value.b, 0, 1))
                        colorpicker.value = color

                        local clr = Color3.new(math.clamp(color.R / 1.7, 0, 1), math.clamp(color.G / 1.7, 0, 1), math.clamp(color.B / 1.7, 0, 1))
                        colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, color), ColorSequenceKeypoint.new(1.00, clr) })
                        pcall(colorpicker.callback, color)
                    end
                    colorpicker:Set(colorpicker.default)

                    local dragging_selector = false
                    local dragging_hue = false

                    colorpicker.selector.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging_selector = true
                            colorpicker:RefreshSelector()
                        end
                    end)
    
                    colorpicker.selector.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging_selector = false
                            colorpicker:RefreshSelector()
                        end
                    end)

                    colorpicker.hue.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging_hue = true
                            colorpicker:RefreshHue()
                        end
                    end)
    
                    colorpicker.hue.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging_hue = false
                            colorpicker:RefreshHue()
                        end
                    end)
    
                    game:GetService("UserInputService").InputChanged:Connect(function(input)
                        if dragging_selector and input.UserInputType == Enum.UserInputType.MouseMovement then
                            colorpicker:RefreshSelector()
                        end
                        if dragging_hue and input.UserInputType == Enum.UserInputType.MouseMovement then
                            colorpicker:RefreshHue()
                        end
                    end)

                    local inputBegan = function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            for i,v in pairs(window.OpenedColorPickers) do
                                if v and i ~= colorpicker.MainPicker then
                                    i.Visible = false
                                    window.OpenedColorPickers[i] = false
                                end
                            end

                            colorpicker.MainPicker.Visible = not colorpicker.MainPicker.Visible
                            window.OpenedColorPickers[colorpicker.MainPicker] = colorpicker.MainPicker.Visible
                            if window.OpenedColorPickers[colorpicker.MainPicker] then
                                colorpicker.Outline.BackgroundColor3 = window.theme.accentcolor
                                colorpicker.BlackOutline.BackgroundColor3 = window.theme.accentcolor
                                colorpicker.Outline.BackgroundTransparency = 0.4
                                colorpicker.BlackOutline.BackgroundTransparency = 0.5
                            else
                                colorpicker.Outline.BackgroundColor3 = window.theme.outlinecolor
                                colorpicker.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                                colorpicker.Outline.BackgroundTransparency = 0
                                colorpicker.BlackOutline.BackgroundTransparency = 0
                            end
                        end
                    end

                    colorpicker.Main.InputBegan:Connect(inputBegan)
                    colorpicker.Outline.InputBegan:Connect(inputBegan)
                    colorpicker.BlackOutline.InputBegan:Connect(inputBegan)

                    return colorpicker
                end

                toggle.Main.MouseButton1Down:Connect(function()
                    toggle:Set(not toggle.CheckedFrame.Visible)
                end)
                toggle.Label.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        toggle:Set(not toggle.CheckedFrame.Visible)
                    end
                end)

                local MouseEnter = function()
                    toggle.Outline.BackgroundColor3 = window.theme.accentcolor
                    toggle.BlackOutline.BackgroundColor3 = window.theme.accentcolor
                    toggle.Outline.BackgroundTransparency = 0.4
                    toggle.BlackOutline.BackgroundTransparency = 0.5
                end
                local MouseLeave = function()
                    toggle.Outline.BackgroundColor3 = window.theme.outlinecolor
                    toggle.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                    toggle.Outline.BackgroundTransparency = 0
                    toggle.BlackOutline.BackgroundTransparency = 0
                end

                toggle.Label.MouseEnter:Connect(MouseEnter)
                toggle.Label.MouseLeave:Connect(MouseLeave)
                toggle.BlackOutline.MouseEnter:Connect(MouseEnter)
                toggle.BlackOutline.MouseLeave:Connect(MouseLeave)

                sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, sector.ListLayout.AbsoluteContentSize.Y + 18)
                tab.TabPage.CanvasSize = sector.Main.Size

                return toggle
            end
            
            function sector:AddTextbox(text,default,callback)
                local textbox = { }
                textbox.text = text or ""
                textbox.callback = callback or function() end
                textbox.default = default

                textbox.Holder = Instance.new("Frame", sector.Items)
                textbox.Holder.Name = "holder"
                textbox.Holder.ZIndex = 4
                textbox.Holder.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 14)
                textbox.Holder.BorderSizePixel = 0
                textbox.Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

                textbox.Gradient = Instance.new("UIGradient", textbox.Holder)
                textbox.Gradient.Rotation = 90
                textbox.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 39, 39)) })

                textbox.Main = Instance.new("TextBox", textbox.Holder)
                textbox.Main.PlaceholderText = textbox.text
                textbox.Main.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
                textbox.Main.Text = ""
                textbox.Main.BackgroundTransparency = 1
                textbox.Main.Font = window.theme.font
                textbox.Main.Name = "textbox"
                textbox.Main.MultiLine = false
                textbox.Main.ZIndex = 5
                textbox.Main.TextScaled = true
                textbox.Main.Size = textbox.Holder.Size
                textbox.Main.TextSize = 13
                textbox.Main.TextColor3 = Color3.fromRGB(255, 255, 255)
                textbox.Main.BorderSizePixel = 0
                textbox.Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                textbox.Main:GetPropertyChangedSignal("Text"):Connect(function()
                    pcall(textbox.callback, textbox.Main.Text)
                end)

                textbox.Outline = Instance.new("Frame", textbox.Main)
                textbox.Outline.Name = "blackline"
                textbox.Outline.ZIndex = 3
                textbox.Outline.Size = textbox.Holder.Size + UDim2.fromOffset(2, 2)
                textbox.Outline.BorderSizePixel = 0
                textbox.Outline.BackgroundColor3 = window.theme.outlinecolor
                textbox.Outline.Position = UDim2.fromOffset(-1, -1)

                textbox.BlackOutline = Instance.new("Frame", textbox.Main)
                textbox.BlackOutline.Name = "blackline"
                textbox.BlackOutline.ZIndex = 2
                textbox.BlackOutline.Size = textbox.Holder.Size + UDim2.fromOffset(4, 4)
                textbox.BlackOutline.BorderSizePixel = 0
                textbox.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                textbox.BlackOutline.Position = UDim2.fromOffset(-2, -2)

                textbox.BlackOutline.MouseEnter:Connect(function()
                    textbox.Outline.BackgroundColor3 = window.theme.accentcolor
                    textbox.BlackOutline.BackgroundColor3 = window.theme.accentcolor
                    textbox.Outline.BackgroundTransparency = 0.4
                    textbox.BlackOutline.BackgroundTransparency = 0.5
                end)
                textbox.BlackOutline.MouseLeave:Connect(function()
                    textbox.Outline.BackgroundColor3 = window.theme.outlinecolor
                    textbox.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                    textbox.Outline.BackgroundTransparency = 0
                    textbox.BlackOutline.BackgroundTransparency = 0
                end)

                function textbox:Set(text)
                    textbox.Main.Text = text
                end
                if textbox.default then 
                    textbox:Set(textbox.default)
                end

                sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, sector.ListLayout.AbsoluteContentSize.Y + 18)
                tab.TabPage.CanvasSize = sector.Main.Size

                return textbox
            end

            function sector:AddSlider(text,min,default,max,decimals,callback)
                local slider = { }
                slider.text = text or ""
                slider.callback = callback or function(value) end
                slider.min = min or 0
                slider.max = max or 100
                slider.decimals = decimals or 1
                slider.default = default or slider.min

                slider.value = slider.default
                local dragging = false

                slider.MainBack = Instance.new("Frame", sector.Items)
                slider.MainBack.Name = "MainBack"
                slider.MainBack.ZIndex = 7
                slider.MainBack.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 25)
                slider.MainBack.BorderSizePixel = 0
                slider.MainBack.BackgroundTransparency = 1

                slider.Label = Instance.new("TextLabel", slider.MainBack)
                slider.Label.BackgroundTransparency = 1
                slider.Label.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 6)
                slider.Label.Font = window.theme.font
                slider.Label.Text = slider.text .. ": " .. tostring(slider.default)
                slider.Label.TextColor3 = window.theme.itemscolor
                slider.Label.Position = UDim2.fromOffset(0, 0)
                slider.Label.TextSize = 13
                slider.Label.ZIndex = 2
                slider.Label.TextStrokeTransparency = 1
                slider.Label.TextXAlignment = Enum.TextXAlignment.Left

                slider.Main = Instance.new("TextButton", slider.MainBack)
                slider.Main.Name = "slider"
                slider.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                slider.Main.Position = UDim2.fromOffset(0, 15)
                slider.Main.BorderSizePixel = 0
                slider.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 10)
                slider.Main.AutoButtonColor = false
                slider.Main.Text = ""
                slider.Main.ZIndex = 4

                slider.Outline = Instance.new("Frame", slider.Main)
                slider.Outline.Name = "blackline"
                slider.Outline.ZIndex = 3
                slider.Outline.Size = slider.Main.Size + UDim2.fromOffset(2, 2)
                slider.Outline.BorderSizePixel = 0
                slider.Outline.BackgroundColor3 = window.theme.outlinecolor
                slider.Outline.Position = UDim2.fromOffset(-1, -1)

                slider.BlackOutline = Instance.new("Frame", slider.Main)
                slider.BlackOutline.Name = "blackline"
                slider.BlackOutline.ZIndex = 2
                slider.BlackOutline.Size = slider.Main.Size + UDim2.fromOffset(4, 4)
                slider.BlackOutline.BorderSizePixel = 0
                slider.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                slider.BlackOutline.Position = UDim2.fromOffset(-2, -2)

                slider.Gradient = Instance.new("UIGradient", slider.Main)
                slider.Gradient.Rotation = 90
                slider.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(41, 41, 41)) })

                slider.SlideBar = Instance.new("Frame", slider.Main)
                slider.SlideBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255) --Color3.fromRGB(204, 0, 102)
                slider.SlideBar.ZIndex = 4
                slider.SlideBar.BorderSizePixel = 0
                slider.SlideBar.Size = UDim2.fromOffset(0, slider.Main.Size.Y.Offset)

                slider.Gradient2 = Instance.new("UIGradient", slider.SlideBar)
                slider.Gradient2.Rotation = 90
                slider.Gradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, window.theme.accentcolor), ColorSequenceKeypoint.new(1.00, window.theme.accentcolor2) })

                slider.BlackOutline.MouseEnter:Connect(function()
                    slider.Outline.BackgroundColor3 = window.theme.accentcolor
                    slider.BlackOutline.BackgroundColor3 = window.theme.accentcolor
                    slider.Outline.BackgroundTransparency = 0.4
                    slider.BlackOutline.BackgroundTransparency = 0.5
                end)
                slider.BlackOutline.MouseLeave:Connect(function()
                    slider.Outline.BackgroundColor3 = window.theme.outlinecolor
                    slider.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                    slider.Outline.BackgroundTransparency = 0
                    slider.BlackOutline.BackgroundTransparency = 0
                end)

                function slider:Set(value)
                    slider.value = value
                    value = math.round(value * slider.decimals) / slider.decimals
                    local percent = 1 - ((slider.max - value) / (slider.max - slider.min))
                    slider.SlideBar:TweenSize(UDim2.fromOffset(percent * slider.Main.Size.X.Offset, slider.Main.Size.Y.Offset), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
					slider.Label.Text = slider.text .. ": " .. tostring(value)
					pcall(slider.callback, value)
				end
                slider:Set(slider.default)

                function slider:Refresh()
                    local percent = math.clamp(mouse.X - slider.SlideBar.AbsolutePosition.X, 0, slider.Main.Size.X.Offset) / slider.Main.Size.X.Offset
                    local value = math.floor((slider.min + (slider.max - slider.min) * percent) * slider.decimals) / slider.decimals
                    slider:Set(value)
                end

                slider.SlideBar.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        slider:Refresh()
                    end
                end)

                slider.SlideBar.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)

                slider.Main.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        slider:Refresh()
                    end
                end)

                slider.Main.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)

				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        slider:Refresh()
					end
				end)

                sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, sector.ListLayout.AbsoluteContentSize.Y + 18)
                tab.TabPage.CanvasSize = sector.Main.Size

                return slider
            end

            function sector:AddColorpicker(text, default, callback)
                local colorpicker = { }

                colorpicker.text = text or ""
                colorpicker.callback = callback or function() end
                colorpicker.default = default or Color3.fromRGB(255, 255, 255)
                colorpicker.value = colorpicker.default

                colorpicker.Label = Instance.new("TextLabel", sector.Items)
                colorpicker.Label.BackgroundTransparency = 1
                colorpicker.Label.Size = UDim2.fromOffset(156, 10)
                colorpicker.Label.ZIndex = 2
                colorpicker.Label.Font = window.theme.font
                colorpicker.Label.Text = colorpicker.text
                colorpicker.Label.TextColor3 = window.theme.itemscolor
                colorpicker.Label.TextSize = 13
                colorpicker.Label.TextStrokeTransparency = 1
                colorpicker.Label.TextXAlignment = Enum.TextXAlignment.Left

                colorpicker.Main = Instance.new("Frame", colorpicker.Label)
                colorpicker.Main.ZIndex = 6
                colorpicker.Main.BorderSizePixel = 0
                colorpicker.Main.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 29, 0)
                colorpicker.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                colorpicker.Main.Size = UDim2.fromOffset(16, 10)

                colorpicker.Gradient = Instance.new("UIGradient", colorpicker.Main)
                colorpicker.Gradient.Rotation = 90

                local clr = Color3.new(math.clamp(colorpicker.value.R / 1.7, 0, 1), math.clamp(colorpicker.value.G / 1.7, 0, 1), math.clamp(colorpicker.value.B / 1.7, 0, 1))
                colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, colorpicker.value), ColorSequenceKeypoint.new(1.00, clr) })

                colorpicker.Outline = Instance.new("Frame", colorpicker.Main)
                colorpicker.Outline.Name = "outline"
                colorpicker.Outline.ZIndex = 5
                colorpicker.Outline.Size = colorpicker.Main.Size + UDim2.fromOffset(2, 2)
                colorpicker.Outline.BorderSizePixel = 0
                colorpicker.Outline.BackgroundColor3 = window.theme.outlinecolor
                colorpicker.Outline.Position = UDim2.fromOffset(-1, -1)

                colorpicker.BlackOutline = Instance.new("Frame", colorpicker.Main)
                colorpicker.BlackOutline.Name = "blackline"
                colorpicker.BlackOutline.ZIndex = 4
                colorpicker.BlackOutline.Size = colorpicker.Main.Size + UDim2.fromOffset(4, 4)
                colorpicker.BlackOutline.BorderSizePixel = 0
                colorpicker.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                colorpicker.BlackOutline.Position = UDim2.fromOffset(-2, -2)

                colorpicker.BlackOutline.MouseEnter:Connect(function()
                    colorpicker.Outline.BackgroundColor3 = window.theme.accentcolor
                    colorpicker.BlackOutline.BackgroundColor3 = window.theme.accentcolor
                    colorpicker.Outline.BackgroundTransparency = 0.4
                    colorpicker.BlackOutline.BackgroundTransparency = 0.5
                end)
                colorpicker.BlackOutline.MouseLeave:Connect(function()
                    if not window.OpenedColorPickers[colorpicker.MainPicker] then
                        colorpicker.Outline.BackgroundColor3 = window.theme.outlinecolor
                        colorpicker.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                        colorpicker.Outline.BackgroundTransparency = 0
                        colorpicker.BlackOutline.BackgroundTransparency = 0
                    end
                end)

                colorpicker.MainPicker = Instance.new("Frame", colorpicker.Main)
                colorpicker.MainPicker.Name = "picker"
                colorpicker.MainPicker.ZIndex = 100
                colorpicker.MainPicker.Visible = false
                window.OpenedColorPickers[colorpicker.MainPicker] = false
                colorpicker.MainPicker.Size = UDim2.fromOffset(160, 178)
                colorpicker.MainPicker.BorderSizePixel = 0
                colorpicker.MainPicker.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                colorpicker.MainPicker.Position = UDim2.fromOffset(-colorpicker.MainPicker.AbsoluteSize.X + colorpicker.Main.AbsoluteSize.X, 15)

                colorpicker.Outline2 = Instance.new("TextButton", colorpicker.MainPicker)
                colorpicker.Outline2.AutoButtonColor = false
                colorpicker.Outline2.Name = "outline"
                colorpicker.Outline2.ZIndex = 99
                colorpicker.Outline2.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(2, 2)
                colorpicker.Outline2.BorderSizePixel = 0
                colorpicker.Outline2.BackgroundColor3 = window.theme.outlinecolor
                colorpicker.Outline2.Position = UDim2.fromOffset(-1, -1)

                colorpicker.BlackOutline2 = Instance.new("Frame", colorpicker.MainPicker)
                colorpicker.BlackOutline2.Name = "blackline"
                colorpicker.BlackOutline2.ZIndex = 98
                colorpicker.BlackOutline2.Size = colorpicker.MainPicker.Size + UDim2.fromOffset(4, 4)
                colorpicker.BlackOutline2.BorderSizePixel = 0
                colorpicker.BlackOutline2.BackgroundColor3 = window.theme.outlinecolor2
                colorpicker.BlackOutline2.Position = UDim2.fromOffset(-2, -2)

                colorpicker.hue = Instance.new("ImageLabel", colorpicker.MainPicker)
                colorpicker.hue.ZIndex = 101
                colorpicker.hue.Position = UDim2.new(0,5,0,5)
                colorpicker.hue.Size = UDim2.new(0,150,0,150)
                colorpicker.hue.Image = "rbxassetid://4155801252"
                colorpicker.hue.ScaleType = Enum.ScaleType.Stretch
                colorpicker.hue.BackgroundColor3 = Color3.new(1,0,0)
                colorpicker.hue.BorderColor3 = window.theme.outlinecolor2

                colorpicker.hueselectorpointer = Instance.new("ImageLabel", colorpicker.MainPicker)
                colorpicker.hueselectorpointer.ZIndex = 101
                colorpicker.hueselectorpointer.BackgroundTransparency = 1
                colorpicker.hueselectorpointer.BorderSizePixel = 0
                colorpicker.hueselectorpointer.Position = UDim2.new(0, 0, 0, 0)
                colorpicker.hueselectorpointer.Size = UDim2.new(0, 7, 0, 7)
                colorpicker.hueselectorpointer.Image = "rbxassetid://6885856475"

                colorpicker.selector = Instance.new("TextLabel", colorpicker.MainPicker)
                colorpicker.selector.ZIndex = 100
                colorpicker.selector.Position = UDim2.new(0,5,0,163)
                colorpicker.selector.Size = UDim2.new(0,150,0,10)
                colorpicker.selector.BackgroundColor3 = Color3.fromRGB(255,255,255)
                colorpicker.selector.BorderColor3 = Color3.new(0, 0, 0)
                colorpicker.selector.Text = ""
    
                colorpicker.gradient = Instance.new("UIGradient", colorpicker.selector)
                colorpicker.gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1,0,0)), ColorSequenceKeypoint.new(0.25,Color3.new(1,0,1)), ColorSequenceKeypoint.new(0.5,Color3.new(0,1,1)), ColorSequenceKeypoint.new(0.75,Color3.new(1,1,0)), ColorSequenceKeypoint.new(1,Color3.new(1,0,0)) })

                colorpicker.pointer = Instance.new("Frame", colorpicker.selector)
                colorpicker.pointer.ZIndex = 101
                colorpicker.pointer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                colorpicker.pointer.Position = UDim2.new(0,0,0,0)
                colorpicker.pointer.Size = UDim2.new(0,2,0,10)
                colorpicker.pointer.BorderColor3 = Color3.fromRGB(255, 255, 255)

                function colorpicker:RefreshSelector()
                    local pos = math.clamp((mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X, 0, 1)
                    colorpicker.color = 1 - pos
                    colorpicker.pointer:TweenPosition(UDim2.new(pos, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
                    colorpicker.hue.BackgroundColor3 = Color3.fromHSV(1 - pos, 1, 1)
                end

                function colorpicker:RefreshHue()
                    local x = (mouse.X - colorpicker.hue.AbsolutePosition.X) / colorpicker.hue.AbsoluteSize.X
                    local y = (mouse.Y - colorpicker.hue.AbsolutePosition.Y) / colorpicker.hue.AbsoluteSize.Y
                    colorpicker.hueselectorpointer:TweenPosition(UDim2.new(math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 0.945 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 0, math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 0.855 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
                    colorpicker:Set(Color3.fromHSV(colorpicker.color, math.clamp(x * colorpicker.hue.AbsoluteSize.X, 0.5, 1 * colorpicker.hue.AbsoluteSize.X) / colorpicker.hue.AbsoluteSize.X, 1 - (math.clamp(y * colorpicker.hue.AbsoluteSize.Y, 0.5, 1 * colorpicker.hue.AbsoluteSize.Y) / colorpicker.hue.AbsoluteSize.Y)))
                end

                function colorpicker:Set(value)
                    local color = Color3.new(math.clamp(value.r, 0, 1), math.clamp(value.g, 0, 1), math.clamp(value.b, 0, 1))
                    colorpicker.value = color

                    local clr = Color3.new(math.clamp(color.R / 1.7, 0, 1), math.clamp(color.G / 1.7, 0, 1), math.clamp(color.B / 1.7, 0, 1))
                    colorpicker.Gradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0.00, color), ColorSequenceKeypoint.new(1.00, clr) })
                    pcall(colorpicker.callback, color)
                end
                colorpicker:Set(colorpicker.default)

                local dragging_selector = false
                local dragging_hue = false

                colorpicker.selector.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging_selector = true
                        colorpicker:RefreshSelector()
                    end
                end)

                colorpicker.selector.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging_selector = false
                        colorpicker:RefreshSelector()
                    end
                end)

                colorpicker.hue.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging_hue = true
                        colorpicker:RefreshHue()
                    end
                end)

                colorpicker.hue.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging_hue = false
                        colorpicker:RefreshHue()
                    end
                end)

                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if dragging_selector and input.UserInputType == Enum.UserInputType.MouseMovement then
                        colorpicker:RefreshSelector()
                    end
                    if dragging_hue and input.UserInputType == Enum.UserInputType.MouseMovement then
                        colorpicker:RefreshHue()
                    end
                end)

                local inputBegan = function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        for i,v in pairs(window.OpenedColorPickers) do
                            if v and i ~= colorpicker.MainPicker then
                                i.Visible = false
                                window.OpenedColorPickers[i] = false
                            end
                        end

                        colorpicker.MainPicker.Visible = not colorpicker.MainPicker.Visible
                        window.OpenedColorPickers[colorpicker.MainPicker] = colorpicker.MainPicker.Visible
                        if window.OpenedColorPickers[colorpicker.MainPicker] then
                            colorpicker.Outline.BackgroundColor3 = window.theme.accentcolor
                            colorpicker.BlackOutline.BackgroundColor3 = window.theme.accentcolor
                            colorpicker.Outline.BackgroundTransparency = 0.4
                            colorpicker.BlackOutline.BackgroundTransparency = 0.5
                        else
                            colorpicker.Outline.BackgroundColor3 = window.theme.outlinecolor
                            colorpicker.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                            colorpicker.Outline.BackgroundTransparency = 0
                            colorpicker.BlackOutline.BackgroundTransparency = 0
                        end
                    end
                end

                colorpicker.Main.InputBegan:Connect(inputBegan)
                colorpicker.Outline.InputBegan:Connect(inputBegan)
                colorpicker.BlackOutline.InputBegan:Connect(inputBegan)

                sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, sector.ListLayout.AbsoluteContentSize.Y + 18)
                tab.TabPage.CanvasSize = sector.Main.Size

                return colorpicker
            end

            function sector:AddKeybind(text,default,newkeycallback,callback)
                local keybind = { }

                keybind.text = text or ""
                keybind.default = default or "None"
                keybind.callback = callback or function() end
                keybind.newkeycallback = newkeycallback or function(key) end

                keybind.value = keybind.default

                keybind.Main = Instance.new("TextLabel", sector.Items)
                keybind.Main.BackgroundTransparency = 1
                keybind.Main.Size = UDim2.fromOffset(156, 10)
                keybind.Main.ZIndex = 2
                keybind.Main.Font = window.theme.font
                keybind.Main.Text = keybind.text
                keybind.Main.TextColor3 = window.theme.itemscolor
                keybind.Main.TextSize = 13
                keybind.Main.TextStrokeTransparency = 1
                keybind.Main.TextXAlignment = Enum.TextXAlignment.Left

                keybind.Bind = Instance.new("TextButton", keybind.Main)
                keybind.Bind.Name = "keybind"
                keybind.Bind.BackgroundTransparency = 1
                keybind.Bind.BorderColor3 = window.theme.outlinecolor
                keybind.Bind.ZIndex = 2
                keybind.Bind.BorderSizePixel = 0
                keybind.Bind.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 50, 0)
                keybind.Bind.Size = UDim2.fromOffset(37, 10)
                keybind.Bind.Font = window.theme.font
                keybind.Bind.Text = keybind.default == "None" and "[None]" or "[" .. keybind.default.Name .. "]"
                keybind.Bind.TextColor3 = Color3.fromRGB(136, 136, 136)
                keybind.Bind.TextSize = 14
                keybind.Bind.TextXAlignment = Enum.TextXAlignment.Right
                keybind.Bind.MouseButton1Down:Connect(function()
                    keybind.Bind.Text = "..."
                end)

                function keybind:Set(value)
                    keybind.Bind.Text = "[" .. value.Name .. "]"
                    pcall(keybind.newkeycallback, value)
                end

                game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                    if not gameProcessed then
                        if keybind.Bind.Text == "..." then
                            if input.UserInputType == Enum.UserInputType.Keyboard then
                                keybind.Bind.Text = "[" .. input.KeyCode.Name .. "]"
                                keybind.value = input.KeyCode
                            else
                                keybind.Bind.Text = "[None]"
                                keybind.value = "None"
                            end
                            pcall(keybind.newkeycallback, keybind.value)
                        else
                            if keybind.value ~= "None" and input.KeyCode == keybind.value then
                                pcall(keybind.callback)
                            end
                        end
                    end
                end)

                sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, sector.ListLayout.AbsoluteContentSize.Y + 18)
                tab.TabPage.CanvasSize = sector.Main.Size

                return keybind
            end

            function sector:AddDropdown(text,items,default,callback)
                local dropdown = { }

                dropdown.text = text or ""
                dropdown.items = items or { }
                dropdown.default = default
                dropdown.callback = callback or function() end
                dropdown.value = dropdown.default

                dropdown.MainBack = Instance.new("Frame", sector.Items)
                dropdown.MainBack.Name = "backlabel"
                dropdown.MainBack.ZIndex = 7
                dropdown.MainBack.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 34)
                dropdown.MainBack.BorderSizePixel = 0
                dropdown.MainBack.BackgroundTransparency = 1
                dropdown.Label = Instance.new("TextLabel", dropdown.MainBack)
                dropdown.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                dropdown.Label.BackgroundTransparency = 1
                dropdown.Label.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 10)
                dropdown.Label.Position = UDim2.fromOffset(0, 0)
                dropdown.Label.Font = window.theme.font
                dropdown.Label.Text = dropdown.text
                dropdown.Label.ZIndex = 4
                dropdown.Label.TextColor3 = window.theme.itemscolor
                dropdown.Label.TextSize = 13
                dropdown.Label.TextStrokeTransparency = 1
                dropdown.Label.TextXAlignment = Enum.TextXAlignment.Left

                dropdown.Main = Instance.new("TextButton", dropdown.MainBack)
                dropdown.Main.Name = "dropdown"
                dropdown.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                dropdown.Main.BorderSizePixel = 0
                dropdown.Main.Size = UDim2.fromOffset(sector.Main.Size.X.Offset - 12, 16)
                dropdown.Main.Position = UDim2.fromOffset(0, 17)
                dropdown.Main.ZIndex = 4
                dropdown.Main.AutoButtonColor = false
                dropdown.Main.Font = window.theme.font
                dropdown.Main.Text = ""
                dropdown.Main.TextColor3 = Color3.fromRGB(255, 255, 255)
                dropdown.Main.TextSize = 14
                dropdown.Main.TextXAlignment = Enum.TextXAlignment.Left

                dropdown.Gradient = Instance.new("UIGradient", dropdown.Main)
                dropdown.Gradient.Rotation = 90
                dropdown.Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 39, 39))}

                dropdown.SelectedLabel = Instance.new("TextLabel", dropdown.Main)
                dropdown.SelectedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                dropdown.SelectedLabel.BackgroundTransparency = 1
                dropdown.SelectedLabel.Position = UDim2.fromOffset(5, 2)
                dropdown.SelectedLabel.Size = UDim2.fromOffset(130, 13)
                dropdown.SelectedLabel.Font = window.theme.font
                dropdown.SelectedLabel.Text = dropdown.text
                dropdown.SelectedLabel.ZIndex = 5
                dropdown.SelectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                dropdown.SelectedLabel.TextSize = 13
                dropdown.SelectedLabel.TextStrokeTransparency = 1
                dropdown.SelectedLabel.TextXAlignment = Enum.TextXAlignment.Left

                dropdown.Nav = Instance.new("ImageButton", dropdown.Main)
                dropdown.Nav.Name = "navigation"
                dropdown.Nav.BackgroundTransparency = 1
                dropdown.Nav.LayoutOrder = 10
                dropdown.Nav.Position = UDim2.fromOffset(sector.Main.Size.X.Offset - 30, 3)
                dropdown.Nav.Rotation = 180
                dropdown.Nav.ZIndex = 5
                dropdown.Nav.Size = UDim2.fromOffset(13, 9)
                dropdown.Nav.Image = "rbxassetid://3926305904"
                dropdown.Nav.ImageRectOffset = Vector2.new(524, 764)
                dropdown.Nav.ImageRectSize = Vector2.new(36, 36)

                dropdown.Outline = Instance.new("Frame", dropdown.Main)
                dropdown.Outline.Name = "blackline"
                dropdown.Outline.ZIndex = 3
                dropdown.Outline.Size = dropdown.Main.Size + UDim2.fromOffset(2, 2)
                dropdown.Outline.BorderSizePixel = 0
                dropdown.Outline.BackgroundColor3 = window.theme.outlinecolor
                dropdown.Outline.Position = UDim2.fromOffset(-1, -1)

                dropdown.BlackOutline = Instance.new("Frame", dropdown.Main)
                dropdown.BlackOutline.Name = "blackline"
                dropdown.BlackOutline.ZIndex = 2
                dropdown.BlackOutline.Size = dropdown.Main.Size + UDim2.fromOffset(4, 4)
                dropdown.BlackOutline.BorderSizePixel = 0
                dropdown.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                dropdown.BlackOutline.Position = UDim2.fromOffset(-2, -2)

                dropdown.ItemsFrame = Instance.new("ScrollingFrame", dropdown.Main)
                dropdown.ItemsFrame.Name = "itemsframe"
                dropdown.ItemsFrame.BorderSizePixel = 0
                dropdown.ItemsFrame.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset, math.clamp(#dropdown.items * 20, 20, 156) + 4)
                dropdown.ItemsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                dropdown.ItemsFrame.Position = UDim2.fromOffset(0, dropdown.Main.Size.Y.Offset + 8)
                dropdown.ItemsFrame.ScrollBarThickness = 0
                dropdown.ItemsFrame.ZIndex = 8
                dropdown.ItemsFrame.ScrollingDirection = "Y"
                dropdown.ItemsFrame.Visible = false

                dropdown.ListLayout = Instance.new("UIListLayout", dropdown.ItemsFrame)
                dropdown.ListLayout.FillDirection = Enum.FillDirection.Vertical
                dropdown.ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

                dropdown.ListPadding = Instance.new("UIPadding", dropdown.ItemsFrame)
                dropdown.ListPadding.PaddingTop = UDim.new(0, 2)
                dropdown.ListPadding.PaddingBottom = UDim.new(0, 2)
                dropdown.ListPadding.PaddingLeft = UDim.new(0, 2)
                dropdown.ListPadding.PaddingRight = UDim.new(0, 2)

                for i,v in pairs(dropdown.items) do
                    local Item = Instance.new("TextButton", dropdown.ItemsFrame)
                    Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Item.BorderSizePixel = 0
                    Item.Position = UDim2.fromOffset(0, 0)
                    Item.Size = UDim2.fromOffset(dropdown.Main.Size.X.Offset - 4, 20)
                    Item.ZIndex = 8
                    Item.Text = v
                    Item.AutoButtonColor = false
                    Item.Font = window.theme.font
                    Item.TextSize = 13
                    Item.TextXAlignment = Enum.TextXAlignment.Left
                    Item.TextStrokeTransparency = 1

                    Item.MouseButton1Down:Connect(function()
                        dropdown.Nav.Rotation = 180
                        dropdown.ItemsFrame.Visible = false
                        dropdown.ItemsFrame.Active = false
                        dropdown.OutlineItems.Visible = false
                        dropdown.BlackOutlineItems.Visible = false

                        dropdown.SelectedLabel.Text = v
                        dropdown.value = v
                        pcall(dropdown.callback, v)
                    end)

                    game:GetService("RunService").RenderStepped:Connect(function()
                        if dropdown.value == v then
                            Item.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
                            Item.TextColor3 = window.theme.accentcolor
                            Item.Text = " " .. v
                        else
                            Item.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                            Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                            Item.Text = v
                        end
                    end)
                end

                dropdown.OutlineItems = Instance.new("Frame", dropdown.Main)
                dropdown.OutlineItems.Name = "blackline"
                dropdown.OutlineItems.ZIndex = 5
                dropdown.OutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(2, 2)
                dropdown.OutlineItems.BorderSizePixel = 0
                dropdown.OutlineItems.BackgroundColor3 = window.theme.outlinecolor
                dropdown.OutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(-1, -1)
                dropdown.OutlineItems.Visible = false

                dropdown.BlackOutlineItems = Instance.new("Frame", dropdown.Main)
                dropdown.BlackOutlineItems.Name = "blackline"
                dropdown.BlackOutlineItems.ZIndex = 4
                dropdown.BlackOutlineItems.Size = dropdown.ItemsFrame.Size + UDim2.fromOffset(4, 4)
                dropdown.BlackOutlineItems.BorderSizePixel = 0
                dropdown.BlackOutlineItems.BackgroundColor3 = window.theme.outlinecolor2
                dropdown.BlackOutlineItems.Position = dropdown.ItemsFrame.Position + UDim2.fromOffset(-2, -2)
                dropdown.BlackOutlineItems.Visible = false

                dropdown.IgnoreBackButtons = Instance.new("TextButton", dropdown.ItemsFrame)
                dropdown.IgnoreBackButtons.BackgroundTransparency = 1
                dropdown.IgnoreBackButtons.BorderSizePixel = 0
                dropdown.IgnoreBackButtons.Position = UDim2.fromOffset(0, 0)
                dropdown.IgnoreBackButtons.Size = dropdown.ItemsFrame.Size
                dropdown.IgnoreBackButtons.ZIndex = 7
                dropdown.IgnoreBackButtons.Text = ""
                dropdown.IgnoreBackButtons.AutoButtonColor = false

                function dropdown:Set(value)
                    dropdown.SelectedLabel.Text = value
                    dropdown.value = value
                    pcall(dropdown.callback, value)
                end

                if dropdown.default then
                    dropdown:Set(dropdown.default)
                end

                local MouseButton1Down = function()
                    if dropdown.Nav.Rotation == 180 then
                        dropdown.Nav.Rotation = 0
                        dropdown.ItemsFrame.Visible = true
                        dropdown.ItemsFrame.Active = true
                        dropdown.OutlineItems.Visible = true
                        dropdown.BlackOutlineItems.Visible = true
                    else
                        dropdown.Nav.Rotation = 180
                        dropdown.ItemsFrame.Visible = false
                        dropdown.ItemsFrame.Active = false
                        dropdown.OutlineItems.Visible = false
                        dropdown.BlackOutlineItems.Visible = false
                    end
                end

                dropdown.Main.MouseButton1Down:Connect(MouseButton1Down)
                dropdown.Nav.MouseButton1Down:Connect(MouseButton1Down)

                dropdown.BlackOutline.MouseEnter:Connect(function()
                    dropdown.Outline.BackgroundColor3 = window.theme.accentcolor
                    dropdown.BlackOutline.BackgroundColor3 = window.theme.accentcolor
                    dropdown.Outline.BackgroundTransparency = 0.4
                    dropdown.BlackOutline.BackgroundTransparency = 0.5
                end)
                dropdown.BlackOutline.MouseLeave:Connect(function()
                    dropdown.Outline.BackgroundColor3 = window.theme.outlinecolor
                    dropdown.BlackOutline.BackgroundColor3 = window.theme.outlinecolor2
                    dropdown.Outline.BackgroundTransparency = 0
                    dropdown.BlackOutline.BackgroundTransparency = 0
                end)

                sector.Main.Size = UDim2.fromOffset(window.size.X.Offset / 2 - 17, sector.ListLayout.AbsoluteContentSize.Y + 18)
                tab.TabPage.CanvasSize = sector.Main.Size

                return dropdown
            end

            table.insert(sector.side:lower() == "left" and tab.SectorsLeft or tab.SectorsRight, sector)

            local size_left, size_right = #tab.SectorsLeft - 1, #tab.SectorsRight - 1
            local first_left, first_right = (#tab.SectorsLeft == 1), (#tab.SectorsRight == 1)
            game:GetService("RunService").RenderStepped:Connect(function()
                if sector.side:lower() == "right" then
                    tab.SectorsRight[size_right + 1].space = sector.Main.AbsoluteSize.Y + 11
                    sector.Main.Position = first_right and UDim2.new(0, window.size.X.Offset - sector.Main.AbsoluteSize.X - 11, 0, 12) or tab.SectorsRight[size_right].Main.Position + UDim2.fromOffset(0, tab.SectorsRight[size_right].space)
                else
                    tab.SectorsLeft[size_left + 1].space = sector.Main.AbsoluteSize.Y + 11
                    sector.Main.Position = first_left and UDim2.new(0, 11, 0, 11) or tab.SectorsLeft[size_left].Main.Position + UDim2.fromOffset(0, tab.SectorsLeft[size_left].space)
                end
            end)

            return sector
        end

        return tab
    end

    return window
end

return library
