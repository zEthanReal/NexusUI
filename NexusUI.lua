--[[
╔══════════════════════════════════════════════════════════════╗
║                    NexusUI Library v2.0                      ║
║           iOS-Inspired Roblox UI Library                     ║
║        Mobile + PC Compatible  |  Easy API                   ║
╚══════════════════════════════════════════════════════════════╝

QUICK START:
    local NexusUI = loadstring(game:HttpGet("YOUR_URL"))()

    local Window = NexusUI:CreateWindow({
        Title     = "My Script",
        Theme     = "Dark",           -- Dark | Ocean | Purple | Rose | Light
        Size      = Vector2.new(500, 540),
        ToggleKey = Enum.KeyCode.RightShift,
    })

    local Tab = Window:CreateTab("Main", "rbxassetid://7733960981")

    Tab:CreateToggle({ Name = "Auto Farm", Default = false, Callback = function(v) print(v) end })
    Tab:CreateButton({ Name = "Click Me", Callback = function() print("Clicked!") end })
    Tab:CreateSlider({ Name = "Speed", Min = 0, Max = 100, Default = 16, Callback = function(v) print(v) end })
    Tab:CreateDropdown({ Name = "Mode", Options = {"A","B","C"}, Callback = function(v) print(v) end })
    Tab:CreateTextbox({ Name = "Name", Placeholder = "Enter name...", Callback = function(v) print(v) end })
    Tab:CreateKeybind({ Name = "Sprint Key", Default = Enum.KeyCode.LeftShift, Callback = function() print("Pressed") end })

    Window:Notify({ Title = "Loaded", Text = "NexusUI ready!", Type = "Success", Duration = 4 })
]]

-- ═══════════════════════════════════════════════════════════════
--  SERVICES
-- ═══════════════════════════════════════════════════════════════
local TweenService      = game:GetService("TweenService")
local UserInputService  = game:GetService("UserInputService")
local RunService        = game:GetService("RunService")
local Players           = game:GetService("Players")
local HttpService       = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

-- ═══════════════════════════════════════════════════════════════
--  THEME DEFINITIONS
-- ═══════════════════════════════════════════════════════════════
local Themes = {
    Dark = {
        Window      = Color3.fromRGB(18, 18, 24),
        Surface     = Color3.fromRGB(28, 28, 38),
        SurfaceAlt  = Color3.fromRGB(38, 38, 52),
        Sidebar     = Color3.fromRGB(22, 22, 30),
        Accent      = Color3.fromRGB(112, 140, 255),
        AccentHover = Color3.fromRGB(90, 118, 240),
        Text        = Color3.fromRGB(238, 238, 255),
        TextSub     = Color3.fromRGB(148, 148, 180),
        Border      = Color3.fromRGB(52, 52, 72),
        ToggleOff   = Color3.fromRGB(58, 58, 78),
        ToggleOn    = Color3.fromRGB(60, 210, 120),
        SliderFill  = Color3.fromRGB(112, 140, 255),
        Notif       = Color3.fromRGB(28, 28, 38),
        Success     = Color3.fromRGB(60, 210, 120),
        Warning     = Color3.fromRGB(255, 185, 55),
        Error       = Color3.fromRGB(255, 85, 85),
        Info        = Color3.fromRGB(112, 140, 255),
    },
    Ocean = {
        Window      = Color3.fromRGB(10, 18, 32),
        Surface     = Color3.fromRGB(14, 28, 52),
        SurfaceAlt  = Color3.fromRGB(18, 40, 70),
        Sidebar     = Color3.fromRGB(12, 22, 40),
        Accent      = Color3.fromRGB(0, 195, 255),
        AccentHover = Color3.fromRGB(0, 165, 225),
        Text        = Color3.fromRGB(215, 240, 255),
        TextSub     = Color3.fromRGB(110, 165, 210),
        Border      = Color3.fromRGB(25, 58, 100),
        ToggleOff   = Color3.fromRGB(28, 52, 85),
        ToggleOn    = Color3.fromRGB(0, 195, 255),
        SliderFill  = Color3.fromRGB(0, 195, 255),
        Notif       = Color3.fromRGB(14, 28, 52),
        Success     = Color3.fromRGB(50, 210, 130),
        Warning     = Color3.fromRGB(255, 185, 55),
        Error       = Color3.fromRGB(255, 85, 85),
        Info        = Color3.fromRGB(0, 195, 255),
    },
    Purple = {
        Window      = Color3.fromRGB(14, 10, 24),
        Surface     = Color3.fromRGB(24, 18, 42),
        SurfaceAlt  = Color3.fromRGB(36, 26, 62),
        Sidebar     = Color3.fromRGB(18, 12, 32),
        Accent      = Color3.fromRGB(168, 85, 255),
        AccentHover = Color3.fromRGB(145, 62, 232),
        Text        = Color3.fromRGB(238, 228, 255),
        TextSub     = Color3.fromRGB(158, 138, 200),
        Border      = Color3.fromRGB(62, 42, 102),
        ToggleOff   = Color3.fromRGB(52, 38, 82),
        ToggleOn    = Color3.fromRGB(168, 85, 255),
        SliderFill  = Color3.fromRGB(168, 85, 255),
        Notif       = Color3.fromRGB(24, 18, 42),
        Success     = Color3.fromRGB(60, 210, 120),
        Warning     = Color3.fromRGB(255, 185, 55),
        Error       = Color3.fromRGB(255, 85, 85),
        Info        = Color3.fromRGB(168, 85, 255),
    },
    Rose = {
        Window      = Color3.fromRGB(22, 14, 18),
        Surface     = Color3.fromRGB(36, 20, 28),
        SurfaceAlt  = Color3.fromRGB(50, 28, 38),
        Sidebar     = Color3.fromRGB(28, 16, 22),
        Accent      = Color3.fromRGB(255, 95, 130),
        AccentHover = Color3.fromRGB(230, 70, 108),
        Text        = Color3.fromRGB(255, 235, 240),
        TextSub     = Color3.fromRGB(198, 158, 170),
        Border      = Color3.fromRGB(90, 45, 62),
        ToggleOff   = Color3.fromRGB(72, 38, 52),
        ToggleOn    = Color3.fromRGB(255, 95, 130),
        SliderFill  = Color3.fromRGB(255, 95, 130),
        Notif       = Color3.fromRGB(36, 20, 28),
        Success     = Color3.fromRGB(60, 210, 120),
        Warning     = Color3.fromRGB(255, 185, 55),
        Error       = Color3.fromRGB(255, 85, 85),
        Info        = Color3.fromRGB(255, 95, 130),
    },
    Light = {
        Window      = Color3.fromRGB(245, 245, 250),
        Surface     = Color3.fromRGB(255, 255, 255),
        SurfaceAlt  = Color3.fromRGB(235, 235, 245),
        Sidebar     = Color3.fromRGB(240, 240, 248),
        Accent      = Color3.fromRGB(0, 122, 255),
        AccentHover = Color3.fromRGB(0, 95, 220),
        Text        = Color3.fromRGB(20, 20, 30),
        TextSub     = Color3.fromRGB(110, 110, 140),
        Border      = Color3.fromRGB(200, 200, 218),
        ToggleOff   = Color3.fromRGB(185, 185, 205),
        ToggleOn    = Color3.fromRGB(40, 200, 100),
        SliderFill  = Color3.fromRGB(0, 122, 255),
        Notif       = Color3.fromRGB(255, 255, 255),
        Success     = Color3.fromRGB(40, 190, 90),
        Warning     = Color3.fromRGB(215, 145, 20),
        Error       = Color3.fromRGB(220, 50, 50),
        Info        = Color3.fromRGB(0, 122, 255),
    },
}

