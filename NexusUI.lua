--[[
╔══════════════════════════════════════════════════════════════════╗
║                   NexusUI  •  v3.0                               ║
║         iOS-Inspired Roblox UI Library                           ║
║         Mobile + PC  •  No Cut-off  •  Easy API                  ║
╚══════════════════════════════════════════════════════════════════╝

  USAGE:
    local NexusUI = loadstring(game:HttpGet("RAW_URL"))()
    local Win = NexusUI:CreateWindow({
        Title     = "My Script",
        SubTitle  = "v1.0",
        Theme     = "Dark",              -- Dark|Ocean|Purple|Rose|Light
        ToggleKey = Enum.KeyCode.RightShift,
        ConfigName = "MyScript",         -- optional, enables save/load
    })
    local Tab = Win:CreateTab("Main")
    Tab:CreateToggle({ Name="Auto Farm", Default=false,
        Callback=function(v) print(v) end })
    Tab:CreateButton({ Name="Click Me",
        Callback=function() print("clicked") end })
    Tab:CreateSlider({ Name="Speed", Min=16, Max=250, Default=16,
        Callback=function(v) print(v) end })
    Tab:CreateDropdown({ Name="Mode", Options={"A","B","C"},
        Callback=function(v) print(v) end })
    Win:Notify({ Title="Ready", Text="NexusUI loaded!", Type="Success" })
]]

-- ═══════════════════════════════════════════════════════════════
--  SERVICES
-- ═══════════════════════════════════════════════════════════════
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players          = game:GetService("Players")
local HttpService      = game:GetService("HttpService")
local LocalPlayer      = Players.LocalPlayer

-- ═══════════════════════════════════════════════════════════════
--  THEMES
-- ═══════════════════════════════════════════════════════════════
local Themes = {
    Dark = {
        Window     = Color3.fromRGB(16, 16, 22),
        Surface    = Color3.fromRGB(26, 26, 36),
        SurfaceAlt = Color3.fromRGB(34, 34, 48),
        Sidebar    = Color3.fromRGB(20, 20, 28),
        Accent     = Color3.fromRGB(108, 138, 255),
        Text       = Color3.fromRGB(235, 235, 255),
        TextSub    = Color3.fromRGB(140, 140, 175),
        Border     = Color3.fromRGB(48, 48, 68),
        ToggleOff  = Color3.fromRGB(55, 55, 75),
        ToggleOn   = Color3.fromRGB(55, 210, 115),
        SliderFill = Color3.fromRGB(108, 138, 255),
        Success    = Color3.fromRGB(55, 210, 115),
        Warning    = Color3.fromRGB(255, 185, 50),
        Error      = Color3.fromRGB(255, 80, 80),
        Info       = Color3.fromRGB(108, 138, 255),
    },
    Ocean = {
        Window     = Color3.fromRGB(8, 16, 30),
        Surface    = Color3.fromRGB(12, 26, 50),
        SurfaceAlt = Color3.fromRGB(16, 36, 66),
        Sidebar    = Color3.fromRGB(10, 20, 38),
        Accent     = Color3.fromRGB(0, 195, 255),
        Text       = Color3.fromRGB(210, 240, 255),
        TextSub    = Color3.fromRGB(100, 160, 210),
        Border     = Color3.fromRGB(22, 55, 95),
        ToggleOff  = Color3.fromRGB(25, 50, 82),
        ToggleOn   = Color3.fromRGB(0, 195, 255),
        SliderFill = Color3.fromRGB(0, 195, 255),
        Success    = Color3.fromRGB(50, 210, 130),
        Warning    = Color3.fromRGB(255, 185, 50),
        Error      = Color3.fromRGB(255, 80, 80),
        Info       = Color3.fromRGB(0, 195, 255),
    },
    Purple = {
        Window     = Color3.fromRGB(12, 8, 22),
        Surface    = Color3.fromRGB(22, 16, 40),
        SurfaceAlt = Color3.fromRGB(32, 24, 58),
        Sidebar    = Color3.fromRGB(16, 11, 30),
        Accent     = Color3.fromRGB(165, 82, 255),
        Text       = Color3.fromRGB(235, 225, 255),
        TextSub    = Color3.fromRGB(150, 130, 195),
        Border     = Color3.fromRGB(58, 40, 98),
        ToggleOff  = Color3.fromRGB(48, 35, 78),
        ToggleOn   = Color3.fromRGB(165, 82, 255),
        SliderFill = Color3.fromRGB(165, 82, 255),
        Success    = Color3.fromRGB(55, 210, 115),
        Warning    = Color3.fromRGB(255, 185, 50),
        Error      = Color3.fromRGB(255, 80, 80),
        Info       = Color3.fromRGB(165, 82, 255),
    },
    Rose = {
        Window     = Color3.fromRGB(20, 12, 17),
        Surface    = Color3.fromRGB(34, 18, 26),
        SurfaceAlt = Color3.fromRGB(46, 26, 36),
        Sidebar    = Color3.fromRGB(26, 14, 20),
        Accent     = Color3.fromRGB(255, 90, 128),
        Text       = Color3.fromRGB(255, 232, 240),
        TextSub    = Color3.fromRGB(195, 152, 168),
        Border     = Color3.fromRGB(86, 42, 58),
        ToggleOff  = Color3.fromRGB(68, 35, 50),
        ToggleOn   = Color3.fromRGB(255, 90, 128),
        SliderFill = Color3.fromRGB(255, 90, 128),
        Success    = Color3.fromRGB(55, 210, 115),
        Warning    = Color3.fromRGB(255, 185, 50),
        Error      = Color3.fromRGB(255, 80, 80),
        Info       = Color3.fromRGB(255, 90, 128),
    },
    Light = {
        Window     = Color3.fromRGB(242, 242, 248),
        Surface    = Color3.fromRGB(255, 255, 255),
        SurfaceAlt = Color3.fromRGB(230, 230, 242),
        Sidebar    = Color3.fromRGB(237, 237, 246),
        Accent     = Color3.fromRGB(0, 120, 255),
        Text       = Color3.fromRGB(18, 18, 28),
        TextSub    = Color3.fromRGB(105, 105, 138),
        Border     = Color3.fromRGB(196, 196, 215),
        ToggleOff  = Color3.fromRGB(178, 178, 200),
        ToggleOn   = Color3.fromRGB(38, 198, 95),
        SliderFill = Color3.fromRGB(0, 120, 255),
        Success    = Color3.fromRGB(38, 190, 88),
        Warning    = Color3.fromRGB(212, 142, 18),
        Error      = Color3.fromRGB(218, 48, 48),
        Info       = Color3.fromRGB(0, 120, 255),
    },
}

-- ═══════════════════════════════════════════════════════════════
--  UTILITIES
-- ═══════════════════════════════════════════════════════════════
local function Tween(obj, props, t, style, dir)
    if not obj or not obj.Parent then return end
    local tw = TweenService:Create(obj,
        TweenInfo.new(t or 0.25, style or Enum.EasingStyle.Quart,
                      dir  or Enum.EasingDirection.Out), props)
    tw:Play(); return tw
end

local function New(cls, props)
    local inst = Instance.new(cls)
    for k, v in pairs(props) do
        pcall(function() inst[k] = v end)
    end
    return inst
end

local function Corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 12)
    c.Parent = parent
    return c
end

local function Stroke(parent, color, thickness, transparency)
    local s = Instance.new("UIStroke")
    s.Color        = color        or Color3.new(1,1,1)
    s.Thickness    = thickness    or 1
    s.Transparency = transparency or 0
    s.Parent = parent
    return s
end

local function Pad(parent, top, right, bottom, left)
    local p = Instance.new("UIPadding")
    p.PaddingTop    = UDim.new(0, top    or 0)
    p.PaddingRight  = UDim.new(0, right  or 0)
    p.PaddingBottom = UDim.new(0, bottom or 0)
    p.PaddingLeft   = UDim.new(0, left   or 0)
    p.Parent = parent
end

local function ListLayout(parent, padding)
    local l = Instance.new("UIListLayout")
    l.SortOrder = Enum.SortOrder.LayoutOrder
    l.Padding   = UDim.new(0, padding or 0)
    l.Parent    = parent
    return l
end

local function ViewportSize()
    local cam = workspace:FindFirstChildOfClass("Camera")
    return cam and cam.ViewportSize or Vector2.new(1280, 720)
end

local function Ripple(frame, px, py)
    local r = New("Frame", {
        Size = UDim2.new(0,0,0,0),
        Position = UDim2.new(0, px, 0, py),
        AnchorPoint = Vector2.new(.5,.5),
        BackgroundColor3 = Color3.new(1,1,1),
        BackgroundTransparency = 0.72,
        ZIndex = 30,
        Parent = frame,
    })
    Corner(r, 999)
    local d = math.max(frame.AbsoluteSize.X, frame.AbsoluteSize.Y) * 2.5
    Tween(r, {Size=UDim2.new(0,d,0,d), BackgroundTransparency=1}, 0.5, Enum.EasingStyle.Quad)
    task.delay(0.55, function() if r and r.Parent then r:Destroy() end end)
