-- Código da Interface

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DraxHub"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Name = "Frame"
frame.Size = UDim2.new(0, 400, 0, 500)
frame.Position = UDim2.new(0.5, -200, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = ScreenGui

-- Botões para cada aba
local teleportTab = Instance.new("TextButton")
teleportTab.Size = UDim2.new(0, 150, 0, 50)
teleportTab.Position = UDim2.new(0, 0, 0, 0)
teleportTab.Text = "Teleporte"
teleportTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportTab.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportTab.Parent = frame

local espTab = Instance.new("TextButton")
espTab.Size = UDim2.new(0, 150, 0, 50)
espTab.Position = UDim2.new(0, 0, 0, 60)
espTab.Text = "ESP"
espTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espTab.TextColor3 = Color3.fromRGB(255, 255, 255)
espTab.Parent = frame

local mainTab = Instance.new("TextButton")
mainTab.Size = UDim2.new(0, 150, 0, 50)
mainTab.Position = UDim2.new(0, 0, 0, 120)
mainTab.Text = "Main"
mainTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainTab.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTab.Parent = frame

local draxScriptTab = Instance.new("TextButton")
draxScriptTab.Size = UDim2.new(0, 150, 0, 50)
draxScriptTab.Position = UDim2.new(0, 0, 0, 180)
draxScriptTab.Text = "DraxScript"
draxScriptTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
draxScriptTab.TextColor3 = Color3.fromRGB(255, 255, 255)
draxScriptTab.Parent = frame

-- Funções de Teleporte e ESP
local espEnabled = false

-- Função de Teleporte
local function teleportPlayer(location)
    local player = game.Players.LocalPlayer
    if player and player.Character then
        if location and location.Position then
            local ray = Ray.new(player.Character.PrimaryPart.Position, location.Position - player.Character.PrimaryPart.Position)
            local hit, position = workspace:FindPartOnRay(ray, player.Character)

            if hit then
                player.Character:SetPrimaryPartCFrame(CFrame.new(position))
                print("Jogador teleportado para: " .. tostring(position))
            else
                print("Não foi possível encontrar um local válido para o teleporte!")
            end
        else
            print("Local de teleporte inválido!")
        end
    end
end

-- Função para ativar/desativar ESP
local function toggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        print("ESP ativado")
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local ray = Ray.new(workspace.CurrentCamera.CFrame.Position, player.Character.HumanoidRootPart.Position - workspace.CurrentCamera.CFrame.Position)
                local hit, position = workspace:FindPartOnRay(ray, game.Players.LocalPlayer.Character)

                if hit then
                    if not player.Character:FindFirstChild("ESP") then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.Adornee = player.Character
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.FillTransparency = 0.5
                        highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
                        highlight.OutlineTransparency = 0
                        highlight.Name = "ESP"
                    end
                end
            end
        end
    else
        print("ESP desativado")
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Highlight") then
                player.Character.Highlight:Destroy()
            end
        end
    end
end

-- Função do botão DraxScript (Discord)
draxScriptTab.MouseButton1Click:Connect(function()
    local discordLink = "https://discord.gg/seu-link"  -- Substitua com o link do seu Discord
    setclipboard(discordLink)  -- Copia o link para a área de transferência
    print("Link do Discord copiado: " .. discordLink)
end)

-- Função do botão Teleport
teleportTab.MouseButton1Click:Connect(function()
    local location = CFrame.new(0, 100, 0)  -- Coordenada de exemplo
    teleportPlayer(location)
end)

-- Função do botão ESP
espTab.MouseButton1Click:Connect(function()
    toggleESP()
end)

-- Função do botão Principal
mainTab.MouseButton1Click:Connect(function()
    print("Função principal chamada")
end)
]]


-- Agora, o código abaixo executa a parte do script
loadstring(code)()