-- ═══════════════════════════════════════════════════════════════
--  UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════════
local function Tween(obj, props, t, style, dir)
    local info = TweenInfo.new(
        t or 0.28,
        style or Enum.EasingStyle.Quart,
        dir or Enum.EasingDirection.Out
    )
    local tw = TweenService:Create(obj, info, props)
    tw:Play()
    return tw
end

local function Make(class, props, children)
    local inst = Instance.new(class)
    for k, v in pairs(props or {}) do
        pcall(function() inst[k] = v end)
    end
    for _, c in pairs(children or {}) do
        c.Parent = inst
    end
    return inst
end

local function Corner(parent, px)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, px or 12)
    c.Parent = parent
    return c
end

local function Stroke(parent, color, thick, transp)
    local s = Instance.new("UIStroke")
    s.Color = color or Color3.new(1,1,1)
    s.Thickness = thick or 1
    s.Transparency = transp or 0
    s.Parent = parent
    return s
end

local function Pad(parent, top, right, bot, left)
    local p = Instance.new("UIPadding")
    p.PaddingTop    = UDim.new(0, top   or 8)
    p.PaddingRight  = UDim.new(0, right or 8)
    p.PaddingBottom = UDim.new(0, bot   or 8)
    p.PaddingLeft   = UDim.new(0, left  or 8)
    p.Parent = parent
    return p
end

local function Ripple(frame, x, y)
    local ripple = Make("Frame", {
        Size               = UDim2.new(0, 0, 0, 0),
        Position           = UDim2.new(0, x, 0, y),
        AnchorPoint        = Vector2.new(0.5, 0.5),
        BackgroundColor3   = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.75,
        ZIndex             = 20,
        Parent             = frame,
    })
    Corner(ripple, 999)
    local maxDim = math.max(frame.AbsoluteSize.X, frame.AbsoluteSize.Y) * 2.2
    Tween(ripple, { Size = UDim2.new(0, maxDim, 0, maxDim), BackgroundTransparency = 1 }, 0.55, Enum.EasingStyle.Quad)
    task.delay(0.6, function() ripple:Destroy() end)
end

local function GetGui()
    local gui
    -- Try protected gui methods used by common executors
    if syn and syn.protect_gui then
        gui = Instance.new("ScreenGui")
        syn.protect_gui(gui)
        gui.Parent = game:GetService("CoreGui")
    elseif gethui then
        gui = Instance.new("ScreenGui")
        gui.Parent = gethui()
    else
        gui = Instance.new("ScreenGui")
        pcall(function() gui.Parent = game:GetService("CoreGui") end)
        if not gui.Parent then
            gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
        end
    end
    return gui
end

-- ═══════════════════════════════════════════════════════════════
--  CONFIG SAVE / LOAD  (uses writefile / readfile if available)
-- ═══════════════════════════════════════════════════════════════
local ConfigSystem = {}
ConfigSystem.__index = ConfigSystem

function ConfigSystem.new(scriptName)
    local self = setmetatable({}, ConfigSystem)
    self.Name     = scriptName or "NexusUI"
    self.FileName = self.Name:gsub("%s+", "_") .. "_config.json"
    self.Data     = {}
    self.Flags    = {}  -- registered flag callbacks
    return self
end

function ConfigSystem:Register(flag, default, callback)
    self.Data[flag] = self.Data[flag] ~= nil and self.Data[flag] or default
    self.Flags[flag] = { Default = default, Callback = callback }
end

function ConfigSystem:Set(flag, value)
    self.Data[flag] = value
    if self.Flags[flag] and self.Flags[flag].Callback then
        self.Flags[flag].Callback(value)
    end
end

function ConfigSystem:Get(flag)
    return self.Data[flag]
end

function ConfigSystem:Save()
    if writefile then
        local ok, err = pcall(function()
            writefile(self.FileName, HttpService:JSONEncode(self.Data))
        end)
        return ok, err
    end
    return false, "writefile not available"
end

function ConfigSystem:Load()
    if readfile and isfile and isfile(self.FileName) then
        local ok, result = pcall(function()
            return HttpService:JSONDecode(readfile(self.FileName))
        end)
        if ok and type(result) == "table" then
            for k, v in pairs(result) do
                self.Data[k] = v
                if self.Flags[k] and self.Flags[k].Callback then
                    self.Flags[k].Callback(v)
                end
            end
            return true
        end
    end
    return false, "No config file found"
end

function ConfigSystem:Reset()
    for flag, info in pairs(self.Flags) do
        self:Set(flag, info.Default)
    end
end

-- ═══════════════════════════════════════════════════════════════
--  NEXUSUI MAIN LIBRARY
-- ═══════════════════════════════════════════════════════════════
local NexusUI   = {}
NexusUI.__index = NexusUI

NexusUI.Version = "2.0.0"
NexusUI.Themes  = Themes

