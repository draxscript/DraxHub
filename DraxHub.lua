-- Verificar se o dispositivo é mobile
local isMobile = game:GetService("UserInputService").TouchEnabled
if not isMobile then
    return -- Se não for mobile, o script não roda
end

-- Função para criar a interface
local function CreateWindow()
    local Window = Instance.new("ScreenGui")
    Window.Name = "DraxHub"

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 600)
    frame.Position = UDim2.new(0.5, -200, 0.5, -300)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.Parent = Window

    -- Função para mover a janela
    local dragging = false
    local dragStartPos = nil
    local framePos = nil

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStartPos = input.Position
            framePos = frame.Position
        end
    end)

    frame.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStartPos
            frame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- Título da janela
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "DraxHub | Dead Rails"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    title.Parent = frame

    -- Botão de minimizar
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 100, 0, 30)
    minimizeButton.Position = UDim2.new(1, -100, 0, 10)
    minimizeButton.Text = "Minimizar"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    minimizeButton.Parent = frame

    -- Ação de minimizar a janela
    minimizeButton.MouseButton1Click:Connect(function()
        frame.Visible = not frame.Visible
    end)

    -- Criar uma barra de opções para o menu
    local optionFrame = Instance.new("Frame")
    optionFrame.Size = UDim2.new(1, 0, 0, 50)
    optionFrame.Position = UDim2.new(0, 0, 0, 40)
    optionFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    optionFrame.Parent = frame

    -- Adicionar as opções de funções ao menu
    local function CreateOptionButton(name, position)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, 200, 0, 50)
        button.Position = position
        button.Text = name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        button.Parent = optionFrame

        button.MouseButton1Click:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char then
                char:MoveTo(position)
            end
        end)
    end

    -- Adicionar botões de teleporte
    CreateOptionButton("TP to End", Vector3.new(9999, 100, 9999))
    CreateOptionButton("TP to Castle", Vector3.new(100, 100, 100))
    CreateOptionButton("TP to TeslaLab", Vector3.new(200, 100, 200))

    -- Mostrar a janela no PlayerGui
    Window.Parent = game.Players.LocalPlayer.PlayerGui
end

-- Criar a interface quando o script for executado
CreateWindow()
