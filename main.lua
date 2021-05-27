--[[
██████╗ ██╗██╗  ██╗ █████╗     ██╗  ██╗██╗   ██╗██████╗ 
██╔══██╗██║██║ ██╔╝██╔══██╗    ██║  ██║██║   ██║██╔══██╗
██████╔╝██║█████╔╝ ███████║    ███████║██║   ██║██████╔╝
██╔═══╝ ██║██╔═██╗ ██╔══██║    ██╔══██║██║   ██║██╔══██╗
██║     ██║██║  ██╗██║  ██║    ██║  ██║╚██████╔╝██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
--]]

getgenv().start_tick = tick()

pcall(function()
    if not isfile("Name.Pika") then
    local GetName = ""
    
    local NewUser = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local Username = Instance.new("TextBox")
    local UICorner = Instance.new("UICorner")
    local Logo = Instance.new("ImageLabel")
    
    NewUser.Name = "NewUser"
    NewUser.Parent = game.CoreGui
    NewUser.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    syn.protect_gui(NewUser)
    
    Main.Name = "Main"
    Main.Parent = NewUser
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 2000, 0, 0)
    Main.BackgroundTransparency = 1
    
    Username.Name = "Username"
    Username.Parent = Main
    Username.AnchorPoint = Vector2.new(0.5, 0.5)
    Username.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Username.BackgroundTransparency = 1
    Username.BorderColor3 = Color3.fromRGB(66, 66, 66)
    Username.BorderSizePixel = 0
    Username.Position = UDim2.new(0.5, 0, 0.5, 0)
    Username.Size = UDim2.new(0, 470, 0, 28)
    Username.Font = Enum.Font.SourceSans
    Username.PlaceholderText = ""
    Username.Text = ""
    Username.TextColor3 = Color3.fromRGB(255, 255, 255)
    Username.TextSize = 18.000
    
    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Username
    
    Logo.Name = "Logo"
    Logo.Parent = Main
    Logo.AnchorPoint = Vector2.new(0.5, 0.5)
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.Position = UDim2.new(0.5, 0, 0.455, 0)
    Logo.Size = UDim2.new(0, 150, 0, 150)
    Logo.Image = "http://www.roblox.com/asset/?id=6870866525"
    Logo.ZIndex = 2
    
    Main:TweenSize(UDim2.new(0, 2000, 0, 2000), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 1, false)
    wait(1)
    game:GetService("TweenService"):Create(Main, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
    wait(1)
    game:GetService("TweenService"):Create(Username, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
    wait(1)
    Username.PlaceholderText = "Since you're new user, please enter your username."
    wait(.2)
    Username.FocusLost:Connect(function(enterPressed)
        if enterPressed then
    		if Username.Text ~= "" then
    		    game:GetService("TweenService"):Create(Username, TweenInfo.new(1), {TextColor3 = Color3.fromRGB(0,250,154)}):Play()
    		    wait(.5)
    		    GetName = Username.Text
    		    wait(1)
    			writefile("Name.Pika", game:GetService("HttpService"):JSONEncode(GetName))
    			game:GetService("TweenService"):Create(Username, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    			game:GetService("TweenService"):Create(Logo, TweenInfo.new(1), {ImageTransparency = 1}):Play()
    			Username.Text = ""
    			Username.PlaceholderText = ""
    			wait(1.2)
    			game:GetService("TweenService"):Create(Main, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    			wait(1)
    			NewUser:Destroy()
    		end
        end
    end)
    
    game:GetService("UserInputService").InputBegan:connect(onKeyPress)
else
    local GetName = game:GetService("HttpService"):JSONDecode(readfile("Name.Pika"))
    
    local NewUser = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local Username = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")
    local Logo = Instance.new("ImageLabel")
    
    NewUser.Name = "NewUser"
    NewUser.Parent = game.CoreGui
    NewUser.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    syn.protect_gui(NewUser)
    
    Main.Name = "Main"
    Main.Parent = NewUser
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 2000, 0, 0)
    Main.BackgroundTransparency = 1
    
    Username.Name = "Username"
    Username.Parent = Main
    Username.AnchorPoint = Vector2.new(0.5, 0.5)
    Username.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Username.BackgroundTransparency = 1
    Username.BorderColor3 = Color3.fromRGB(66, 66, 66)
    Username.BorderSizePixel = 0
    Username.Position = UDim2.new(0.5, 0, 0.5, 0)
    Username.Size = UDim2.new(0, 470, 0, 28)
    Username.Font = Enum.Font.SourceSans
    Username.Text = ""
    Username.TextColor3 = Color3.fromRGB(255, 255, 255)
    Username.TextSize = 22.000
    
    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Username
    
    Logo.Name = "Logo"
    Logo.Parent = Main
    Logo.AnchorPoint = Vector2.new(0.5, 0.5)
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.Position = UDim2.new(0.5, 0, 0.455, 0)
    Logo.Size = UDim2.new(0, 150, 0, 150)
    Logo.Image = "http://www.roblox.com/asset/?id=6870866525"
    Logo.ZIndex = 2
    
    Main:TweenSize(UDim2.new(0, 2000, 0, 2000), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 1, false)
    wait(1)
    game:GetService("TweenService"):Create(Main, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
    wait(1)
    game:GetService("TweenService"):Create(Username, TweenInfo.new(1), {TextColor3 = Color3.fromRGB(0,250,154)}):Play()
    wait(.5)
    Username.Text = "Hi " .. GetName .. ", welcome back to pikasense"
    wait(1)
    game:GetService("TweenService"):Create(Username, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    Username.Text = ""
	game:GetService("TweenService"):Create(Logo, TweenInfo.new(1), {ImageTransparency = 1}):Play()
	wait(1.2)
	game:GetService("TweenService"):Create(Main, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
	wait(3)
	NewUser:Destroy()
end
end)

local loader = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

loader.Name = "loader"
loader.Parent = game.CoreGui
loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if syn then
   syn.protect_gui(loader)
end

TextLabel.Parent = loader
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
TextLabel.BorderColor3 = Color3.fromRGB(68, 68, 68)
TextLabel.Position = UDim2.new(0.5, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 5000, 0, 0)
TextLabel.ZIndex = 0
TextLabel.Font = Enum.Font.Code
TextLabel.Text = ""
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextStrokeTransparency = 0.000

TextLabel:TweenSize(UDim2.new(0, 5000, 0, 20), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 1, false)
wait(1.5)
TextLabel.Text = "checking exploit environment..."
if not Drawing then
   TextLabel.Text = "your exploti doesn't support drawing ;-;"
   return
end
wait(0.6)
TextLabel.Text = "loading framework..."
wait(0.6)
TextLabel.Text = "loading ui..."
wait(0.6)
TextLabel.Text = "loading config..."
wait(0.6)
TextLabel.Text = "finished <3 - pika hub"
wait(1.5)

if pikaloaded then return; end
pcall(function()
  getgenv().pikaloaded = true
  getgenv().tick = tick()
end)

local pika = {}
pika.games = {}

function pika:add(name, id)
  pika.games[tostring(id)] = {name = name, id = id}
end

--[[
pika:add("cbro", cbrogameid)
MAKE SURE THAT GITHUB FILE NAME IS THE NAME (first arg)
OR IT WONT WORK
--]]

pika:add("cbro", 301549746)

function pika:detect()
  if pika.games[tostring(game.PlaceId)] then
    print("detected game")
    local detectedgame = pika.games[tostring(game.PlaceId)]
    return detectedgame;
  else
    print("not supported")
    return;
  end
end

local detectedgame = pika:detect()
spawn(function()
  if detectedgame then
    print("detected game: ".. detectedgame.name)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/PikaHub/main/Games/".. detectedgame.name ..".lua"))()
  end
end)

TextLabel.Text = "loaded in " .. math.floor((tick() - getgenv().start_tick) * 10) / 10 .. " seconds."
wait(2)
TextLabel.Text = ""
TextLabel:TweenSize(UDim2.new(0, 5000, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 1, false)
wait(2)
TextLabel:Destroy()
