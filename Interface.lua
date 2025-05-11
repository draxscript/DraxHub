local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "DraxHub"
ScreenGui.ResetOnSpawn = false

-- Criando o frame da interface
local frame = Instance.new("Frame")
frame.Parent = ScreenGui
frame.Size = UDim2.new(0, 300, 0, 400)  -- Tamanho do menu
frame.Position = UDim2.new(0, 50, 0, 50)  -- Posição da interface
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Cor de fundo (dark mode)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Criando o título do menu
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "DraxHub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.Font = Enum.Font.GothamBold  -- Fonte bonita
title.TextStrokeTransparency = 0.6  -- Sombra do texto
title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)  -- Cor da sombra
title.TextShadow = true  -- Ativar sombra
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.BorderSizePixel = 0

-- Criando o botão de minimizar
local minimizeButton = Instance.new("TextButton")
minimizeButton.Parent = frame
minimizeButton.Size = UDim2.new(0, 40, 0, 40)
minimizeButton.Position = UDim2.new(1, -40, 0, 0)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizeButton.BorderSizePixel = 0
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextStrokeTransparency = 0.6
minimizeButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Criando o botão de fechar
local closeButton = Instance.new("TextButton")
closeButton.Parent = frame
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -80, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Font = Enum.Font.GothamBold
closeButton.TextStrokeTransparency = 0.6
closeButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Função para minimizar
minimizeButton.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- Função para fechar
closeButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Criando as abas
local tabContainer = Instance.new("Frame")
tabContainer.Parent = frame
tabContainer.Size = UDim2.new(1, 0, 0, 50)
tabContainer.Position = UDim2.new(0, 0, 0, 40)
tabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabContainer.BorderSizePixel = 0

-- Aba de Teleporte
local teleportTab = Instance.new("TextButton")
teleportTab.Parent = tabContainer
teleportTab.Size = UDim2.new(0, 100, 1, 0)
teleportTab.Text = "Teleport"
teleportTab.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportTab.BorderSizePixel = 0
teleportTab.Font = Enum.Font.GothamBold
teleportTab.TextStrokeTransparency = 0.6
teleportTab.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Aba de ESP
local espTab = Instance.new("TextButton")
espTab.Parent = tabContainer
espTab.Size = UDim2.new(0, 100, 1, 0)
espTab.Position = UDim2.new(0, 100, 0, 0)
espTab.Text = "ESP"
espTab.TextColor3 = Color3.fromRGB(255, 255, 255)
espTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espTab.BorderSizePixel = 0
espTab.Font = Enum.Font.GothamBold
espTab.TextStrokeTransparency = 0.6
espTab.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Aba Principal
local mainTab = Instance.new("TextButton")
mainTab.Parent = tabContainer
mainTab.Size = UDim2.new(0, 100, 1, 0)
mainTab.Position = UDim2.new(0, 200, 0, 0)
mainTab.Text = "Main"
mainTab.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainTab.BorderSizePixel = 0
mainTab.Font = Enum.Font.GothamBold
mainTab.TextStrokeTransparency = 0.6
mainTab.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Criando a aba DraxScript para o link do Discord
local draxScriptTab = Instance.new("TextButton")
draxScriptTab.Parent = tabContainer
draxScriptTab.Size = UDim2.new(0, 100, 1, 0)
draxScriptTab.Position = UDim2.new(0, 300, 0, 0)
draxScriptTab.Text = "DraxScript"
draxScriptTab.TextColor3 = Color3.fromRGB(255, 255, 255)
draxScriptTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
draxScriptTab.BorderSizePixel = 0
draxScriptTab.Font = Enum.Font.GothamBold
draxScriptTab.TextStrokeTransparency = 0.6
draxScriptTab.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Função do botão DraxScript (link para o Discord)
draxScriptTab.MouseButton1Click:Connect(function()
    local discordLink = "https://discord.gg/seu-link"  -- Substitua com o link do seu Discord
    setclipboard(discordLink)  -- Copia o link para a área de transferência
    print("Link do Discord copiado: " .. discordLink)
end)
