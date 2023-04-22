args = {...}
shuffle = require("./lib/shuffle")
playfile = require("./lib/playfile")
location = "/songs/"

if not args[1] then args[1] = 0.2 end
args[1] = tonumber(args[1])

local list = fs.list("songs")
shuffle.shuffleInPlace(list)

for n=1, #list, 1 do
    --print(list[n])
    shell.run("clear")
    print("Playing " .. list[n])
    list[n] = location .. list[n]
    playfile.play_dfpwm(list[n],args[1])
end
