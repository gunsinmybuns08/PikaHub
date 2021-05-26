--[[
██████╗ ██╗██╗  ██╗ █████╗     ██╗  ██╗██╗   ██╗██████╗ 
██╔══██╗██║██║ ██╔╝██╔══██╗    ██║  ██║██║   ██║██╔══██╗
██████╔╝██║█████╔╝ ███████║    ███████║██║   ██║██████╔╝
██╔═══╝ ██║██╔═██╗ ██╔══██║    ██╔══██║██║   ██║██╔══██╗
██║     ██║██║  ██╗██║  ██║    ██║  ██║╚██████╔╝██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
--]]

local loader = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

loader.Name = "loader"
loader.Parent = game.CoreGui
loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if syn then
   syn.protect_gui(loader)
end

TextLabel.Parent = decodeisgay
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
wait(0.6)
TextLabel.Text = "loading framework..."
wait(0.6)
TextLabel.Text = "loading ui..."
wait(0.6)
TextLabel.Text = "loading config..."
wait(0.6)
TextLabel.Text = "finished <3 - pika hub"
wait(1.5)
TextLabel.Text = ""
TextLabel:TweenSize(UDim2.new(0, 5000, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 1, false)
wait(2)
TextLabel:Destroy()

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
