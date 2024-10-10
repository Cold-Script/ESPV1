local esp = {}

local function Billboard(child, name, size, title)
local bill = Instance.new("BillboardGui",child) do
local txt = Instance.new("TextLabel",bill)
local uistroke = Instance.new("UIStroke", txt)
        bill.AlwaysOnTop = true
        bill.Size = UDim2.new(0,400,0,100)
        bill.Adornee = child
        bill.Name = title
        bill.Active = true
        bill.AlwaysOnTop = true
        txt.AnchorPoint = Vector2.new(0.5,0.5)
        txt.BackgroundTransparency = 1
        txt.BackgroundColor3 = Color3.new(1,1,1)
        txt.TextColor3 = Color3.new(1,1,1)
        txt.Font = "FredokaOne"
        txt.TextSize = size
        txt.Text = name
        txt.TextTransparency = 0
        txt.Visible = true
        txt.Size = UDim2.new(1,0,0,0)
        txt.Position = UDim2.new(0.5,0,0.7,-35)
        uistroke.Thickness = 0.5
task.spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
uistroke.Color = Color3.fromHSV(tick() % 5/5, 1, 1)
end);
end);
end
end
local function esp:Highlight(child, name, size, title)
Billboard(child, name, size, title)
local Highlight = Instance.new("Highlight") do
        Highlight.FillTransparency = 0.75
        Highlight.OutlineTransparency = 0
        Highlight.Name = title
        Highlight.Adornee = child
        Highlight.Parent = child
        if child:IsA("Part") then
        child.Transparency = 0
        end
task.spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
Highlight.FillColor = Color3.fromHSV(tick() % 5/5, 1, 1)
Highlight.OutlineColor = Color3.fromHSV(tick() % 5/5, 1, 1)
end)
end)
end
end
return esp
