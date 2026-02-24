--GUI, By Sherm0l
local TweenService = game:GetService("TweenService")
local player = game:GetService("Players").LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SkypieHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 320)
mainFrame.Position = UDim2.new(0.5, 0, -0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = mainFrame

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 14)
topCorner.Parent = topBar

local topMask = Instance.new("Frame")
topMask.Size = UDim2.new(1, 0, 0, 14)
topMask.Position = UDim2.new(0, 0, 1, -14)
topMask.BackgroundColor3 = topBar.BackgroundColor3
topMask.BorderSizePixel = 0
topMask.Parent = topBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "SkyPie Hub🥧"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 28)
closeButton.Position = UDim2.new(1, -10, 0.5, 0)
closeButton.AnchorPoint = Vector2.new(1, 0.5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
	screenGui.Enabled = false
end)
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.K then
		screenGui.Enabled = true
	end
end)

local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -20, 0, 40)
tabBar.Position = UDim2.new(0, 10, 0, 50)
tabBar.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
tabBar.BorderSizePixel = 0
tabBar.Parent = mainFrame

local tabCorner = Instance.new("UICorner")
tabCorner.CornerRadius = UDim.new(0, 10)
tabCorner.Parent = tabBar

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
tabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0, 10)
tabLayout.Parent = tabBar

local tabPadding = Instance.new("UIPadding")
tabPadding.PaddingLeft = UDim.new(0, 10)
tabPadding.PaddingRight = UDim.new(0, 10)
tabPadding.Parent = tabBar

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 1, -110)
contentFrame.Position = UDim2.new(0, 10, 0, 100)
contentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 12)
contentCorner.Parent = contentFrame

local function createTabButton(name, order)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 120, 0, 30)
	btn.LayoutOrder = order
	btn.BackgroundColor3 = Color3.fromRGB(55, 55, 70)
	btn.BorderSizePixel = 0
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 15
	btn.Text = name
	btn.Parent = tabBar

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = btn

	return btn
end

local tabs = {}
local buttons = {}

local tabNames = {"Main", "Info", "Mobs"}

for i, tabName in ipairs(tabNames) do
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundTransparency = 1
	frame.Visible = false
	frame.Parent = contentFrame

	tabs[tabName] = frame
	buttons[tabName] = createTabButton(tabName, i)
end

local function showTab(name)
	for tabName, frame in pairs(tabs) do
		frame.Visible = (tabName == name)
		buttons[tabName].BackgroundColor3 = (tabName == name)
			and Color3.fromRGB(75, 75, 100)
			or Color3.fromRGB(55, 55, 70)
	end
end

for name, button in pairs(buttons) do
	button.MouseButton1Click:Connect(function()
		showTab(name)
	end)
end



showTab("Main")
-- === INFO TAB CONTENT ===
local infoTab = tabs["Info"]

local function createButton1(text, posY)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 200, 0, 40)
	btn.Position = UDim2.new(0, 20, 0, posY)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.Text = text
	btn.Parent = infoTab
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,8)
	corner.Parent = btn
	
	return btn
end
local discordButton = createButton1("Discord", 20)

discordButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("https://discord.gg/p88BhThHZh")
		discordButton.Text = "Copied!"
		task.wait(1.5)
		discordButton.Text = "Discord"
	else
		discordButton.Text = "Clipboard not supported"
		task.wait(1.5)
		discordButton.Text = "Discord"
	end
end)
-- === MAIN TAB CONTENT ===

local mainTab = tabs["Main"]

local farmEnabled = false
local digEnabled = false
local dispencersEnabled = false

local function createButton(text, posY)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 200, 0, 40)
	btn.Position = UDim2.new(0, 20, 0, posY)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.Text = text
	btn.Parent = mainTab
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,8)
	corner.Parent = btn
	
	return btn
end

local farmButton = createButton("Farm: OFF", 20)
local digButton = createButton("Auto Dig: OFF", 80)
local dispencersButton = createButton("Auto Dispencers: OFF", 140)

local tokensFolder = workspace:WaitForChild("Rendered Models"):WaitForChild("Tokens")

local convertEvent = game:GetService("ReplicatedStorage")
	:WaitForChild("Modules")
	:WaitForChild("Shared")
	:WaitForChild("Network")
	:WaitForChild("Hives: Toggle Converting")

local digEvent = game:GetService("ReplicatedStorage")
	:WaitForChild("Modules")
	:WaitForChild("Shared")
	:WaitForChild("Network")
	:WaitForChild("Equipment: Use Collector")

