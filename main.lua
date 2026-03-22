local Library = loadstring(game:HttpGet("https://githubusercontent.com"))()
local Window = Library.CreateLib("Brainrot Hub", "Midnight")

local Main = Window:NewTab("Main")
local Section = Main:NewSection("Player Mods")

Section:NewSlider("WalkSpeed", "Tempo", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("JumpPower", "Sprung", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

Section:NewButton("Anti-Ragdoll", "Nicht umfallen", function()
    local char = game.Players.LocalPlayer.Character
    if char:FindFirstChild("Ragdoll") then
        char.Ragdoll:Destroy()
    end
end)
