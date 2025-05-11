local ScreenGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("DraxHub")
local frame = ScreenGui:WaitForChild("Frame")
local teleportTab = frame:WaitForChild("TeleportTab")
local espTab = frame:WaitForChild("ESPTab")
local mainTab = frame:WaitForChild("MainTab")
local draxScriptTab = frame:WaitForChild("DraxScriptTab")

local espEnabled = false  -- Variável para controlar o estado do ESP

-- Função de Teleporte usando Raycasting
local function teleportPlayer(location)
    local player = game.Players.LocalPlayer
    if player and player.Character then
        -- Verificação básica para garantir que a posição de teleporte é válida
        if location and location.Position then
            -- Utiliza o Raycasting para verificar se o local é válido
            local ray = Ray.new(player.Character.PrimaryPart.Position, location.Position - player.Character.PrimaryPart.Position)
            local hit, position = workspace:FindPartOnRay(ray, player.Character)

            if hit then
                -- Realiza o teleporte apenas se a posição for válida
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

-- Função para ativar/desativar ESP com Raycasting
local function toggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        print("ESP ativado")
        -- Realiza Raycasting para destacar jogadores e objetos visíveis
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                -- Utiliza Raycasting com verificação de visibilidade
                local ray = Ray.new(workspace.CurrentCamera.CFrame.Position, player.Character.HumanoidRootPart.Position - workspace.CurrentCamera.CFrame.Position)
                local hit, position = workspace:FindPartOnRay(ray, game.Players.LocalPlayer.Character)

                if hit then
                    -- Cria um destaque no jogador (como um Box ou Highlight)
                    if not player.Character:FindFirstChild("ESP") then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.Adornee = player.Character
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)  -- Cor do destaque (vermelho)
                        highlight.FillTransparency = 0.5
                        highlight.OutlineColor = Color3.fromRGB(0, 0, 0)  -- Cor da borda
                        highlight.OutlineTransparency = 0
                        highlight.Name = "ESP"
                    end
                end
            end
        end
    else
        print("ESP desativado")
        -- Remove os destaques
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Highlight") then
                player.Character.Highlight:Destroy()
            end
        end
    end
end

-- Função principal (onde você pode adicionar suas funcionalidades principais)
local function mainFunction()
    -- Exemplo de ação principal
    print("Função principal chamada")
end

-- Função do botão DraxScript (link para o Discord)
draxScriptTab.MouseButton1Click:Connect(function()
    local discordLink = "https://discord.gg/seu-link"  -- Substitua com o link do seu Discord
    setclipboard(discordLink)  -- Copia o link para a área de transferência
    print("Link do Discord copiado: " .. discordLink)
end)

-- Função do botão Teleport
teleportTab.MouseButton1Click:Connect(function()
    -- Exemplo de teleporte para uma coordenada arbitrária (ajuste conforme necessário)
    local location = CFrame.new(0, 100, 0)  -- Coordenada de exemplo
    teleportPlayer(location)
end)

-- Função do botão ESP
espTab.MouseButton1Click:Connect(function()
    toggleESP()
end)

-- Função do botão Principal
mainTab.MouseButton1Click:Connect(function()
    mainFunction()
end)
