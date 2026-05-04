-- Roblox LocalScript
-- Put inside StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

---------------------------------------------------
-- GUI (ALWAYS ON TOP)
---------------------------------------------------

local gui = Instance.new("ScreenGui")
gui.Name = "TradeGlitchGUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")
---------------------------------------------------
-- MAIN FRAME
---------------------------------------------------

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,390,0,330)
frame.Position = UDim2.new(0.5,-195,0.5,-165)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BorderSizePixel = 0
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,18)

local stroke = Instance.new("UIStroke")
stroke.Thickness = 1.5
stroke.Color = Color3.fromRGB(0,170,255)
stroke.Transparency = 0.15
stroke.Parent = frame

---------------------------------------------------
-- TOP BAR (ROUNDED)
---------------------------------------------------

local top = Instance.new("Frame")
top.Size = UDim2.new(1,0,0,42)
top.BackgroundColor3 = Color3.fromRGB(6,6,6)
top.BorderSizePixel = 0
top.Parent = frame

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0,18)
topCorner.Parent = top

-- hides bottom round so only top corners stay rounded
local fix = Instance.new("Frame")
fix.Size = UDim2.new(1,0,0,18)
fix.Position = UDim2.new(0,0,1,-18)
fix.BackgroundColor3 = Color3.fromRGB(6,6,6)
fix.BorderSizePixel = 0
fix.Parent = top

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-50,1,0)
title.Position = UDim2.new(0,16,0,0)
title.BackgroundTransparency = 1
title.Text = "TRADE GLITCHING GUI"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.new(1,1,1)
title.Parent = top

local mini = Instance.new("TextButton")
mini.Size = UDim2.new(0,28,0,28)
mini.Position = UDim2.new(1,-36,0,7)
mini.Text = "—"
mini.Font = Enum.Font.GothamBold
mini.TextSize = 16
mini.TextColor3 = Color3.new(1,1,1)
mini.BackgroundColor3 = Color3.fromRGB(20,20,20)
mini.Parent = top
Instance.new("UICorner", mini).CornerRadius = UDim.new(0,10)

---------------------------------------------------
-- CONTENT
---------------------------------------------------

local content = Instance.new("Frame")
content.Size = UDim2.new(1,-24,1,-58)
content.Position = UDim2.new(0,12,0,48)
content.BackgroundTransparency = 1
content.Parent = frame

---------------------------------------------------
-- TOGGLE CARD
---------------------------------------------------

local card1 = Instance.new("Frame")
card1.Size = UDim2.new(1,0,0,62)
card1.BackgroundColor3 = Color3.fromRGB(18,18,18)
card1.Parent = content
Instance.new("UICorner", card1).CornerRadius = UDim.new(0,14)

local txt = Instance.new("TextLabel")
txt.Size = UDim2.new(0.7,0,1,0)
txt.Position = UDim2.new(0,14,0,0)
txt.BackgroundTransparency = 1
txt.Text = "Activate Trade Glitch"
txt.TextColor3 = Color3.new(1,1,1)
txt.Font = Enum.Font.GothamSemibold
txt.TextSize = 14
txt.TextXAlignment = Enum.TextXAlignment.Left
txt.Parent = card1

local toggleBack = Instance.new("Frame")
toggleBack.Size = UDim2.new(0,54,0,28)
toggleBack.Position = UDim2.new(1,-68,0.5,-14)
toggleBack.BackgroundColor3 = Color3.fromRGB(170,50,50)
toggleBack.Parent = card1
Instance.new("UICorner", toggleBack).CornerRadius = UDim.new(1,0)

local knob = Instance.new("Frame")
knob.Size = UDim2.new(0,22,0,22)
knob.Position = UDim2.new(0,3,0,3)
knob.BackgroundColor3 = Color3.new(1,1,1)
knob.Parent = toggleBack
Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(1,0,1,0)
toggle.BackgroundTransparency = 1
toggle.Text = ""
toggle.Parent = toggleBack

---------------------------------------------------
-- PLAYER CARD
---------------------------------------------------

local card2 = Instance.new("Frame")
card2.Size = UDim2.new(1,0,0,170)
card2.Position = UDim2.new(0,0,0,74)
card2.BackgroundColor3 = Color3.fromRGB(18,18,18)
card2.Parent = content
Instance.new("UICorner", card2).CornerRadius = UDim.new(0,14)

local choose = Instance.new("TextLabel")
choose.Size = UDim2.new(1,-20,0,20)
choose.Position = UDim2.new(0,14,0,10)
choose.BackgroundTransparency = 1
choose.Text = "Choose player you want to trade"
choose.TextColor3 = Color3.fromRGB(220,220,220)
choose.Font = Enum.Font.GothamSemibold
choose.TextSize = 12
choose.TextXAlignment = Enum.TextXAlignment.Left
choose.Parent = card2

local dropBtn = Instance.new("TextButton")
dropBtn.Size = UDim2.new(1,-28,0,38)
dropBtn.Position = UDim2.new(0,14,0,36)
dropBtn.Text = "Select Player ▼"
dropBtn.TextColor3 = Color3.new(1,1,1)
dropBtn.Font = Enum.Font.Gotham
dropBtn.TextSize = 13
dropBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
dropBtn.Parent = card2
Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0,12)