end

local function MakeScreenGui(name)
    local gui = Instance.new("ScreenGui")
    gui.Name           = name
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.ResetOnSpawn   = false
    gui.DisplayOrder   = 999
    -- IgnoreGuiInset=true: we own the full screen coordinate space.
    -- We manually place the window below the Roblox inset (36px).
    gui.IgnoreGuiInset = true

    local ok = pcall(function()
        if gethui then
            gui.Parent = gethui()
        else
            gui.Parent = game:GetService("CoreGui")
        end
    end)
    if not ok or not gui.Parent then
        gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    return gui
end

-- ═══════════════════════════════════════════════════════════════
--  CONFIG SYSTEM
-- ═══════════════════════════════════════════════════════════════
local ConfigSys = {}
ConfigSys.__index = ConfigSys
function ConfigSys.new(name)
    return setmetatable({
        _file = (name:gsub("%s", "_")) .. "_nexus.json",
        _data = {},
        _cb   = {},
    }, ConfigSys)
end
function ConfigSys:register(flag, default, callback)
    if self._data[flag] == nil then self._data[flag] = default end
    self._cb[flag] = { default = default, callback = callback }
end
function ConfigSys:set(flag, value)
    self._data[flag] = value
    if self._cb[flag] then self._cb[flag].callback(value) end
end
function ConfigSys:get(flag) return self._data[flag] end
function ConfigSys:save()
    if not writefile then return false, "writefile unavailable" end
    local ok, err = pcall(writefile, self._file, HttpService:JSONEncode(self._data))
    return ok, err
end
function ConfigSys:load()
    if not (readfile and isfile and isfile(self._file)) then
        return false, "No config file found"
    end
    local ok, result = pcall(function()
        return HttpService:JSONDecode(readfile(self._file))
    end)
    if ok and type(result) == "table" then
        for k, v in pairs(result) do self:set(k, v) end
        return true
    end
    return false, "Parse error"
end

-- ═══════════════════════════════════════════════════════════════
--  NEXUSUI LIBRARY
-- ═══════════════════════════════════════════════════════════════
local NexusUI   = {}
NexusUI.__index = NexusUI
NexusUI.Version = "3.0.0"
NexusUI.Themes  = Themes

