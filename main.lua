local _gamelists = {
    Cbro = 301549746
}

for i,v in pairs(_gamelists) do
  if game.PlaceId == v then
     loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/PikaHub/main/Hentai/" .. i .. ".lua"))()
  end
end
