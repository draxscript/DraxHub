local isMobile = game:GetService("UserInputService").TouchEnabled
if not isMobile then
    return -- Se não for mobile, o script não roda
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
    Name = "DraxHub | Dead Rails",
    LoadingTitle = "Iniciando DraxHub...",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false,
    Size = Vector2.new(400, 600)
})

local Hub = Window:CreateTab("DraxHub", 4483362458)

Hub:CreateSection("Teleportes")

local teleports = {
   ["TP to End"] = Vector3.new(9999, 100, 9999),
   ["TP to Castle"] = Vector3.new(100, 100, 100),
   ["TP to TeslaLab"] = Vector3.new(200, 100, 200),
   ["TP to Sterling"] = Vector3.new(300, 100, 300),
   ["TP to Fort"] = Vector3.new(400, 100, 400),
   ["TP to Train"] = Vector3.new(0, 100, 0)
}

for name, pos in pairs(teleports) do
   Hub:CreateButton({
      Name = name,
      Callback = function()
         local char = game.Players.LocalPlayer.Character
         if char then char:MoveTo(pos) end
      end
   })
end

Hub:CreateSection("Auras & Coleta")

Hub:CreateToggle({
   Name = "Gun Aura (Kill Mobs)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().GunAura = Value
      while getgenv().GunAura do
         for _, mob in pairs(workspace:GetDescendants()) do
            if mob.Name == "Mob" and mob:FindFirstChild("Humanoid") then
               mob.Humanoid.Health = 0
            end
         end
         task.wait(1)
      end
   end
})

Hub:CreateButton({
   Name = "Collect Bond & Ammo",
   Callback = function()
      for _,v in pairs(workspace:GetDescendants()) do
         if v:IsA("TouchTransmitter") and v.Parent then
            pcall(function()
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
            end)
         end
      end
   end
})

Hub:CreateSection("Visual")

Hub:CreateToggle({
   Name = "Items ESP",
   CurrentValue = false,
   Callback = function(v) end
})

Hub:CreateToggle({
   Name = "Mobs ESP",
   CurrentValue = false,
   Callback = function(v) end
})

Hub:CreateButton({
   Name = "UnlockCam",
   Callback = function()
      game.Players.LocalPlayer.CameraMaxZoomDistance = 1000
   end
})

Hub:CreateButton({
   Name = "FullBright",
   Callback = function()
      local light = game:GetService("Lighting")
      light.Brightness = 2
      light.ClockTime = 14
      light.FogEnd = 100000
      light.GlobalShadows = false
   end
})

Hub:CreateSection("Modificadores")

Hub:CreateButton({
   Name = "Inf Jump",
   Callback = function()
      local UIS = game:GetService("UserInputService")
      UIS.JumpRequest:Connect(function()
         game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
      end)
   end
})

Hub:CreateToggle({
   Name = "Walk Speed",
   CurrentValue = false,
   Callback = function(v)
      local h = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
      if h then
         h.WalkSpeed = v and 50 or 16
      end
   end
})
