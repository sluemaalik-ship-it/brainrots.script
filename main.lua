local Library = loadstring(game:HttpGet('https://sirius.menu'))()

local Window = Library:CreateWindow({
   Name = "Brainrot Pro Hub",
   LoadingTitle = "Lade Stealer Scripts...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = {
      Enabled = false
   }
})

local Tab = Window:CreateTab("Main Hacks", 4483362458)

Tab:CreateSlider({
   Name = "WalkSpeed (Tempo)",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

Tab:CreateButton({
   Name = "Auto-Steal (E-Spam)",
   Callback = function()
      _G.AutoSteal = true
      while _G.AutoSteal do
         task.wait(0.1)
         for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("ProximityPrompt") then
               fireproximityprompt(v)
            end
         end
      end
   end,
})

Tab:CreateButton({
   Name = "Anti-Ragdoll",
   Callback = function()
      local char = game.Players.LocalPlayer.Character
      if char and char:FindFirstChild("Ragdoll") then
         char.Ragdoll:Destroy()
      end
   end,
})
