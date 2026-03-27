local OrionLib = loadstring(game:HttpGet(('https://githubusercontent.com')))()

local Window = OrionLib:MakeWindow({
    Name = "Ice Hub v2 | Steal a Brainrot", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "IceHubConfig"
})

-- "Stealer" Tab (wie in deinem Screenshot)
local StealerTab = Window:MakeTab({
    Name = "Stealer",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

StealerTab:AddToggle({
    Name = "Auto Steal UI",
    Default = false,
    Callback = function(Value)
        _G.AutoSteal = Value
        while _G.AutoSteal do
            task.wait(0.5)
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        -- Prüft Distanz, damit es nicht laggt (Radius 15)
                        local dist = (char.HumanoidRootPart.Position - v.Parent.Position).Magnitude
                        if dist < 15 then
                            fireproximityprompt(v)
                        end
                    end
                end
            end
        end
    end    
})

-- "Main" Tab für Speed & Jump
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 500,
    Default = 16,
    Color = Color3.fromRGB(80, 120, 255),
    Increment = 1,
    ValueName = "Tempo",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end    
})

MainTab:AddButton({
    Name = "Anti-Ragdoll",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Ragdoll") then
            char.Ragdoll:Destroy()
        end
    end
})

OrionLib:Init()
