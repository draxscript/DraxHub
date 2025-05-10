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

    -- Criar frame do menu
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 600)
    frame.Position = UDim2.new(0.5, -200, 0.5, -300)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
    frame.Parent = Window

    -- Criar título
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "DraxHub | Dead Rails"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextScaled = true
    title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    title.Parent = frame

    -- Variáveis para movimentação
    local dragging = false
    local dragInput, dragStart, startPos

    -- Função para mover o menu
    local function OnDragStart(input)
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end

    local function OnDragEnd()
        dragging = false
    end

    local function OnDrag(input)
        if dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end

    -- Habilitar movimentação
    title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            OnDragStart(input)
        end
    end)

    title.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            OnDragEnd()
        end
    end)

    -- Funcionalidade do botão minimizar
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 40, 0, 40)
    minimizeButton.Position = UDim2.new(1, -50, 0, 0)
    minimizeButton.Text = "_"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.TextScaled = true
    minimizeButton.Parent = frame

    local minimized = false
    minimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            frame.Size = UDim2.new(0, 400, 0, 40) -- Minimizar
            frame.Position = UDim2.new(0.5, -200, 0.5, -300)
            minimizeButton.Text = "+"
        else
            frame.Size = UDim2.new(0, 400, 0, 600) -- Restaurar
            minimizeButton.Text = "_"
        end
    end)

    -- Função para criar botões
    local function CreateButton(name, position)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, 200, 0, 50)
        button.Text = name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.BorderSizePixel = 2
        button.BorderColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
        button.TextScaled = true
        button.Parent = frame

        button.MouseButton1Click:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char then
                -- Garantir que o personagem não esteja se movendo
                if not char:FindFirstChild("HumanoidRootPart") then return end
                local hrp = char.HumanoidRootPart
                
                -- Verificar se o personagem já chegou na posição (previne teleport contínuo)
                if (hrp.Position - position).Magnitude < 5 then
                    return
                end

                -- Criar tween para movimentar suavemente
                local tweenService = game:GetService("TweenService")
                local goal = {Position = position}
                local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                local tween = tweenService:Create(hrp, tweenInfo, goal)
                
                -- Iniciar o movimento
                tween:Play()

                -- Aguardar o movimento terminar
                tween.Completed:Connect(function()
                    print("Teleportação concluída!")
                end)
            end
        end)
    end

    -- Adicionar botões de teleporte
    CreateButton("TP to End", Vector3.new(9999, 100, 9999))
    CreateButton("TP to Castle", Vector3.new(100, 100, 100))
    CreateButton("TP to TeslaLab", Vector3.new(200, 100, 200))
    CreateButton("TP to Area 51", Vector3.new(300, 100, 300))  -- Exemplo de outro local
    CreateButton("TP to Secret Base", Vector3.new(400, 100, 400))  -- Exemplo de outro local
    CreateButton("TP to Mountain", Vector3.new(500, 100, 500))  -- Exemplo de outro local
end

-- Criar a interface quando o script for executado
CreateWindow()
