--[[
Rayfield UI Library (Fonte oficial: https://github.com/shlexware/Rayfield)
Versão otimizada para compatibilidade com mobile e scripts externos como o DraxHub
]]

local Rayfield = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

local function Create(class, props)
	local inst = Instance.new(class)
	for prop, val in pairs(props) do
		inst[prop] = val
	end
	return inst
end

function Rayfield:CreateWindow(settings)
	local ScreenGui = Create("ScreenGui", {
		Name = "RayfieldUI",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Global,
		Parent = CoreGui
	})

	local MainFrame = Create("Frame", {
		Name = "Main",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, settings.Size.X, 0, settings.Size.Y),
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BorderSizePixel = 0,
		Parent = ScreenGui
	})

	local UICorner = Create("UICorner", {
		CornerRadius = UDim.new(0, 10),
		Parent = MainFrame
	})

	local Title = Create("TextLabel", {
		Text = settings.Name or "Rayfield Window",
		Font = Enum.Font.GothamBold,
		TextSize = 20,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 30),
		Position = UDim2.new(0, 0, 0, 0),
		Parent = MainFrame
	})

	local TabsFolder = {}

	function TabsFolder:CreateTab(name, iconId)
		local Tab = {}
		local TabFrame = Create("Frame", {
			Name = name,
			Size = UDim2.new(1, 0, 1, -30),
			Position = UDim2.new(0, 0, 0, 30),
			BackgroundTransparency = 1,
			Parent = MainFrame
		})

		local UIListLayout = Create("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 6),
			Parent = TabFrame
		})

		function Tab:CreateSection(title)
			local SectionLabel = Create("TextLabel", {
				Text = title,
				Font = Enum.Font.GothamBold,
				TextSize = 16,
				TextColor3 = Color3.fromRGB(200, 200, 200),
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -10, 0, 20),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = TabFrame
			})
		end

		function Tab:CreateButton(data)
			local Button = Create("TextButton", {
				Text = data.Name,
				Font = Enum.Font.Gotham,
				TextSize = 16,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundColor3 = Color3.fromRGB(50, 50, 50),
				Size = UDim2.new(1, -10, 0, 30),
				Parent = TabFrame
			})

			local UICorner = Create("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Parent = Button
			})

			Button.MouseButton1Click:Connect(function()
				pcall(data.Callback)
			end)
		end

		function Tab:CreateToggle(data)
			local Toggle = Create("TextButton", {
				Text = data.Name .. ": OFF",
				Font = Enum.Font.Gotham,
				TextSize = 16,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
				Size = UDim2.new(1, -10, 0, 30),
				Parent = TabFrame
			})

			local UICorner = Create("UICorner", {
				CornerRadius = UDim.new(0, 6),
				Parent = Toggle
			})

			local state = data.CurrentValue or false

			local function updateText()
				Toggle.Text = data.Name .. ": " .. (state and "ON" or "OFF")
			end

			updateText()

			Toggle.MouseButton1Click:Connect(function()
				state = not state
				updateText()
				pcall(data.Callback, state)
			end)
		end

		return Tab
	end

	return TabsFolder
end

return Rayfield
