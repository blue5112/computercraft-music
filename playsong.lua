args = {...}
playfile = require("./lib/playfile")

local song = "/songs/" .. args[1]

if not args[2] then args[2] = 0.2 end
local vol = tonumber(args[2])

if not song:match('^(.*).dfpwm') then
    song = song .. ".dfpwm"
end

if not fs.exists(song) then
    local list = fs.list("/songs/")
    print("File not found.\n")
    sleep(2)
    print("Valid songs:")
    shell.run("dir","./songs/")
    return
end

shell.run("clear")
print("Playing " .. args[1])
playfile.play_dfpwm(song, vol)
