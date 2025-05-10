-- Verificar se o dispositivo é mobile
local isMobile = game:GetService("UserInputService").TouchEnabled
if not isMobile then
    return -- Se não for mobile, o script não roda
end

-- Função para criar a interface
local function CreateWindow()
    local Window = Instance.new("ScreenGui")
    Window.Name = "DraxHub"
    Window.Parent = game.Players.LocalPlayer.PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 600)
    frame.Position = UDim2.new(0.5, -200, 0.5, -300)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.Parent = Window
    frame.AnchorPoint = Vector2.new(0.5, 0.5)

    -- Criando o título
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "DraxHub | Dead Rails"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    title.Parent = frame

    -- Função para arrastar a janela
    local dragging = false
    local dragInput, dragStart, startPos

    title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)

    title.InputChanged:Connect(function(input)
        if dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    title.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- Botão de minimizar
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 40, 0, 40)
    minimizeButton.Position = UDim2.new(1, -40, 0, 0)
    minimizeButton.Text = "_"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    minimizeButton.Parent = frame

    -- Função de minimizar
    local isMinimized = false
    minimizeButton.MouseButton1Click:Connect(function()
        if isMinimized then
            frame.Size = UDim2.new(0, 400, 0, 600)
            isMinimized = false
        else
            frame.Size = UDim2.new(0, 400, 0, 40)
            isMinimized = true
        end
    end)

    return frame
end

-- Criar a interface quando o script for executado
local frame = CreateWindow()

-- Função para criar os botões de teleporte
local function CreateTeleportButton(name, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0.5, 50)  -- Ajustei a posição para que os botões não sobreponham
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        local char = game.Players.LocalPlayer.Character
        if char then
            char:MoveTo(position)
        end
    end)
end

-- Adicionar botões de teleporte
CreateTeleportButton("TP to End", Vector3.new(9999, 100, 9999))
CreateTeleportButton("TP to Castle", Vector3.new(100, 100, 100))
CreateTeleportButton("TP to TeslaLab", Vector3.new(200, 100, 200))
CreateTeleportButton("TP to Sterling", Vector3.new(300, 100, 300))
CreateTeleportButton("TP to Fort", Vector3.new(400, 100, 400))
CreateTeleportButton("TP to Train", Vector3.new(0, 100, 0))
