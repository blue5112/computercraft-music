local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")

local function play_dfpwm(file, volume)
    if not file:match('^(.*).dfpwm') then
        file = file .. ".dfpwm"
    end
    local decoder = dfpwm.make_decoder()
    for chunk in io.lines(file, 16 * 1024) do
        local buffer = decoder(chunk)

        while not speaker.playAudio(buffer, volume) do
            os.pullEvent("speaker_audio_empty")
        end
    end
end

return { play_dfpwm = play_dfpwm }