local dispencersEvent = game:GetService("ReplicatedStorage")
	:WaitForChild("Modules")
	:WaitForChild("Shared")
	:WaitForChild("Network")
	:WaitForChild("Dispensers: Use")

local player = game:GetService("Players").LocalPlayer

local function getProgress()
	return player.PlayerGui.UI.Top.Currencies.Pollen.Bar.Progress
end

local function getMyHive()
	for _, hive in ipairs(workspace.Map.Hives:GetChildren()) do
		if hive:FindFirstChild("Owner")
		and hive.Owner.Value == player.Name
		and hive:FindFirstChild("Pad")
		and hive.Pad:FindFirstChild("Main") then
			
			return hive
		end
	end
end
-- === FARM ===
task.spawn(function()
	local state = "Idle"
	local teleportedToField = false

	while true do
		if farmEnabled then
			local character = player.Character or player.CharacterAdded:Wait()
			local humanoid = character:WaitForChild("Humanoid")
			local hrp = character:WaitForChild("HumanoidRootPart")
			local progress = getProgress()

			if progress.Size.X.Scale < 1 then
				if not teleportedToField then
					hrp.CFrame = CFrame.new(-118, 3, 0)
					task.wait(0.5)
					teleportedToField = true
					state = "Field"
				end

				for _, token in ipairs(tokensFolder:GetChildren()) do
					if not farmEnabled then break end
					progress = getProgress()
					if progress.Size.X.Scale >= 1 then break end

					if token.Name ~= "Reward" and token.Name ~= "Honey" then
						local part = token:FindFirstChildWhichIsA("BasePart")
						if part then
							local reached = false
							local connection

							connection = humanoid.MoveToFinished:Connect(function()
								reached = true
							end)

							humanoid:MoveTo(part.Position)

							local startTime = tick()

							while farmEnabled and not reached do
							if (hrp.Position - part.Position).Magnitude < 4 then
								break
							end
	
							if tick() - startTime > 2 then
								break
							end
	
							task.wait(0.1)
							end

connection:Disconnect()

						end
					end
				end
			end

			if progress.Size.X.Scale >= 1 then
				teleportedToField = false
				if state ~= "Hive" then
					state = "Hive"
					local myHive = getMyHive()
					if myHive then
						hrp.CFrame = myHive.Pad.Main.CFrame
					end
					task.wait(1)
					convertEvent:FireServer()
				end

				repeat
					task.wait(0.3)
					progress = getProgress()
				until progress.Size.X.Scale <= 0.01 or not farmEnabled

				teleportedToField = false
			end
		else
			state = "Idle"
			teleportedToField = false
		end

		task.wait(0.2)
	end
end)
-- === AUTO DIG LOOP ===
task.spawn(function()
	while true do
		if digEnabled then
			digEvent:FireServer()
		end
		task.wait(0.2)
	end
end)
-- === AUTO DISPENCERS LOOP ===
task.spawn(function()
	while true do
		if dispencersEnabled then
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("Dispensers: Use"):FireServer("Beelixir Dispencer")
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("Dispensers: Use"):FireServer("Blackberry Dispencer")
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("Dispensers: Use"):FireServer("Honey Dispencer")
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("Dispensers: Use"):FireServer("Strawberry Dispencer")
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Shared"):WaitForChild("Network"):WaitForChild("Dispensers: Use"):FireServer("Treats Dispencer")
		end
		task.wait(0.1)
	end
end)
-- === BUTTON LOGIC ===
farmButton.MouseButton1Click:Connect(function()
	farmEnabled = not farmEnabled
	farmButton.Text = farmEnabled and "Farm: ON" or "Farm: OFF"
end)

digButton.MouseButton1Click:Connect(function()
	digEnabled = not digEnabled
	digButton.Text = digEnabled and "Auto Dig: ON" or "Auto Dig: OFF"
end)

dispencersButton.MouseButton1Click:Connect(function()
	dispencersEnabled = not dispencersEnabled
	dispencersButton.Text = dispencersEnabled and "Auto Dispencers: ON" or "Auto Dispencers: OFF"
end)

local targetPos = UDim2.new(0.5, 0, 0.5, 0)
local tweenInfo = TweenInfo.new(
	0.6,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out
)

local tween = TweenService:Create(mainFrame, tweenInfo, {Position = targetPos})
tween:Play()
