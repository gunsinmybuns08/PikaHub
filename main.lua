--[[
pika loader
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
