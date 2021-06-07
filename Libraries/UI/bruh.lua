
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/PikaHub/main/Libraries/UI/bruh.lua"))()

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
local window = library:CreateWindow("cuteware", Vector2.new(492, 598), Enum.KeyCode.RightShift)

local legit = window:CreateTab("Legit")
local rage = window:CreateTab("Rage")
local visuals = window:CreateTab("Visuals")
local misc = window:CreateTab("Misc")
local exploits = window:CreateTab("Exploits")
local settings = window:CreateTab("Settings")

local sector = legit:CreateSector("Aimbot", "left")
sector:AddToggle("Enabled", false, function() end)
sector:AddToggle("Aim Assist", false, function() end):AddKeybind(Enum.KeyCode.Space)
sector:AddToggle("Visible Only", false, function() end)
sector:AddToggle("Teammates", false, function() end)
sector:AddToggle("Magnet Triggerbot", false, function() end)
sector:AddToggle("Jump Check", false, function() end)
sector:AddToggle("Flash Check", false, function() end)
sector:AddKeybind("Triggerbot Keybind", Enum.KeyCode.LeftAlt)
sector:AddDropdown("Weapon", {"Rifles"}, "Rifles", function() end)

local sector = legit:CreateSector("Other", "left")
sector:AddToggle("Auto Pistol", false, function() end)

local sector = legit:CreateSector("Rifles", "right")
sector:AddToggle("Triggerbot", false, function() end)
sector:AddToggle("Body Aim", false, function() end)
sector:AddToggle("Silent Aim", false, function() end)
sector:AddSlider("Aim Assist FOV", 1, 1, 100, 1, function() end)
sector:AddSlider("Silent Aim FOV", 1, 1, 100, 1, function() end)
sector:AddSlider("Deadzone", 0, 0, 100, 1, function() end)
sector:AddSlider("Smoothness", 1, 1, 100, 1, function() end)
sector:AddSlider("Triggerbot Delay", 0, 0, 100, 1, function() end)

local hum = game.Players.LocalPlayer.Character.Humanoid
setreadonly(hum.MoveDirection, false)
hum.MoveDirection = Vector3.new(0, 10, 0)