local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1,-28,0,78)
list.Position = UDim2.new(0,14,0,84)
list.BackgroundColor3 = Color3.fromRGB(14,14,14)
list.BorderSizePixel = 0
list.ScrollBarThickness = 5
list.AutomaticCanvasSize = Enum.AutomaticSize.Y
list.CanvasSize = UDim2.new()
list.Parent = card2
Instance.new("UICorner", list).CornerRadius = UDim.new(0,12)

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0,5)
layout.Parent = list

---------------------------------------------------
-- LOADING PANEL
---------------------------------------------------

local loading = Instance.new("Frame")
loading.Size = UDim2.new(1,0,1,0)
loading.BackgroundColor3 = Color3.fromRGB(8,8,8)
loading.Visible = false
loading.Parent = content
Instance.new("UICorner", loading).CornerRadius = UDim.new(0,16)

local ltitle = Instance.new("TextLabel")
ltitle.Size = UDim2.new(1,0,0,30)
ltitle.Position = UDim2.new(0,0,0.22,0)
ltitle.BackgroundTransparency = 1
ltitle.Text = "Optimizing Trade..."
ltitle.TextColor3 = Color3.new(1,1,1)
ltitle.Font = Enum.Font.GothamBold
ltitle.TextSize = 20
ltitle.Parent = loading

local linfo = Instance.new("TextLabel")
linfo.Size = UDim2.new(1,-20,0,36)
linfo.Position = UDim2.new(0,10,0.37,0)
linfo.BackgroundTransparency = 1
linfo.TextWrapped = true
linfo.Text = "If script doesn't work, wait a few minutes for optimization."
linfo.TextColor3 = Color3.fromRGB(120,210,255)
linfo.Font = Enum.Font.GothamMedium
linfo.TextSize = 12
linfo.Parent = loading

local barBack = Instance.new("Frame")
barBack.Size = UDim2.new(0.82,0,0,16)
barBack.Position = UDim2.new(0.09,0,0.58,0)
barBack.BackgroundColor3 = Color3.fromRGB(40,40,40)
barBack.Parent = loading
Instance.new("UICorner", barBack).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
bar.Parent = barBack
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

local percent = Instance.new("TextLabel")
percent.Size = UDim2.new(1,0,0,18)
percent.Position = UDim2.new(0,0,0.66,0)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.new(1,1,1)
percent.Font = Enum.Font.GothamBold
percent.TextSize = 13
percent.Parent = loading

---------------------------------------------------
-- PLAYER LIST
---------------------------------------------------

local function refresh()
	for _,v in pairs(list:GetChildren()) do
		if v:IsA("TextButton") then v:Destroy() end
	end

	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= player then
			local item = Instance.new("TextButton")
			item.Size = UDim2.new(1,-8,0,28)
			item.Text = plr.Name
			item.TextColor3 = Color3.new(1,1,1)
			item.Font = Enum.Font.Gotham
			item.TextSize = 12
			item.BackgroundColor3 = Color3.fromRGB(25,25,25)
			item.Parent = list
			Instance.new("UICorner", item).CornerRadius = UDim.new(0,10)

			item.MouseButton1Click:Connect(function()
				dropBtn.Text = plr.Name .. " ▼"
			end)
		end
	end
end

refresh()

---------------------------------------------------
-- TOGGLE
---------------------------------------------------

local enabled = false

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled

	if enabled then
		TweenService:Create(toggleBack,TweenInfo.new(.2),{
			BackgroundColor3 = Color3.fromRGB(40,180,90)
		}):Play()

		TweenService:Create(knob,TweenInfo.new(.2),{
			Position = UDim2.new(0,29,0,3)
		}):Play()

		loading.Visible = true
		bar.Size = UDim2.new(0,0,1,0)

		for i = 1,100 do
			bar.Size = UDim2.new(i/100,0,1,0)
			percent.Text = i .. "%"
			task.wait(.12)
		end

		task.wait(1)
		loading.Visible = false
	else
		TweenService:Create(toggleBack,TweenInfo.new(.2),{
			BackgroundColor3 = Color3.fromRGB(170,50,50)
		}):Play()

		TweenService:Create(knob,TweenInfo.new(.2),{
			Position = UDim2.new(0,3,0,3)
		}):Play()
	end
end)

-- Replace ONLY your minimize section with this

---------------------------------------------------
-- MINIMIZE (FIXED ROUNDED EDGES)
---------------------------------------------------

local minimized = false

mini.MouseButton1Click:Connect(function()
	minimized = not minimized

	if minimized then
		content.Visible = false
		mini.Text = "+"

		-- hide top bar fix piece so bottom corners round properly
		fix.Visible = false

		TweenService:Create(frame,TweenInfo.new(.25,Enum.EasingStyle.Quad),{
			Size = UDim2.new(0,390,0,42)
		}):Play()

	else
		mini.Text = "—"

		TweenService:Create(frame,TweenInfo.new(.25,Enum.EasingStyle.Quad),{
			Size = UDim2.new(0,390,0,330)
		}):Play()

		task.wait(.18)

		-- restore square join between top bar and body
		fix.Visible = true
		content.Visible = true
	end
end)
---------------------------------------------------
-- DRAGGING
---------------------------------------------------

local dragging = false
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart

	frame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (
		input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch
	) then
		update(input)
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)