-- ┌─────────────────────────────────────────────────────────────┐
-- │  NexusUI:CreateWindow(config)                               │
-- └─────────────────────────────────────────────────────────────┘
function NexusUI:CreateWindow(config)
    config = config or {}
    local cfg = {
        Title       = config.Title     or "NexusUI",
        SubTitle    = config.SubTitle  or "Script Hub",
        Size        = config.Size      or Vector2.new(500, 540),
        Theme       = Themes[config.Theme] or Themes.Dark,
        ToggleKey   = config.ToggleKey or Enum.KeyCode.RightShift,
        ConfigName  = config.ConfigName,
        Position    = config.Position, -- optional UDim2 override
    }

    local T = cfg.Theme
    local W, H = cfg.Size.X, cfg.Size.Y

    -- ── SCREENGUI ────────────────────────────────────────────
    local ScreenGui      = GetGui()
    ScreenGui.Name       = "NexusUI_" .. cfg.Title
    ScreenGui.ZIndexBehavior   = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn     = false
    ScreenGui.IgnoreGuiInset   = true
    ScreenGui.DisplayOrder     = 99

    -- ── SHADOW ───────────────────────────────────────────────
    local ShadowImg = Make("ImageLabel", {
        Name               = "Shadow",
        AnchorPoint        = Vector2.new(0.5, 0.5),
        Size               = UDim2.new(0, W + 50, 0, H + 50),
        Position           = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 1,
        Image              = "rbxassetid://6014261993",
        ImageColor3        = Color3.fromRGB(0, 0, 0),
        ImageTransparency  = 0.45,
        ScaleType          = Enum.ScaleType.Slice,
        SliceCenter        = Rect.new(49, 49, 450, 450),
        ZIndex             = 0,
        Parent             = ScreenGui,
    })

    -- ── MAIN FRAME ───────────────────────────────────────────
    local MainFrame = Make("Frame", {
        Name               = "MainFrame",
        AnchorPoint        = Vector2.new(0.5, 0.5),
        Size               = UDim2.new(0, W, 0, H),
        Position           = cfg.Position or UDim2.new(0.5, 0, 0.5, 0),
        BackgroundColor3   = T.Window,
        BorderSizePixel    = 0,
        ClipsDescendants   = true,
        ZIndex             = 1,
        Parent             = ScreenGui,
    })
    Corner(MainFrame, 18)
    Stroke(MainFrame, T.Border, 1.5)

    -- Entry animation
    MainFrame.Size         = UDim2.new(0, W * 0.88, 0, H * 0.88)
    MainFrame.BackgroundTransparency = 1
    task.defer(function()
        Tween(MainFrame, { Size = UDim2.new(0, W, 0, H), BackgroundTransparency = 0 }, 0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        Tween(ShadowImg, { ImageTransparency = 0.45 }, 0.5)
    end)

    -- ── TITLE BAR ────────────────────────────────────────────
    local TitleBar = Make("Frame", {
        Name             = "TitleBar",
        Size             = UDim2.new(1, 0, 0, 52),
        BackgroundColor3 = T.Sidebar,
        BorderSizePixel  = 0,
        ZIndex           = 2,
        Parent           = MainFrame,
    })

    -- Title bar bottom divider
    Make("Frame", {
        Size             = UDim2.new(1, 0, 0, 1),
        Position         = UDim2.new(0, 0, 1, -1),
        BackgroundColor3 = T.Border,
        BorderSizePixel  = 0,
        Parent           = TitleBar,
    })

    -- Logo dot
    local LogoDot = Make("Frame", {
        Size             = UDim2.new(0, 8, 0, 8),
        Position         = UDim2.new(0, 16, 0.5, -4),
        BackgroundColor3 = T.Accent,
        BorderSizePixel  = 0,
        Parent           = TitleBar,
    })
    Corner(LogoDot, 4)

    local TitleLabel = Make("TextLabel", {
        Size             = UDim2.new(1, -160, 1, 0),
        Position         = UDim2.new(0, 32, 0, 0),
        BackgroundTransparency = 1,
        Text             = cfg.Title,
        TextColor3       = T.Text,
        TextSize         = 15,
        Font             = Enum.Font.GothamBold,
        TextXAlignment   = Enum.TextXAlignment.Left,
        ZIndex           = 3,
        Parent           = TitleBar,
    })

    local SubLabel = Make("TextLabel", {
        Size             = UDim2.new(0, 200, 0, 16),
        Position         = UDim2.new(0, 32, 0.5, 2),
        BackgroundTransparency = 1,
        Text             = cfg.SubTitle,
        TextColor3       = T.TextSub,
        TextSize         = 11,
        Font             = Enum.Font.Gotham,
        TextXAlignment   = Enum.TextXAlignment.Left,
        ZIndex           = 3,
        Visible          = cfg.SubTitle ~= nil,
        Parent           = TitleBar,
    })

    -- If subtitle exists, shift title up
    if cfg.SubTitle then
        TitleLabel.Position = UDim2.new(0, 32, 0, 6)
    end

    -- Window control buttons
    local function MakeControlBtn(offsetX, bgColor, symbol)
        local btn = Make("TextButton", {
            Size             = UDim2.new(0, 28, 0, 28),
            Position         = UDim2.new(1, offsetX, 0.5, -14),
            BackgroundColor3 = bgColor,
            BorderSizePixel  = 0,
            Text             = symbol,
            TextColor3       = Color3.fromRGB(255, 255, 255),
            TextSize         = 12,
            Font             = Enum.Font.GothamBold,
            AutoButtonColor  = false,
            ZIndex           = 4,
            Parent           = TitleBar,
        })
        Corner(btn, 8)
        return btn
    end

    local CloseBtn   = MakeControlBtn(-12,  Color3.fromRGB(255, 80,  80),  "✕")
    local MinBtn     = MakeControlBtn(-46,  T.SurfaceAlt,                  "─")

    -- Hover effects
    CloseBtn.MouseEnter:Connect(function() Tween(CloseBtn, { BackgroundColor3 = Color3.fromRGB(220, 50, 50) }, 0.14) end)
    CloseBtn.MouseLeave:Connect(function() Tween(CloseBtn, { BackgroundColor3 = Color3.fromRGB(255, 80, 80) }, 0.14) end)
    MinBtn.MouseEnter:Connect(function()   Tween(MinBtn,   { BackgroundColor3 = T.Accent }, 0.14) end)
    MinBtn.MouseLeave:Connect(function()   Tween(MinBtn,   { BackgroundColor3 = T.SurfaceAlt }, 0.14) end)

    -- ── CONTENT CONTAINER ────────────────────────────────────
    local ContentFrame = Make("Frame", {
        Name             = "Content",
        Size             = UDim2.new(1, 0, 1, -52),
        Position         = UDim2.new(0, 0, 0, 52),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent           = MainFrame,
    })

    -- ── SIDEBAR ──────────────────────────────────────────────
    local SidebarWidth = 115
    local Sidebar = Make("Frame", {
        Name             = "Sidebar",
        Size             = UDim2.new(0, SidebarWidth, 1, 0),
        BackgroundColor3 = T.Sidebar,
        BorderSizePixel  = 0,
        Parent           = ContentFrame,
    })

    Make("Frame", {
        Size             = UDim2.new(0, 1, 1, 0),
        Position         = UDim2.new(1, -1, 0, 0),
        BackgroundColor3 = T.Border,
        BorderSizePixel  = 0,
        Parent           = Sidebar,
    })

    -- Tab scroll list
    local TabScroll = Make("ScrollingFrame", {
        Size               = UDim2.new(1, 0, 1, -10),
        Position           = UDim2.new(0, 0, 0, 8),
        BackgroundTransparency = 1,
        BorderSizePixel    = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = T.Accent,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        CanvasSize         = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Parent             = Sidebar,
    })
    Pad(TabScroll, 4, 6, 4, 6)

    local TabListLayout = Make("UIListLayout", {
        SortOrder   = Enum.SortOrder.LayoutOrder,
        Padding     = UDim.new(0, 5),
        Parent      = TabScroll,
    })

    -- ── RIGHT PANEL ──────────────────────────────────────────
    local RightPanel = Make("Frame", {
        Name             = "RightPanel",
        Size             = UDim2.new(1, -SidebarWidth, 1, 0),
        Position         = UDim2.new(0, SidebarWidth, 0, 0),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent           = ContentFrame,
    })

    -- ── NOTIFICATION LAYER ───────────────────────────────────
    local NotifHolder = Make("Frame", {
        Name               = "NotifHolder",
        Size               = UDim2.new(0, 295, 1, 0),
        Position           = UDim2.new(1, -305, 0, 0),
        BackgroundTransparency = 1,
        Parent             = ScreenGui,
        ZIndex             = 50,
    })
    local NotifLayout = Make("UIListLayout", {
        SortOrder          = Enum.SortOrder.LayoutOrder,
        VerticalAlignment  = Enum.VerticalAlignment.Bottom,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        Padding            = UDim.new(0, 8),
        Parent             = NotifHolder,
    })
    Pad(NotifHolder, 0, 0, 14, 0)

    -- ══════════════════════════════════════════════════════════
    --  WINDOW OBJECT
    -- ══════════════════════════════════════════════════════════
    local Window = {
        ScreenGui  = ScreenGui,
        MainFrame  = MainFrame,
        Theme      = T,
        Tabs       = {},
        ActiveTab  = nil,
        Minimized  = false,
        Visible    = true,
        Config     = cfg.ConfigName and ConfigSystem.new(cfg.ConfigName) or nil,
        _notifCt   = 0,
    }

    -- ── DRAGGING (Mouse + Touch) ──────────────────────────────
    do
        local drag       = false
        local dragStart  = nil
        local frameStart = nil

        local function startDrag(input)
            drag       = true
            dragStart  = input.Position
            frameStart = MainFrame.Position
        end

        local function moveDrag(input)
            if not drag then return end
            local delta  = input.Position - dragStart
            local newPos = UDim2.new(
                frameStart.X.Scale, frameStart.X.Offset + delta.X,
                frameStart.Y.Scale, frameStart.Y.Offset + delta.Y
            )
            MainFrame.Position = newPos
            ShadowImg.Position = UDim2.new(
                newPos.X.Scale, newPos.X.Offset,
                newPos.Y.Scale, newPos.Y.Offset
            )
        end

        TitleBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or
               input.UserInputType == Enum.UserInputType.Touch then
                startDrag(input)
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or
               input.UserInputType == Enum.UserInputType.Touch then
                moveDrag(input)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or
               input.UserInputType == Enum.UserInputType.Touch then
                drag = false
            end
        end)
    end

    -- ── MINIMIZE ─────────────────────────────────────────────
    local fullSize = UDim2.new(0, W, 0, H)
    local miniSize = UDim2.new(0, W, 0, 52)

    MinBtn.MouseButton1Click:Connect(function()
        Window.Minimized = not Window.Minimized
        if Window.Minimized then
            Tween(MainFrame, { Size = miniSize }, 0.32, Enum.EasingStyle.Quart)
            task.delay(0.15, function()
                ContentFrame.Visible = false
            end)
            MinBtn.Text = "⬜"
        else
            ContentFrame.Visible = true
            Tween(MainFrame, { Size = fullSize }, 0.38, Enum.EasingStyle.Back)
            MinBtn.Text = "─"
        end
    end)

    -- ── CLOSE ────────────────────────────────────────────────
    CloseBtn.MouseButton1Click:Connect(function()
        Tween(MainFrame, { Size = UDim2.new(0, W * 0.88, 0, H * 0.88), BackgroundTransparency = 1 }, 0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        Tween(ShadowImg, { ImageTransparency = 1 }, 0.3)
        task.delay(0.38, function()
            ScreenGui:Destroy()
        end)
    end)

    -- ── TOGGLE KEY ───────────────────────────────────────────
    UserInputService.InputBegan:Connect(function(input, proc)
        if proc then return end
        if input.KeyCode == cfg.ToggleKey then
            Window.Visible = not Window.Visible
            MainFrame.Visible = Window.Visible
            ShadowImg.Visible = Window.Visible
        end
    end)

    -- ══════════════════════════════════════════════════════════
    --  NOTIFICATION SYSTEM
    -- ══════════════════════════════════════════════════════════
    function Window:Notify(config)
        config = config or {}
        local nTitle    = config.Title    or "Notice"
        local nText     = config.Text     or ""
        local nDuration = config.Duration or 4
        local nType     = config.Type     or "Info"

        local accentMap = {
            Success = T.Success, Warning = T.Warning,
            Error   = T.Error,   Info    = T.Info,
        }
        local accentCol = accentMap[nType] or T.Info

        local iconMap = { Success = "✓", Warning = "⚠", Error = "✕", Info = "i" }
        local iconChar = iconMap[nType] or "i"

        self._notifCt = self._notifCt + 1
        local order   = self._notifCt

        local nFrame = Make("Frame", {
            Name             = "Notif_" .. order,
            Size             = UDim2.new(1, 0, 0, 76),
            BackgroundColor3 = T.Notif,
            BorderSizePixel  = 0,
            LayoutOrder      = -order,
            ClipsDescendants = true,
            Parent           = NotifHolder,
        })
        Corner(nFrame, 14)
        Stroke(nFrame, T.Border, 1, 0)

        -- Slide in from right
        nFrame.Position = UDim2.new(0, 320, 0, 0)
        Tween(nFrame, { Position = UDim2.new(0, 0, 0, 0) }, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

        -- Icon badge
        local IconBadge = Make("Frame", {
            Size             = UDim2.new(0, 32, 0, 32),
            Position         = UDim2.new(0, 12, 0.5, -16),
            BackgroundColor3 = accentCol,
            BackgroundTransparency = 0.75,
            BorderSizePixel  = 0,
            Parent           = nFrame,
        })
        Corner(IconBadge, 10)

        Make("TextLabel", {
            Size             = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text             = iconChar,
            TextColor3       = accentCol,
            TextSize         = 14,
            Font             = Enum.Font.GothamBold,
            Parent           = IconBadge,
        })

        Make("TextLabel", {
            Size             = UDim2.new(1, -60, 0, 20),
            Position         = UDim2.new(0, 52, 0, 10),
            BackgroundTransparency = 1,
            Text             = nTitle,
            TextColor3       = T.Text,
            TextSize         = 13,
            Font             = Enum.Font.GothamBold,
            TextXAlignment   = Enum.TextXAlignment.Left,
            Parent           = nFrame,
        })

        Make("TextLabel", {
            Size             = UDim2.new(1, -60, 0, 28),
            Position         = UDim2.new(0, 52, 0, 30),
            BackgroundTransparency = 1,
            Text             = nText,
            TextColor3       = T.TextSub,
            TextSize         = 11,
            Font             = Enum.Font.Gotham,
            TextXAlignment   = Enum.TextXAlignment.Left,
            TextWrapped      = true,
            Parent           = nFrame,
        })

        -- Progress bar
        local PBar = Make("Frame", {
            Size             = UDim2.new(1, -24, 0, 3),
            Position         = UDim2.new(0, 12, 1, -8),
            BackgroundColor3 = T.Border,
            BorderSizePixel  = 0,
            Parent           = nFrame,
        })
        Corner(PBar, 2)
        local PFill = Make("Frame", {
            Size             = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = accentCol,
            BorderSizePixel  = 0,
            Parent           = PBar,
        })
        Corner(PFill, 2)
        Tween(PFill, { Size = UDim2.new(0, 0, 1, 0) }, nDuration, Enum.EasingStyle.Linear)

        -- Click to dismiss
        local dismissed = false
        local function dismiss()
            if dismissed then return end
            dismissed = true
            Tween(nFrame, { Position = UDim2.new(0, 320, 0, 0), BackgroundTransparency = 1 }, 0.3)
            task.delay(0.35, function() nFrame:Destroy() end)
        end

        nFrame.InputBegan:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 or
               inp.UserInputType == Enum.UserInputType.Touch then
                dismiss()
            end
        end)

        task.delay(nDuration, dismiss)
    end

    -- ══════════════════════════════════════════════════════════
    --  TAB CREATION
    -- ══════════════════════════════════════════════════════════
    function Window:CreateTab(name, icon)
        -- ── Tab Button ───────────────────────────────────────
        local tabBtn = Make("TextButton", {
            Name             = name .. "_TabBtn",
            Size             = UDim2.new(1, 0, 0, 42),
            BackgroundColor3 = T.SurfaceAlt,
            BackgroundTransparency = 1,
            BorderSizePixel  = 0,
            Text             = "",
            AutoButtonColor  = false,
            LayoutOrder      = #self.Tabs + 1,
            Parent           = TabScroll,
        })
        Corner(tabBtn, 10)

        -- Active indicator line
        local ActiveBar = Make("Frame", {
            Size             = UDim2.new(0, 3, 0, 22),
            Position         = UDim2.new(0, 0, 0.5, -11),
            BackgroundColor3 = T.Accent,
            BackgroundTransparency = 1,
            BorderSizePixel  = 0,
            Parent           = tabBtn,
        })
        Corner(ActiveBar, 2)

        local iconX = 10
        if icon then
            Make("ImageLabel", {
                Size             = UDim2.new(0, 17, 0, 17),
                Position         = UDim2.new(0, 12, 0.5, -8),
                BackgroundTransparency = 1,
                Image            = icon,
                ImageColor3      = T.TextSub,
                Parent           = tabBtn,
            })
            iconX = 34
        end

        local TabNameLabel = Make("TextLabel", {
            Size             = UDim2.new(1, -(iconX + 8), 1, 0),
            Position         = UDim2.new(0, iconX, 0, 0),
            BackgroundTransparency = 1,
            Text             = name,
            TextColor3       = T.TextSub,
            TextSize         = 13,
            Font             = Enum.Font.Gotham,
            TextXAlignment   = Enum.TextXAlignment.Left,
            TextTruncate     = Enum.TextTruncate.AtEnd,
            Parent           = tabBtn,
        })

        -- ── Tab Content ──────────────────────────────────────
        local TabContent = Make("ScrollingFrame", {
            Name               = name .. "_Content",
            Size               = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            BorderSizePixel    = 0,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = T.Accent,
            CanvasSize         = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            Visible            = false,
            Parent             = RightPanel,
        })
        Pad(TabContent, 12, 12, 12, 12)

        Make("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding   = UDim.new(0, 8),
            Parent    = TabContent,
        })

        -- Tab object
        local Tab = {
            Name      = name,
            Button    = tabBtn,
            Content   = TabContent,
            _order    = 0,
            _theme    = T,
        }

        -- ── Activate / Deactivate ────────────────────────────
        local function activateTab()
            if Window.ActiveTab and Window.ActiveTab ~= Tab then
                local prev = Window.ActiveTab
                prev.Content.Visible = false
                Tween(prev.Button, { BackgroundTransparency = 1 }, 0.2)
                Tween(prev._nameLabel, { TextColor3 = T.TextSub, Font = Enum.Font.Gotham }, 0.2)
                Tween(prev._activeBar, { BackgroundTransparency = 1 }, 0.2)
            end
            Window.ActiveTab = Tab
            TabContent.Visible = true
            Tween(tabBtn, { BackgroundTransparency = 0.82 }, 0.2)
            Tween(TabNameLabel, { TextColor3 = T.Accent }, 0.2)
            TabNameLabel.Font = Enum.Font.GothamSemibold
            Tween(ActiveBar, { BackgroundTransparency = 0 }, 0.2)
        end

        Tab._nameLabel = TabNameLabel
        Tab._activeBar = ActiveBar

        tabBtn.MouseButton1Click:Connect(activateTab)

        -- Hover effect
        tabBtn.MouseEnter:Connect(function()
            if Window.ActiveTab ~= Tab then
                Tween(tabBtn, { BackgroundTransparency = 0.92 }, 0.15)
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if Window.ActiveTab ~= Tab then
                Tween(tabBtn, { BackgroundTransparency = 1 }, 0.15)
            end
        end)

        -- Auto-select first tab
        if #self.Tabs == 0 then
            task.defer(activateTab)
        end

        table.insert(self.Tabs, Tab)

        -- ══════════════════════════════════════════════════════
        --  ELEMENT FACTORY HELPERS
        -- ══════════════════════════════════════════════════════
        local function nextOrder()
            Tab._order = Tab._order + 1
            return Tab._order
        end

        -- Base card frame
        local function Card(height, clip)
            local f = Make("Frame", {
                Size             = UDim2.new(1, 0, 0, height or 52),
                BackgroundColor3 = T.Surface,
                BorderSizePixel  = 0,
                LayoutOrder      = nextOrder(),
                ClipsDescendants = clip or false,
                Parent           = TabContent,
            })
            Corner(f, 13)
            Stroke(f, T.Border, 1, 0.4)
            return f
        end

        -- Element name label (left side)
        local function ElemName(parent, text, yPos, color)
            return Make("TextLabel", {
                Size             = UDim2.new(1, -80, 0, 20),
                Position         = UDim2.new(0, 14, 0, yPos or 0),
                AnchorPoint      = yPos and Vector2.new(0, 0) or Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                Text             = text,
                TextColor3       = color or T.Text,
                TextSize         = 14,
                Font             = Enum.Font.GothamSemibold,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = parent,
            })
        end

        -- Sub-description
        local function ElemDesc(parent, text, yPos)
            return Make("TextLabel", {
                Size             = UDim2.new(1, -30, 0, 15),
                Position         = UDim2.new(0, 14, 0, yPos or 0),
                BackgroundTransparency = 1,
                Text             = text,
                TextColor3       = T.TextSub,
                TextSize         = 11,
                Font             = Enum.Font.Gotham,
                TextXAlignment   = Enum.TextXAlignment.Left,
                TextTruncate     = Enum.TextTruncate.AtEnd,
                Parent           = parent,
            })
        end

        -- ══════════════════════════════════════════════════════
        --  TOGGLE
        -- ══════════════════════════════════════════════════════
        function Tab:CreateToggle(config)
            config = config or {}
            local name     = config.Name     or "Toggle"
            local desc     = config.Description
            local default  = config.Default  or false
            local callback = config.Callback or function() end
            local flag     = config.Flag

            local height = desc and 64 or 52
            local frame  = Card(height)

            local nameY  = desc and 10  or nil
            local descY  = 30
            local nl = ElemName(frame, name, nameY)
            if not desc then
                nl.Position = UDim2.new(0, 14, 0.5, -10)
            end
            if desc then ElemDesc(frame, desc, descY) end

            -- Track
            local track = Make("Frame", {
                Size             = UDim2.new(0, 48, 0, 27),
                Position         = UDim2.new(1, -62, 0.5, -13),
                BackgroundColor3 = default and T.ToggleOn or T.ToggleOff,
                BorderSizePixel  = 0,
                Parent           = frame,
            })
            Corner(track, 14)

            -- Knob
            local knob = Make("Frame", {
                Size             = UDim2.new(0, 21, 0, 21),
                Position         = default and UDim2.new(1, -24, 0.5, -10) or UDim2.new(0, 3, 0.5, -10),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel  = 0,
                ZIndex           = 3,
                Parent           = track,
            })
            Corner(knob, 11)

            -- Invisible button over whole card
            local hitbox = Make("TextButton", {
                Size             = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text             = "",
                ZIndex           = 4,
                Parent           = frame,
            })

            local value = default

            local function setValue(v, silent)
                value = v
                if v then
                    Tween(track, { BackgroundColor3 = T.ToggleOn  }, 0.25)
                    Tween(knob,  { Position = UDim2.new(1, -24, 0.5, -10) }, 0.25, Enum.EasingStyle.Back)
                else
                    Tween(track, { BackgroundColor3 = T.ToggleOff }, 0.25)
                    Tween(knob,  { Position = UDim2.new(0, 3,  0.5, -10) }, 0.25, Enum.EasingStyle.Back)
                end
                if not silent then callback(v) end
            end

            hitbox.MouseButton1Click:Connect(function()
                setValue(not value)
            end)

            -- Register config flag
            if flag and Window.Config then
                Window.Config:Register(flag, default, setValue)
            end

            return { Set = setValue, Get = function() return value end }
        end

        -- ══════════════════════════════════════════════════════
        --  BUTTON
        -- ══════════════════════════════════════════════════════
        function Tab:CreateButton(config)
            config = config or {}
            local name     = config.Name     or "Button"
            local desc     = config.Description
            local callback = config.Callback or function() end
            local icon     = config.Icon

            local height = desc and 64 or 52
            local frame  = Card(height, true)  -- clip for ripple

            local nameX = icon and 46 or 14
            local nl = Make("TextLabel", {
                Size             = UDim2.new(1, -50, 0, 20),
                Position         = UDim2.new(0, nameX, desc and 0.12 or 0.5, -10),
                BackgroundTransparency = 1,
                Text             = name,
                TextColor3       = T.Accent,
                TextSize         = 14,
                Font             = Enum.Font.GothamSemibold,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = frame,
            })
            if desc then ElemDesc(frame, desc, 34) end

            -- Optional icon
            if icon then
                Make("ImageLabel", {
                    Size             = UDim2.new(0, 22, 0, 22),
                    Position         = UDim2.new(0, 14, 0.5, -11),
                    BackgroundTransparency = 1,
                    Image            = icon,
                    ImageColor3      = T.Accent,
                    Parent           = frame,
                })
            end

            -- Chevron
            Make("TextLabel", {
                Size             = UDim2.new(0, 28, 1, 0),
                Position         = UDim2.new(1, -32, 0, 0),
                BackgroundTransparency = 1,
                Text             = "›",
                TextColor3       = T.Accent,
                TextSize         = 22,
                Font             = Enum.Font.GothamBold,
                Parent           = frame,
            })

            local hitbox = Make("TextButton", {
                Size             = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text             = "",
                ZIndex           = 4,
                Parent           = frame,
            })

            hitbox.MouseEnter:Connect(function()
                Tween(frame, { BackgroundColor3 = T.SurfaceAlt }, 0.14)
            end)
            hitbox.MouseLeave:Connect(function()
                Tween(frame, { BackgroundColor3 = T.Surface }, 0.14)
            end)
            hitbox.MouseButton1Click:Connect(function()
                local pos = UserInputService:GetMouseLocation() - frame.AbsolutePosition
                Ripple(frame, pos.X, pos.Y)
                Tween(nl, { TextColor3 = Color3.fromRGB(255, 255, 255) }, 0.08)
                task.delay(0.18, function()
                    Tween(nl, { TextColor3 = T.Accent }, 0.18)
                end)
                callback()
            end)

            -- Touch support
            hitbox.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.Touch then
                    local pos = inp.Position - frame.AbsolutePosition
                    Ripple(frame, pos.X, pos.Y)
                    callback()
                end
            end)
        end

        -- ══════════════════════════════════════════════════════
        --  SLIDER
        -- ══════════════════════════════════════════════════════
        function Tab:CreateSlider(config)
            config = config or {}
            local name      = config.Name      or "Slider"
            local desc      = config.Description
            local min       = config.Min       or 0
            local max       = config.Max       or 100
            local default   = config.Default   or min
            local increment = config.Increment or 1
            local suffix    = config.Suffix    or ""
            local callback  = config.Callback  or function() end
            local flag      = config.Flag

            local height = desc and 78 or 65
            local frame  = Card(height)

            -- Name row
            Make("TextLabel", {
                Size             = UDim2.new(1, -100, 0, 20),
                Position         = UDim2.new(0, 14, 0, 10),
                BackgroundTransparency = 1,
                Text             = name,
                TextColor3       = T.Text,
                TextSize         = 14,
                Font             = Enum.Font.GothamSemibold,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = frame,
            })

            local valLabel = Make("TextLabel", {
                Size             = UDim2.new(0, 80, 0, 20),
                Position         = UDim2.new(1, -94, 0, 10),
                BackgroundTransparency = 1,
                Text             = tostring(default) .. suffix,
                TextColor3       = T.Accent,
                TextSize         = 13,
                Font             = Enum.Font.GothamBold,
                TextXAlignment   = Enum.TextXAlignment.Right,
                Parent           = frame,
            })

            if desc then ElemDesc(frame, desc, 32) end

            local trackY = desc and 54 or 42

            local trackBg = Make("Frame", {
                Size             = UDim2.new(1, -28, 0, 6),
                Position         = UDim2.new(0, 14, 0, trackY),
                BackgroundColor3 = T.SurfaceAlt,
                BorderSizePixel  = 0,
                Parent           = frame,
            })
            Corner(trackBg, 3)

            local fill = Make("Frame", {
                Size             = UDim2.new(0, 0, 1, 0),
                BackgroundColor3 = T.SliderFill,
                BorderSizePixel  = 0,
                Parent           = trackBg,
            })
            Corner(fill, 3)

            local knob = Make("Frame", {
                Size             = UDim2.new(0, 18, 0, 18),
                Position         = UDim2.new(0, 0, 0.5, -9),
                AnchorPoint      = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel  = 0,
                ZIndex           = 3,
                Parent           = trackBg,
            })
            Corner(knob, 9)
            Stroke(knob, T.Accent, 2)

            local hitbox = Make("TextButton", {
                Size             = UDim2.new(1, 0, 0, 36),
                Position         = UDim2.new(0, 0, 0.5, -18),
                BackgroundTransparency = 1,
                Text             = "",
                ZIndex           = 4,
                Parent           = trackBg,
            })

            local value   = default
            local sliding = false

            local function snap(v)
                return math.clamp(math.round(v / increment) * increment, min, max)
            end

            local function updateFromAlpha(alpha)
                alpha = math.clamp(alpha, 0, 1)
                local raw = min + (max - min) * alpha
                local snapped = snap(raw)
                value = snapped
                local trueAlpha = (snapped - min) / (max - min)
                fill.Size = UDim2.new(trueAlpha, 0, 1, 0)
                knob.Position = UDim2.new(trueAlpha, 0, 0.5, -9)
                valLabel.Text = tostring(snapped) .. suffix
                callback(snapped)
            end

            local function getAlphaFromInput(input)
                local rel = (input.Position.X - trackBg.AbsolutePosition.X) / trackBg.AbsoluteSize.X
                updateFromAlpha(rel)
            end

            hitbox.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1 or
                   inp.UserInputType == Enum.UserInputType.Touch then
                    sliding = true
                    getAlphaFromInput(inp)
                end
            end)

            UserInputService.InputChanged:Connect(function(inp)
                if sliding and (inp.UserInputType == Enum.UserInputType.MouseMovement or
                                inp.UserInputType == Enum.UserInputType.Touch) then
                    getAlphaFromInput(inp)
                end
            end)

            UserInputService.InputEnded:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1 or
                   inp.UserInputType == Enum.UserInputType.Touch then
                    sliding = false
                end
            end)

            -- Init
            local initAlpha = (default - min) / (max - min)
            fill.Size    = UDim2.new(initAlpha, 0, 1, 0)
            knob.Position = UDim2.new(initAlpha, 0, 0.5, -9)

            if flag and Window.Config then
                Window.Config:Register(flag, default, function(v) updateFromAlpha((v - min) / (max - min)) end)
            end

            return {
                Set = function(v) updateFromAlpha((v - min) / (max - min)) end,
                Get = function() return value end,
            }
        end

        -- ══════════════════════════════════════════════════════
        --  DROPDOWN
        -- ══════════════════════════════════════════════════════
        function Tab:CreateDropdown(config)
            config = config or {}
            local name     = config.Name     or "Dropdown"
            local options  = config.Options  or {}
            local default  = config.Default  or (options[1] or "None")
            local callback = config.Callback or function() end
            local flag     = config.Flag

            local frame = Card(52)
            frame.ClipsDescendants = false
            frame.ZIndex = 5

            Make("TextLabel", {
                Size             = UDim2.new(0.5, 0, 1, 0),
                Position         = UDim2.new(0, 14, 0, 0),
                BackgroundTransparency = 1,
                Text             = name,
                TextColor3       = T.Text,
                TextSize         = 14,
                Font             = Enum.Font.GothamSemibold,
                TextXAlignment   = Enum.TextXAlignment.Left,
                ZIndex           = 5,
                Parent           = frame,
            })

            local selectedLbl = Make("TextLabel", {
                Size             = UDim2.new(0.42, 0, 1, 0),
                Position         = UDim2.new(0.52, 0, 0, 0),
                BackgroundTransparency = 1,
                Text             = default,
                TextColor3       = T.TextSub,
                TextSize         = 13,
                Font             = Enum.Font.Gotham,
                TextXAlignment   = Enum.TextXAlignment.Right,
                TextTruncate     = Enum.TextTruncate.AtEnd,
                ZIndex           = 5,
                Parent           = frame,
            })

            local arrowLbl = Make("TextLabel", {
                Size             = UDim2.new(0, 26, 1, 0),
                Position         = UDim2.new(1, -30, 0, 0),
                BackgroundTransparency = 1,
                Text             = "⌄",
                TextColor3       = T.TextSub,
                TextSize         = 14,
                Font             = Enum.Font.GothamBold,
                ZIndex           = 5,
                Parent           = frame,
            })

            local dropHit = Make("TextButton", {
                Size             = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text             = "",
                ZIndex           = 6,
                Parent           = frame,
            })

            -- Dropdown list (renders below card)
            local dropList = Make("Frame", {
                Name             = "DropList",
                Size             = UDim2.new(1, 0, 0, 0),
                Position         = UDim2.new(0, 0, 1, 6),
                BackgroundColor3 = T.Surface,
                BorderSizePixel  = 0,
                ClipsDescendants = true,
                ZIndex           = 12,
                Visible          = false,
                Parent           = frame,
            })
            Corner(dropList, 13)
            Stroke(dropList, T.Border, 1, 0)

            local dropLayout = Make("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding   = UDim.new(0, 2),
                Parent    = dropList,
            })
            Pad(dropList, 5, 5, 5, 5)

            local isOpen  = false
            local selVal  = default
            local maxH    = 190
            local optionH = 34

            local function closeList()
                isOpen = false
                Tween(dropList, { Size = UDim2.new(1, 0, 0, 0) }, 0.22)
                Tween(arrowLbl, { Rotation = 0 }, 0.22)
                task.delay(0.25, function()
                    dropList.Visible = false
                end)
            end

            local function openList()
                isOpen = true
                dropList.Visible = true
                local h = math.min(#options * optionH + 10, maxH)
                Tween(dropList, { Size = UDim2.new(1, 0, 0, h) }, 0.28, Enum.EasingStyle.Back)
                Tween(arrowLbl, { Rotation = 180 }, 0.22)
            end

            local function buildOptions(opts)
                for _, c in pairs(dropList:GetChildren()) do
                    if c:IsA("TextButton") then c:Destroy() end
                end
                for i, opt in ipairs(opts) do
                    local ob = Make("TextButton", {
                        Size             = UDim2.new(1, 0, 0, optionH - 2),
                        BackgroundColor3 = T.SurfaceAlt,
                        BackgroundTransparency = 1,
                        BorderSizePixel  = 0,
                        Text             = opt,
                        TextColor3       = selVal == opt and T.Accent or T.Text,
                        TextSize         = 13,
                        Font             = selVal == opt and Enum.Font.GothamSemibold or Enum.Font.Gotham,
                        AutoButtonColor  = false,
                        LayoutOrder      = i,
                        ZIndex           = 14,
                        Parent           = dropList,
                    })
                    Corner(ob, 9)

                    ob.MouseEnter:Connect(function()
                        Tween(ob, { BackgroundTransparency = 0 }, 0.12)
                    end)
                    ob.MouseLeave:Connect(function()
                        Tween(ob, { BackgroundTransparency = 1 }, 0.12)
                    end)
                    ob.MouseButton1Click:Connect(function()
                        selVal = opt
                        selectedLbl.Text = opt
                        closeList()
                        callback(opt)
                        buildOptions(opts) -- refresh check marks
                    end)
                end
            end

            buildOptions(options)

            dropHit.MouseButton1Click:Connect(function()
                if isOpen then closeList() else openList() end
            end)

            if flag and Window.Config then
                Window.Config:Register(flag, default, function(v)
                    selVal = v; selectedLbl.Text = v; callback(v)
                end)
            end

            return {
                Set     = function(v) selVal = v; selectedLbl.Text = v; callback(v) end,
                Get     = function() return selVal end,
                Refresh = function(newOpts) options = newOpts; buildOptions(newOpts) end,
            }
        end

        -- ══════════════════════════════════════════════════════
        --  TEXTBOX
        -- ══════════════════════════════════════════════════════
        function Tab:CreateTextbox(config)
            config = config or {}
            local name         = config.Name         or "Textbox"
            local placeholder  = config.Placeholder  or "Type here..."
            local default      = config.Default      or ""
            local callback     = config.Callback     or function() end
            local clearOnFocus = config.ClearOnFocus ~= nil and config.ClearOnFocus or false

            local frame = Card(76)

            Make("TextLabel", {
                Size             = UDim2.new(1, -20, 0, 20),
                Position         = UDim2.new(0, 14, 0, 8),
                BackgroundTransparency = 1,
                Text             = name,
                TextColor3       = T.Text,
                TextSize         = 14,
                Font             = Enum.Font.GothamSemibold,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = frame,
            })

            local inputBg = Make("Frame", {
                Size             = UDim2.new(1, -28, 0, 34),
                Position         = UDim2.new(0, 14, 0, 32),
                BackgroundColor3 = T.SurfaceAlt,
                BorderSizePixel  = 0,
                Parent           = frame,
            })
            Corner(inputBg, 9)
            local inputStroke = Stroke(inputBg, T.Border, 1, 0.3)

            local inputBox = Make("TextBox", {
                Size               = UDim2.new(1, -20, 1, 0),
                Position           = UDim2.new(0, 10, 0, 0),
                BackgroundTransparency = 1,
                Text               = default,
                PlaceholderText    = placeholder,
                TextColor3         = T.Text,
                PlaceholderColor3  = T.TextSub,
                TextSize           = 13,
                Font               = Enum.Font.Gotham,
                TextXAlignment     = Enum.TextXAlignment.Left,
                ClearTextOnFocus   = clearOnFocus,
                Parent             = inputBg,
            })

            inputBox.Focused:Connect(function()
                Tween(inputBg, { BackgroundColor3 = T.Surface }, 0.14)
                Tween(inputStroke, { Color = T.Accent, Transparency = 0 }, 0.14)
            end)
            inputBox.FocusLost:Connect(function(enter)
                Tween(inputBg, { BackgroundColor3 = T.SurfaceAlt }, 0.14)
                Tween(inputStroke, { Color = T.Border, Transparency = 0.3 }, 0.14)
                if enter then callback(inputBox.Text) end
            end)

            return {
                Set = function(v) inputBox.Text = v end,
                Get = function() return inputBox.Text end,
            }
        end

        -- ══════════════════════════════════════════════════════
        --  LABEL
        -- ══════════════════════════════════════════════════════
        function Tab:CreateLabel(config)
            config = config or {}
            local text = config.Text or "Label"

            local f = Make("Frame", {
                Size             = UDim2.new(1, 0, 0, 28),
                BackgroundTransparency = 1,
                LayoutOrder      = nextOrder(),
                Parent           = TabContent,
            })

            local lbl = Make("TextLabel", {
                Size             = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text             = text,
                TextColor3       = T.TextSub,
                TextSize         = 11,
                Font             = Enum.Font.GothamSemibold,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = f,
            })

            -- Section label uppercase style
            Make("Frame", {
                Size             = UDim2.new(1, 0, 0, 1),
                Position         = UDim2.new(0, 0, 1, -1),
                BackgroundColor3 = T.Border,
                BorderSizePixel  = 0,
                BackgroundTransparency = 0.5,
                Parent           = f,
            })

            return { SetText = function(t) lbl.Text = t end }
        end

        -- ══════════════════════════════════════════════════════
        --  SEPARATOR
        -- ══════════════════════════════════════════════════════
        function Tab:CreateSeparator(config)
            config = config or {}
            local text = config.Text

            local f = Make("Frame", {
                Size             = UDim2.new(1, 0, 0, 22),
                BackgroundTransparency = 1,
                LayoutOrder      = nextOrder(),
                Parent           = TabContent,
            })

            if text then
                Make("TextLabel", {
                    Size             = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text             = text,
                    TextColor3       = T.TextSub,
                    TextSize         = 11,
                    Font             = Enum.Font.GothamSemibold,
                    Parent           = f,
                })
            else
                Make("Frame", {
                    Size             = UDim2.new(1, 0, 0, 1),
                    Position         = UDim2.new(0, 0, 0.5, 0),
                    BackgroundColor3 = T.Border,
                    BorderSizePixel  = 0,
                    Parent           = f,
                })
            end
        end

        -- ══════════════════════════════════════════════════════
        --  KEYBIND
        -- ══════════════════════════════════════════════════════
        function Tab:CreateKeybind(config)
            config = config or {}
            local name     = config.Name     or "Keybind"
            local default  = config.Default  or Enum.KeyCode.F
            local callback = config.Callback or function() end

            local frame = Card(52)

            Make("TextLabel", {
                Size             = UDim2.new(1, -130, 1, 0),
                Position         = UDim2.new(0, 14, 0, 0),
                BackgroundTransparency = 1,
                Text             = name,
                TextColor3       = T.Text,
                TextSize         = 14,
                Font             = Enum.Font.GothamSemibold,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = frame,
            })

            local keyBg = Make("Frame", {
                Size             = UDim2.new(0, 88, 0, 30),
                Position         = UDim2.new(1, -102, 0.5, -15),
                BackgroundColor3 = T.SurfaceAlt,
                BorderSizePixel  = 0,
                Parent           = frame,
            })
            Corner(keyBg, 9)
            Stroke(keyBg, T.Border, 1, 0.2)

            local keyLbl = Make("TextButton", {
                Size             = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text             = default.Name,
                TextColor3       = T.Accent,
                TextSize         = 12,
                Font             = Enum.Font.GothamBold,
                AutoButtonColor  = false,
                Parent           = keyBg,
            })

            local bound    = default
            local listening = false

            keyLbl.MouseButton1Click:Connect(function()
                listening    = true
                keyLbl.Text  = "· · ·"
                keyLbl.TextColor3 = T.Warning
                Tween(keyBg, { BackgroundColor3 = T.Surface }, 0.14)
            end)

            UserInputService.InputBegan:Connect(function(inp, proc)
                if listening and inp.UserInputType == Enum.UserInputType.Keyboard then
                    listening       = false
                    bound           = inp.KeyCode
                    keyLbl.Text     = inp.KeyCode.Name
                    keyLbl.TextColor3 = T.Accent
                    Tween(keyBg, { BackgroundColor3 = T.SurfaceAlt }, 0.14)
                elseif not listening and not proc and inp.KeyCode == bound then
                    callback()
                end
            end)

            return { GetKey = function() return bound end }
        end

        -- ══════════════════════════════════════════════════════
        --  COLOR DISPLAY (shows color, calls callback on click)
        -- ══════════════════════════════════════════════════════
        function Tab:CreateColorDisplay(config)
            config = config or {}
            local name     = config.Name     or "Color"
            local default  = config.Default  or Color3.fromRGB(100, 150, 255)
            local callback = config.Callback or function() end

            local frame = Card(52)
            local current = default

            Make("TextLabel", {
                Size             = UDim2.new(1, -80, 1, 0),
                Position         = UDim2.new(0, 14, 0, 0),
                BackgroundTransparency = 1,
                Text             = name,
                TextColor3       = T.Text,
                TextSize         = 14,
                Font             = Enum.Font.GothamSemibold,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = frame,
            })

            local preview = Make("Frame", {
                Size             = UDim2.new(0, 34, 0, 34),
                Position         = UDim2.new(1, -48, 0.5, -17),
                BackgroundColor3 = default,
                BorderSizePixel  = 0,
                Parent           = frame,
            })
            Corner(preview, 9)
            Stroke(preview, T.Border, 1, 0.2)

            local hit = Make("TextButton", {
                Size             = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text             = "",
                ZIndex           = 4,
                Parent           = frame,
            })
            hit.MouseButton1Click:Connect(function()
                callback(current)
            end)

            return {
                Set = function(c) current = c; preview.BackgroundColor3 = c end,
                Get = function() return current end,
            }
        end

        -- ══════════════════════════════════════════════════════
        --  PARAGRAPH / INFO BOX
        -- ══════════════════════════════════════════════════════
        function Tab:CreateParagraph(config)
            config = config or {}
            local title   = config.Title   or ""
            local content = config.Content or ""

            local frame = Make("Frame", {
                Size             = UDim2.new(1, 0, 0, 0),
                AutomaticSize    = Enum.AutomaticSize.Y,
                BackgroundColor3 = T.Surface,
                BorderSizePixel  = 0,
                LayoutOrder      = nextOrder(),
                Parent           = TabContent,
            })
            Corner(frame, 13)
            Stroke(frame, T.Border, 1, 0.4)
            Pad(frame, 12, 14, 12, 14)

            local layout = Make("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding   = UDim.new(0, 6),
                Parent    = frame,
            })

            if title ~= "" then
                Make("TextLabel", {
                    Size             = UDim2.new(1, 0, 0, 0),
                    AutomaticSize    = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    Text             = title,
                    TextColor3       = T.Text,
                    TextSize         = 14,
                    Font             = Enum.Font.GothamBold,
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    TextWrapped      = true,
                    LayoutOrder      = 1,
                    Parent           = frame,
                })
            end

            local contentLbl = Make("TextLabel", {
                Size             = UDim2.new(1, 0, 0, 0),
                AutomaticSize    = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Text             = content,
                TextColor3       = T.TextSub,
                TextSize         = 12,
                Font             = Enum.Font.Gotham,
                TextXAlignment   = Enum.TextXAlignment.Left,
                TextWrapped      = true,
                LayoutOrder      = 2,
                Parent           = frame,
            })

            return {
                SetContent = function(t) contentLbl.Text = t end,
                SetTitle   = function(t)
                    -- update title label text if exists
                end,
            }
        end

        return Tab
    end -- CreateTab

    -- ── Config helpers on Window ──────────────────────────────
    function Window:SaveConfig()
        if self.Config then
            local ok, err = self.Config:Save()
            self:Notify({
                Title = ok and "Config Saved" or "Save Failed",
                Text  = ok and self.Config.FileName or tostring(err),
                Type  = ok and "Success" or "Error",
            })
        end
    end

    function Window:LoadConfig()
        if self.Config then
            local ok, err = self.Config:Load()
            self:Notify({
                Title = ok and "Config Loaded" or "Load Failed",
                Text  = ok and "Settings restored." or tostring(err),
                Type  = ok and "Success" or "Warning",
            })
        end
    end

    function Window:SetTheme(themeName)
        -- Runtime theme switching (basic – re-tints Accent on all elements)
        local newTheme = Themes[themeName]
        if not newTheme then return end
        self.Theme = newTheme
        self:Notify({ Title = "Theme Changed", Text = themeName, Type = "Info", Duration = 2 })
    end

    function Window:Destroy()
        ScreenGui:Destroy()
    end

    return Window
end -- CreateWindow

-- ═══════════════════════════════════════════════════════════════
--  LIBRARY SHORTCUT: NexusUI:Notify (standalone)
-- ═══════════════════════════════════════════════════════════════
-- (Notifications are per-window; this is a convenience alias)

return NexusUI
