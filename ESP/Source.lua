--// Service \\
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
--// Create ESP \\
local Lib = {}
local function Billboard(child, name)
  local BillboardGui = Instance.new("BillboardGui", CoreGui)
  BillboardGui.ResetOnSpawn = false
  BillboardGui.Enabled = true
  BillboardGui.AlwaysOnTop = true
  BillboardGui.Size = UDim2.new(0, 200, 0, 50)
  BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
  BillboardGui.Adornee = child
  BillboardGui.Name = "Instance"
  local Text = Instance.new("TextLabel", BillboardGui)
  Text.ZIndex = 0
  Text.SizeConstraint = Enum.SizeConstraint.RelativeXX
	Text.Size = UDim2.new(0, 200, 0, 50)
  Text.ClipsDescendants = true
  Text.Active = true
	Text.BackgroundTransparency = 1
	Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Text.FontSize = Enum.FontSize.Size18
	Text.TextStrokeTransparency = 0
	Text.TextSize = 15
	Text.RichText = true
	Text.Text = name
	Text.TextWrapped = true
	Text.Font = Enum.Font.RobotoCondensed
	Text.TextWrap = true
	Instance.new("UIStroke", Text)
task.spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
Text.TextColor3 = Color3.fromHSV(tick() % 5/5, 1, 1)
Text.Text = string.format("%s\n[%s studs]", name or child.Name, math.floor((workspace.CurrentCamera.CFrame.Position - child:GetPivot().Position).Magnitude));
end);
end);
end
local function Highlight(child, name)
  local Highlight = Instance.new("Highlight", child)
	Highlight.FillColor = 
	Highlight.OutlineColor = 
	Highlight.FillTransparency = 0.75
	Highlight.OutlineTransparency = 0
	Highlight.Adornee = child
  Highlight.Name = "Instance"
end
local function ESP:CreateESP(child, name)
Highlight(child, name)
Billboard(child, name)
end
local function ClearESP(name)
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == name then
v:Destroy()
end
end
end
return ESP
