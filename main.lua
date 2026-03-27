-- ICE HUB LITE v2 (KEINE EXTERNEN LINKS)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedBtn = Instance.new("TextButton")
local JumpBtn = Instance.new("TextButton")
local StealBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.5, -100, 0.5, -90)
Frame.Size = UDim2.new(0, 200, 0, 180) -- Etwas größer für 3 Buttons
Frame.Active = true
Frame.Draggable = true

Title.Parent = Frame
Title.Text = "ICE HUB LITE"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
Title.TextColor3 = Color3.new(1, 1, 1)

-- 1. Speed Button
SpeedBtn.Parent = Frame
SpeedBtn.Text = "Speed Boost"
SpeedBtn.Position = UDim2.new(0, 10, 0, 40)
SpeedBtn.Size = UDim2.new(0, 180, 0, 35)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SpeedBtn.TextColor3 = Color3.new(1, 1, 1)
SpeedBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

-- 2. Jump Button
JumpBtn.Parent = Frame
JumpBtn.Text = "Jump Boost"
JumpBtn.Position = UDim2.new(0, 10, 0, 85)
JumpBtn.Size = UDim2.new(0, 180, 0, 35)
JumpBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
JumpBtn.TextColor3 = Color3.new(1, 1, 1)
JumpBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
end)

-- 3. Auto-Steal Button (NEU)
local stealing = false
StealBtn.Parent = Frame
StealBtn.Text = "Auto-Steal: AUS"
StealBtn.Position = UDim2.new(0, 10, 0, 130)
StealBtn.Size = UDim2.new(0, 180, 0, 35)
StealBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
StealBtn.TextColor3 = Color3.new(1, 1, 1)

StealBtn.MouseButton1Click:Connect(function()
    stealing = not stealing
    StealBtn.Text = stealing and "Auto-Steal: AN" or "Auto-Steal: AUS"
    StealBtn.BackgroundColor3 = stealing and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(45, 45, 45)
    
    if stealing then
        spawn(function()
            while stealing do
                task.wait(0.5)
                for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        local char = game.Players.LocalPlayer.Character
                        if char and (char.HumanoidRootPart.Position - v.Parent.Position).Magnitude < 20 then
                            fireproximityprompt(v)
                        end
                    end
                end
            end
        end)
    end
end)
