-- Verificar se o dispositivo é mobile
local isMobile = game:GetService("UserInputService").TouchEnabled
if not isMobile then
    return -- Se não for mobile, o script não roda
end

-- Criar o Rayfield
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Rayfield/main/source"))()

-- Função para criar a interface
local function CreateWindow()
    local Window = Rayfield:CreateWindow({
        Name = "DraxHub | Dead Rails", -- Nome da janela
        LoadingTitle = "Iniciando DraxHub...", -- Título enquanto carrega
        ConfigurationSaving = { Enabled = false }, -- Não salvar configurações
        KeySystem = false, -- Não usar sistema de chave
        Size = Vector2.new(400, 600), -- Tamanho do menu (ajustar conforme necessário)
    })

    -- Criar uma aba
    local Hub = Window:CreateTab("DraxHub", 4483362458)

    -- Seção de Teleportes
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
                if char then
                    char:MoveTo(pos)
                end
            end
        })
    end

    -- Seção de Auras & Coleta
    Hub:CreateSection("Auras & Coleta")

    Hub:CreateToggle({
        Name = "Gun Aura (Kill Mobs)",
        CurrentValue = false,
        Callback = function(Value)
            get
