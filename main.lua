local Library = loadstring(game:HttpGet("https://githubusercontent.com"))()
local Window = Library.CreateLib("Brainrot Stealer Hub", "Midnight")

-- Haupt-Tab
local Main = Window:NewTab("Main")
local Section = Main:NewSection("Spieler Mods")

-- Speed Hack (Wichtig, um Diebe einzuholen oder schnell zu flüchten)
Section:NewSlider("WalkSpeed", "Ändere dein Tempo", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

-- Jump Hack
Section:NewSlider("JumpPower", "Springe höher", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- Anti-Ragdoll / Anti-Fall (Verhindert, dass du hinfällst)
Section:NewButton("Anti-Ragdoll", "Du fällst nicht mehr hin", function()
    local char = game.Players.LocalPlayer.Character
    if char:FindFirstChild("Ragdoll") then
        char.Ragdoll:Destroy()
    end
end)

-- Teleport Tab
local TP = Window:NewTab("Teleports")
local TPSection = TP:NewSection("Basen")

TPSection:NewButton("Teleport zur Mitte", "Bringt dich zum Spawner", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) -- Koordinaten müssten ggf. angepasst werden
end)
