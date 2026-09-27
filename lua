--[[
    Project: Script Free (Key System Edition)
    Style: Liquid Glass / Neon Blue UI 
    Author: phongdepzai02 (Customized by ashfall)
]]--

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

-- ================= CONFIGURATION =================
local CONFIG = {
    KeyLink = "gay à. hhhh", -- Dán link lấy key của bạn vào đây trong dấu ngoặc kép
    CorrectKey = "PHONG-FREE-2026",                 -- Key mẫu để xác thực
}
-- =================================================

-- Xóa UI cũ nếu tồn tại
if CoreGui:FindFirstChild("ScriptFreeKeySystem") then
    CoreGui.ScriptFreeKeySystem:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptFreeKeySystem"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Khung tổng thể (Main Container)
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Parent = ScreenGui
MainContainer.BackgroundTransparency = 1
MainContainer.Position = UDim2.new(0.5, -175, 0.5, -140)
MainContainer.Size = UDim2.new(0, 350, 0, 280)
MainContainer.Active = true
MainContainer.Draggable = true

-- Header / Tiêu đề chính
local HeaderFrame = Instance.new("Frame")
HeaderFrame.Name = "HeaderFrame"
HeaderFrame.Parent = MainContainer
HeaderFrame.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
HeaderFrame.BackgroundTransparency = 0.15
HeaderFrame.BorderSizePixel = 0
HeaderFrame.Size = UDim2.new(1, 0, 0, 55)

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 16)
HeaderCorner.Parent = HeaderFrame

local HeaderStroke = Instance.new("UIStroke")
HeaderStroke.Parent = HeaderFrame
HeaderStroke.Color = Color3.fromRGB(120, 190, 255)
HeaderStroke.Thickness = 1.8
HeaderStroke.Transparency = 0.3

local TitleText = Instance.new("TextLabel")
TitleText.Parent = HeaderFrame
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 20, 0, 0)
TitleText.Size = UDim2.new(1, -20, 1, 0)
TitleText.Font = Enum.Font.GothamBold
TitleText.Text = "Script Free  ✨"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left

local SubtitleText = Instance.new("TextLabel")
SubtitleText.Parent = HeaderFrame
SubtitleText.BackgroundTransparency = 1
SubtitleText.Position = UDim2.new(0, 20, 0, 22)
SubtitleText.Size = UDim2.new(1, -20, 1, 0)
SubtitleText.Font = Enum.Font.GothamMedium
SubtitleText.Text = "Made by phongdepzai02"
SubtitleText.TextColor3 = Color3.fromRGB(200, 230, 255)
SubtitleText.TextSize = 11
SubtitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Khung nội dung chứa các hàng điều khiển (Body Frame)
local BodyFrame = Instance.new("Frame")
BodyFrame.Name = "BodyFrame"
BodyFrame.Parent = MainContainer
BodyFrame.BackgroundColor3 = Color3.fromRGB(10, 30, 70)
BodyFrame.BackgroundTransparency = 0.3
BodyFrame.BorderSizePixel = 0
BodyFrame.Position = UDim2.new(0, 0, 0, 65)
BodyFrame.Size = UDim2.new(1, 0, 0, 210)

local BodyCorner = Instance.new("UICorner")
BodyCorner.CornerRadius = UDim.new(0, 16)
BodyCorner.Parent = BodyFrame

local BodyStroke = Instance.new("UIStroke")
BodyStroke.Parent = BodyFrame
BodyStroke.Color = Color3.fromRGB(0, 150, 255)
BodyStroke.Thickness = 1.5
BodyStroke.Transparency = 0.4

-- Hàng 1: Ô nhập Key (TextBox Row)
local KeyInputRow = Instance.new("Frame")
KeyInputRow.Parent = BodyFrame
KeyInputRow.BackgroundColor3 = Color3.fromRGB(0, 80, 200)
KeyInputRow.BackgroundTransparency = 0.4
KeyInputRow.Position = UDim2.new(0.05, 0, 0, 12)
KeyInputRow.Size = UDim2.new(0.9, 0, 0, 42)

local KeyRowCorner = Instance.new("UICorner")
KeyRowCorner.CornerRadius = UDim.new(0, 12)
KeyRowCorner.Parent = KeyInputRow

local KeyBox = Instance.new("TextBox")
KeyBox.Parent = KeyInputRow
KeyBox.BackgroundTransparency = 1
KeyBox.Position = UDim2.new(0.03, 0, 0, 0)
KeyBox.Size = UDim2.new(0.94, 0, 1, 0)
KeyBox.Font = Enum.Font.GothamMedium
KeyBox.PlaceholderText = "Paste your key here..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderColor3 = Color3.fromRGB(160, 200, 255)
KeyBox.TextSize = 13
KeyBox.ClearTextOnFocus = false

