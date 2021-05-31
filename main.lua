--[[
██████╗ ██╗██╗  ██╗ █████╗     ██╗  ██╗██╗   ██╗██████╗ 
██╔══██╗██║██║ ██╔╝██╔══██╗    ██║  ██║██║   ██║██╔══██╗
██████╔╝██║█████╔╝ ███████║    ███████║██║   ██║██████╔╝
██╔═══╝ ██║██╔═██╗ ██╔══██║    ██╔══██║██║   ██║██╔══██╗
██║     ██║██║  ██╗██║  ██║    ██║  ██║╚██████╔╝██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
--]]

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
pika:add("cbro unrank", 1480424328)
pika:add("mortem", 4169490976)
pika:add("arsenal", 286090429)
pika:add("propiece", 6672265834)

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
