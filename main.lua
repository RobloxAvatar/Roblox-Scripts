_G.start = tick()

function loadSettings()
    local httpService = game:GetService("HttpService")
    if (readfile and isfile and isfile("tapping-simulator-settings.txt")) then
        _G.Settings = httpService:JSONDecode(readfile("tapping-simulator-settings.txt"))
    end
end

function saveSettings()
    local json
    local httpService = game:GetService("HttpService")

    if writefile then
        json = httpService:JSONEncode(_G.Settings)
        writefile("tapping-simulator-settings.txt", json)
        if (isfile and isfile("tapping-simulator-settings.txt")) then
            print("settings are successfully saved!") 
        end
    else
        warn("Your exploit doesn't support writefile your settings can not be saved!")
    end
end

if (isfile and isfile("tapping-simulator-settings.txt")) then
    if (readfile) then
        if _G.Settings ~= readfile("tapping-simulator-settings.txt") then
            saveSettings()
        else
            if _G.Settings == readfile("tapping-simulator-settings.txt") then
                loadSettings()
            end
        end
    end
end

while true do wait()
    if _G.Settings["autoPlaying"] == true and game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Lights.TextLabel.Text == "Green Light" then
        game:GetService("Players").LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(-581.118, 4.09381, 287.879))
        game:GetService("Players").LocalPlayer.Character.UpperTorso.Anchored = false
    else
        if autoPlaying == true and game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Lights.TextLabel.Text == "Red Light" then
            game:GetService("Players").LocalPlayer.Character.UpperTorso.Anchored = true
        end
    else
        if _G.Settings["autoPlaying"] == false then
            game:GetService("Players").LocalPlayer.Character.UpperTorso.Anchored = true
            wait(0.1)
            game:GetService("Players").LocalPlayer.Character.UpperTorso.Anchored = false
        end
    end
end

print(string.format("Successfully loaded in %.3f seconds", (tick()) - _G.start))