-- Hàng 2: Hai nút bấm (Check Key & Copy Link)
local CheckButton = Instance.new("TextButton")
CheckButton.Parent = BodyFrame
CheckButton.BackgroundColor3 = Color3.fromRGB(0, 180, 90)
CheckButton.BackgroundTransparency = 0.15
CheckButton.Position = UDim2.new(0.05, 0, 0, 64)
CheckButton.Size = UDim2.new(0.43, 0, 0, 38)
CheckButton.Font = Enum.Font.GothamBold
CheckButton.Text = "Check Key"
CheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckButton.TextSize = 13
CheckButton.AutoButtonColor = true

local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 10)
CheckCorner.Parent = CheckButton

local CopyButton = Instance.new("TextButton")
CopyButton.Parent = BodyFrame
CopyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 240)
CopyButton.BackgroundTransparency = 0.15
CopyButton.Position = UDim2.new(0.52, 0, 0, 64)
CopyButton.Size = UDim2.new(0.43, 0, 0, 38)
CopyButton.Font = Enum.Font.GothamBold
CopyButton.Text = "Copy Link"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 13
CopyButton.AutoButtonColor = true

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 10)
CopyCorner.Parent = CopyButton

-- Hàng 3: Đồng hồ đếm thời gian (Stopwatch)
local StopwatchRow = Instance.new("Frame")
StopwatchRow.Parent = BodyFrame
StopwatchRow.BackgroundColor3 = Color3.fromRGB(0, 60, 150)
StopwatchRow.BackgroundTransparency = 0.5
StopwatchRow.Position = UDim2.new(0.05, 0, 0, 114)
StopwatchRow.Size = UDim2.new(0.9, 0, 0, 38)

local StopwatchCorner = Instance.new("UICorner")
StopwatchCorner.CornerRadius = UDim.new(0, 10)
StopwatchCorner.Parent = StopwatchRow

local StopwatchTitle = Instance.new("TextLabel")
StopwatchTitle.Parent = StopwatchRow
StopwatchTitle.BackgroundTransparency = 1
StopwatchTitle.Position = UDim2.new(0.05, 0, 0, 0)
StopwatchTitle.Size = UDim2.new(0.5, 0, 1, 0)
StopwatchTitle.Font = Enum.Font.GothamSemibold
StopwatchTitle.Text = "⏱️ Session Time"
StopwatchTitle.TextColor3 = Color3.fromRGB(200, 225, 255)
StopwatchTitle.TextSize = 12
StopwatchTitle.TextXAlignment = Enum.TextXAlignment.Left

local StopwatchValue = Instance.new("TextLabel")
StopwatchValue.Parent = StopwatchRow
StopwatchValue.BackgroundTransparency = 1
StopwatchValue.Position = UDim2.new(0.5, 0, 0, 0)
StopwatchValue.Size = UDim2.new(0.45, 0, 1, 0)
StopwatchValue.Font = Enum.Font.GothamBold
StopwatchValue.Text = "00:00"
StopwatchValue.TextColor3 = Color3.fromRGB(255, 255, 255)
StopwatchValue.TextSize = 13
StopwatchValue.TextXAlignment = Enum.TextXAlignment.Right

-- Hàng 4: Trạng thái thông báo (Status Label)
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = BodyFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0.05, 0, 0, 162)
StatusLabel.Size = UDim2.new(0.9, 0, 0, 30)
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = "Status: Waiting for key..."
StatusLabel.TextColor3 = Color3.fromRGB(180, 210, 255)
StatusLabel.TextSize = 11

-- ================= LOGIC XỬ LÝ =================

-- Logic Đồng hồ đếm thời gian (Stopwatch)
local startTime = tick()
RunService.RenderStepped:Connect(function()
    local elapsed = math.floor(tick() - startTime)
    local minutes = math.floor(elapsed / 60)
    local seconds = elapsed % 60
    StopwatchValue.Text = string.format("%02d:%02d", minutes, seconds)
end)

-- Logic nút Copy Link
CopyButton.MouseButton1Click:Connect(function()
    local success = pcall(function()
        setclipboard(CONFIG.KeyLink)
    end)
    
    if success then
        StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
        StatusLabel.Text = "✓ Link copied successfully!"
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        StatusLabel.Text = "✕ Executor does not support setclipboard!"
    end
end)

-- Logic nút Check Key
CheckButton.MouseButton1Click:Connect(function()
    local enteredKey = KeyBox.Text
    enteredKey = string.gsub(enteredKey, "^%s*(.-)%s*$", "%1") -- Trim khoảng trắng
    
    if enteredKey == "" then
        StatusLabel.TextColor3 = Color3.fromRGB(255, 180, 100)
        StatusLabel.Text = "⚠ Please enter your key!"
        return
    end
    
    if enteredKey == CONFIG.CorrectKey then
        StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
        StatusLabel.Text = "✓ Key correct! Loading Script Free..."
        
        task.wait(1.2)
        ScreenGui:Destroy()
        
        -- ==========================================
        -- CHÈN CODE SCRIPT CHÍNH CỦA BẠN VÀO DƯỚI ĐÂY
        -- ==========================================
        print("Script Free loaded successfully!")
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        StatusLabel.Text = "✕ Invalid Key! Please try again."
    end
end)