-- ───────────────────────────────────────────────────────────────
function NexusUI:CreateWindow(cfg)
    cfg = cfg or {}
    local T          = Themes[cfg.Theme] or Themes.Dark
    local title      = cfg.Title     or "NexusUI"
    local subtitle   = cfg.SubTitle  -- nil = hide
    local toggleKey  = cfg.ToggleKey or Enum.KeyCode.RightShift
    local cfgSystem  = cfg.ConfigName and ConfigSys.new(cfg.ConfigName) or nil
    local MARGIN     = 20
    local INSET      = 36  -- Roblox mobile top bar height

    -- ── Responsive window size ────────────────────────────────
    -- Caps at developer-provided Size, but never exceeds safe screen area.
    local vp   = ViewportSize()
    local maxW = vp.X - MARGIN * 2
    local maxH = vp.Y - INSET - MARGIN * 2
    local W    = math.floor(math.min(cfg.Size and cfg.Size.X or 480, maxW))
    local H    = math.floor(math.min(cfg.Size and cfg.Size.Y or 560, maxH))

    -- Proportional sidebar (never narrower than 80, never wider than 112)
    local SIDEBAR = math.floor(math.clamp(W * 0.225, 80, 112))
    -- Title bar height
    local TITLE_H  = subtitle and 52 or 48

    -- Starting center position (inside safe area)
    local cx = math.floor(vp.X / 2)
    local cy = math.floor(INSET + (vp.Y - INSET) / 2)

    -- ── ScreenGui ─────────────────────────────────────────────
    local Screen = MakeScreenGui("NexusUI_" .. title)

    --[[
        LAYOUT:
          Screen
            Root            ← draggable container, no bg, no clip
              Shadow        ← ImageLabel, child of Root, always moves with it
              WinFrame      ← actual window, child of Root
                TitleBar
                Body
                  Sidebar
                  RightPanel
            NotifFrame      ← notification stack, anchored bottom-right
    ]]

    -- ── Root: the draggable wrapper ───────────────────────────
    -- Putting Shadow AND WinFrame both inside Root means:
    --   • dragging Root moves both atomically (no sync bugs)
    --   • hiding Root hides both (no ghost shadow)
    --   • minimizing Root resizes both (no oversized shadow)
    local Root = New("Frame", {
        Name             = "Root",
        AnchorPoint      = Vector2.new(0.5, 0.5),
        Position         = UDim2.new(0, cx, 0, cy),
        Size             = UDim2.new(0, W, 0, H),
        BackgroundTransparency = 1,
        ClipsDescendants = false,   -- MUST be false so shadow overflows
        ZIndex           = 1,
        Parent           = Screen,
    })

    -- ── Shadow ────────────────────────────────────────────────
    -- Child of Root. Extends 30px on each side via UDim2 offset.
    -- Starts transparent; fades in with the open animation.
    local Shadow = New("ImageLabel", {
        Name             = "Shadow",
        AnchorPoint      = Vector2.new(0.5, 0.5),
        Size             = UDim2.new(1, 58, 1, 58),
        Position         = UDim2.new(0.5, 0, 0.5, 5),  -- 5px down = depth illusion
        BackgroundTransparency = 1,
        Image            = "rbxassetid://6014261993",
        ImageColor3      = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 1,      -- fades in on open
        ScaleType        = Enum.ScaleType.Slice,
        SliceCenter      = Rect.new(49, 49, 450, 450),
        ZIndex           = 0,
        Parent           = Root,
    })

    -- ── WinFrame (the visible window) ─────────────────────────
    local WinFrame = New("Frame", {
        Name             = "WinFrame",
        Size             = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = T.Window,
        BorderSizePixel  = 0,
        ClipsDescendants = true,
        ZIndex           = 2,
        Parent           = Root,
    })
    Corner(WinFrame, 16)
    local WinStroke = Stroke(WinFrame, T.Border, 1.2, 1) -- starts transparent

    -- ── Open animation ────────────────────────────────────────
    Root.Size = UDim2.new(0, W * 0.85, 0, H * 0.85)
    WinFrame.BackgroundTransparency = 1
    task.defer(function()
        Tween(Root,     {Size = UDim2.new(0, W, 0, H)},     0.40, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        Tween(WinFrame, {BackgroundTransparency = 0},        0.36)
        Tween(WinStroke,{Transparency = 0},                  0.36)
        Tween(Shadow,   {ImageTransparency = 0.40},          0.50)
    end)

    -- ── Title bar ─────────────────────────────────────────────
    -- ClipsDescendants=true so the top corners match WinFrame's 16px radius.
    -- A square-fix Frame covers the bottom two corners so they stay flat.
    local TITLE_BTN_SPACE = 82  -- px reserved on the right for both buttons
    local TitleBar = New("Frame", {
        Name             = "TitleBar",
        Size             = UDim2.new(1, 0, 0, TITLE_H),
        BackgroundColor3 = T.Sidebar,
        BorderSizePixel  = 0,
        ClipsDescendants = true,
        ZIndex           = 5,
        Parent           = WinFrame,
    })
    -- Round all corners, then cover the bottom two with a rect so only top is rounded
    Corner(TitleBar, 16)
    New("Frame", {
        Size = UDim2.new(1,0,0,18), Position = UDim2.new(0,0,1,-18),
        BackgroundColor3 = T.Sidebar, BorderSizePixel = 0, ZIndex = 5, Parent = TitleBar,
    })
    -- Subtle top-to-bottom gradient
    local tg = Instance.new("UIGradient")
    tg.Color = ColorSequence.new(Color3.new(1,1,1), Color3.new(0.9,0.9,0.9))
    tg.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.05),
        NumberSequenceKeypoint.new(1, 0.0),
    })
    tg.Rotation = 90; tg.Parent = TitleBar
    -- Bottom border divider
    New("Frame", {
        Size = UDim2.new(1,0,0,1), Position = UDim2.new(0,0,1,-1),
        BackgroundColor3 = T.Border, BorderSizePixel = 0, ZIndex = 6, Parent = TitleBar,
    })
    -- Accent dot + glow ring
    local DotGlow = New("Frame", {
        Size = UDim2.new(0,14,0,14), Position = UDim2.new(0,12,0.5,-7),
        BackgroundColor3 = T.Accent, BackgroundTransparency = 0.72,
        BorderSizePixel = 0, ZIndex = 5, Parent = TitleBar,
    }); Corner(DotGlow, 7)
    local Dot = New("Frame", {
        Size = UDim2.new(0,8,0,8), Position = UDim2.new(0,15,0.5,-4),
        BackgroundColor3 = T.Accent, BorderSizePixel = 0, ZIndex = 6, Parent = TitleBar,
    }); Corner(Dot, 4)
    -- Title label — width capped so it can never overlap the buttons
    New("TextLabel", {
        Size     = UDim2.new(1, -(TITLE_BTN_SPACE + 32), 0, subtitle and 18 or 20),
        Position = subtitle and UDim2.new(0,32,0,8) or UDim2.new(0,32,0.5,-10),
        BackgroundTransparency = 1, Text = title,
        TextColor3 = T.Text, TextSize = 14, Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 6, Parent = TitleBar,
    })
    if subtitle then
        New("TextLabel", {
            Size     = UDim2.new(1, -(TITLE_BTN_SPACE + 32), 0, 14),
            Position = UDim2.new(0, 32, 0, 28),
            BackgroundTransparency = 1, Text = subtitle,
            TextColor3 = T.TextSub, TextSize = 10, Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 6, Parent = TitleBar,
        })
    end

    -- ── Window control buttons ────────────────────────────────
    -- Only ONE button in the title bar now: Close (✕).
    -- Minimize has been removed; UI hiding is handled by the
    -- floating ToggleBtn at the top-center of the screen instead.
    local BTN_W = 28
    local BTN_H = 28
    local BTN_R = 10   -- right margin from window edge

    local BtnGroup = New("Frame", {
        Size     = UDim2.new(0, BTN_W, 0, BTN_H),
        Position = UDim2.new(1, -(BTN_W + BTN_R), 0.5, -BTN_H/2),
        BackgroundTransparency = 1,
        ZIndex   = 7,
        Parent   = TitleBar,
    })

    local closeBg    = Color3.fromRGB(255, 74, 74)
    local closeHover = Color3.fromRGB(220, 45, 45)
    local CloseBtn = New("TextButton", {
        Size             = UDim2.new(0, BTN_W, 0, BTN_H),
        Position         = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = closeBg,
        BorderSizePixel  = 0,
        Text             = "✕",
        TextColor3       = Color3.new(1, 1, 1),
        TextSize         = 12,
        Font             = Enum.Font.GothamBold,
        AutoButtonColor  = false,
        ZIndex           = 8,
        Parent           = BtnGroup,
    })
    Corner(CloseBtn, 8)
    CloseBtn.MouseEnter:Connect(function() Tween(CloseBtn,{BackgroundColor3=closeHover},0.12) end)
    CloseBtn.MouseLeave:Connect(function() Tween(CloseBtn,{BackgroundColor3=closeBg   },0.12) end)

    -- ── Body ──────────────────────────────────────────────────
    local Body = New("Frame", {
        Name             = "Body",
        Size             = UDim2.new(1, 0, 1, -TITLE_H),
        Position         = UDim2.new(0, 0, 0, TITLE_H),
        BackgroundTransparency = 1,
        ClipsDescendants = false,
        ZIndex           = 3,
        Parent           = WinFrame,
    })

    -- ── Sidebar ───────────────────────────────────────────────
    local Sidebar = New("Frame", {
        Name             = "Sidebar",
        Size             = UDim2.new(0, SIDEBAR, 1, 0),
        BackgroundColor3 = T.Sidebar,
        BorderSizePixel  = 0,
        ZIndex           = 4,
        Parent           = Body,
    })
    -- Right divider line
    New("Frame", {
        Size = UDim2.new(0,1,1,0), Position = UDim2.new(1,-1,0,0),
        BackgroundColor3 = T.Border, BorderSizePixel = 0, ZIndex = 5, Parent = Sidebar,
    })
    local TabScroll = New("ScrollingFrame", {
        Size             = UDim2.new(1, 0, 1, -8),
        Position         = UDim2.new(0, 0, 0, 6),
        BackgroundTransparency = 1,
        BorderSizePixel  = 0,
        ScrollBarThickness    = 2,
        ScrollBarImageColor3  = T.Accent,
        ScrollingDirection    = Enum.ScrollingDirection.Y,
        AutomaticCanvasSize   = Enum.AutomaticSize.Y,
        CanvasSize            = UDim2.new(0,0,0,0),
        ZIndex           = 5,
        Parent           = Sidebar,
    })
    Pad(TabScroll, 4, 5, 4, 5)
    ListLayout(TabScroll, 4)

    -- ── Right panel (content) ─────────────────────────────────
    local RightPanel = New("Frame", {
        Name             = "RightPanel",
        Size             = UDim2.new(1, -SIDEBAR, 1, 0),
        Position         = UDim2.new(0, SIDEBAR, 0, 0),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex           = 4,
        Parent           = Body,
    })

    -- ── Notification container ────────────────────────────────
    -- Fixed to screen bottom-right, completely independent of window
    local NotifFrame = New("Frame", {
        Name             = "Notifs",
        Size             = UDim2.new(0, 295, 1, -54),
        Position         = UDim2.new(1, -305, 0, 44),
        BackgroundTransparency = 1,
        ZIndex           = 80,
        Parent           = Screen,
    })
    local NL = Instance.new("UIListLayout")
    NL.SortOrder           = Enum.SortOrder.LayoutOrder
    NL.VerticalAlignment   = Enum.VerticalAlignment.Bottom
    NL.HorizontalAlignment = Enum.HorizontalAlignment.Right
    NL.Padding             = UDim.new(0, 7)
    NL.Parent              = NotifFrame
    Pad(NotifFrame, 0, 0, 14, 0)

    -- ═══════════════════════════════════════════════════════════
    --  TOGGLE BUTTON  (top-center, replaces minimize)
    -- ═══════════════════════════════════════════════════════════
    --[[
        This floating button appears at the very top-center of the
        player's screen whenever the main UI is hidden.

        HOW TO CHANGE THE ICON:
            Change the string below to any valid rbxassetid.
            Use "" (empty string) to show a text fallback instead.
    ]]
    local TOGGLE_ICON_ID = ""   -- ← paste your icon ID here, e.g. "rbxassetid://1234567"
    local TOGGLE_BTN_SIZE = 42  -- diameter in pixels

    -- Wrapper frame: AnchorPoint=(0.5,0), Position=(0.5,0, 0,20)
    -- This keeps it pixel-perfect at top-center on every device.
    local ToggleWrapper = New("Frame", {
        Name        = "ToggleWrapper",
        AnchorPoint = Vector2.new(0.5, 0),
        Position    = UDim2.new(0.5, 0, 0, 20),
        Size        = UDim2.new(0, TOGGLE_BTN_SIZE + 6, 0, TOGGLE_BTN_SIZE + 6),
        BackgroundTransparency = 1,
        ZIndex      = 90,
        Visible     = false,   -- hidden while the main UI is open
        Parent      = Screen,
    })

    -- Soft glow ring behind the button
    local ToggleGlow = New("Frame", {
        AnchorPoint      = Vector2.new(0.5, 0.5),
        Position         = UDim2.new(0.5, 0, 0.5, 0),
        Size             = UDim2.new(1, 6, 1, 6),
        BackgroundColor3 = T.Accent,
        BackgroundTransparency = 0.72,
        BorderSizePixel  = 0,
        ZIndex           = 90,
        Parent           = ToggleWrapper,
    })
    Corner(ToggleGlow, (TOGGLE_BTN_SIZE + 12) / 2)

    -- The actual ImageButton
    local ToggleBtn = New("ImageButton", {
        Name             = "ToggleBtn",
        AnchorPoint      = Vector2.new(0.5, 0.5),
        Position         = UDim2.new(0.5, 0, 0.5, 0),
        Size             = UDim2.new(0, TOGGLE_BTN_SIZE, 0, TOGGLE_BTN_SIZE),
        BackgroundColor3 = T.Accent,
        BorderSizePixel  = 0,
        -- Image: shows the icon if TOGGLE_ICON_ID is set, blank circle otherwise
        Image            = TOGGLE_ICON_ID,
        ImageColor3      = Color3.new(1, 1, 1),
        ImageTransparency = TOGGLE_ICON_ID == "" and 1 or 0,
        ScaleType        = Enum.ScaleType.Fit,
        AutoButtonColor  = false,
        ZIndex           = 92,
        Parent           = ToggleWrapper,
    })
    Corner(ToggleBtn, TOGGLE_BTN_SIZE / 2)
    Stroke(ToggleBtn, T.Border, 1.5, 0)

    -- Fallback text label (shown when no icon is set)
    local ToggleFallbackLbl = New("TextLabel", {
        Size             = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text             = "☰",
        TextColor3       = Color3.new(1, 1, 1),
        TextSize         = 18,
        Font             = Enum.Font.GothamBold,
        Visible          = TOGGLE_ICON_ID == "",
        ZIndex           = 93,
        Parent           = ToggleBtn,
    })

    -- Hover / press polish
    ToggleBtn.MouseEnter:Connect(function()
        Tween(ToggleBtn, {BackgroundColor3 = T.Accent}, 0.12)
        Tween(ToggleGlow,{BackgroundTransparency = 0.55}, 0.12)
    end)
    ToggleBtn.MouseLeave:Connect(function()
        Tween(ToggleGlow,{BackgroundTransparency = 0.72}, 0.14)
    end)
    ToggleBtn.MouseButton1Down:Connect(function()
        Tween(ToggleBtn, {Size = UDim2.new(0, TOGGLE_BTN_SIZE-4, 0, TOGGLE_BTN_SIZE-4)}, 0.10)
    end)
    ToggleBtn.MouseButton1Up:Connect(function()
        Tween(ToggleBtn, {Size = UDim2.new(0, TOGGLE_BTN_SIZE, 0, TOGGLE_BTN_SIZE)}, 0.14, Enum.EasingStyle.Back)
    end)

    -- Helper: show/hide the main window and swap ToggleBtn visibility
    local function showUI()
        ToggleWrapper.Visible = false
        Root.Visible          = true
        Tween(Root,     {Size = UDim2.new(0, W, 0, H)},     0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        Tween(WinFrame, {BackgroundTransparency = 0},        0.30)
        Tween(WinStroke,{Transparency = 0},                  0.30)
        Tween(Shadow,   {ImageTransparency = 0.40},          0.42)
    end

    local function hideUI()
        -- Shrink-out animation, then show the toggle button
        Tween(Root,     {Size = UDim2.new(0, W*0.88, 0, H*0.88)}, 0.26, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        Tween(WinFrame, {BackgroundTransparency = 1},               0.24)
        Tween(WinStroke,{Transparency = 1},                        0.24)
        Tween(Shadow,   {ImageTransparency = 1},                    0.20)
        task.delay(0.28, function()
            Root.Visible          = false
            ToggleWrapper.Visible = true
            -- Pop the toggle button in
            ToggleBtn.Size = UDim2.new(0, TOGGLE_BTN_SIZE * 0.72, 0, TOGGLE_BTN_SIZE * 0.72)
            Tween(ToggleBtn, {Size = UDim2.new(0, TOGGLE_BTN_SIZE, 0, TOGGLE_BTN_SIZE)},
                  0.30, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        end)
    end

    -- Toggle button click → show the UI
    ToggleBtn.MouseButton1Click:Connect(showUI)
    ToggleBtn.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.Touch then showUI() end
    end)
    -- ═══════════════════════════════════════════════════════════
    --  DRAG SYSTEM  (mouse + touch, clamped to screen edges)
    -- ═══════════════════════════════════════════════════════════
    do
        local dragging   = false
        local dragStart  = nil
        local rootStart  = nil

        -- Clamp so the window can't go off-screen
        local function clampPos(x, y)
            local sv = ViewportSize()
            local hw = Root.AbsoluteSize.X / 2
            local hh = Root.AbsoluteSize.Y / 2
            return math.clamp(x, hw + MARGIN, sv.X - hw - MARGIN),
                   math.clamp(y, hh + INSET,  sv.Y - hh - MARGIN)
        end

        TitleBar.InputBegan:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1
            or inp.UserInputType == Enum.UserInputType.Touch then
                dragging  = true
                dragStart = inp.Position
                rootStart = Root.Position
            end
        end)

        UserInputService.InputChanged:Connect(function(inp)
            if not dragging then return end
            if inp.UserInputType == Enum.UserInputType.MouseMovement
            or inp.UserInputType == Enum.UserInputType.Touch then
                local d  = inp.Position - dragStart
                local nx = rootStart.X.Offset + d.X
                local ny = rootStart.Y.Offset + d.Y
                local cx2, cy2 = clampPos(nx, ny)
                Root.Position = UDim2.new(0, cx2, 0, cy2)
            end
        end)

        UserInputService.InputEnded:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1
            or inp.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
    end

    -- ═══════════════════════════════════════════════════════════
    --  WINDOW OBJECT
    -- ═══════════════════════════════════════════════════════════
    local Window = {
        _screen    = Screen,
        _root      = Root,
        _win       = WinFrame,
        _notifCt   = 0,
        _tabs      = {},
        _activeTab = nil,
        Minimized  = false,
        Visible    = true,
        Config     = cfgSystem,
        Theme      = T,
    }

    -- ── Close button → hide UI, reveal ToggleBtn ──────────────
    -- The window is NOT destroyed. Closing simply hides it and
    -- shows the floating top-center toggle button instead.
    CloseBtn.MouseButton1Click:Connect(hideUI)
    CloseBtn.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.Touch then hideUI() end
    end)

    -- ── Toggle key (keyboard shortcut) ───────────────────────
    -- Pressing ToggleKey mirrors exactly what the close/toggle
    -- button does: shows the UI if hidden, hides it if visible.
    UserInputService.InputBegan:Connect(function(inp, proc)
        if proc then return end
        if inp.KeyCode == toggleKey then
            if Root.Visible then
                hideUI()
            else
                showUI()
            end
        end
    end)

    -- ═══════════════════════════════════════════════════════════
    --  NOTIFICATION SYSTEM
    -- ═══════════════════════════════════════════════════════════
    function Window:Notify(c)
        c = c or {}
        local nTitle = c.Title    or "Notice"
        local nText  = c.Text     or ""
        local nDur   = c.Duration or 4
        local nType  = c.Type     or "Info"

        local colMap  = {Success=T.Success, Warning=T.Warning, Error=T.Error, Info=T.Info}
        local icoMap  = {Success="✓",       Warning="⚠",       Error="✕",    Info="i"}
        local col     = colMap[nType] or T.Info
        local ico     = icoMap[nType] or "i"

        self._notifCt = self._notifCt + 1
        local ord     = self._notifCt

        local nf = New("Frame", {
            Name             = "N"..ord,
            Size             = UDim2.new(1, 0, 0, 72),
            BackgroundColor3 = T.Surface,
            BorderSizePixel  = 0,
            LayoutOrder      = -ord,
            ClipsDescendants = true,
            ZIndex           = 82,
            Parent           = NotifFrame,
        })
        Corner(nf, 13)
        Stroke(nf, T.Border, 1, 0.15)

        -- Slide in from right
        nf.Position = UDim2.new(0, 310, 0, 0)
        Tween(nf, {Position = UDim2.new(0, 0, 0, 0)}, 0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

        -- Accent strip
        local strip = New("Frame", {
            Size = UDim2.new(0,3,1,0), BackgroundColor3 = col,
            BorderSizePixel = 0, ZIndex = 84, Parent = nf,
        }); Corner(strip, 2)

        -- Icon badge
        local ic = New("Frame", {
            Size = UDim2.new(0,30,0,30), Position = UDim2.new(0,12,0.5,-15),
            BackgroundColor3 = col, BackgroundTransparency = 0.78,
            BorderSizePixel = 0, ZIndex = 84, Parent = nf,
        }); Corner(ic, 9)
        New("TextLabel", {
            Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
            Text=ico, TextColor3=col, TextSize=13, Font=Enum.Font.GothamBold,
            ZIndex=85, Parent=ic,
        })

        -- Texts
        New("TextLabel", {
            Size=UDim2.new(1,-54,0,18), Position=UDim2.new(0,48,0,8),
            BackgroundTransparency=1, Text=nTitle,
            TextColor3=T.Text, TextSize=13, Font=Enum.Font.GothamBold,
            TextXAlignment=Enum.TextXAlignment.Left, ZIndex=85, Parent=nf,
        })
        New("TextLabel", {
            Size=UDim2.new(1,-54,0,28), Position=UDim2.new(0,48,0,26),
            BackgroundTransparency=1, Text=nText,
            TextColor3=T.TextSub, TextSize=11, Font=Enum.Font.Gotham,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextWrapped=true, ZIndex=85, Parent=nf,
        })

        -- Progress bar
        local pb = New("Frame", {
            Size=UDim2.new(1,-18,0,2), Position=UDim2.new(0,9,1,-5),
            BackgroundColor3=T.Border, BorderSizePixel=0, ZIndex=84, Parent=nf,
        }); Corner(pb, 1)
        local pf = New("Frame", {
            Size=UDim2.new(1,0,1,0), BackgroundColor3=col,
            BorderSizePixel=0, ZIndex=85, Parent=pb,
        }); Corner(pf, 1)
        Tween(pf, {Size=UDim2.new(0,0,1,0)}, nDur, Enum.EasingStyle.Linear)

        -- Dismiss
        local gone = false
        local function dismiss()
            if gone then return end; gone = true
            Tween(nf, {Position=UDim2.new(0,310,0,0), BackgroundTransparency=1}, 0.26)
            task.delay(0.30, function() if nf and nf.Parent then nf:Destroy() end end)
        end
        nf.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then dismiss() end
        end)
        task.delay(nDur, dismiss)
    end

    -- ═══════════════════════════════════════════════════════════
    --  TAB CREATION
    -- ═══════════════════════════════════════════════════════════
    function Window:CreateTab(name, iconId)

        -- Sidebar button
        local tabBtn = New("TextButton", {
            Name             = name .. "_Btn",
            Size             = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = T.SurfaceAlt,
            BackgroundTransparency = 1,
            BorderSizePixel  = 0,
            Text             = "",
            AutoButtonColor  = false,
            LayoutOrder      = #self._tabs + 1,
            ZIndex           = 6,
            Parent           = TabScroll,
        }); Corner(tabBtn, 9)

        -- Active bar
        local activeBar = New("Frame", {
            Size = UDim2.new(0,3,0,20), Position = UDim2.new(0,0,0.5,-10),
            BackgroundColor3 = T.Accent, BackgroundTransparency = 1,
            BorderSizePixel = 0, ZIndex = 7, Parent = tabBtn,
        }); Corner(activeBar, 2)

        -- Optional icon
        local textOffX = 10
        if iconId then
            New("ImageLabel", {
                Size=UDim2.new(0,15,0,15), Position=UDim2.new(0,11,0.5,-7),
                BackgroundTransparency=1, Image=iconId,
                ImageColor3=T.TextSub, ZIndex=7, Parent=tabBtn,
            })
            textOffX = 31
        end

        local nameLbl = New("TextLabel", {
            Size = UDim2.new(1,-(textOffX+5),1,0),
            Position = UDim2.new(0, textOffX, 0, 0),
            BackgroundTransparency = 1, Text = name,
            TextColor3 = T.TextSub, TextSize = 12,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            ZIndex = 7, Parent = tabBtn,
        })

        -- Content scroll frame
        local contentScroll = New("ScrollingFrame", {
            Name             = name .. "_Content",
            Size             = UDim2.new(1,0,1,0),
            BackgroundTransparency = 1,
            BorderSizePixel  = 0,
            ScrollBarThickness    = 3,
            ScrollBarImageColor3  = T.Accent,
            AutomaticCanvasSize   = Enum.AutomaticSize.Y,
            CanvasSize            = UDim2.new(0,0,0,0),
            ScrollingDirection    = Enum.ScrollingDirection.Y,
            Visible          = false,
            ZIndex           = 5,
            Parent           = RightPanel,
        })
        Pad(contentScroll, 10, 10, 14, 10)
        ListLayout(contentScroll, 7)

        -- Tab object
        local Tab = {
            _content  = contentScroll,
            _btn      = tabBtn,
            _bar      = activeBar,
            _lbl      = nameLbl,
            _itemIdx  = 0,
            T         = T,
        }

        -- Activate / deactivate
        local function activate()
            if Window._activeTab and Window._activeTab ~= Tab then
                local prev = Window._activeTab
                prev._content.Visible = false
                Tween(prev._btn, {BackgroundTransparency = 1},       0.18)
                Tween(prev._lbl, {TextColor3 = T.TextSub},           0.18)
                Tween(prev._bar, {BackgroundTransparency = 1},       0.18)
                prev._lbl.Font = Enum.Font.Gotham
            end
            Window._activeTab = Tab
            contentScroll.Visible = true
            Tween(tabBtn,   {BackgroundTransparency = 0.84}, 0.18)
            Tween(nameLbl,  {TextColor3 = T.Accent},         0.18)
            nameLbl.Font = Enum.Font.GothamSemibold
            Tween(activeBar,{BackgroundTransparency = 0},    0.18)
        end

        tabBtn.MouseButton1Click:Connect(activate)
        tabBtn.MouseEnter:Connect(function()
            if Window._activeTab ~= Tab then
                Tween(tabBtn, {BackgroundTransparency = 0.92}, 0.12)
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if Window._activeTab ~= Tab then
                Tween(tabBtn, {BackgroundTransparency = 1}, 0.12)
            end
        end)
        tabBtn.InputBegan:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.Touch then activate() end
        end)

        -- First tab auto-selected
        if #self._tabs == 0 then task.defer(activate) end
        table.insert(self._tabs, Tab)

        -- ════════════════════════════════════════════════════
        --  ELEMENT FACTORY HELPERS
        -- ════════════════════════════════════════════════════

        local function nextIdx()
            Tab._itemIdx = Tab._itemIdx + 1
            return Tab._itemIdx
        end

        -- Base card frame
        local function Card(h, noClip)
            local f = New("Frame", {
                Size             = UDim2.new(1, 0, 0, h or 50),
                LayoutOrder      = nextIdx(),
                BackgroundColor3 = T.Surface,
                BorderSizePixel  = 0,
                ClipsDescendants = not noClip,
                ZIndex           = 6,
                Parent           = contentScroll,
            })
            Corner(f, 12)
            Stroke(f, T.Border, 1, 0.45)
            return f
        end

        -- Name label, vertically centered or at absolute y
        local function NameLabel(parent, text, yOffset)
            return New("TextLabel", {
                Size     = UDim2.new(1, -90, 0, 18),
                Position = yOffset ~= nil
                    and UDim2.new(0, 14, 0, yOffset)
                    or  UDim2.new(0, 14, 0.5, -9),
                BackgroundTransparency = 1,
                Text     = text,
                TextColor3 = T.Text,
                TextSize = 13,
                Font     = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex   = 7,
                Parent   = parent,
            })
        end

        -- Small description below name
        local function DescLabel(parent, text, yOffset)
            return New("TextLabel", {
                Size     = UDim2.new(1, -24, 0, 13),
                Position = UDim2.new(0, 14, 0, yOffset or 0),
                BackgroundTransparency = 1,
                Text     = text,
                TextColor3 = T.TextSub,
                TextSize = 10,
                Font     = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                ZIndex   = 7,
                Parent   = parent,
            })
        end

        -- Invisible full-card button for hit detection
        local function HitBtn(parent, zIndex)
            return New("TextButton", {
                Size = UDim2.new(1,0,1,0),
                BackgroundTransparency = 1,
                Text = "",
                AutoButtonColor = false,
                ZIndex = zIndex or 9,
                Parent = parent,
            })
        end

        -- ════════════════════════════════════════════════════
        --  TOGGLE
        -- ════════════════════════════════════════════════════
        function Tab:CreateToggle(c)
            c = c or {}
            local nm   = c.Name        or "Toggle"
            local desc = c.Description
            local def  = c.Default     or false
            local cb   = c.Callback    or function() end
            local flag = c.Flag

            local card = Card(desc and 60 or 50)
            NameLabel(card, nm, desc and 8)
            if desc then DescLabel(card, desc, 29) end

            -- Track background
            local track = New("Frame", {
                Size = UDim2.new(0,46,0,26), Position = UDim2.new(1,-58,0.5,-13),
                BackgroundColor3 = def and T.ToggleOn or T.ToggleOff,
                BorderSizePixel = 0, ZIndex = 7, Parent = card,
            }); Corner(track, 13)

            -- Knob
            local knob = New("Frame", {
                Size = UDim2.new(0,20,0,20),
                Position = def and UDim2.new(1,-23,0.5,-10) or UDim2.new(0,3,0.5,-10),
                BackgroundColor3 = Color3.new(1,1,1),
                BorderSizePixel = 0, ZIndex = 8, Parent = track,
            }); Corner(knob, 10)

            local value = def
            local hit   = HitBtn(card)

            local function setVal(v, silent)
                value = v
                if v then
                    Tween(track, {BackgroundColor3 = T.ToggleOn},  0.22)
                    Tween(knob,  {Position = UDim2.new(1,-23,0.5,-10)}, 0.22, Enum.EasingStyle.Back)
                else
                    Tween(track, {BackgroundColor3 = T.ToggleOff}, 0.22)
                    Tween(knob,  {Position = UDim2.new(0,3,0.5,-10)},   0.22, Enum.EasingStyle.Back)
                end
                if not silent then cb(v) end
            end

            hit.MouseButton1Click:Connect(function() setVal(not value) end)
            hit.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then setVal(not value) end
            end)

            if flag and cfgSystem then cfgSystem:register(flag, def, setVal) end
            return { Set = setVal, Get = function() return value end }
        end

        -- ════════════════════════════════════════════════════
        --  BUTTON
        -- ════════════════════════════════════════════════════
        function Tab:CreateButton(c)
            c = c or {}
            local nm   = c.Name        or "Button"
            local desc = c.Description
            local ico  = c.Icon
            local cb   = c.Callback    or function() end

            local card = Card(desc and 60 or 50, true)  -- noClip=true for ripple overflow
            local xOff = ico and 42 or 14

            local nl = New("TextLabel", {
                Size     = UDim2.new(1,-55,0,18),
                Position = desc and UDim2.new(0,xOff,0,8) or UDim2.new(0,xOff,0.5,-9),
                BackgroundTransparency = 1, Text = nm,
                TextColor3 = T.Accent, TextSize = 13,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 7, Parent = card,
            })
            if desc then DescLabel(card, desc, 29) end
            if ico then
                New("ImageLabel", {
                    Size=UDim2.new(0,20,0,20), Position=UDim2.new(0,14,0.5,-10),
                    BackgroundTransparency=1, Image=ico, ImageColor3=T.Accent,
                    ZIndex=7, Parent=card,
                })
            end
            -- Arrow
            New("TextLabel", {
                Size=UDim2.new(0,22,1,0), Position=UDim2.new(1,-26,0,0),
                BackgroundTransparency=1, Text="›",
                TextColor3=T.Accent, TextSize=19, Font=Enum.Font.GothamBold,
                ZIndex=7, Parent=card,
            })

            local hit = HitBtn(card)
            local function press(px, py)
                Ripple(card, px, py)
                Tween(card, {BackgroundColor3=T.SurfaceAlt}, 0.09)
                task.delay(0.19, function() Tween(card,{BackgroundColor3=T.Surface},0.14) end)
                cb()
            end
            hit.MouseButton1Click:Connect(function()
                local mp = UserInputService:GetMouseLocation()
                press(mp.X-card.AbsolutePosition.X, mp.Y-card.AbsolutePosition.Y)
            end)
            hit.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then
                    press(i.Position.X-card.AbsolutePosition.X, i.Position.Y-card.AbsolutePosition.Y)
                end
            end)
            hit.MouseEnter:Connect(function() Tween(card,{BackgroundColor3=T.SurfaceAlt},0.12) end)
            hit.MouseLeave:Connect(function() Tween(card,{BackgroundColor3=T.Surface},0.12) end)
        end

        -- ════════════════════════════════════════════════════
        --  SLIDER
        -- ════════════════════════════════════════════════════
        function Tab:CreateSlider(c)
            c = c or {}
            local nm   = c.Name        or "Slider"
            local desc = c.Description
            local mn   = c.Min         or 0
            local mx   = c.Max         or 100
            local def  = c.Default     or mn
            local inc  = c.Increment   or 1
            local suf  = c.Suffix      or ""
            local cb   = c.Callback    or function() end
            local flag = c.Flag

            local card = Card(desc and 74 or 62)
            NameLabel(card, nm, 8)

            local valLbl = New("TextLabel", {
                Size=UDim2.new(0,72,0,18), Position=UDim2.new(1,-82,0,8),
                BackgroundTransparency=1, Text=tostring(def)..suf,
                TextColor3=T.Accent, TextSize=12, Font=Enum.Font.GothamBold,
                TextXAlignment=Enum.TextXAlignment.Right, ZIndex=7, Parent=card,
            })
            if desc then DescLabel(card, desc, 28) end

            local trkY = desc and 52 or 40
            local trkBg = New("Frame", {
                Size=UDim2.new(1,-26,0,5), Position=UDim2.new(0,13,0,trkY),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0, ZIndex=7, Parent=card,
            }); Corner(trkBg, 3)

            local fill = New("Frame", {
                Size=UDim2.new(0,0,1,0), BackgroundColor3=T.SliderFill,
                BorderSizePixel=0, ZIndex=8, Parent=trkBg,
            }); Corner(fill, 3)

            local knob = New("Frame", {
                Size=UDim2.new(0,16,0,16), AnchorPoint=Vector2.new(0.5,0.5),
                Position=UDim2.new(0,0,0.5,0),
                BackgroundColor3=Color3.new(1,1,1), BorderSizePixel=0, ZIndex=9, Parent=trkBg,
            }); Corner(knob,8); Stroke(knob,T.Accent,2,0)

            local curVal  = def
            local sliding = false

            local function snap(v)
                return math.clamp(math.round(v/inc)*inc, mn, mx)
            end
            local function applyAlpha(a)
                a = math.clamp(a, 0, 1)
                local sv = snap(mn + (mx-mn)*a)
                curVal = sv
                local ta = (sv-mn)/(mx-mn)
                fill.Size     = UDim2.new(ta, 0, 1, 0)
                knob.Position = UDim2.new(ta, 0, 0.5, 0)
                valLbl.Text   = tostring(sv) .. suf
                cb(sv)
            end
            local function alphaFromInput(i)
                applyAlpha((i.Position.X - trkBg.AbsolutePosition.X) / trkBg.AbsoluteSize.X)
            end

            -- Tall hitbox so it's easy to tap on mobile
            local hitBg = New("Frame",{
                Size=UDim2.new(1,0,0,40), Position=UDim2.new(0,0,0.5,-20),
                BackgroundTransparency=1, ZIndex=10, Parent=trkBg,
            })
            local hitBtn = New("TextButton",{
                Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                Text="",AutoButtonColor=false, ZIndex=11, Parent=hitBg,
            })
            hitBtn.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.MouseButton1
                or i.UserInputType==Enum.UserInputType.Touch then
                    sliding=true; alphaFromInput(i)
                end
            end)
            UserInputService.InputChanged:Connect(function(i)
                if not sliding then return end
                if i.UserInputType==Enum.UserInputType.MouseMovement
                or i.UserInputType==Enum.UserInputType.Touch then alphaFromInput(i) end
            end)
            UserInputService.InputEnded:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.MouseButton1
                or i.UserInputType==Enum.UserInputType.Touch then sliding=false end
            end)

            -- Init visuals
            local ia = (def-mn)/(mx-mn)
            fill.Size     = UDim2.new(ia,0,1,0)
            knob.Position = UDim2.new(ia,0,0.5,0)

            if flag and cfgSystem then
                cfgSystem:register(flag, def, function(v) applyAlpha((v-mn)/(mx-mn)) end)
            end
            return {
                Set = function(v) applyAlpha((v-mn)/(mx-mn)) end,
                Get = function() return curVal end,
            }
        end

        -- ════════════════════════════════════════════════════
        --  DROPDOWN
        -- ════════════════════════════════════════════════════
        function Tab:CreateDropdown(c)
            c = c or {}
            local nm   = c.Name        or "Dropdown"
            local opts = c.Options     or {}
            local def  = c.Default     or opts[1] or "None"
            local cb   = c.Callback    or function() end
            local flag = c.Flag

            -- noClip=true so the list floats below the card
            local card = New("Frame", {
                Size = UDim2.new(1,0,0,50), LayoutOrder = nextIdx(),
                BackgroundColor3 = T.Surface, BorderSizePixel = 0,
                ClipsDescendants = false, ZIndex = 10, Parent = contentScroll,
            }); Corner(card,12); Stroke(card,T.Border,1,0.45)

            NameLabel(card, nm, nil)

            local selLbl = New("TextLabel", {
                Size=UDim2.new(0.42,0,1,0), Position=UDim2.new(0.52,0,0,0),
                BackgroundTransparency=1, Text=def,
                TextColor3=T.TextSub, TextSize=12, Font=Enum.Font.Gotham,
                TextXAlignment=Enum.TextXAlignment.Right,
                TextTruncate=Enum.TextTruncate.AtEnd, ZIndex=11, Parent=card,
            })
            local arrow = New("TextLabel", {
                Size=UDim2.new(0,22,1,0), Position=UDim2.new(1,-26,0,0),
                BackgroundTransparency=1, Text="⌄",
                TextColor3=T.TextSub, TextSize=13, Font=Enum.Font.GothamBold,
                ZIndex=11, Parent=card,
            })

            local dropHit = New("TextButton", {
                Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                Text="",AutoButtonColor=false, ZIndex=12, Parent=card,
            })

            -- Dropdown list panel (elevated ZIndex)
            local list = New("Frame", {
                Size=UDim2.new(1,0,0,0), Position=UDim2.new(0,0,1,5),
                BackgroundColor3=T.Surface, BorderSizePixel=0,
                ClipsDescendants=true, ZIndex=20, Visible=false, Parent=card,
            }); Corner(list,12); Stroke(list,T.Border,1,0.1)
            Pad(list,4,4,4,4)
            ListLayout(list, 3)

            local OPT_H  = 32
            local MAX_H  = 160
            local selVal = def
            local isOpen = false

            local function closeList()
                isOpen = false
                Tween(list, {Size=UDim2.new(1,0,0,0)}, 0.2)
                Tween(arrow,{Rotation=0}, 0.2)
                task.delay(0.22, function() list.Visible=false end)
            end
            local function openList()
                isOpen = true
                list.Visible = true
                local h = math.min(#opts * OPT_H + 8, MAX_H)
                Tween(list, {Size=UDim2.new(1,0,0,h)}, 0.25, Enum.EasingStyle.Back)
                Tween(arrow,{Rotation=180}, 0.2)
            end
            local function buildOptions(o)
                for _, ch in pairs(list:GetChildren()) do
                    if ch:IsA("TextButton") then ch:Destroy() end
                end
                for i, opt in ipairs(o) do
                    local isSelected = selVal == opt
                    local ob = New("TextButton", {
                        Size=UDim2.new(1,0,0,OPT_H-2),
                        BackgroundColor3=T.SurfaceAlt,
                        BackgroundTransparency=1,
                        BorderSizePixel=0,
                        Text=opt,
                        TextColor3 = isSelected and T.Accent or T.Text,
                        TextSize=12,
                        Font = isSelected and Enum.Font.GothamSemibold or Enum.Font.Gotham,
                        AutoButtonColor=false, LayoutOrder=i,
                        ZIndex=22, Parent=list,
                    }); Corner(ob, 8)
                    ob.MouseEnter:Connect(function() Tween(ob,{BackgroundTransparency=0},0.1) end)
                    ob.MouseLeave:Connect(function() Tween(ob,{BackgroundTransparency=1},0.1) end)
                    local function pick()
                        selVal = opt; selLbl.Text = opt
                        closeList(); cb(opt); buildOptions(o)
                    end
                    ob.MouseButton1Click:Connect(pick)
                    ob.InputBegan:Connect(function(i)
                        if i.UserInputType==Enum.UserInputType.Touch then pick() end
                    end)
                end
            end
            buildOptions(opts)

            local function toggle()
                if isOpen then closeList() else openList() end
            end
            dropHit.MouseButton1Click:Connect(toggle)
            dropHit.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then toggle() end
            end)

            if flag and cfgSystem then
                cfgSystem:register(flag, def, function(v) selVal=v;selLbl.Text=v;cb(v) end)
            end
            return {
                Set     = function(v) selVal=v; selLbl.Text=v; cb(v) end,
                Get     = function() return selVal end,
                Refresh = function(o) opts=o; buildOptions(o) end,
            }
        end

        -- ════════════════════════════════════════════════════
        --  TEXTBOX
        -- ════════════════════════════════════════════════════
        function Tab:CreateTextbox(c)
            c = c or {}
            local nm  = c.Name           or "Textbox"
            local ph  = c.Placeholder    or "Type here..."
            local def = c.Default        or ""
            local cof = c.ClearOnFocus   ~= nil and c.ClearOnFocus or false
            local cb  = c.Callback       or function() end

            local card = Card(74)
            NameLabel(card, nm, 7)

            local ibg = New("Frame", {
                Size=UDim2.new(1,-26,0,32), Position=UDim2.new(0,13,0,31),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0, ZIndex=7, Parent=card,
            }); Corner(ibg,9)
            local ist = Stroke(ibg, T.Border, 1, 0.2)

            local ib = New("TextBox", {
                Size=UDim2.new(1,-16,1,0), Position=UDim2.new(0,8,0,0),
                BackgroundTransparency=1, Text=def,
                PlaceholderText=ph, TextColor3=T.Text,
                PlaceholderColor3=T.TextSub, TextSize=12,
                Font=Enum.Font.Gotham,
                TextXAlignment=Enum.TextXAlignment.Left,
                ClearTextOnFocus=cof, ZIndex=8, Parent=ibg,
            })
            ib.Focused:Connect(function()
                Tween(ibg, {BackgroundColor3=T.Surface}, 0.14)
                Tween(ist, {Color=T.Accent, Transparency=0}, 0.14)
            end)
            ib.FocusLost:Connect(function(enter)
                Tween(ibg, {BackgroundColor3=T.SurfaceAlt}, 0.14)
                Tween(ist, {Color=T.Border, Transparency=0.2}, 0.14)
                if enter then cb(ib.Text) end
            end)
            return { Set=function(v) ib.Text=v end, Get=function() return ib.Text end }
        end

        -- ════════════════════════════════════════════════════
        --  KEYBIND
        -- ════════════════════════════════════════════════════
        function Tab:CreateKeybind(c)
            c = c or {}
            local nm  = c.Name     or "Keybind"
            local def = c.Default  or Enum.KeyCode.F
            local cb  = c.Callback or function() end

            local card = Card(50)
            NameLabel(card, nm, nil)

            local kbg = New("Frame", {
                Size=UDim2.new(0,86,0,28), Position=UDim2.new(1,-98,0.5,-14),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0, ZIndex=7, Parent=card,
            }); Corner(kbg,9); Stroke(kbg,T.Border,1,0.1)

            local klbl = New("TextButton", {
                Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                Text=def.Name, TextColor3=T.Accent,
                TextSize=11, Font=Enum.Font.GothamBold,
                AutoButtonColor=false, ZIndex=8, Parent=kbg,
            })

            local bound    = def
            local listening = false

            klbl.MouseButton1Click:Connect(function()
                listening = true
                klbl.Text = "· · ·"
                klbl.TextColor3 = T.Warning
                Tween(kbg,{BackgroundColor3=T.Surface},0.12)
            end)
            UserInputService.InputBegan:Connect(function(inp, proc)
                if listening and inp.UserInputType==Enum.UserInputType.Keyboard then
                    listening = false
                    bound     = inp.KeyCode
                    klbl.Text = inp.KeyCode.Name
                    klbl.TextColor3 = T.Accent
                    Tween(kbg,{BackgroundColor3=T.SurfaceAlt},0.12)
                elseif not listening and not proc and inp.KeyCode == bound then
                    cb()
                end
            end)
            return { GetKey=function() return bound end }
        end

        -- ════════════════════════════════════════════════════
        --  LABEL  (section header)
        -- ════════════════════════════════════════════════════
        function Tab:CreateLabel(c)
            c = c or {}
            local f = New("Frame", {
                Size=UDim2.new(1,0,0,24), LayoutOrder=nextIdx(),
                BackgroundTransparency=1, ZIndex=6, Parent=contentScroll,
            })
            New("TextLabel", {
                Size=UDim2.new(1,-6,1,0), Position=UDim2.new(0,4,0,0),
                BackgroundTransparency=1, Text=(c.Text or "Section"):upper(),
                TextColor3=T.TextSub, TextSize=10,
                Font=Enum.Font.GothamSemibold,
                TextXAlignment=Enum.TextXAlignment.Left,
                ZIndex=7, Parent=f,
            })
            New("Frame", {
                Size=UDim2.new(1,-4,0,1), Position=UDim2.new(0,2,1,-1),
                BackgroundColor3=T.Border, BorderSizePixel=0,
                BackgroundTransparency=0.4, ZIndex=6, Parent=f,
            })
        end

        -- ════════════════════════════════════════════════════
        --  SEPARATOR
        -- ════════════════════════════════════════════════════
        function Tab:CreateSeparator(c)
            c = c or {}
            local f = New("Frame", {
                Size=UDim2.new(1,0,0,18), LayoutOrder=nextIdx(),
                BackgroundTransparency=1, ZIndex=6, Parent=contentScroll,
            })
            if c.Text then
                New("TextLabel", {
                    Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                    Text=c.Text, TextColor3=T.TextSub, TextSize=10,
                    Font=Enum.Font.GothamSemibold, ZIndex=7, Parent=f,
                })
            else
                New("Frame", {
                    Size=UDim2.new(1,0,0,1), Position=UDim2.new(0,0,0.5,0),
                    BackgroundColor3=T.Border, BorderSizePixel=0,
                    BackgroundTransparency=0.35, ZIndex=7, Parent=f,
                })
            end
        end

        -- ════════════════════════════════════════════════════
        --  PARAGRAPH  (info card)
        -- ════════════════════════════════════════════════════
        function Tab:CreateParagraph(c)
            c = c or {}
            local f = New("Frame", {
                Size=UDim2.new(1,0,0,0), AutomaticSize=Enum.AutomaticSize.Y,
                LayoutOrder=nextIdx(), BackgroundColor3=T.Surface,
                BorderSizePixel=0, ZIndex=6, Parent=contentScroll,
            }); Corner(f,12); Stroke(f,T.Border,1,0.45)
            Pad(f,12,13,12,13)
            ListLayout(f, 5)

            if c.Title and c.Title ~= "" then
                New("TextLabel", {
                    Size=UDim2.new(1,0,0,0), AutomaticSize=Enum.AutomaticSize.Y,
                    BackgroundTransparency=1, Text=c.Title,
                    TextColor3=T.Text, TextSize=13, Font=Enum.Font.GothamBold,
                    TextXAlignment=Enum.TextXAlignment.Left,
                    TextWrapped=true, LayoutOrder=1, ZIndex=7, Parent=f,
                })
            end
            local cl = New("TextLabel", {
                Size=UDim2.new(1,0,0,0), AutomaticSize=Enum.AutomaticSize.Y,
                BackgroundTransparency=1, Text=c.Content or "",
                TextColor3=T.TextSub, TextSize=11, Font=Enum.Font.Gotham,
                TextXAlignment=Enum.TextXAlignment.Left,
                TextWrapped=true, LayoutOrder=2, ZIndex=7, Parent=f,
            })
            return { SetContent=function(t) cl.Text=t end }
        end

        -- ════════════════════════════════════════════════════
        --  COLOR DISPLAY
        -- ════════════════════════════════════════════════════
        function Tab:CreateColorDisplay(c)
            c = c or {}
            local nm  = c.Name     or "Color"
            local def = c.Default  or Color3.fromRGB(100,150,255)
            local cb  = c.Callback or function() end
            local cur = def

            local card = Card(50)
            NameLabel(card, nm, nil)
            local prev = New("Frame", {
                Size=UDim2.new(0,32,0,32), Position=UDim2.new(1,-46,0.5,-16),
                BackgroundColor3=def, BorderSizePixel=0, ZIndex=7, Parent=card,
            }); Corner(prev,9); Stroke(prev,T.Border,1,0.1)

            HitBtn(card).MouseButton1Click:Connect(function() cb(cur) end)
            return {
                Set=function(v) cur=v; prev.BackgroundColor3=v end,
                Get=function() return cur end,
            }
        end

        -- ════════════════════════════════════════════════════
        --  PROGRESS BAR  (new)
        --  Shows a labeled progress value that can be updated.
        -- ════════════════════════════════════════════════════
        function Tab:CreateProgressBar(c)
            c = c or {}
            local nm   = c.Name    or "Progress"
            local def  = math.clamp(c.Default or 0, 0, 100)
            local col  = c.Color   -- nil = uses Accent
            local suf  = c.Suffix  or "%"

            local card = Card(62)
            NameLabel(card, nm, 8)

            -- Value label top-right
            local valLbl = New("TextLabel", {
                Size=UDim2.new(0,52,0,18), Position=UDim2.new(1,-62,0,8),
                BackgroundTransparency=1, Text=tostring(def)..suf,
                TextColor3 = col or T.Accent, TextSize=12,
                Font=Enum.Font.GothamBold,
                TextXAlignment=Enum.TextXAlignment.Right,
                ZIndex=7, Parent=card,
            })

            -- Track
            local trkBg = New("Frame", {
                Size=UDim2.new(1,-26,0,8), Position=UDim2.new(0,13,0,36),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0, ZIndex=7, Parent=card,
            }); Corner(trkBg, 4)

            local fillCol = col or T.Accent
            local fill = New("Frame", {
                Size=UDim2.new(def/100,0,1,0), BackgroundColor3=fillCol,
                BorderSizePixel=0, ZIndex=8, Parent=trkBg,
            }); Corner(fill, 4)

            -- Sheen on the fill bar
            local sheen = New("Frame", {
                Size=UDim2.new(1,0,0.5,0),
                BackgroundColor3=Color3.new(1,1,1),
                BackgroundTransparency=0.88, BorderSizePixel=0, ZIndex=9, Parent=fill,
            }); Corner(sheen, 3)

            local curVal = def
            local function setVal(v)
                v = math.clamp(v, 0, 100)
                curVal = v
                Tween(fill, {Size = UDim2.new(v/100, 0, 1, 0)}, 0.30, Enum.EasingStyle.Quad)
                valLbl.Text = tostring(math.floor(v)) .. suf
            end
            return {
                Set = setVal,
                Get = function() return curVal end,
            }
        end

        -- ════════════════════════════════════════════════════
        --  BADGE / STAT DISPLAY  (new)
        --  Shows a row of key→value stat badges side by side.
        --  e.g. { Stats = { Level="99", Gold="1,234" } }
        -- ════════════════════════════════════════════════════
        function Tab:CreateBadgeRow(c)
            c = c or {}
            local stats = c.Stats or {}

            local cardH = 56
            local card = New("Frame", {
                Size=UDim2.new(1,0,0,cardH), LayoutOrder=nextIdx(),
                BackgroundColor3=T.Surface, BorderSizePixel=0,
                ZIndex=6, Parent=contentScroll,
            }); Corner(card,12); Stroke(card,T.Border,1,0.45)
            Pad(card, 8, 10, 8, 10)

            local rowList = Instance.new("UIListLayout")
            rowList.FillDirection = Enum.FillDirection.Horizontal
            rowList.SortOrder = Enum.SortOrder.LayoutOrder
            rowList.Padding = UDim.new(0, 6)
            rowList.VerticalAlignment = Enum.VerticalAlignment.Center
            rowList.Parent = card

            local badges = {}
            local keys   = {}
            for k, _ in pairs(stats) do table.insert(keys, k) end
            table.sort(keys)

            for i, k in ipairs(keys) do
                local v = stats[k]
                local badge = New("Frame", {
                    Size=UDim2.new(0, 0, 1, 0),  -- auto-sized by content
                    AutomaticSize=Enum.AutomaticSize.X,
                    BackgroundColor3=T.SurfaceAlt,
                    BorderSizePixel=0, LayoutOrder=i, ZIndex=7, Parent=card,
                }); Corner(badge, 8)
                Pad(badge, 4, 10, 4, 10)

                local bList = Instance.new("UIListLayout")
                bList.FillDirection = Enum.FillDirection.Vertical
                bList.SortOrder = Enum.SortOrder.LayoutOrder
                bList.HorizontalAlignment = Enum.HorizontalAlignment.Center
                bList.Padding = UDim.new(0, 1)
                bList.Parent = badge

                New("TextLabel", {
                    Size=UDim2.new(0,0,0,14), AutomaticSize=Enum.AutomaticSize.X,
                    BackgroundTransparency=1, Text=tostring(v),
                    TextColor3=T.Accent, TextSize=12, Font=Enum.Font.GothamBold,
                    LayoutOrder=1, ZIndex=8, Parent=badge,
                })
                local kLbl = New("TextLabel", {
                    Size=UDim2.new(0,0,0,11), AutomaticSize=Enum.AutomaticSize.X,
                    BackgroundTransparency=1, Text=k,
                    TextColor3=T.TextSub, TextSize=10, Font=Enum.Font.Gotham,
                    LayoutOrder=2, ZIndex=8, Parent=badge,
                })
                badges[k] = badge
            end

            return {
                -- Update a single stat value
                Set = function(key, val)
                    if badges[key] then
                        local vl = badges[key]:FindFirstChildWhichIsA("TextLabel")
                        if vl then vl.Text = tostring(val) end
                    end
                end,
            }
        end

        -- ════════════════════════════════════════════════════
        --  MULTI-OPTION PICKER  (new)
        --  Horizontal pill buttons — only one active at a time.
        -- ════════════════════════════════════════════════════
        function Tab:CreatePicker(c)
            c = c or {}
            local nm   = c.Name     or "Mode"
            local opts = c.Options  or {}
            local def  = c.Default  or opts[1]
            local cb   = c.Callback or function() end

            local cardH = 68
            local card = Card(cardH)
            NameLabel(card, nm, 8)

            -- Pills row
            local rowFrame = New("Frame", {
                Size=UDim2.new(1,-26,0,30), Position=UDim2.new(0,13,0,30),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0, ZIndex=7, Parent=card,
            }); Corner(rowFrame, 9)

            local pillList = Instance.new("UIListLayout")
            pillList.FillDirection = Enum.FillDirection.Horizontal
            pillList.SortOrder = Enum.SortOrder.LayoutOrder
            pillList.Padding = UDim.new(0, 3)
            pillList.VerticalAlignment = Enum.VerticalAlignment.Center
            pillList.Parent = rowFrame
            Pad(rowFrame, 3, 3, 3, 3)

            local pillBtns = {}
            local selVal   = def

            local function setActive(opt, silent)
                selVal = opt
                for o, btn in pairs(pillBtns) do
                    local active = o == opt
                    Tween(btn, {
                        BackgroundColor3 = active and T.Accent or T.Surface,
                        BackgroundTransparency = active and 0 or 0,
                    }, 0.18)
                    btn.TextColor3 = active and Color3.new(1,1,1) or T.TextSub
                    btn.Font = active and Enum.Font.GothamSemibold or Enum.Font.Gotham
                end
                if not silent then cb(opt) end
            end

            for i, opt in ipairs(opts) do
                local btn = New("TextButton", {
                    Size=UDim2.new(1/#opts,-(3*(#opts+1)/#opts),1,0),
                    BackgroundColor3=T.Surface,
                    BackgroundTransparency=0, BorderSizePixel=0,
                    Text=opt, TextColor3=T.TextSub, TextSize=11,
                    Font=Enum.Font.Gotham, AutoButtonColor=false,
                    LayoutOrder=i, ZIndex=8, Parent=rowFrame,
                }); Corner(btn, 7)
                pillBtns[opt] = btn
                btn.MouseButton1Click:Connect(function() setActive(opt) end)
                btn.InputBegan:Connect(function(inp)
                    if inp.UserInputType==Enum.UserInputType.Touch then setActive(opt) end
                end)
            end
            task.defer(function() setActive(def, true) end)

            return {
                Set = function(v) setActive(v, false) end,
                Get = function() return selVal end,
            }
        end

        return Tab
    end  -- CreateTab

    -- ═══════════════════════════════════════════════════════════
    --  WINDOW UTILITY METHODS
    -- ═══════════════════════════════════════════════════════════
    function Window:SaveConfig()
        if not self.Config then return end
        local ok, e = self.Config:save()
        self:Notify({
            Title = ok and "Config Saved"  or "Save Failed",
            Text  = ok and self.Config._file or tostring(e),
            Type  = ok and "Success" or "Error",
        })
    end

    function Window:LoadConfig()
        if not self.Config then return end
        local ok, e = self.Config:load()
        self:Notify({
            Title = ok and "Config Loaded"  or "Load Failed",
            Text  = ok and "Settings restored." or tostring(e),
            Type  = ok and "Success" or "Warning",
        })
    end

    function Window:Destroy()
        ToggleWrapper:Destroy()
        Screen:Destroy()
    end

    return Window
end  -- CreateWindow

return NexusUI
