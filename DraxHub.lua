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

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "DraxHub | Dead Rails"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    title.Parent = frame

    Window.Parent = game.Players.LocalPlayer.PlayerGui
end

-- Criar a interface quando o script for executado
CreateWindow()

-- Criar uma funcionalidade simples para o Teleporte
local function CreateTeleportButton(name, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0.5, 50)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    button.Parent = game.Players.LocalPlayer.PlayerGui.DraxHub.Frame

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
