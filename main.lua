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
   TextLabel.Text = "your exploit doesn't support drawing ;-;"
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
23
TextLabel.BorderColor3 = Color3.fromRGB(68, 68, 68)
24
TextLabel.Position = UDim2.new(0.5, 0, 0, 0)
25
TextLabel.Size = UDim2.new(0, 5000, 0, 0)
26
TextLabel.ZIndex = 0
27
TextLabel.Font = Enum.Font.Code
28
TextLabel.Text = ""
29
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
30
TextLabel.TextSize = 14.000
31
TextLabel.TextStrokeTransparency = 0.000
32
​
33
TextLabel:TweenSize(UDim2.new(0, 5000, 0, 20), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 1, false)
34
wait(1.5)
35
TextLabel.Text = "checking exploit environment..."
36
if not Drawing then
37
   TextLabel.Text = "your exploit doesn't support drawing ;-;"
38
   return
39
end
40
wait(0.6)
41
TextLabel.Text = "loading framework..."
42
wait(0.6)
43
TextLabel.Text = "loading ui..."
44
wait(0.6)
45
TextLabel.Text = "loading config..."
46
wait(0.6)
47
TextLabel.Text = "finished <3 - pika hub"
48
wait(1.5)
49
​
50
if pikaloaded then return; end
51
pcall(function()
52
  getgenv().pikaloaded = true
53
  getgenv().tick = tick()
54
end)
55
​
56
local pika = {}
57
pika.games = {}
58
​
59
function pika:add(name, id)
60
  pika.games[tostring(id)] = {name = name, id = id}
61
end
62
​
63
--[[
64
pika:add("cbro", cbrogameid)
65
MAKE SURE THAT GITHUB FILE NAME IS THE NAME (first arg)
66
OR IT WONT WORK
67
--]]
68
​
69
pika:add("cbro", 301549746)
70
​
71
function pika:detect()
72
  if pika.games[tostring(game.PlaceId)] then
73
    print("detected game")
74
    local detectedgame = pika.games[tostring(game.PlaceId)]
75
    return detectedgame;
76
  else
77
    print("not supported")
78
    return;
79
  end
80
end
81
​
82
local detectedgame = pika:detect()
83
spawn(function()
84
  if detectedgame then
85
    print("detected game: ".. detectedgame.name)
86
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/PikaHub/main/Games/".. detectedgame.name ..".lua"))()
87
  end

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

TextLabel.Text = "loaded in " .. math.floor((tick() - getgenv().tick) * 10) / 10 .. " seconds."
wait(2)
TextLabel.Text = ""
TextLabel:TweenSize(UDim2.new(0, 5000, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 1, false)
wait(2)
TextLabel:Destroy()
