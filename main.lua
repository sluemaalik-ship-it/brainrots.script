-- ICE HUB LITE v3 (STABILER AUTO-STEAL)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedBtn = Instance.new("TextButton")
local JumpBtn = Instance.new("TextButton")
local StealBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.5, -100, 0.5, -90)
Frame.Size = UDim2.new(0, 200, 0, 180)
Frame.Active = true
Frame.Draggable = true

Title.Parent = Frame
Title.Text = "ICE HUB LITE"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
Title.TextColor3 = Color3.new(1, 1, 1)

-- Buttons Setup (Speed & Jump)
local function setupBtn(btn, text, pos, func)
    btn.Parent = Frame
    btn.Text = text
    btn.Position = pos
    btn.Size = UDim2.new(0, 180, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.MouseButton1Click:Connect(func)
end

setupBtn(SpeedBtn, "Speed Boost", UDim2.new(0, 10, 0, 40), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

setupBtn(JumpBtn, "Jump Boost", UDim2.new(0, 10, 0, 85), function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
end)

-- 3. Auto-Steal Logik (Verbessert)
local stealing = false
setupBtn(StealBtn, "Auto-Steal: AUS", UDim2.new(0, 10, 0, 130), function()
    stealing = not stealing
    StealBtn.Text = stealing and "Auto-Steal: AN" or "Auto-Steal: AUS"
    StealBtn.BackgroundColor3 = stealing and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(40, 40, 40)
    
    if stealing then
        task.spawn(function()
            while stealing do
                task.wait(0.2) -- Schnellerer Intervall
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    for _, v in pairs(game.Workspace:GetDescendants()) do
                        if v:IsA("ProximityPrompt") then
                            -- Prüft, ob du nah genug am Item bist (Radius 20)
                            local dist = (char.HumanoidRootPart.Position - v.Parent.Position).Magnitude
                            if dist < 20 then
                                fireproximityprompt(v)
                            end
                        end
                    end
                end
            end
        end)
    end
end)
