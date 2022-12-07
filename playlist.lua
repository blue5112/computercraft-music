args = {...}
shuffle = require("./lib/shuffle")
playfile = require("./lib/playfile")
location = "/songs/"
filelist = "/lists/" .. args[1] .. ".list"
if not filelist:match('(.*).list$') then
    filelist = filelist .. ".list"
end

if not args[2] then args[2] = 0.2 end
args[2] = tonumber(args[2])

if not fs.exists(filelist) then
    local list = fs.list("/lists/")
    print("Playlist not found.\n\nValid playlists:")
    shell.run("dir","./lists/")
    return
end

local file = fs.open(filelist, "r")
local list = {}

while true do
    local line = file.readLine()
    
    if not line then break end
    
    list[#list+1] = line
end
file.close()

for n=1, #list, 1 do
    --print(list[n])
    shell.run("clear")
    print("Playing " .. list[n])
    list[n] = location .. list[n]
    playfile.play_dfpwm(list[n],args[2])
end
