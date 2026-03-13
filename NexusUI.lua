-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║               N E X U S U I   v7.0  —  Premium Rework               ║
-- ║   Complete visual & UX overhaul. Same public API surface (v6.x).    ║
-- ╚══════════════════════════════════════════════════════════════════════╝

-- ════════════════════════════════════════════════════════════════════════
--  SERVICES
-- ════════════════════════════════════════════════════════════════════════
local TS   = game:GetService("TweenService")
local UIS  = game:GetService("UserInputService")
local PL   = game:GetService("Players")
local HTTP = game:GetService("HttpService")
local LP   = PL.LocalPlayer

-- ════════════════════════════════════════════════════════════════════════
--  THEMES  (9 built-in, all fully refined for v7 palette)
-- ════════════════════════════════════════════════════════════════════════
local Themes = {
    -- ── Dark ─────────────────────────────────────────────────────────
    Dark = {
        Window      = Color3.fromRGB(10, 10, 18),
        WindowB     = Color3.fromRGB(14, 14, 24),   -- gradient bottom
        Surface     = Color3.fromRGB(18, 18, 30),
        SurfaceAlt  = Color3.fromRGB(24, 24, 40),
        SurfaceHov  = Color3.fromRGB(30, 30, 50),
        SurfaceGlow = Color3.fromRGB(38, 42, 70),
        Sidebar     = Color3.fromRGB(12, 12, 22),
        SidebarB    = Color3.fromRGB(9,  9, 17),
        Accent      = Color3.fromRGB(112, 140, 255),
        AccentB     = Color3.fromRGB(80,  108, 230),
        AccentGlow  = Color3.fromRGB(112, 140, 255),
        Text        = Color3.fromRGB(235, 235, 255),
        TextSub     = Color3.fromRGB(140, 140, 185),
        TextMute    = Color3.fromRGB(72,  72,  108),
        Border      = Color3.fromRGB(38,  38,  62),
        BorderSoft  = Color3.fromRGB(24,  24,  42),
        ToggleOff   = Color3.fromRGB(44,  44,  68),
        ToggleOn    = Color3.fromRGB(50,  215, 115),
        SliderFill  = Color3.fromRGB(112, 140, 255),
        Success     = Color3.fromRGB(50,  215, 115),
        Warning     = Color3.fromRGB(255, 190,  50),
        Error       = Color3.fromRGB(255,  72,  72),
        Info        = Color3.fromRGB(112, 140, 255),
    },
    -- ── Midnight ─────────────────────────────────────────────────────
    Midnight = {
        Window      = Color3.fromRGB(4,  4,  10),
        WindowB     = Color3.fromRGB(7,  7,  16),
        Surface     = Color3.fromRGB(10, 10, 20),
        SurfaceAlt  = Color3.fromRGB(15, 15, 28),
        SurfaceHov  = Color3.fromRGB(20, 20, 38),
        SurfaceGlow = Color3.fromRGB(28, 32, 60),
        Sidebar     = Color3.fromRGB(6,  6,  14),
        SidebarB    = Color3.fromRGB(4,  4,  10),
        Accent      = Color3.fromRGB(80, 165, 255),
        AccentB     = Color3.fromRGB(55, 130, 225),
        AccentGlow  = Color3.fromRGB(80, 165, 255),
        Text        = Color3.fromRGB(220, 232, 255),
        TextSub     = Color3.fromRGB(110, 122, 170),
        TextMute    = Color3.fromRGB(58,  64,  102),
        Border      = Color3.fromRGB(24,  24,  50),
        BorderSoft  = Color3.fromRGB(14,  14,  34),
        ToggleOff   = Color3.fromRGB(34,  34,  62),
        ToggleOn    = Color3.fromRGB(50,  215, 115),
        SliderFill  = Color3.fromRGB(80,  165, 255),
        Success     = Color3.fromRGB(50,  215, 115),
        Warning     = Color3.fromRGB(255, 190,  50),
        Error       = Color3.fromRGB(255,  72,  72),
        Info        = Color3.fromRGB(80,  165, 255),
    },
    -- ── Ocean ─────────────────────────────────────────────────────────
    Ocean = {
        Window      = Color3.fromRGB(4,  14, 28),
        WindowB     = Color3.fromRGB(6,  20, 40),
        Surface     = Color3.fromRGB(8,  24, 48),
        SurfaceAlt  = Color3.fromRGB(12, 32, 62),
        SurfaceHov  = Color3.fromRGB(16, 40, 78),
        SurfaceGlow = Color3.fromRGB(22, 55, 100),
        Sidebar     = Color3.fromRGB(5,  17, 35),
        SidebarB    = Color3.fromRGB(4,  12, 26),
        Accent      = Color3.fromRGB(0,  200, 255),
        AccentB     = Color3.fromRGB(0,  162, 215),
        AccentGlow  = Color3.fromRGB(0,  200, 255),
        Text        = Color3.fromRGB(205, 242, 255),
        TextSub     = Color3.fromRGB(95,  158, 210),
        TextMute    = Color3.fromRGB(50,   96, 148),
        Border      = Color3.fromRGB(14,   52, 96),
        BorderSoft  = Color3.fromRGB(8,    34, 66),
        ToggleOff   = Color3.fromRGB(16,   48, 82),
        ToggleOn    = Color3.fromRGB(0,    200, 255),
        SliderFill  = Color3.fromRGB(0,    200, 255),
        Success     = Color3.fromRGB(46,   210, 130),
        Warning     = Color3.fromRGB(255,  190,  50),
        Error       = Color3.fromRGB(255,   72,  72),
        Info        = Color3.fromRGB(0,    200, 255),
    },
    -- ── Purple ───────────────────────────────────────────────────────
    Purple = {
        Window      = Color3.fromRGB(8,   5, 20),
        WindowB     = Color3.fromRGB(12,  8, 28),
        Surface     = Color3.fromRGB(16, 11, 38),
        SurfaceAlt  = Color3.fromRGB(24, 16, 54),
        SurfaceHov  = Color3.fromRGB(32, 22, 70),
        SurfaceGlow = Color3.fromRGB(44, 28, 92),
        Sidebar     = Color3.fromRGB(10,  7, 26),
        SidebarB    = Color3.fromRGB(7,   4, 18),
        Accent      = Color3.fromRGB(168, 82, 255),
        AccentB     = Color3.fromRGB(132, 56, 218),
        AccentGlow  = Color3.fromRGB(168, 82, 255),
        Text        = Color3.fromRGB(232, 222, 255),
        TextSub     = Color3.fromRGB(148, 126, 200),
        TextMute    = Color3.fromRGB(84,   70, 128),
        Border      = Color3.fromRGB(56,   36, 100),
        BorderSoft  = Color3.fromRGB(36,   22,  70),
        ToggleOff   = Color3.fromRGB(46,   32,  80),
        ToggleOn    = Color3.fromRGB(168,  82, 255),
        SliderFill  = Color3.fromRGB(168,  82, 255),
        Success     = Color3.fromRGB(50,  215, 115),
        Warning     = Color3.fromRGB(255, 190,  50),
        Error       = Color3.fromRGB(255,  72,  72),
        Info        = Color3.fromRGB(168,  82, 255),
    },
    -- ── Rose ─────────────────────────────────────────────────────────
    Rose = {
        Window      = Color3.fromRGB(18,  8, 14),
        WindowB     = Color3.fromRGB(24, 11, 19),
        Surface     = Color3.fromRGB(30, 14, 24),
        SurfaceAlt  = Color3.fromRGB(42, 20, 33),
        SurfaceHov  = Color3.fromRGB(54, 26, 42),
        SurfaceGlow = Color3.fromRGB(68, 32, 52),
        Sidebar     = Color3.fromRGB(20, 10, 17),
        SidebarB    = Color3.fromRGB(14,  7, 12),
        Accent      = Color3.fromRGB(255,  88, 130),
        AccentB     = Color3.fromRGB(225,  55,  98),
        AccentGlow  = Color3.fromRGB(255,  88, 130),
        Text        = Color3.fromRGB(255, 228, 240),
        TextSub     = Color3.fromRGB(195, 148, 168),
        TextMute    = Color3.fromRGB(118,  80,  98),
        Border      = Color3.fromRGB(86,   38,  58),
        BorderSoft  = Color3.fromRGB(56,   24,  38),
        ToggleOff   = Color3.fromRGB(66,   32,  50),
        ToggleOn    = Color3.fromRGB(255,  88, 130),
        SliderFill  = Color3.fromRGB(255,  88, 130),
        Success     = Color3.fromRGB(50,  215, 115),
        Warning     = Color3.fromRGB(255, 190,  50),
        Error       = Color3.fromRGB(255,  72,  72),
        Info        = Color3.fromRGB(255,  88, 130),
    },
    -- ── Neon ─────────────────────────────────────────────────────────
    Neon = {
        Window      = Color3.fromRGB(5,   8,  5),
        WindowB     = Color3.fromRGB(7,  11,  7),
        Surface     = Color3.fromRGB(9,  14,  9),
        SurfaceAlt  = Color3.fromRGB(13, 20, 13),
        SurfaceHov  = Color3.fromRGB(17, 27, 17),
        SurfaceGlow = Color3.fromRGB(22, 38, 22),
        Sidebar     = Color3.fromRGB(6,  10,  6),
        SidebarB    = Color3.fromRGB(4,   7,  4),
        Accent      = Color3.fromRGB(0,  240, 128),
        AccentB     = Color3.fromRGB(0,  195,  96),
        AccentGlow  = Color3.fromRGB(0,  240, 128),
        Text        = Color3.fromRGB(215, 255, 228),
        TextSub     = Color3.fromRGB(100, 168, 120),
        TextMute    = Color3.fromRGB(54,   98,  68),
        Border      = Color3.fromRGB(22,   52,  30),
        BorderSoft  = Color3.fromRGB(12,   32,  18),
        ToggleOff   = Color3.fromRGB(18,   44,  26),
        ToggleOn    = Color3.fromRGB(0,   240, 128),
        SliderFill  = Color3.fromRGB(0,   240, 128),
        Success     = Color3.fromRGB(0,   240, 128),
        Warning     = Color3.fromRGB(255, 190,  50),
        Error       = Color3.fromRGB(255,  72,  72),
        Info        = Color3.fromRGB(0,   240, 128),
    },
    -- ── Sunset ───────────────────────────────────────────────────────
    Sunset = {
        Window      = Color3.fromRGB(18,  9,  5),
        WindowB     = Color3.fromRGB(24, 13,  7),
        Surface     = Color3.fromRGB(30, 17,  9),
        SurfaceAlt  = Color3.fromRGB(42, 23, 12),
        SurfaceHov  = Color3.fromRGB(54, 30, 16),
        SurfaceGlow = Color3.fromRGB(68, 38, 20),
        Sidebar     = Color3.fromRGB(21, 11,  6),
        SidebarB    = Color3.fromRGB(14,  7,  4),
        Accent      = Color3.fromRGB(255, 145,  54),
        AccentB     = Color3.fromRGB(225, 110,  28),
        AccentGlow  = Color3.fromRGB(255, 145,  54),
        Text        = Color3.fromRGB(255, 240, 225),
        TextSub     = Color3.fromRGB(200, 155, 118),
        TextMute    = Color3.fromRGB(125,  90,  64),
        Border      = Color3.fromRGB(90,   48,  22),
        BorderSoft  = Color3.fromRGB(60,   30,  13),
        ToggleOff   = Color3.fromRGB(70,   36,  18),
        ToggleOn    = Color3.fromRGB(255, 145,  54),
        SliderFill  = Color3.fromRGB(255, 145,  54),
        Success     = Color3.fromRGB(50,  215, 115),
        Warning     = Color3.fromRGB(255, 190,  50),
        Error       = Color3.fromRGB(255,  72,  72),
        Info        = Color3.fromRGB(255, 145,  54),
    },
    -- ── Aqua ─────────────────────────────────────────────────────────
    Aqua = {
        Window      = Color3.fromRGB(4,   18, 18),
        WindowB     = Color3.fromRGB(6,   24, 24),
        Surface     = Color3.fromRGB(8,   30, 30),
        SurfaceAlt  = Color3.fromRGB(12,  42, 42),
        SurfaceHov  = Color3.fromRGB(16,  54, 54),
        SurfaceGlow = Color3.fromRGB(20,  68, 68),
        Sidebar     = Color3.fromRGB(5,   22, 22),
        SidebarB    = Color3.fromRGB(4,   14, 14),
        Accent      = Color3.fromRGB(0,   220, 200),
        AccentB     = Color3.fromRGB(0,   178, 160),
        AccentGlow  = Color3.fromRGB(0,   220, 200),
        Text        = Color3.fromRGB(215, 255, 252),
        TextSub     = Color3.fromRGB(105, 182, 175),
        TextMute    = Color3.fromRGB(58,  115, 110),
        Border      = Color3.fromRGB(18,   78,  74),
        BorderSoft  = Color3.fromRGB(10,   52,  50),
        ToggleOff   = Color3.fromRGB(14,   62,  60),
        ToggleOn    = Color3.fromRGB(0,   220, 200),
        SliderFill  = Color3.fromRGB(0,   220, 200),
        Success     = Color3.fromRGB(0,   220, 200),
        Warning     = Color3.fromRGB(255, 190,  50),
        Error       = Color3.fromRGB(255,  72,  72),
        Info        = Color3.fromRGB(0,   220, 200),
    },
    -- ── Light ─────────────────────────────────────────────────────────
    Light = {
        Window      = Color3.fromRGB(240, 240, 248),
        WindowB     = Color3.fromRGB(232, 232, 244),
        Surface     = Color3.fromRGB(255, 255, 255),
        SurfaceAlt  = Color3.fromRGB(228, 228, 242),
        SurfaceHov  = Color3.fromRGB(218, 218, 235),
        SurfaceGlow = Color3.fromRGB(208, 215, 255),
        Sidebar     = Color3.fromRGB(234, 234, 246),
        SidebarB    = Color3.fromRGB(225, 225, 240),
        Accent      = Color3.fromRGB(0,   112, 255),
        AccentB     = Color3.fromRGB(0,    85, 215),
        AccentGlow  = Color3.fromRGB(0,   112, 255),
        Text        = Color3.fromRGB(14,   14,  24),
        TextSub     = Color3.fromRGB(98,   98, 140),
        TextMute    = Color3.fromRGB(158, 158, 190),
        Border      = Color3.fromRGB(195, 195, 218),
        BorderSoft  = Color3.fromRGB(218, 218, 234),
        ToggleOff   = Color3.fromRGB(175, 175, 200),
        ToggleOn    = Color3.fromRGB(34,  195,  90),
        SliderFill  = Color3.fromRGB(0,   112, 255),
        Success     = Color3.fromRGB(34,  190,  86),
        Warning     = Color3.fromRGB(205, 140,  14),
        Error       = Color3.fromRGB(215,  45,  45),
        Info        = Color3.fromRGB(0,   112, 255),
    },
}

-- ════════════════════════════════════════════════════════════════════════
--  CORE UTILITIES
-- ════════════════════════════════════════════════════════════════════════
local function Tween(obj, props, t, style, dir)
    if not obj or not obj.Parent then return end
    local tw = TS:Create(obj,
        TweenInfo.new(t or 0.22, style or Enum.EasingStyle.Sine, dir or Enum.EasingDirection.Out),
        props)
    tw:Play(); return tw
end

local function TweenSpring(obj, props, t)
    return Tween(obj, props, t or 0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
end

local function New(cls, props)
    local i = Instance.new(cls)
    for k, v in pairs(props) do pcall(function() i[k] = v end) end
    return i
end

local function Corner(p, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 14)
    c.Parent = p; return c
end

local function Stroke(p, col, t, tr)
    local s = Instance.new("UIStroke")
    s.Color = col or Color3.new(1,1,1)
    s.Thickness = t or 1
    s.Transparency = tr or 0
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = p; return s
end

local function Pad(p, t, r, b, l)
    local u = Instance.new("UIPadding")
    u.PaddingTop    = UDim.new(0, t or 0)
    u.PaddingRight  = UDim.new(0, r or 0)
    u.PaddingBottom = UDim.new(0, b or 0)
    u.PaddingLeft   = UDim.new(0, l or 0)
    u.Parent = p
end

local function ListY(p, gap)
    local l = Instance.new("UIListLayout")
    l.SortOrder = Enum.SortOrder.LayoutOrder
    l.Padding = UDim.new(0, gap or 0)
    l.Parent = p; return l
end

local function GradSeq(p, seq, rot)
    local g = Instance.new("UIGradient")
    g.Color = seq; g.Rotation = rot or 0
    g.Parent = p; return g
end

local function Grad(p, c0, c1, rot)
    GradSeq(p, ColorSequence.new(c0, c1), rot)
end

local function ViewportSize()
    local cam = workspace:FindFirstChildOfClass("Camera")
    return cam and cam.ViewportSize or Vector2.new(1280, 720)
end

-- Premium click ripple
local function Ripple(frame, px, py, col)
    local r = New("Frame", {
        Size = UDim2.new(0,0,0,0),
        Position = UDim2.new(0, px, 0, py),
        AnchorPoint = Vector2.new(.5,.5),
        BackgroundColor3 = col or Color3.new(1,1,1),
        BackgroundTransparency = 0.82,
        ZIndex = 30, Parent = frame,
    })
    Corner(r, 999)
    local d = math.max(frame.AbsoluteSize.X, frame.AbsoluteSize.Y) * 1.5
    Tween(r, {Size=UDim2.new(0,d,0,d), BackgroundTransparency=1}, 0.40, Enum.EasingStyle.Quad)
    task.delay(0.44, function() if r and r.Parent then r:Destroy() end end)
end

local function MakeScreen(name)
    local g = Instance.new("ScreenGui")
    g.Name = name
    g.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    g.ResetOnSpawn = false
    g.DisplayOrder = 999
    g.IgnoreGuiInset = true
    local ok = pcall(function()
        if gethui then g.Parent = gethui()
        else g.Parent = game:GetService("CoreGui") end
    end)
    if not ok or not g.Parent then g.Parent = LP:WaitForChild("PlayerGui") end
    return g
end

-- ════════════════════════════════════════════════════════════════════════
--  CONFIG SYSTEM  (unchanged from v6.2.1)
-- ════════════════════════════════════════════════════════════════════════
local Cfg = {}; Cfg.__index = Cfg
function Cfg.new(name)
    return setmetatable({ _f=(name:gsub("%s","_")).."_nexus.json", _d={}, _c={} }, Cfg)
end
function Cfg:reg(flag, def, cb)
    if self._d[flag] == nil then self._d[flag] = def end
    self._c[flag] = { def=def, cb=cb }
end
function Cfg:set(flag, v)
    self._d[flag] = v
    local e = self._c[flag]
    if e and e.cb then pcall(e.cb, v) end
end
function Cfg:get(flag) return self._d[flag] end
function Cfg:save()
    if not writefile then return false, "writefile unavailable" end
    local ok,e = pcall(writefile, self._f, HTTP:JSONEncode(self._d))
    return ok, e
end
function Cfg:load()
    if not (readfile and isfile and isfile(self._f)) then return false, "No config file" end
    local ok,r = pcall(function() return HTTP:JSONDecode(readfile(self._f)) end)
    if ok and type(r)=="table" then
        for k,v in pairs(r) do self:set(k,v) end
        return true
    end
    return false, "Parse error"
end
function Cfg:reset()
    for flag, info in pairs(self._c) do self:set(flag, info.def) end
end

-- ════════════════════════════════════════════════════════════════════════
--  N E X U S U I   v7
-- ════════════════════════════════════════════════════════════════════════
local NexusUI = {}; NexusUI.__index = NexusUI
NexusUI.Version = "7.0.0"
NexusUI.Themes  = Themes

function NexusUI:GetVersion() return NexusUI.Version end

function NexusUI:CreateWindow(cfg)
    cfg = cfg or {}
    local T         = Themes[cfg.Theme] or Themes.Dark
    local title     = cfg.Title    or "NexusUI"
    local subtitle  = cfg.SubTitle
    local toggleKey = cfg.ToggleKey or Enum.KeyCode.RightShift
    local cfgSys    = cfg.ConfigName and Cfg.new(cfg.ConfigName) or nil

    -- ── Responsive sizing ──────────────────────────────────────────
    local MARGIN = 18
    local INSET  = 36
    local vp = ViewportSize()
    local W  = math.floor(math.min(cfg.Size and cfg.Size.X or 530, vp.X - MARGIN*2))
    local H  = math.floor(math.min(cfg.Size and cfg.Size.Y or 610, vp.Y - INSET - MARGIN*2))
    local SB = math.floor(math.clamp(W * 0.232, 96, 128))
    local TH = subtitle and 62 or 54

    local cx = math.floor(vp.X / 2)
    local cy = math.floor(INSET + (vp.Y - INSET) / 2)

    -- ════════════════════════════════════════════════════════════════
    --  SCREEN  +  ROOT
    -- ════════════════════════════════════════════════════════════════
    local Screen = MakeScreen("NexusUI_"..title)

    local Root = New("Frame", {
        Name="Root", AnchorPoint=Vector2.new(.5,.5),
        Position=UDim2.new(0,cx,0,cy),
        Size=UDim2.new(0,W,0,H),
        BackgroundTransparency=1,
        ClipsDescendants=false, ZIndex=1, Parent=Screen,
    })

    -- ── Three-layer shadow system ───────────────────────────────────
    local function makeShadow(sz, oy, tr, z)
        return New("ImageLabel", {
            AnchorPoint=Vector2.new(.5,.5),
            Size=UDim2.new(1,sz,1,sz),
            Position=UDim2.new(.5,0,.5,oy),
            BackgroundTransparency=1,
            Image="rbxassetid://6014261993",
            ImageColor3=Color3.fromRGB(0,0,0),
            ImageTransparency=tr, ScaleType=Enum.ScaleType.Slice,
            SliceCenter=Rect.new(49,49,450,450),
            ZIndex=z, Parent=Root,
        })
    end
    local Sh1 = makeShadow(110, 16, 1, 0)   -- largest / softest
    local Sh2 = makeShadow(60,   8, 1, 0)
    local Sh3 = makeShadow(28,   3, 1, 0)   -- tightest / sharpest

    -- ── Main window frame ───────────────────────────────────────────
    local WinFrame = New("Frame", {
        Name="WinFrame", Size=UDim2.new(1,0,1,0),
        BackgroundColor3=T.Window, BorderSizePixel=0,
        ClipsDescendants=true, ZIndex=2, Parent=Root,
    })
    Corner(WinFrame, 20)
    -- Subtle window background gradient
    Grad(WinFrame, T.Window, T.WindowB, 120)
    local WinStroke = Stroke(WinFrame, T.Border, 1.5, 1)

    -- Open animation
    Root.Size = UDim2.new(0, W*0.78, 0, H*0.78)
    WinFrame.BackgroundTransparency = 1
    task.defer(function()
        TweenSpring(Root, {Size=UDim2.new(0,W,0,H)}, 0.54)
        Tween(WinFrame,    {BackgroundTransparency=0},     0.38)
        Tween(WinStroke,   {Transparency=0},               0.38)
        Tween(Sh1, {ImageTransparency=0.44}, 0.60)
        Tween(Sh2, {ImageTransparency=0.58}, 0.60)
        Tween(Sh3, {ImageTransparency=0.70}, 0.60)
    end)

    -- ════════════════════════════════════════════════════════════════
    --  TITLE BAR
    -- ════════════════════════════════════════════════════════════════
    local TitleBar = New("Frame", {
        Name="TitleBar", Size=UDim2.new(1,0,0,TH),
        BackgroundColor3=T.Sidebar, BorderSizePixel=0,
        ClipsDescendants=true, ZIndex=6, Parent=WinFrame,
    })
    Corner(TitleBar, 20)
    -- Flatten bottom corners
    New("Frame", {
        Size=UDim2.new(1,0,0,22), Position=UDim2.new(0,0,1,-22),
        BackgroundColor3=T.Sidebar, BorderSizePixel=0, ZIndex=6, Parent=TitleBar,
    })
    -- Title bar background gradient
    Grad(TitleBar, T.Sidebar, T.SidebarB, 100)
    -- Bottom divider
    New("Frame", {
        Size=UDim2.new(1,0,0,1), Position=UDim2.new(0,0,1,-1),
        BackgroundColor3=T.Border, BorderSizePixel=0, ZIndex=7, Parent=TitleBar,
    })

    -- Accent stripe (top edge, fades at corners)
    local stripe = New("Frame", {
        Size=UDim2.new(1,0,0,3), BackgroundColor3=T.Accent,
        BorderSizePixel=0, ZIndex=10, Parent=TitleBar,
    })
    GradSeq(stripe, ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, Color3.new(0,0,0)),
        ColorSequenceKeypoint.new(0.12, T.Accent),
        ColorSequenceKeypoint.new(0.88, T.Accent),
        ColorSequenceKeypoint.new(1.00, Color3.new(0,0,0)),
    }), 0)

    -- Logo: glow halo → ring → dot
    local logoHalo = New("Frame", {
        Size=UDim2.new(0,24,0,24), Position=UDim2.new(0,15,0.5,-12),
        BackgroundColor3=T.Accent, BackgroundTransparency=0.82,
        BorderSizePixel=0, ZIndex=7, Parent=TitleBar,
    }); Corner(logoHalo,12)
    local logoRing = New("Frame", {
        Size=UDim2.new(0,16,0,16), Position=UDim2.new(0,19,0.5,-8),
        BackgroundColor3=T.Accent, BackgroundTransparency=0.55,
        BorderSizePixel=0, ZIndex=8, Parent=TitleBar,
    }); Corner(logoRing,8)
    local logoDot = New("Frame", {
        Size=UDim2.new(0,8,0,8), Position=UDim2.new(0,23,0.5,-4),
        BackgroundColor3=T.Accent, BorderSizePixel=0,
        ZIndex=9, Parent=TitleBar,
    }); Corner(logoDot,4)

    -- Pulse the logo on open
    task.defer(function()
        Tween(logoHalo, {BackgroundTransparency=0.65}, 0.30)
        task.delay(0.30, function()
            Tween(logoHalo, {BackgroundTransparency=0.82}, 0.40)
        end)
    end)

    -- Title text
    New("TextLabel", {
        Size=UDim2.new(1,-90,0, subtitle and 22 or 24),
        Position=subtitle and UDim2.new(0,44,0,9) or UDim2.new(0,44,0.5,-12),
        BackgroundTransparency=1, Text=title,
        TextColor3=T.Text, TextSize=15, Font=Enum.Font.GothamBold,
        TextXAlignment=Enum.TextXAlignment.Left, ZIndex=8, Parent=TitleBar,
    })
    if subtitle then
        New("TextLabel", {
            Size=UDim2.new(1,-90,0,13), Position=UDim2.new(0,44,0,33),
            BackgroundTransparency=1, Text=subtitle,
            TextColor3=T.TextSub, TextSize=10, Font=Enum.Font.Gotham,
            TextXAlignment=Enum.TextXAlignment.Left, ZIndex=8, Parent=TitleBar,
        })
    end

    -- Version badge
    local verBg = New("Frame", {
        Size=UDim2.new(0,44,0,17), Position=UDim2.new(1,-82,0,6),
        BackgroundColor3=T.SurfaceAlt, BackgroundTransparency=0.25,
        BorderSizePixel=0, ZIndex=8, Parent=TitleBar,
    }); Corner(verBg,5)
    New("TextLabel", {
        Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
        Text="v"..NexusUI.Version, TextColor3=T.TextMute,
        TextSize=9, Font=Enum.Font.GothamBold, ZIndex=9, Parent=verBg,
    })

    -- Close button (premium circle style)
    local CloseBg  = Color3.fromRGB(255,68,68)
    local CloseHov = Color3.fromRGB(235,40,40)
    local CloseBtn = New("TextButton", {
        Size=UDim2.new(0,28,0,28), Position=UDim2.new(1,-40,0.5,-14),
        BackgroundColor3=CloseBg, BorderSizePixel=0,
        Text="", AutoButtonColor=false, ZIndex=9, Parent=TitleBar,
    }); Corner(CloseBtn,14)
    Stroke(CloseBtn, Color3.fromRGB(255,100,100), 1, 0.5)
    -- "×" icon
    New("TextLabel", {
        Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
        Text="✕", TextColor3=Color3.new(1,1,1),
        TextSize=11, Font=Enum.Font.GothamBold, ZIndex=10, Parent=CloseBtn,
    })
    CloseBtn.MouseEnter:Connect(function()
        Tween(CloseBtn, {BackgroundColor3=CloseHov, Size=UDim2.new(0,30,0,30)}, 0.10)
        CloseBtn.Position = UDim2.new(1,-41,0.5,-15)
    end)
    CloseBtn.MouseLeave:Connect(function()
        Tween(CloseBtn, {BackgroundColor3=CloseBg, Size=UDim2.new(0,28,0,28)}, 0.14)
        CloseBtn.Position = UDim2.new(1,-40,0.5,-14)
    end)

    -- ════════════════════════════════════════════════════════════════
    --  BODY  +  SIDEBAR  +  RIGHT PANEL
    -- ════════════════════════════════════════════════════════════════
    local Body = New("Frame", {
        Name="Body", Size=UDim2.new(1,0,1,-TH),
        Position=UDim2.new(0,0,0,TH),
        BackgroundTransparency=1,
        ClipsDescendants=false, ZIndex=3, Parent=WinFrame,
    })

    -- Sidebar
    local Sidebar = New("Frame", {
        Name="Sidebar", Size=UDim2.new(0,SB,1,0),
        BackgroundColor3=T.Sidebar, BorderSizePixel=0,
        ZIndex=4, Parent=Body,
    })
    Grad(Sidebar, T.Sidebar, T.SidebarB, 180)
    -- Right border line
    New("Frame", {
        Size=UDim2.new(0,1,1,0), Position=UDim2.new(1,-1,0,0),
        BackgroundColor3=T.Border, BorderSizePixel=0, ZIndex=5, Parent=Sidebar,
    })

    local TabScroll = New("ScrollingFrame", {
        Size=UDim2.new(1,0,1,-8), Position=UDim2.new(0,0,0,6),
        BackgroundTransparency=1, BorderSizePixel=0,
        ScrollBarThickness=2, ScrollBarImageColor3=T.Accent,
        ScrollingDirection=Enum.ScrollingDirection.Y,
        AutomaticCanvasSize=Enum.AutomaticSize.Y,
        CanvasSize=UDim2.new(0,0,0,0), ZIndex=5, Parent=Sidebar,
    })
    Pad(TabScroll, 6, 6, 6, 6); ListY(TabScroll, 2)

    -- Right content panel
    local RightPanel = New("Frame", {
        Name="RightPanel",
        Size=UDim2.new(1,-SB,1,0), Position=UDim2.new(0,SB,0,0),
        BackgroundTransparency=1, ClipsDescendants=true,
        ZIndex=4, Parent=Body,
    })

    -- ── Notification stack ─────────────────────────────────────────
    local NotifHolder = New("Frame", {
        Name="Notifs", Size=UDim2.new(0,320,1,-INSET-12),
        Position=UDim2.new(1,-330,0,INSET+6),
        BackgroundTransparency=1, ZIndex=88, Parent=Screen,
    })
    local NL = Instance.new("UIListLayout")
    NL.SortOrder=Enum.SortOrder.LayoutOrder
    NL.VerticalAlignment=Enum.VerticalAlignment.Bottom
    NL.HorizontalAlignment=Enum.HorizontalAlignment.Right
    NL.Padding=UDim.new(0,7); NL.Parent=NotifHolder
    Pad(NotifHolder,0,0,16,0)

    -- ════════════════════════════════════════════════════════════════
    --  FLOATING TOGGLE BUTTON
    -- ════════════════════════════════════════════════════════════════
    local TICON = cfg.ToggleIcon or ""
    local TB_SZ = 46

    local ToggleWrap = New("Frame", {
        Name="ToggleWrap", AnchorPoint=Vector2.new(.5,0),
        Position=UDim2.new(.5,0,0,22),
        Size=UDim2.new(0,TB_SZ+16,0,TB_SZ+16),
        BackgroundTransparency=1, ZIndex=92, Visible=false, Parent=Screen,
    })
    local TBGlow = New("Frame", {
        AnchorPoint=Vector2.new(.5,.5), Position=UDim2.new(.5,0,.5,0),
        Size=UDim2.new(1,12,1,12),
        BackgroundColor3=T.Accent, BackgroundTransparency=0.60,
        BorderSizePixel=0, ZIndex=92, Parent=ToggleWrap,
    }); Corner(TBGlow,(TB_SZ+24)/2)
    local TBGlow2 = New("Frame", {
        AnchorPoint=Vector2.new(.5,.5), Position=UDim2.new(.5,0,.5,0),
        Size=UDim2.new(1,24,1,24),
        BackgroundColor3=T.Accent, BackgroundTransparency=0.84,
        BorderSizePixel=0, ZIndex=91, Parent=ToggleWrap,
    }); Corner(TBGlow2,(TB_SZ+32)/2)

    local TBtn = New("ImageButton", {
        Name="ToggleBtn", AnchorPoint=Vector2.new(.5,.5),
        Position=UDim2.new(.5,0,.5,0),
        Size=UDim2.new(0,TB_SZ,0,TB_SZ),
        BackgroundColor3=T.Accent, BorderSizePixel=0,
        Image=TICON, ImageColor3=Color3.new(1,1,1),
        ImageTransparency=TICON==""  and 1 or 0,
        ScaleType=Enum.ScaleType.Fit, AutoButtonColor=false,
        ZIndex=94, Parent=ToggleWrap,
    }); Corner(TBtn,TB_SZ/2)
    Stroke(TBtn,T.AccentB,1.5,0.2)
    -- Gradient on toggle button
    Grad(TBtn, T.Accent, T.AccentB, 135)
    New("TextLabel", {
        Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
        Text="☰", TextColor3=Color3.new(1,1,1), TextSize=22,
        Font=Enum.Font.GothamBold,
        Visible=TICON=="", ZIndex=95, Parent=TBtn,
    })

    TBtn.MouseEnter:Connect(function()
        Tween(TBGlow, {BackgroundTransparency=0.42}, 0.12)
        Tween(TBtn,   {BackgroundColor3=T.AccentB},  0.12)
    end)
    TBtn.MouseLeave:Connect(function()
        Tween(TBGlow, {BackgroundTransparency=0.60}, 0.16)
        Tween(TBtn,   {BackgroundColor3=T.Accent},   0.16)
    end)
    TBtn.MouseButton1Down:Connect(function()
        TweenSpring(TBtn,{Size=UDim2.new(0,TB_SZ-6,0,TB_SZ-6)},0.10)
    end)
    TBtn.MouseButton1Up:Connect(function()
        TweenSpring(TBtn,{Size=UDim2.new(0,TB_SZ,0,TB_SZ)},0.22)
    end)

    -- ── Show / hide helpers ─────────────────────────────────────────
    local function showUI()
        ToggleWrap.Visible=false
        Root.Visible=true
        TweenSpring(Root,     {Size=UDim2.new(0,W,0,H)},         0.48)
        Tween(WinFrame,  {BackgroundTransparency=0},              0.32)
        Tween(WinStroke, {Transparency=0},                        0.32)
        Tween(Sh1, {ImageTransparency=0.44}, 0.52)
        Tween(Sh2, {ImageTransparency=0.58}, 0.52)
        Tween(Sh3, {ImageTransparency=0.70}, 0.52)
    end
    local function hideUI()
        Tween(Root,     {Size=UDim2.new(0,W*0.90,0,H*0.90)}, 0.20)
        Tween(WinFrame, {BackgroundTransparency=1},            0.18)
        Tween(WinStroke,{Transparency=1},                      0.18)
        Tween(Sh1,{ImageTransparency=1},0.14)
        Tween(Sh2,{ImageTransparency=1},0.14)
        Tween(Sh3,{ImageTransparency=1},0.14)
        task.delay(0.22, function()
            Root.Visible=false
            ToggleWrap.Visible=true
            TBtn.Size=UDim2.new(0,TB_SZ*0.60,0,TB_SZ*0.60)
            TweenSpring(TBtn,{Size=UDim2.new(0,TB_SZ,0,TB_SZ)},0.40)
        end)
    end

    TBtn.MouseButton1Click:Connect(showUI)
    TBtn.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.Touch then showUI() end
    end)
    CloseBtn.MouseButton1Click:Connect(hideUI)
    CloseBtn.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.Touch then hideUI() end
    end)

    -- ════════════════════════════════════════════════════════════════
    --  WINDOW OBJECT
    -- ════════════════════════════════════════════════════════════════
    local Window = {
        _screen=Screen, _root=Root, _win=WinFrame,
        _notifCt=0, _tabs={}, _activeTab=nil,
        Visible=true, Config=cfgSys, Theme=T,
        _connections={},
    }
    local function TrackConn(c) table.insert(Window._connections,c) end

    -- ════════════════════════════════════════════════════════════════
    --  DRAG  (clamped, velocity-smoothed)
    -- ════════════════════════════════════════════════════════════════
    do
        local drag,ds,rs=false,nil,nil
        local function clampPos(x,y)
            local sv=ViewportSize()
            local hw,hh=Root.AbsoluteSize.X/2,Root.AbsoluteSize.Y/2
            return math.clamp(x,hw+MARGIN,sv.X-hw-MARGIN),
                   math.clamp(y,hh+INSET, sv.Y-hh-MARGIN)
        end
        TitleBar.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then
                drag=true; ds=i.Position; rs=Root.Position
            end
        end)
        TrackConn(UIS.InputChanged:Connect(function(i)
            if not drag then return end
            if i.UserInputType==Enum.UserInputType.MouseMovement
            or i.UserInputType==Enum.UserInputType.Touch then
                local d=i.Position-ds
                local x2,y2=clampPos(rs.X.Offset+d.X,rs.Y.Offset+d.Y)
                Root.Position=UDim2.new(0,x2,0,y2)
            end
        end))
        TrackConn(UIS.InputEnded:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then drag=false end
        end))
    end

    -- Toggle key
    TrackConn(UIS.InputBegan:Connect(function(i,proc)
        if proc then return end
        if i.KeyCode==toggleKey then
            if Root.Visible then Window.Visible=false; hideUI()
            else Window.Visible=true; showUI() end
        end
    end))

    -- ════════════════════════════════════════════════════════════════
    --  NOTIFICATION  (v7: glassmorphism card, larger, richer layout)
    -- ════════════════════════════════════════════════════════════════
    function Window:Notify(c)
        c=c or {}
        local nTitle = c.Title    or "Notice"
        local nText  = c.Text     or ""
        local nDur   = c.Duration or 4.5
        local nType  = c.Type     or "Info"
        local colMap = {Success=T.Success,Warning=T.Warning,Error=T.Error,Info=T.Info}
        local icoMap = {Success="✓",Warning="!",Error="✕",Info="i"}
        local col    = colMap[nType] or T.Info
        local ico    = icoMap[nType] or "i"

        self._notifCt = self._notifCt+1
        local ord = self._notifCt

        -- Card
        local nf = New("Frame",{
            Name="N"..ord, Size=UDim2.new(1,0,0,96),
            BackgroundColor3=T.Surface, BorderSizePixel=0,
            LayoutOrder=-ord, ClipsDescendants=true,
            ZIndex=90, Parent=NotifHolder,
        }); Corner(nf,16)
        Stroke(nf,T.Border,1.2,0.04)
        -- Subtle inner gradient
        Grad(nf, T.Surface, T.SurfaceAlt, 135)

        -- Left accent bar (rounded both ends)
        local acBar=New("Frame",{
            Size=UDim2.new(0,4,0.72,0), Position=UDim2.new(0,0,0.14,0),
            BackgroundColor3=col, BorderSizePixel=0, ZIndex=92, Parent=nf,
        }); Corner(acBar,3)

        -- Icon area
        local icCircle=New("Frame",{
            Size=UDim2.new(0,40,0,40), Position=UDim2.new(0,14,0.5,-20),
            BackgroundColor3=col, BackgroundTransparency=0.80,
            BorderSizePixel=0, ZIndex=92, Parent=nf,
        }); Corner(icCircle,12)
        Stroke(icCircle,col,1.5,0.60)
        local icInner=New("Frame",{
            Size=UDim2.new(0,26,0,26), AnchorPoint=Vector2.new(.5,.5),
            Position=UDim2.new(.5,0,.5,0),
            BackgroundColor3=col, BackgroundTransparency=0.50,
            BorderSizePixel=0, ZIndex=93, Parent=icCircle,
        }); Corner(icInner,8)
        New("TextLabel",{
            Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
            Text=ico, TextColor3=col, TextSize=14,
            Font=Enum.Font.GothamBold, ZIndex=94, Parent=icInner,
        })
        -- Icon pulse
        task.defer(function()
            Tween(icCircle,{BackgroundTransparency=0.60},0.25)
            task.delay(0.25,function() Tween(icCircle,{BackgroundTransparency=0.82},0.35) end)
        end)

        -- Close button
        local xBtn=New("TextButton",{
            Size=UDim2.new(0,24,0,24), Position=UDim2.new(1,-28,0,8),
            BackgroundTransparency=1, Text="×",
            TextColor3=T.TextMute, TextSize=18,
            Font=Enum.Font.GothamBold, AutoButtonColor=false, ZIndex=93, Parent=nf,
        })
        xBtn.MouseEnter:Connect(function() xBtn.TextColor3=T.Text end)
        xBtn.MouseLeave:Connect(function() xBtn.TextColor3=T.TextMute end)

        -- Title + body
        local titleLbl=New("TextLabel",{
            Size=UDim2.new(1,-70,0,20), Position=UDim2.new(0,62,0,12),
            BackgroundTransparency=1, Text=nTitle,
            TextColor3=T.Text, TextSize=13, Font=Enum.Font.GothamBold,
            TextXAlignment=Enum.TextXAlignment.Left, ZIndex=93, Parent=nf,
        })
        local bodyLbl=New("TextLabel",{
            Size=UDim2.new(1,-70,0,0), AutomaticSize=Enum.AutomaticSize.Y,
            Position=UDim2.new(0,62,0,34),
            BackgroundTransparency=1, Text=nText,
            TextColor3=T.TextSub, TextSize=11, Font=Enum.Font.Gotham,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextWrapped=true, ZIndex=93, Parent=nf,
        })

        -- Progress bar
        local pbBg=New("Frame",{
            Size=UDim2.new(1,-16,0,3), Position=UDim2.new(0,8,1,-5),
            BackgroundColor3=T.BorderSoft, BorderSizePixel=0, ZIndex=91, Parent=nf,
        }); Corner(pbBg,2)
        local pb=New("Frame",{
            Size=UDim2.new(1,0,1,0), BackgroundColor3=col,
            BorderSizePixel=0, ZIndex=92, Parent=pbBg,
        }); Corner(pb,2)
        Tween(pb,{Size=UDim2.new(0,0,1,0)},nDur,Enum.EasingStyle.Linear)

        -- Slide in (from right, spring)
        nf.Position=UDim2.new(0,340,0,0)
        TweenSpring(nf,{Position=UDim2.new(0,0,0,0)},0.42)

        -- Dismiss
        local gone=false
        local function dismiss()
            if gone then return end; gone=true
            Tween(nf,      {Position=UDim2.new(0,340,0,0)},   0.28, Enum.EasingStyle.Sine)
            Tween(nf,      {BackgroundTransparency=1},         0.22)
            Tween(acBar,   {BackgroundTransparency=1},         0.18)
            Tween(icCircle,{BackgroundTransparency=1},         0.18)
            Tween(icInner, {BackgroundTransparency=1},         0.18)
            Tween(titleLbl,{TextTransparency=1},               0.16)
            Tween(bodyLbl, {TextTransparency=1},               0.16)
            task.delay(0.32,function() if nf and nf.Parent then nf:Destroy() end end)
        end
        xBtn.MouseButton1Click:Connect(dismiss)
        nf.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then dismiss() end
        end)
        task.delay(nDur,dismiss)
    end

    -- ════════════════════════════════════════════════════════════════
    --  ALERT MODAL  (v7: sharper slide-up, richer buttons)
    -- ════════════════════════════════════════════════════════════════
    function Window:Alert(c)
        c=c or {}
        local aTitle   = c.Title       or "Alert"
        local aText    = c.Text        or ""
        local confTxt  = c.ConfirmText or "Confirm"
        local canTxt   = c.CancelText  or "Cancel"
        local onConf   = c.OnConfirm   or function() end
        local onCanc   = c.OnCancel    or function() end
        local onDismiss= c.OnDismiss   or onCanc

        local overlay=New("Frame",{
            Size=UDim2.new(1,0,1,0), BackgroundColor3=Color3.new(0,0,0),
            BackgroundTransparency=1, ZIndex=200, Parent=Screen,
        })
        Tween(overlay,{BackgroundTransparency=0.60},0.22)

        local modal=New("Frame",{
            AnchorPoint=Vector2.new(.5,.5),
            Position=UDim2.new(.5,0,.5,40),
            Size=UDim2.new(0,340,0,0),
            AutomaticSize=Enum.AutomaticSize.Y,
            BackgroundColor3=T.Surface, BorderSizePixel=0,
            ZIndex=202, Parent=Screen,
        }); Corner(modal,20); Stroke(modal,T.Border,1.5,0)
        Pad(modal,24,24,24,24); ListY(modal,16)
        Grad(modal, T.Surface, T.SurfaceAlt, 135)

        -- Top accent stripe
        local mStripe=New("Frame",{
            Size=UDim2.new(1,0,0,3),
            BackgroundColor3=T.Accent, BorderSizePixel=0, ZIndex=203, Parent=modal,
        })
        GradSeq(mStripe,ColorSequence.new({
            ColorSequenceKeypoint.new(0.00,Color3.new(0,0,0)),
            ColorSequenceKeypoint.new(0.20,T.Accent),
            ColorSequenceKeypoint.new(0.80,T.Accent),
            ColorSequenceKeypoint.new(1.00,Color3.new(0,0,0)),
        }),0)

        New("TextLabel",{
            Size=UDim2.new(1,0,0,0), AutomaticSize=Enum.AutomaticSize.Y,
            BackgroundTransparency=1, Text=aTitle,
            TextColor3=T.Text, TextSize=17, Font=Enum.Font.GothamBold,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextWrapped=true, LayoutOrder=1, ZIndex=203, Parent=modal,
        })
        New("TextLabel",{
            Size=UDim2.new(1,0,0,0), AutomaticSize=Enum.AutomaticSize.Y,
            BackgroundTransparency=1, Text=aText,
            TextColor3=T.TextSub, TextSize=12, Font=Enum.Font.Gotham,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextWrapped=true, LayoutOrder=2, ZIndex=203, Parent=modal,
        })

        local btnRow=New("Frame",{
            Size=UDim2.new(1,0,0,40), LayoutOrder=3,
            BackgroundTransparency=1, ZIndex=203, Parent=modal,
        })
        local bl=Instance.new("UIListLayout")
        bl.FillDirection=Enum.FillDirection.Horizontal
        bl.SortOrder=Enum.SortOrder.LayoutOrder
        bl.HorizontalAlignment=Enum.HorizontalAlignment.Right
        bl.Padding=UDim.new(0,10); bl.Parent=btnRow

        local function closeModal()
            Tween(overlay,{BackgroundTransparency=1},0.20)
            Tween(modal,{BackgroundTransparency=1,Position=UDim2.new(.5,0,.5,60)},0.24)
            task.delay(0.28,function() overlay:Destroy(); modal:Destroy() end)
        end
        local function MBtn(txt,bg,hov,ord,action)
            local b=New("TextButton",{
                Size=UDim2.new(0,0,1,0), AutomaticSize=Enum.AutomaticSize.X,
                BackgroundColor3=bg, BorderSizePixel=0,
                Text=txt, TextColor3=Color3.new(1,1,1),
                TextSize=12, Font=Enum.Font.GothamSemibold,
                AutoButtonColor=false, LayoutOrder=ord, ZIndex=204, Parent=btnRow,
            }); Corner(b,10); Pad(b,0,18,0,18)
            Grad(b, bg, hov, 90)
            b.MouseEnter:Connect(function() Tween(b,{BackgroundColor3=hov},0.10) end)
            b.MouseLeave:Connect(function() Tween(b,{BackgroundColor3=bg },0.10) end)
            b.MouseButton1Click:Connect(function() closeModal(); task.defer(action) end)
            b.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then
                    closeModal(); task.defer(action)
                end
            end)
        end
        MBtn(canTxt,  T.SurfaceAlt, T.SurfaceHov, 1, onCanc)
        MBtn(confTxt, T.Accent,     T.AccentB,     2, onConf)

        -- Slide up animation
        modal.BackgroundTransparency=1
        task.defer(function()
            Tween(modal,{BackgroundTransparency=0,Position=UDim2.new(.5,0,.5,0)},
                  0.36,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
        end)
        overlay.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then
                closeModal(); task.defer(onDismiss)
            end
        end)
    end

    -- ════════════════════════════════════════════════════════════════
    --  TAB CREATION
    -- ════════════════════════════════════════════════════════════════
    function Window:CreateTab(name, iconId)
        -- Sidebar pill
        local tabBtn=New("TextButton",{
            Name=name.."_Btn", Size=UDim2.new(1,0,0,42),
            BackgroundColor3=T.SurfaceAlt, BackgroundTransparency=1,
            BorderSizePixel=0, Text="", AutoButtonColor=false,
            LayoutOrder=#self._tabs+1, ZIndex=6, Parent=TabScroll,
        }); Corner(tabBtn,10)

        -- Active pill background (fills whole button, glows)
        local activePill=New("Frame",{
            Size=UDim2.new(1,0,1,0), BackgroundColor3=T.SurfaceGlow,
            BackgroundTransparency=1, BorderSizePixel=0,
            ZIndex=6, Parent=tabBtn,
        }); Corner(activePill,10)

        -- Left accent bar
        local activeBar=New("Frame",{
            Size=UDim2.new(0,3,0,22), Position=UDim2.new(0,0,0.5,-11),
            BackgroundColor3=T.Accent, BackgroundTransparency=1,
            BorderSizePixel=0, ZIndex=8, Parent=tabBtn,
        }); Corner(activeBar,2)

        -- Optional icon
        local txOff=12
        local tabIcon
        if iconId then
            tabIcon=New("ImageLabel",{
                Size=UDim2.new(0,16,0,16), Position=UDim2.new(0,13,0.5,-8),
                BackgroundTransparency=1, Image=iconId,
                ImageColor3=T.TextSub, ZIndex=7, Parent=tabBtn,
            })
            txOff=36
        end

        local tabLbl=New("TextLabel",{
            Size=UDim2.new(1,-(txOff+8),1,0), Position=UDim2.new(0,txOff,0,0),
            BackgroundTransparency=1, Text=name,
            TextColor3=T.TextSub, TextSize=12, Font=Enum.Font.Gotham,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextTruncate=Enum.TextTruncate.AtEnd, ZIndex=7, Parent=tabBtn,
        })

        -- Content scroll
        local scroll=New("ScrollingFrame",{
            Name=name.."_Scroll", Size=UDim2.new(1,0,1,0),
            BackgroundTransparency=1, BorderSizePixel=0,
            ScrollBarThickness=3, ScrollBarImageColor3=T.Accent,
            AutomaticCanvasSize=Enum.AutomaticSize.Y,
            CanvasSize=UDim2.new(0,0,0,0),
            ScrollingDirection=Enum.ScrollingDirection.Y,
            Visible=false, ZIndex=5, Parent=RightPanel,
        })
        Pad(scroll,12,12,18,12); ListY(scroll,7)

        local Tab={
            _content=scroll, _btn=tabBtn,
            _bar=activeBar, _pill=activePill,
            _lbl=tabLbl, _icon=tabIcon,
            _idx=0, T=T,
        }

        local function activate()
            if Window._activeTab and Window._activeTab~=Tab then
                local p=Window._activeTab
                p._content.Visible=false
                Tween(p._pill,{BackgroundTransparency=1},0.18)
                Tween(p._lbl, {TextColor3=T.TextSub},   0.18)
                Tween(p._bar, {BackgroundTransparency=1},0.18)
                p._lbl.Font=Enum.Font.Gotham
                if p._icon then Tween(p._icon,{ImageColor3=T.TextSub},0.18) end
            end
            Window._activeTab=Tab
            scroll.Visible=true
            Tween(activePill,{BackgroundTransparency=0.88},0.22)
            Tween(tabLbl,    {TextColor3=T.Accent},         0.22)
            Tween(activeBar, {BackgroundTransparency=0},    0.22)
            tabLbl.Font=Enum.Font.GothamSemibold
            if tabIcon then Tween(tabIcon,{ImageColor3=T.Accent},0.22) end
        end

        tabBtn.MouseButton1Click:Connect(activate)
        tabBtn.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.Touch then activate() end
        end)
        tabBtn.MouseEnter:Connect(function()
            if Window._activeTab~=Tab then
                Tween(activePill,{BackgroundTransparency=0.94},0.12)
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if Window._activeTab~=Tab then
                Tween(activePill,{BackgroundTransparency=1},0.14)
            end
        end)

        if #self._tabs==0 then task.defer(activate) end
        table.insert(self._tabs, Tab)

        -- ════════════════════════════════════════════════════════
        --  ELEMENT HELPERS
        -- ════════════════════════════════════════════════════════
        local function nextIdx() Tab._idx=Tab._idx+1; return Tab._idx end

        local function Card(h, noClip)
            local f=New("Frame",{
                Size=UDim2.new(1,0,0,h or 56),
                LayoutOrder=nextIdx(),
                BackgroundColor3=T.Surface,
                BorderSizePixel=0,
                ClipsDescendants=not noClip,
                ZIndex=6, Parent=scroll,
            }); Corner(f,14)
            Stroke(f,T.Border,1,0.35)
            return f
        end

        local function NameLbl(parent, text, yOff)
            return New("TextLabel",{
                Size=UDim2.new(1,-110,0,18),
                Position=yOff~=nil and UDim2.new(0,16,0,yOff) or UDim2.new(0,16,0.5,-9),
                BackgroundTransparency=1, Text=text,
                TextColor3=T.Text, TextSize=13, Font=Enum.Font.GothamSemibold,
                TextXAlignment=Enum.TextXAlignment.Left, ZIndex=7, Parent=parent,
            })
        end

        local function DescLbl(parent, text, yOff)
            return New("TextLabel",{
                Size=UDim2.new(1,-28,0,12), Position=UDim2.new(0,16,0,yOff or 0),
                BackgroundTransparency=1, Text=text,
                TextColor3=T.TextSub, TextSize=10, Font=Enum.Font.Gotham,
                TextXAlignment=Enum.TextXAlignment.Left,
                TextTruncate=Enum.TextTruncate.AtEnd, ZIndex=7, Parent=parent,
            })
        end

        local function HitBtn(parent, z)
            return New("TextButton",{
                Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                Text="", AutoButtonColor=false,
                ZIndex=z or 9, Parent=parent,
            })
        end

        -- ════════════════════════════════════════════════════════
        --  BASE ELEMENT  — Show/Hide/Enable/Disable
        -- ════════════════════════════════════════════════════════
        local function BaseEl(frame, cornerR)
            local disabled=false; local veil
            local origTransp=frame.BackgroundTransparency
            local el={}
            el.Show    = function() frame.Visible=true  end
            el.Hide    = function() frame.Visible=false end
            el.Enable  = function()
                if not disabled then return end; disabled=false
                if veil then veil.Visible=false end
                Tween(frame,{BackgroundTransparency=origTransp},0.14)
            end
            el.Disable = function()
                if disabled then return end; disabled=true
                if not veil then
                    veil=New("TextButton",{
                        Size=UDim2.new(1,0,1,0),
                        BackgroundColor3=Color3.fromRGB(0,0,0),
                        BackgroundTransparency=0.50,
                        Text="", AutoButtonColor=false,
                        BorderSizePixel=0, ZIndex=50, Parent=frame,
                    }); Corner(veil,cornerR or 14)
                end
                veil.Visible=true
            end
            el.IsDisabled = function() return disabled end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  SECTION HEADER  (v7: bolder, accent dot)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateSection(c)
            c=c or {}
            local f=New("Frame",{
                Size=UDim2.new(1,0,0,32), LayoutOrder=nextIdx(),
                BackgroundTransparency=1, ZIndex=6, Parent=scroll,
            })
            -- Accent left dot
            local dot=New("Frame",{
                Size=UDim2.new(0,6,0,6), Position=UDim2.new(0,2,0.5,-3),
                BackgroundColor3=T.Accent, BorderSizePixel=0, ZIndex=7, Parent=f,
            }); Corner(dot,3)
            local lbl=New("TextLabel",{
                Size=UDim2.new(0,0,1,0), AutomaticSize=Enum.AutomaticSize.X,
                Position=UDim2.new(0,13,0,0),
                BackgroundTransparency=1, Text=(c.Text or "Section"):upper(),
                TextColor3=T.Accent, TextSize=10, Font=Enum.Font.GothamBold,
                TextXAlignment=Enum.TextXAlignment.Left, ZIndex=7, Parent=f,
            })
            -- Trailing separator
            local trail=New("Frame",{
                Size=UDim2.new(1,-20,0,1), Position=UDim2.new(0,18,0.5,0),
                BackgroundColor3=T.Border, BorderSizePixel=0,
                BackgroundTransparency=0.40, ZIndex=6, Parent=f,
            })
            lbl:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                local w=lbl.AbsoluteSize.X
                trail.Position=UDim2.new(0,16+w+8,0.5,0)
                trail.Size=UDim2.new(1,-(16+w+8+4),0,1)
            end)
            local el=BaseEl(f,0)
            el.SetText=function(t) lbl.Text=t:upper() end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  TOGGLE  (v7: larger track, smooth spring knob)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateToggle(c)
            c=c or {}
            local nm   = c.Name        or "Toggle"
            local desc = c.Description
            local def  = c.Default     or false
            local cb   = c.Callback    or function() end
            local flag = c.Flag

            local card=Card(desc and 66 or 56)
            local nameLblRef=NameLbl(card,nm,desc and 10)
            if desc then DescLbl(card,desc,32) end

            -- Track: 54×30
            local TW,TH2,KD,INS=54,30,24,3
            local track=New("Frame",{
                Size=UDim2.new(0,TW,0,TH2),
                Position=UDim2.new(1,-(TW+15),0.5,-TH2/2),
                BackgroundColor3=def and T.ToggleOn or T.ToggleOff,
                BorderSizePixel=0, ZIndex=7, Parent=card,
            }); Corner(track,TH2/2)
            Stroke(track,Color3.fromRGB(0,0,0),1,0.88)

            local kOFF=UDim2.new(0,INS,0.5,-KD/2)
            local kON =UDim2.new(0,TW-KD-INS,0.5,-KD/2)
            local knob=New("Frame",{
                Size=UDim2.new(0,KD,0,KD),
                Position=def and kON or kOFF,
                BackgroundColor3=Color3.new(1,1,1),
                BorderSizePixel=0, ZIndex=9, Parent=track,
            }); Corner(knob,KD/2)
            Stroke(knob,Color3.fromRGB(0,0,0),1,0.92)
            -- Knob shadow (frame behind it)
            local knobSh=New("Frame",{
                Size=UDim2.new(0,KD+4,0,KD+4),
                Position=def and UDim2.new(0,TW-KD-INS-2,0.5,-KD/2-2)
                             or UDim2.new(0,INS-2,0.5,-KD/2-2),
                BackgroundColor3=Color3.fromRGB(0,0,0),
                BackgroundTransparency=0.70, BorderSizePixel=0,
                ZIndex=8, Parent=track,
            }); Corner(knobSh,(KD+4)/2)

            local val=def; local busy=false
            local function setVal(v,silent)
                if busy then return end; busy=true; val=v
                local sqW=KD+8
                Tween(knob,{Size=UDim2.new(0,sqW,0,KD)},0.06)
                if v then
                    Tween(track,{BackgroundColor3=T.ToggleOn},0.24,Enum.EasingStyle.Sine)
                    task.delay(0.06,function()
                        TweenSpring(knob,{Position=UDim2.new(0,TW-sqW-INS,0.5,-KD/2),
                            Size=UDim2.new(0,KD,0,KD)},0.26)
                        TweenSpring(knobSh,{Position=UDim2.new(0,TW-KD-INS-2,0.5,-KD/2-2)},0.26)
                    end)
                else
                    Tween(track,{BackgroundColor3=T.ToggleOff},0.24,Enum.EasingStyle.Sine)
                    task.delay(0.06,function()
                        TweenSpring(knob,{Position=kOFF,Size=UDim2.new(0,KD,0,KD)},0.26)
                        TweenSpring(knobSh,{Position=UDim2.new(0,INS-2,0.5,-KD/2-2)},0.26)
                    end)
                end
                task.delay(0.34,function() busy=false end)
                if not silent then cb(v) end
            end

            local th=New("TextButton",{
                Size=UDim2.new(0,TW+24,1,0),
                Position=UDim2.new(1,-(TW+26),0,0),
                BackgroundTransparency=1, Text="", AutoButtonColor=false, ZIndex=11, Parent=card,
            })
            th.MouseButton1Click:Connect(function() setVal(not val) end)
            th.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then setVal(not val) end
            end)
            local ch=HitBtn(card,8)
            ch.MouseButton1Click:Connect(function() setVal(not val) end)
            ch.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then setVal(not val) end
            end)
            -- Card hover
            ch.MouseEnter:Connect(function() Tween(card,{BackgroundColor3=T.SurfaceAlt},0.14) end)
            ch.MouseLeave:Connect(function() Tween(card,{BackgroundColor3=T.Surface},   0.14) end)

            if flag and cfgSys then cfgSys:reg(flag,def,setVal) end
            local el=BaseEl(card)
            el.Set     = setVal
            el.Get     = function() return val end
            el.SetName = function(t) nameLblRef.Text=t end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  BUTTON  (v7: gradient face, loading dots, glow pulse)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateButton(c)
            c=c or {}
            local nm   = c.Name        or "Button"
            local desc = c.Description
            local ico  = c.Icon
            local cb   = c.Callback    or function() end

            local card=Card(desc and 64 or 56, true)
            -- Subtle accent tint on card
            Grad(card, T.Surface, T.SurfaceAlt, 135)
            local xOff=ico and 46 or 18

            local nameLbl=New("TextLabel",{
                Size=UDim2.new(1,-56,0,18),
                Position=desc and UDim2.new(0,xOff,0,10) or UDim2.new(0,xOff,0.5,-9),
                BackgroundTransparency=1, Text=nm,
                TextColor3=T.Accent, TextSize=13, Font=Enum.Font.GothamSemibold,
                TextXAlignment=Enum.TextXAlignment.Left, ZIndex=7, Parent=card,
            })
            if desc then DescLbl(card,desc,32) end
            if ico then
                New("ImageLabel",{
                    Size=UDim2.new(0,20,0,20), Position=UDim2.new(0,16,0.5,-10),
                    BackgroundTransparency=1, Image=ico,
                    ImageColor3=T.Accent, ZIndex=7, Parent=card,
                })
            end
            -- Arrow chevron
            local chevron=New("TextLabel",{
                Size=UDim2.new(0,24,1,0), Position=UDim2.new(1,-28,0,0),
                BackgroundTransparency=1, Text="›",
                TextColor3=T.Accent, TextSize=24, Font=Enum.Font.GothamBold,
                ZIndex=7, Parent=card,
            })

            -- Loading dots
            local dotContainer=New("Frame",{
                Size=UDim2.new(0,50,0,10), AnchorPoint=Vector2.new(.5,.5),
                Position=UDim2.new(0.5,0,0.5,0),
                BackgroundTransparency=1, Visible=false, ZIndex=8, Parent=card,
            })
            local dots={}
            for di=1,3 do
                dots[di]=New("Frame",{
                    Size=UDim2.new(0,8,0,8), AnchorPoint=Vector2.new(.5,.5),
                    Position=UDim2.new(0,(di-1)*21+5,0.5,0),
                    BackgroundColor3=T.Accent, BorderSizePixel=0,
                    ZIndex=9, Parent=dotContainer,
                }); Corner(dots[di],4)
            end

            local loading=false
            local function startSpinner()
                local function bounce(di)
                    if not loading then return end
                    task.delay((di-1)*0.14,function()
                        if not loading then return end
                        Tween(dots[di],{Position=UDim2.new(0,(di-1)*21+5,0.5,-6)},0.16,Enum.EasingStyle.Sine)
                        task.delay(0.18,function()
                            if not loading then return end
                            Tween(dots[di],{Position=UDim2.new(0,(di-1)*21+5,0.5,0)},0.16,Enum.EasingStyle.Sine)
                        end)
                    end)
                end
                local function loop()
                    if not loading then return end
                    bounce(1);bounce(2);bounce(3)
                    task.delay(0.72,loop)
                end
                loop()
            end

            local hit=HitBtn(card)
            local function press(px,py)
                if loading then return end
                Ripple(card,px,py,T.Accent)
                Tween(card,{BackgroundColor3=T.SurfaceHov},0.08)
                Tween(chevron,{TextColor3=T.AccentB},0.08)
                task.delay(0.16,function()
                    Tween(card,{BackgroundColor3=T.Surface},0.20)
                    Tween(chevron,{TextColor3=T.Accent},0.20)
                end)
                cb()
            end
            hit.MouseButton1Click:Connect(function()
                local mp=UIS:GetMouseLocation()
                press(mp.X-card.AbsolutePosition.X,mp.Y-card.AbsolutePosition.Y)
            end)
            hit.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then
                    press(i.Position.X-card.AbsolutePosition.X,i.Position.Y-card.AbsolutePosition.Y)
                end
            end)
            hit.MouseEnter:Connect(function()
                if not loading then Tween(card,{BackgroundColor3=T.SurfaceAlt},0.14) end
            end)
            hit.MouseLeave:Connect(function()
                if not loading then Tween(card,{BackgroundColor3=T.Surface},   0.14) end
            end)

            local el=BaseEl(card)
            el.SetLoading=function(_,v)
                if type(_)=="boolean" then v=_ end
                loading=v
                nameLbl.Visible=not v
                chevron.Visible=not v
                dotContainer.Visible=v
                if v then card.BackgroundColor3=T.SurfaceAlt; startSpinner()
                else card.BackgroundColor3=T.Surface end
            end
            el.SetText=function(t) nameLbl.Text=t end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  SLIDER  (v7: thicker track, tooltip bubble, glow knob)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateSlider(c)
            c=c or {}
            local nm   = c.Name        or "Slider"
            local desc = c.Description
            local mn   = c.Min         or 0
            local mx   = c.Max         or 100
            local def  = c.Default     or mn
            local inc  = c.Increment   or 1
            local suf  = c.Suffix      or ""
            local cb   = c.Callback    or function() end
            local flag = c.Flag

            local card=Card(desc and 82 or 70)
            local nameLblRef=NameLbl(card,nm,10)
            def=math.clamp(def,mn,mx)

            -- Value badge (top-right, pill shape)
            local vBg=New("Frame",{
                Size=UDim2.new(0,68,0,24), Position=UDim2.new(1,-78,0,9),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ZIndex=7, Parent=card,
            }); Corner(vBg,8); Stroke(vBg,T.Border,1,0.30)
            local vLbl=New("TextLabel",{
                Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                Text=tostring(def)..suf, TextColor3=T.Accent,
                TextSize=12, Font=Enum.Font.GothamBold,
                ZIndex=8, Parent=vBg,
            })

            if desc then DescLbl(card,desc,34) end

            local trkY=desc and 58 or 46
            local trkBg=New("Frame",{
                Size=UDim2.new(1,-28,0,8), Position=UDim2.new(0,14,0,trkY),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ZIndex=7, Parent=card,
            }); Corner(trkBg,4)
            Stroke(trkBg,T.BorderSoft,1,0.40)

            local fill=New("Frame",{
                Size=UDim2.new(0,0,1,0), BackgroundColor3=T.Accent,
                BorderSizePixel=0, ZIndex=8, Parent=trkBg,
            }); Corner(fill,4)
            -- Fill gradient
            Grad(fill, T.Accent, T.AccentB, 0)
            -- Fill sheen
            New("Frame",{
                Size=UDim2.new(1,0,0.5,0), BackgroundColor3=Color3.new(1,1,1),
                BackgroundTransparency=0.88, BorderSizePixel=0, ZIndex=9, Parent=fill,
            })

            -- Knob glow ring
            local knobGlow=New("Frame",{
                Size=UDim2.new(0,30,0,30), AnchorPoint=Vector2.new(.5,.5),
                Position=UDim2.new(0,0,0.5,0),
                BackgroundColor3=T.Accent, BackgroundTransparency=1,
                BorderSizePixel=0, ZIndex=8, Parent=trkBg,
            }); Corner(knobGlow,15)

            -- Knob
            local knob=New("Frame",{
                Size=UDim2.new(0,20,0,20), AnchorPoint=Vector2.new(.5,.5),
                Position=UDim2.new(0,0,0.5,0),
                BackgroundColor3=Color3.new(1,1,1),
                BorderSizePixel=0, ZIndex=10, Parent=trkBg,
            }); Corner(knob,10); Stroke(knob,T.Accent,2,0)

            -- Tooltip bubble (visible while dragging)
            local tooltip=New("Frame",{
                Size=UDim2.new(0,52,0,22), AnchorPoint=Vector2.new(.5,1),
                Position=UDim2.new(0,0,0,-6),
                BackgroundColor3=T.Accent, BorderSizePixel=0,
                ZIndex=12, Visible=false, Parent=trkBg,
            }); Corner(tooltip,7)
            local tooltipLbl=New("TextLabel",{
                Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                Text=tostring(def)..suf, TextColor3=Color3.new(1,1,1),
                TextSize=11, Font=Enum.Font.GothamBold, ZIndex=13, Parent=tooltip,
            })

            local curVal=def; local sliding=false; local lastFired=nil
            local function snap(v) return math.clamp(math.round(v/inc)*inc,mn,mx) end
            local function applyAlpha(a)
                a=math.clamp(a,0,1)
                local sv=snap(mn+(mx-mn)*a); curVal=sv
                local ta=(sv-mn)/(mx-mn)
                fill.Size        = UDim2.new(ta,0,1,0)
                knob.Position    = UDim2.new(ta,0,0.5,0)
                knobGlow.Position= UDim2.new(ta,0,0.5,0)
                tooltip.Position = UDim2.new(ta,0,0,-6)
                vLbl.Text        = tostring(sv)..suf
                tooltipLbl.Text  = tostring(sv)..suf
                if sv~=lastFired then lastFired=sv; cb(sv) end
            end
            local function fromInput(i)
                applyAlpha((i.Position.X-trkBg.AbsolutePosition.X)/trkBg.AbsoluteSize.X)
            end

            -- Hit zone (tall for easy touch)
            local hitZ=New("Frame",{
                Size=UDim2.new(1,0,0,46), Position=UDim2.new(0,0,0.5,-23),
                BackgroundTransparency=1, ZIndex=10, Parent=trkBg,
            }); Corner(hitZ,4)
            local hitB=New("TextButton",{
                Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                Text="", AutoButtonColor=false, ZIndex=11, Parent=hitZ,
            }); Corner(hitB,4)

            hitB.MouseEnter:Connect(function()
                if not sliding then
                    TweenSpring(knob,{Size=UDim2.new(0,22,0,22)},0.14)
                    Tween(knobGlow,{BackgroundTransparency=0.78},0.14)
                end
            end)
            hitB.MouseLeave:Connect(function()
                if not sliding then
                    Tween(knob,    {Size=UDim2.new(0,20,0,20)},0.16)
                    Tween(knobGlow,{BackgroundTransparency=1},  0.16)
                end
            end)
            hitB.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.MouseButton1
                or i.UserInputType==Enum.UserInputType.Touch then
                    sliding=true; fromInput(i)
                    TweenSpring(knob,{Size=UDim2.new(0,24,0,24)},0.12)
                    Tween(knobGlow,{BackgroundTransparency=0.70},0.12)
                    tooltip.Visible=true
                    TweenSpring(tooltip,{Size=UDim2.new(0,52,0,22)},0.20)
                end
            end)
            TrackConn(UIS.InputChanged:Connect(function(i)
                if not sliding then return end
                if i.UserInputType==Enum.UserInputType.MouseMovement
                or i.UserInputType==Enum.UserInputType.Touch then fromInput(i) end
            end))
            TrackConn(UIS.InputEnded:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.MouseButton1
                or i.UserInputType==Enum.UserInputType.Touch then
                    sliding=false
                    Tween(knob,    {Size=UDim2.new(0,20,0,20)},0.18,Enum.EasingStyle.Back)
                    Tween(knobGlow,{BackgroundTransparency=1},  0.18)
                    Tween(tooltip, {Size=UDim2.new(0,0,0,0)},  0.14)
                    task.delay(0.16,function() tooltip.Visible=false; tooltip.Size=UDim2.new(0,52,0,22) end)
                end
            end))

            -- Set initial position
            local ia=(def-mn)/(mx-mn)
            fill.Size=UDim2.new(ia,0,1,0)
            knob.Position=UDim2.new(ia,0,0.5,0)
            knobGlow.Position=UDim2.new(ia,0,0.5,0)
            tooltip.Position=UDim2.new(ia,0,0,-6)

            if flag and cfgSys then cfgSys:reg(flag,def,function(v) applyAlpha((v-mn)/(mx-mn)) end) end
            local el=BaseEl(card)
            el.Set     = function(v) applyAlpha((v-mn)/(mx-mn)) end
            el.Get     = function() return curVal end
            el.SetName = function(t) nameLblRef.Text=t end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  DROPDOWN  (v7: accordion, hover glow rows, search-hint)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateDropdown(c)
            c=c or {}
            local nm   = c.Name     or "Dropdown"
            local opts = c.Options  or {}
            local def  = c.Default  or opts[1] or "None"
            local cb   = c.Callback or function() end
            local flag = c.Flag

            local HEADER_H = 56
            local OPT_H    = 44
            local MAX_OPTS = 5
            local GAP      = 5

            local card=New("Frame",{
                Size=UDim2.new(1,0,0,HEADER_H), LayoutOrder=nextIdx(),
                BackgroundColor3=T.Surface, BorderSizePixel=0,
                ClipsDescendants=true, ZIndex=6, Parent=scroll,
            }); Corner(card,14); Stroke(card,T.Border,1,0.35)

            local header=New("Frame",{
                Size=UDim2.new(1,0,0,HEADER_H),
                BackgroundTransparency=1, ZIndex=7, Parent=card,
            })
            NameLbl(header,nm,nil)

            local selLbl=New("TextLabel",{
                Size=UDim2.new(0.42,0,1,0), Position=UDim2.new(0.52,0,0,0),
                BackgroundTransparency=1, Text=def,
                TextColor3=T.TextSub, TextSize=12, Font=Enum.Font.Gotham,
                TextXAlignment=Enum.TextXAlignment.Right,
                TextTruncate=Enum.TextTruncate.AtEnd, ZIndex=8, Parent=header,
            })
            -- Arrow with background pill
            local arrowBg=New("Frame",{
                Size=UDim2.new(0,26,0,26), Position=UDim2.new(1,-36,0.5,-13),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ZIndex=8, Parent=header,
            }); Corner(arrowBg,8)
            local arrow=New("TextLabel",{
                Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                Text="⌄", TextColor3=T.Accent, TextSize=16,
                Font=Enum.Font.GothamBold, ZIndex=9, Parent=arrowBg,
            })

            local dropHit=New("TextButton",{
                Size=UDim2.new(1,0,0,HEADER_H),
                BackgroundTransparency=1, Text="",
                AutoButtonColor=false, ZIndex=10, Parent=card,
            }); Corner(dropHit,14)

            local listScroll=New("ScrollingFrame",{
                Size=UDim2.new(1,-10,0,0),
                Position=UDim2.new(0,5,0,HEADER_H+GAP),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ScrollBarThickness=2, ScrollBarImageColor3=T.Accent,
                AutomaticCanvasSize=Enum.AutomaticSize.Y,
                CanvasSize=UDim2.new(0,0,0,0),
                ScrollingDirection=Enum.ScrollingDirection.Y,
                ZIndex=8, Parent=card,
            }); Corner(listScroll,10); Stroke(listScroll,T.Border,1,0.20)
            Pad(listScroll,4,4,4,4); ListY(listScroll,2)

            local selVal=def; local isOpen=false

            local function listH()
                return math.min(#opts,MAX_OPTS)*OPT_H+8
            end
            local function close()
                isOpen=false
                Tween(card,      {Size=UDim2.new(1,0,0,HEADER_H)},               0.26)
                Tween(listScroll,{Size=UDim2.new(1,-10,0,0)},                    0.22)
                Tween(arrow,     {Rotation=0,TextColor3=T.Accent},               0.20)
                Tween(arrowBg,   {BackgroundColor3=T.SurfaceAlt},                0.20)
            end
            local function open()
                isOpen=true
                local lh=listH()
                Tween(card,      {Size=UDim2.new(1,0,0,HEADER_H+GAP+lh+8)},     0.30)
                Tween(listScroll,{Size=UDim2.new(1,-10,0,lh)},                   0.26)
                Tween(arrow,     {Rotation=180,TextColor3=T.Accent},             0.20)
                Tween(arrowBg,   {BackgroundColor3=T.SurfaceGlow},               0.20)
            end

            local function rebuild(o)
                for _,ch in pairs(listScroll:GetChildren()) do
                    if ch:IsA("TextButton") or ch:IsA("Frame") then ch:Destroy() end
                end
                for i,opt in ipairs(o) do
                    local sel=(opt==selVal)
                    local row=New("Frame",{
                        Size=UDim2.new(1,0,0,OPT_H-2),
                        BackgroundColor3=sel and T.SurfaceGlow or T.SurfaceAlt,
                        BackgroundTransparency=sel and 0 or 1,
                        BorderSizePixel=0, LayoutOrder=i, ZIndex=9, Parent=listScroll,
                    }); Corner(row,8)
                    if sel then Stroke(row,T.Accent,1,0.50) end

                    New("TextLabel",{
                        Size=UDim2.new(1,-40,1,0), Position=UDim2.new(0,12,0,0),
                        BackgroundTransparency=1, Text=opt,
                        TextColor3=sel and T.Accent or T.Text,
                        TextSize=12,
                        Font=sel and Enum.Font.GothamSemibold or Enum.Font.Gotham,
                        TextXAlignment=Enum.TextXAlignment.Left, ZIndex=10, Parent=row,
                    })
                    if sel then
                        New("TextLabel",{
                            Size=UDim2.new(0,20,1,0), Position=UDim2.new(1,-24,0,0),
                            BackgroundTransparency=1, Text="✓",
                            TextColor3=T.Accent, TextSize=12,
                            Font=Enum.Font.GothamBold, ZIndex=10, Parent=row,
                        })
                    end

                    local ob=New("TextButton",{
                        Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                        Text="", AutoButtonColor=false, ZIndex=11, Parent=row,
                    })
                    ob.MouseEnter:Connect(function()
                        if not sel then Tween(row,{BackgroundTransparency=0.80},0.10) end
                    end)
                    ob.MouseLeave:Connect(function()
                        if not sel then Tween(row,{BackgroundTransparency=1},0.12) end
                    end)
                    local fired=false
                    local function pick()
                        if fired then return end; fired=true
                        selVal=opt; selLbl.Text=opt
                        close(); cb(opt); rebuild(o)
                    end
                    ob.MouseButton1Down:Connect(pick)
                    ob.MouseButton1Click:Connect(pick)
                    ob.InputBegan:Connect(function(inp)
                        if inp.UserInputType==Enum.UserInputType.Touch then pick() end
                    end)
                end
            end
            rebuild(opts)

            local function tog() if isOpen then close() else open() end end
            dropHit.MouseButton1Click:Connect(tog)
            dropHit.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then tog() end
            end)
            dropHit.MouseEnter:Connect(function()
                if not isOpen then Tween(card,{BackgroundColor3=T.SurfaceAlt},0.14) end
            end)
            dropHit.MouseLeave:Connect(function()
                Tween(card,{BackgroundColor3=T.Surface},0.14)
            end)

            if flag and cfgSys then
                cfgSys:reg(flag,def,function(v) selVal=v;selLbl.Text=v;cb(v) end)
            end
            local el=BaseEl(card)
            el.Set     = function(v) selVal=v; selLbl.Text=v; rebuild(opts); cb(v) end
            el.Get     = function() return selVal end
            el.Refresh = function(o) opts=o; rebuild(o) end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  MULTI-DROPDOWN  (v7: checkmark rows, count badge)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateMultiDropdown(c)
            c=c or {}
            local nm     = c.Name      or "MultiSelect"
            local opts   = c.Options   or {}
            local def    = c.Default   or {}
            local maxSel = c.MaxSelect or 0
            local cb     = c.Callback  or function() end

            local selected={}
            for _,v in ipairs(def) do selected[v]=true end

            local card=New("Frame",{
                Size=UDim2.new(1,0,0,56), LayoutOrder=nextIdx(),
                BackgroundColor3=T.Surface, BorderSizePixel=0,
                ClipsDescendants=false, ZIndex=10, Parent=scroll,
            }); Corner(card,14); Stroke(card,T.Border,1,0.35)

            NameLbl(card,nm,nil)

            -- Count badge
            local countBg=New("Frame",{
                Size=UDim2.new(0,0,0,24), AutomaticSize=Enum.AutomaticSize.X,
                Position=UDim2.new(1,-72,0.5,-12),
                BackgroundColor3=T.Accent, BackgroundTransparency=0.76,
                BorderSizePixel=0, ZIndex=11, Parent=card,
            }); Corner(countBg,7); Pad(countBg,0,10,0,10)
            local countLbl=New("TextLabel",{
                Size=UDim2.new(0,0,1,0), AutomaticSize=Enum.AutomaticSize.X,
                BackgroundTransparency=1, Text="None",
                TextColor3=T.Accent, TextSize=11, Font=Enum.Font.GothamBold,
                ZIndex=12, Parent=countBg,
            })

            local arrowBg2=New("Frame",{
                Size=UDim2.new(0,26,0,26), Position=UDim2.new(1,-36,0.5,-13),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ZIndex=11, Parent=card,
            }); Corner(arrowBg2,8)
            local arrow=New("TextLabel",{
                Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                Text="⌄", TextColor3=T.Accent, TextSize=16,
                Font=Enum.Font.GothamBold, ZIndex=12, Parent=arrowBg2,
            })

            local list=New("ScrollingFrame",{
                Size=UDim2.new(1,0,0,0), Position=UDim2.new(0,0,1,5),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ScrollBarThickness=3, ScrollBarImageColor3=T.Accent,
                AutomaticCanvasSize=Enum.AutomaticSize.Y,
                CanvasSize=UDim2.new(0,0,0,0),
                ScrollingDirection=Enum.ScrollingDirection.Y,
                ClipsDescendants=true, ZIndex=20, Visible=false, Parent=card,
            }); Corner(list,12); Stroke(list,T.Border,1,0.10)
            Pad(list,5,5,5,5); ListY(list,2)

            local OPT_H=46; local MAX_H=228
            local isOpen=false; local optBtns={}

            local function getSelected()
                local t={}
                for v in pairs(selected) do table.insert(t,v) end
                return t
            end
            local function updateCount()
                local n=#getSelected()
                countLbl.Text = n==0 and "None" or tostring(n)
                Tween(countBg,{BackgroundTransparency=n==0 and 0.76 or 0.58},0.12)
            end
            local function refreshRow(opt)
                local btn=optBtns[opt]; if not btn then return end
                local sel=selected[opt]==true
                Tween(btn._bg,{BackgroundTransparency=sel and 0.78 or 1},0.14)
                btn._check.Text=sel and "✓" or ""
                btn._lbl.TextColor3=sel and T.Accent or T.Text
                btn._lbl.Font=sel and Enum.Font.GothamSemibold or Enum.Font.Gotham
            end
            local function closeM()
                isOpen=false
                Tween(list,{Size=UDim2.new(1,0,0,0)},0.20)
                Tween(arrow,{Rotation=0},0.18)
                task.delay(0.22,function() list.Visible=false end)
            end
            local function openM()
                isOpen=true; list.Visible=true
                local h=math.min(#opts*OPT_H+10,MAX_H)
                Tween(list,{Size=UDim2.new(1,0,0,h)},0.24,Enum.EasingStyle.Back)
                Tween(arrow,{Rotation=180},0.18)
            end

            for i,opt in ipairs(opts) do
                local row=New("Frame",{
                    Size=UDim2.new(1,0,0,OPT_H-2),
                    BackgroundTransparency=1, BorderSizePixel=0,
                    LayoutOrder=i, ZIndex=21, Parent=list,
                })
                local rowBg=New("Frame",{
                    Size=UDim2.new(1,0,1,0),
                    BackgroundColor3=T.SurfaceGlow, BackgroundTransparency=1,
                    BorderSizePixel=0, ZIndex=21, Parent=row,
                }); Corner(rowBg,8)

                local chkBox=New("Frame",{
                    Size=UDim2.new(0,18,0,18), Position=UDim2.new(0,10,0.5,-9),
                    BackgroundColor3=T.Accent, BackgroundTransparency=selected[opt] and 0 or 1,
                    BorderSizePixel=0, ZIndex=22, Parent=row,
                }); Corner(chkBox,5); Stroke(chkBox,T.Accent,1.5,0)
                local chkLbl=New("TextLabel",{
                    Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                    Text=selected[opt] and "✓" or "",
                    TextColor3=Color3.new(1,1,1), TextSize=11,
                    Font=Enum.Font.GothamBold, ZIndex=23, Parent=chkBox,
                })
                local optLbl=New("TextLabel",{
                    Size=UDim2.new(1,-38,1,0), Position=UDim2.new(0,36,0,0),
                    BackgroundTransparency=1, Text=opt,
                    TextColor3=selected[opt] and T.Accent or T.Text,
                    TextSize=12,
                    Font=selected[opt] and Enum.Font.GothamSemibold or Enum.Font.Gotham,
                    TextXAlignment=Enum.TextXAlignment.Left, ZIndex=22, Parent=row,
                })

                optBtns[opt]={_bg=rowBg,_check=chkLbl,_lbl=optLbl}

                local hitBtn=New("TextButton",{
                    Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                    Text="", AutoButtonColor=false, ZIndex=26, Parent=row,
                })
                local mFired=false
                local function pick()
                    if mFired then return end; mFired=true
                    if selected[opt] then
                        selected[opt]=nil
                    else
                        if maxSel>0 and #getSelected()>=maxSel then mFired=false; return end
                        selected[opt]=true
                    end
                    refreshRow(opt); updateCount(); cb(getSelected())
                    task.delay(0.05,function() mFired=false end)
                end
                hitBtn.MouseButton1Down:Connect(pick)
                hitBtn.MouseButton1Click:Connect(pick)
                hitBtn.InputBegan:Connect(function(i)
                    if i.UserInputType==Enum.UserInputType.Touch then pick() end
                end)
                hitBtn.MouseEnter:Connect(function() Tween(rowBg,{BackgroundTransparency=0.82},0.10) end)
                hitBtn.MouseLeave:Connect(function()
                    Tween(rowBg,{BackgroundTransparency=selected[opt] and 0.78 or 1},0.10)
                end)
            end
            updateCount()

            local dropHit=New("TextButton",{
                Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                Text="", AutoButtonColor=false, ZIndex=12, Parent=card,
            })
            local function tog() if isOpen then closeM() else openM() end end
            dropHit.MouseButton1Click:Connect(tog)
            dropHit.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then tog() end
            end)
            dropHit.MouseEnter:Connect(function() Tween(card,{BackgroundColor3=T.SurfaceAlt},0.12) end)
            dropHit.MouseLeave:Connect(function() Tween(card,{BackgroundColor3=T.Surface},   0.12) end)

            local el=BaseEl(card)
            el.Get   = getSelected
            el.Set   = function(arr)
                selected={}
                for _,v in ipairs(arr) do selected[v]=true end
                for _,opt in ipairs(opts) do refreshRow(opt) end
                updateCount(); cb(getSelected())
            end
            el.Clear = function()
                selected={}
                for _,opt in ipairs(opts) do refreshRow(opt) end
                updateCount(); cb({})
            end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  STEPPER  (v7: rounder controls, hold-to-repeat)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateStepper(c)
            c=c or {}
            local nm   = c.Name        or "Stepper"
            local desc = c.Description
            local mn   = c.Min         or 0
            local mx   = c.Max         or 100
            local def  = c.Default     or mn
            local inc  = c.Increment   or 1
            local suf  = c.Suffix      or ""
            local cb   = c.Callback    or function() end
            local flag = c.Flag

            local card=Card(desc and 66 or 56)
            NameLbl(card,nm,desc and 10)
            if desc then DescLbl(card,desc,32) end

            local CTRL_W=122; local BTN_SZ=32
            local ctrlFrame=New("Frame",{
                Size=UDim2.new(0,CTRL_W,0,BTN_SZ),
                Position=UDim2.new(1,-(CTRL_W+14),0.5,-BTN_SZ/2),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ZIndex=7, Parent=card,
            }); Corner(ctrlFrame,11); Stroke(ctrlFrame,T.Border,1,0.25)

            local curVal=math.clamp(def,mn,mx)
            local valLbl=New("TextLabel",{
                Size=UDim2.new(1,-BTN_SZ*2,1,0), Position=UDim2.new(0,BTN_SZ,0,0),
                BackgroundTransparency=1, Text=tostring(curVal)..suf,
                TextColor3=T.Text, TextSize=13, Font=Enum.Font.GothamBold,
                ZIndex=8, Parent=ctrlFrame,
            })

            local function StepBtn(xPos,symbol,delta)
                local b=New("TextButton",{
                    Size=UDim2.new(0,BTN_SZ,1,0), Position=UDim2.new(0,xPos,0,0),
                    BackgroundColor3=T.SurfaceAlt, BackgroundTransparency=1,
                    BorderSizePixel=0, Text=symbol,
                    TextColor3=T.Accent, TextSize=20, Font=Enum.Font.GothamBold,
                    AutoButtonColor=false, ZIndex=9, Parent=ctrlFrame,
                }); Corner(b,11)
                local function step()
                    curVal=math.clamp(curVal+delta,mn,mx)
                    valLbl.Text=tostring(curVal)..suf
                    TweenSpring(b,{Size=UDim2.new(0,BTN_SZ-4,0,BTN_SZ-4),
                        Position=UDim2.new(0,xPos+2,0.5,-(BTN_SZ-4)/2)},0.08)
                    task.delay(0.10,function()
                        TweenSpring(b,{Size=UDim2.new(0,BTN_SZ,0,BTN_SZ-0),
                            Position=UDim2.new(0,xPos,0,0)},0.18)
                    end)
                    Tween(b,{TextColor3=Color3.new(1,1,1)},0.06)
                    task.delay(0.10,function() Tween(b,{TextColor3=T.Accent},0.16) end)
                    cb(curVal)
                end
                local holding=false
                b.MouseButton1Click:Connect(step)
                b.InputBegan:Connect(function(i)
                    if i.UserInputType==Enum.UserInputType.Touch then
                        step(); holding=true
                        task.delay(0.40,function()
                            while holding do step(); task.wait(0.08) end
                        end)
                    elseif i.UserInputType==Enum.UserInputType.MouseButton1 then
                        holding=true
                        task.delay(0.40,function()
                            while holding do step(); task.wait(0.08) end
                        end)
                    end
                end)
                b.InputEnded:Connect(function(i)
                    if i.UserInputType==Enum.UserInputType.MouseButton1
                    or i.UserInputType==Enum.UserInputType.Touch then holding=false end
                end)
                b.MouseEnter:Connect(function() Tween(b,{BackgroundTransparency=0.86},0.10) end)
                b.MouseLeave:Connect(function() Tween(b,{BackgroundTransparency=1},0.12); holding=false end)
                return b
            end

            StepBtn(0,              "−", -inc)
            StepBtn(CTRL_W-BTN_SZ, "+",  inc)
            -- Divider lines
            New("Frame",{Size=UDim2.new(0,1,0.6,0),Position=UDim2.new(0,BTN_SZ,0.2,0),
                BackgroundColor3=T.Border,BorderSizePixel=0,ZIndex=8,Parent=ctrlFrame})
            New("Frame",{Size=UDim2.new(0,1,0.6,0),Position=UDim2.new(1,-BTN_SZ-1,0.2,0),
                BackgroundColor3=T.Border,BorderSizePixel=0,ZIndex=8,Parent=ctrlFrame})

            if flag and cfgSys then
                cfgSys:reg(flag,def,function(v)
                    curVal=math.clamp(v,mn,mx); valLbl.Text=tostring(curVal)..suf
                end)
            end
            local el=BaseEl(card)
            el.Set     = function(v) curVal=math.clamp(v,mn,mx); valLbl.Text=tostring(curVal)..suf end
            el.Get     = function() return curVal end
            el.SetName = function(t)
                local lbl=card:FindFirstChildWhichIsA("TextLabel")
                if lbl then lbl.Text=t end
            end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  TEXTBOX  (v7: focus ring glow, char counter, clear btn)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateTextbox(c)
            c=c or {}
            local nm       = c.Name        or "Textbox"
            local ph       = c.Placeholder or "Type here…"
            local def      = c.Default     or ""
            local cof      = c.ClearOnFocus~=nil and c.ClearOnFocus or false
            local cb       = c.Callback    or function() end
            local onChange = c.OnChange
            local maxC     = c.MaxChars    or 0

            local card=Card(84)
            NameLbl(card,nm,9)

            local ibg=New("Frame",{
                Size=UDim2.new(1,-28,0,36), Position=UDim2.new(0,14,0,37),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ZIndex=7, Parent=card,
            }); Corner(ibg,11)
            local ist=Stroke(ibg,T.Border,1.5,0.20)

            local ib=New("TextBox",{
                Size=UDim2.new(1,-40,1,0), Position=UDim2.new(0,12,0,0),
                BackgroundTransparency=1, Text=def,
                PlaceholderText=ph, TextColor3=T.Text,
                PlaceholderColor3=T.TextMute,
                TextSize=12, Font=Enum.Font.Gotham,
                TextXAlignment=Enum.TextXAlignment.Left,
                ClearTextOnFocus=cof, ZIndex=8, Parent=ibg,
            })

            -- Char counter (if maxC set)
            local charLbl
            if maxC>0 then
                charLbl=New("TextLabel",{
                    Size=UDim2.new(0,40,0,12), Position=UDim2.new(1,-4,1,2),
                    BackgroundTransparency=1,
                    Text="0/"..maxC, TextColor3=T.TextMute,
                    TextSize=9, Font=Enum.Font.Gotham,
                    TextXAlignment=Enum.TextXAlignment.Right,
                    ZIndex=8, Parent=ibg,
                })
            end

            local clrBtn=New("TextButton",{
                Size=UDim2.new(0,26,0,26), Position=UDim2.new(1,-30,0.5,-13),
                BackgroundTransparency=1, Text="×",
                TextColor3=T.TextMute, TextSize=18, Font=Enum.Font.GothamBold,
                AutoButtonColor=false, ZIndex=9,
                Visible=def~="", Parent=ibg,
            })
            clrBtn.MouseEnter:Connect(function() clrBtn.TextColor3=T.Error end)
            clrBtn.MouseLeave:Connect(function() clrBtn.TextColor3=T.TextMute end)
            clrBtn.MouseButton1Click:Connect(function() ib.Text=""; clrBtn.Visible=false end)

            ib:GetPropertyChangedSignal("Text"):Connect(function()
                clrBtn.Visible=ib.Text~=""
                if maxC>0 then
                    if #ib.Text>maxC then ib.Text=ib.Text:sub(1,maxC) end
                    if charLbl then
                        charLbl.Text=#ib.Text.."/"..maxC
                        charLbl.TextColor3=#ib.Text>=maxC and T.Warning or T.TextMute
                    end
                end
                if onChange then onChange(ib.Text) end
            end)
            ib.Focused:Connect(function()
                Tween(ibg,{BackgroundColor3=T.Surface},0.14)
                Tween(ist,{Color=T.Accent,Transparency=0,Thickness=2},0.14)
            end)
            ib.FocusLost:Connect(function()
                Tween(ibg,{BackgroundColor3=T.SurfaceAlt},0.14)
                Tween(ist,{Color=T.Border,Transparency=0.20,Thickness=1.5},0.14)
                cb(ib.Text)
            end)

            local el=BaseEl(card)
            el.Set = function(v) ib.Text=v end
            el.Get = function() return ib.Text end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  KEYBIND  (v7: animated listening dot, escape to cancel)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateKeybind(c)
            c=c or {}
            local nm  = c.Name     or "Keybind"
            local def = c.Default  or Enum.KeyCode.F
            local cb  = c.Callback or function() end

            local card=Card(56)
            NameLbl(card,nm,nil)

            local kbg=New("Frame",{
                Size=UDim2.new(0,104,0,30), Position=UDim2.new(1,-118,0.5,-15),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ZIndex=7, Parent=card,
            }); Corner(kbg,10); Stroke(kbg,T.Border,1,0.12)

            local klbl=New("TextButton",{
                Size=UDim2.new(1,-8,1,0), Position=UDim2.new(0,4,0,0),
                BackgroundTransparency=1,
                Text=def.Name, TextColor3=T.Accent,
                TextSize=11, Font=Enum.Font.GothamBold,
                AutoButtonColor=false, ZIndex=8, Parent=kbg,
            })

            -- Animated pulse dot (listening indicator)
            local lisDot=New("Frame",{
                Size=UDim2.new(0,7,0,7), Position=UDim2.new(0,8,0.5,-3.5),
                BackgroundColor3=T.Warning, BorderSizePixel=0,
                Visible=false, ZIndex=9, Parent=kbg,
            }); Corner(lisDot,4)

            local bound=def; local listening=false

            -- Pulse animation for listening dot
            local function pulseDot()
                if not listening then return end
                Tween(lisDot,{BackgroundTransparency=0},0.20)
                task.delay(0.22,function()
                    if not listening then return end
                    Tween(lisDot,{BackgroundTransparency=0.60},0.20)
                    task.delay(0.22,function() pulseDot() end)
                end)
            end

            klbl.MouseButton1Click:Connect(function()
                listening=true; klbl.Text="   press key…"
                klbl.TextColor3=T.Warning
                lisDot.Visible=true
                Tween(kbg,{BackgroundColor3=T.Surface},0.12)
                pulseDot()
            end)

            -- Card hover
            local ch=HitBtn(card,7)
            ch.MouseEnter:Connect(function()
                if not listening then Tween(card,{BackgroundColor3=T.SurfaceAlt},0.14) end
            end)
            ch.MouseLeave:Connect(function()
                Tween(card,{BackgroundColor3=T.Surface},0.14)
            end)

            TrackConn(UIS.InputBegan:Connect(function(inp,proc)
                if listening and inp.UserInputType==Enum.UserInputType.Keyboard then
                    if proc or inp.KeyCode==Enum.KeyCode.Escape then
                        listening=false; klbl.Text=bound.Name; klbl.TextColor3=T.Accent
                        lisDot.Visible=false
                        Tween(kbg,{BackgroundColor3=T.SurfaceAlt},0.12)
                        return
                    end
                    listening=false; bound=inp.KeyCode
                    klbl.Text=inp.KeyCode.Name; klbl.TextColor3=T.Accent
                    lisDot.Visible=false
                    Tween(kbg,{BackgroundColor3=T.SurfaceAlt},0.12)
                elseif not listening and not proc and inp.KeyCode==bound then
                    cb()
                end
            end))

            local el=BaseEl(card)
            el.GetKey = function() return bound end
            el.Set    = function(keyCode)
                bound=keyCode; klbl.Text=keyCode.Name; klbl.TextColor3=T.Accent
                lisDot.Visible=false; listening=false
                Tween(kbg,{BackgroundColor3=T.SurfaceAlt},0.12)
            end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  PROGRESS BAR  (v7: gradient fill, animated sheen)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateProgressBar(c)
            c=c or {}
            local nm  = c.Name    or "Progress"
            local def = math.clamp(c.Default or 0,0,100)
            local col = c.Color
            local suf = c.Suffix  or "%"

            local card=Card(70)
            local nameLblRef=NameLbl(card,nm,10)

            local fillCol=col or T.Accent
            -- Value label (top-right pill)
            local vBg=New("Frame",{
                Size=UDim2.new(0,60,0,22), Position=UDim2.new(1,-70,0,10),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ZIndex=7, Parent=card,
            }); Corner(vBg,7)
            local vLbl=New("TextLabel",{
                Size=UDim2.new(1,0,1,0), BackgroundTransparency=1,
                Text=tostring(math.floor(def))..suf,
                TextColor3=fillCol, TextSize=11, Font=Enum.Font.GothamBold,
                ZIndex=8, Parent=vBg,
            })

            -- Track
            local trkBg=New("Frame",{
                Size=UDim2.new(1,-28,0,10), Position=UDim2.new(0,14,0,46),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ZIndex=7, Parent=card,
            }); Corner(trkBg,5); Stroke(trkBg,T.BorderSoft,1,0.40)

            local fill=New("Frame",{
                Size=UDim2.new(def/100,0,1,0), BackgroundColor3=fillCol,
                BorderSizePixel=0, ZIndex=8, Parent=trkBg,
            }); Corner(fill,5)
            Grad(fill, fillCol, col and fillCol or T.AccentB, 0)

            -- Sheen
            local sheen=New("Frame",{
                Size=UDim2.new(1,0,0.5,0), BackgroundColor3=Color3.new(1,1,1),
                BackgroundTransparency=0.84, BorderSizePixel=0, ZIndex=9, Parent=fill,
            }); Corner(sheen,5)

            local curVal=def
            local function setVal(v)
                v=math.clamp(v,0,100); curVal=v
                Tween(fill,{Size=UDim2.new(v/100,0,1,0)},0.38,Enum.EasingStyle.Sine)
                vLbl.Text=tostring(math.floor(v))..suf
                -- Color shift: green at 100%, amber at ~50%, accent below
                if v>=100 then Tween(fill,{BackgroundColor3=T.Success},0.20)
                elseif v>=75 then Tween(fill,{BackgroundColor3=fillCol},0.20)
                end
            end
            local el=BaseEl(card)
            el.Set     = setVal
            el.Get     = function() return curVal end
            el.SetName = function(t) nameLblRef.Text=t end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  MULTI-PICKER  (v7: pill row, hover glow per pill)
        -- ════════════════════════════════════════════════════════
        function Tab:CreatePicker(c)
            c=c or {}
            local nm   = c.Name     or "Mode"
            local opts = c.Options  or {}
            local def  = c.Default  or opts[1]
            local cb   = c.Callback or function() end

            if #opts==0 then
                local card=Card(72); NameLbl(card,nm,10); return BaseEl(card)
            end

            local card=Card(72)
            local nameLblRef=NameLbl(card,nm,10)

            local row=New("Frame",{
                Size=UDim2.new(1,-28,0,34), Position=UDim2.new(0,14,0,32),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ZIndex=7, Parent=card,
            }); Corner(row,10); Stroke(row,T.Border,1,0.30)
            local pl=Instance.new("UIListLayout")
            pl.FillDirection=Enum.FillDirection.Horizontal
            pl.SortOrder=Enum.SortOrder.LayoutOrder
            pl.Padding=UDim.new(0,3)
            pl.VerticalAlignment=Enum.VerticalAlignment.Center
            pl.Parent=row; Pad(row,3,3,3,3)

            local pills={}; local selVal=def
            local function setActive(opt,silent)
                selVal=opt
                for o,btn in pairs(pills) do
                    local a=(o==opt)
                    Tween(btn,{BackgroundColor3=a and T.Accent or T.Surface,
                               BackgroundTransparency=a and 0 or 1},0.18)
                    btn.TextColor3=a and Color3.new(1,1,1) or T.TextSub
                    btn.Font=a and Enum.Font.GothamSemibold or Enum.Font.Gotham
                end
                if not silent then cb(opt) end
            end
            for i,opt in ipairs(opts) do
                local btn=New("TextButton",{
                    Size=UDim2.new(1/#opts,-(3*(#opts+1)/#opts),1,0),
                    BackgroundColor3=T.Surface, BackgroundTransparency=1,
                    BorderSizePixel=0, Text=opt, TextColor3=T.TextSub, TextSize=11,
                    Font=Enum.Font.Gotham, AutoButtonColor=false,
                    LayoutOrder=i, ZIndex=8, Parent=row,
                }); Corner(btn,8); pills[opt]=btn
                btn.MouseButton1Click:Connect(function() setActive(opt) end)
                btn.InputBegan:Connect(function(inp)
                    if inp.UserInputType==Enum.UserInputType.Touch then setActive(opt) end
                end)
                btn.MouseEnter:Connect(function()
                    if opt~=selVal then Tween(btn,{BackgroundTransparency=0.92},0.10) end
                end)
                btn.MouseLeave:Connect(function()
                    if opt~=selVal then Tween(btn,{BackgroundTransparency=1},0.12) end
                end)
            end
            task.defer(function() setActive(def,true) end)
            local el=BaseEl(card)
            el.Set     = function(v) setActive(v,false) end
            el.Get     = function() return selVal end
            el.SetName = function(t) nameLblRef.Text=t end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  LABEL  (v7: accent underline, uppercase tracking)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateLabel(c)
            c=c or {}
            local f=New("Frame",{
                Size=UDim2.new(1,0,0,24), LayoutOrder=nextIdx(),
                BackgroundTransparency=1, ZIndex=6, Parent=scroll,
            })
            local lbl=New("TextLabel",{
                Size=UDim2.new(1,-8,1,0), Position=UDim2.new(0,5,0,0),
                BackgroundTransparency=1, Text=(c.Text or "Label"):upper(),
                TextColor3=T.Accent, TextSize=10, Font=Enum.Font.GothamBold,
                TextXAlignment=Enum.TextXAlignment.Left, ZIndex=7, Parent=f,
            })
            -- Underline
            New("Frame",{
                Size=UDim2.new(1,-4,0,1), Position=UDim2.new(0,2,1,-1),
                BackgroundColor3=T.Accent, BackgroundTransparency=0.60,
                BorderSizePixel=0, ZIndex=6, Parent=f,
            })
            local el=BaseEl(f,0)
            el.SetText=function(t) lbl.Text=t:upper() end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  SEPARATOR  (v7: optional centered text)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateSeparator(c)
            c=c or {}
            local f=New("Frame",{
                Size=UDim2.new(1,0,0,18), LayoutOrder=nextIdx(),
                BackgroundTransparency=1, ZIndex=6, Parent=scroll,
            })
            if c.Text then
                -- Centered label with lines either side
                local lbl=New("TextLabel",{
                    Size=UDim2.new(0,0,1,0), AutomaticSize=Enum.AutomaticSize.X,
                    AnchorPoint=Vector2.new(.5,.5), Position=UDim2.new(.5,0,.5,0),
                    BackgroundTransparency=1, Text=c.Text,
                    TextColor3=T.TextMute, TextSize=10,
                    Font=Enum.Font.GothamSemibold, ZIndex=7, Parent=f,
                })
                New("Frame",{
                    Size=UDim2.new(0.46,0,0,1), Position=UDim2.new(0,0,0.5,0),
                    BackgroundColor3=T.BorderSoft, BorderSizePixel=0,
                    BackgroundTransparency=0.30, ZIndex=6, Parent=f,
                })
                New("Frame",{
                    Size=UDim2.new(0.46,0,0,1), Position=UDim2.new(0.54,0,0.5,0),
                    BackgroundColor3=T.BorderSoft, BorderSizePixel=0,
                    BackgroundTransparency=0.30, ZIndex=6, Parent=f,
                })
            else
                New("Frame",{
                    Size=UDim2.new(1,0,0,1), Position=UDim2.new(0,0,0.5,0),
                    BackgroundColor3=T.BorderSoft, BorderSizePixel=0,
                    BackgroundTransparency=0.30, ZIndex=7, Parent=f,
                })
            end
            return BaseEl(f,0)
        end

        -- ════════════════════════════════════════════════════════
        --  PARAGRAPH  (v7: inset card, title+body)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateParagraph(c)
            c=c or {}
            local f=New("Frame",{
                Size=UDim2.new(1,0,0,0), AutomaticSize=Enum.AutomaticSize.Y,
                LayoutOrder=nextIdx(), BackgroundColor3=T.Surface,
                BorderSizePixel=0, ZIndex=6, Parent=scroll,
            }); Corner(f,14); Stroke(f,T.Border,1,0.35)
            -- Left accent bar
            New("Frame",{
                Size=UDim2.new(0,3,1,0), BackgroundColor3=T.Accent,
                BackgroundTransparency=0.40, BorderSizePixel=0, ZIndex=7, Parent=f,
            })
            Pad(f,14,16,14,18); ListY(f,6)

            local tl
            if c.Title and c.Title~="" then
                tl=New("TextLabel",{
                    Size=UDim2.new(1,0,0,0), AutomaticSize=Enum.AutomaticSize.Y,
                    BackgroundTransparency=1, Text=c.Title,
                    TextColor3=T.Text, TextSize=13, Font=Enum.Font.GothamBold,
                    TextXAlignment=Enum.TextXAlignment.Left,
                    TextWrapped=true, LayoutOrder=1, ZIndex=7, Parent=f,
                })
            end
            local cl=New("TextLabel",{
                Size=UDim2.new(1,0,0,0), AutomaticSize=Enum.AutomaticSize.Y,
                BackgroundTransparency=1, Text=c.Content or "",
                TextColor3=T.TextSub, TextSize=11, Font=Enum.Font.Gotham,
                TextXAlignment=Enum.TextXAlignment.Left,
                TextWrapped=true, LayoutOrder=2, ZIndex=7, Parent=f,
            })
            local el=BaseEl(f,14)
            el.SetContent = function(t) cl.Text=t end
            el.SetTitle   = function(t) if tl then tl.Text=t end end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  COLOR DISPLAY  (v7: larger swatch, animated callback)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateColorDisplay(c)
            c=c or {}
            local nm  = c.Name    or "Color"
            local def = c.Default or Color3.fromRGB(112,140,255)
            local cb  = c.Callback or function() end
            local cur = def

            local card=Card(56)
            NameLbl(card,nm,nil)

            -- Swatch with inner ring
            local swatchRing=New("Frame",{
                Size=UDim2.new(0,46,0,34), Position=UDim2.new(1,-58,0.5,-17),
                BackgroundColor3=T.SurfaceAlt, BorderSizePixel=0,
                ZIndex=7, Parent=card,
            }); Corner(swatchRing,10); Stroke(swatchRing,T.Border,1,0.20)
            local prev=New("Frame",{
                Size=UDim2.new(1,-8,1,-8), AnchorPoint=Vector2.new(.5,.5),
                Position=UDim2.new(.5,0,.5,0),
                BackgroundColor3=def, BorderSizePixel=0,
                ZIndex=8, Parent=swatchRing,
            }); Corner(prev,7)

            local hit=HitBtn(card)
            hit.MouseButton1Click:Connect(function() cb(cur) end)
            hit.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then cb(cur) end
            end)
            hit.MouseEnter:Connect(function() Tween(card,{BackgroundColor3=T.SurfaceAlt},0.14) end)
            hit.MouseLeave:Connect(function() Tween(card,{BackgroundColor3=T.Surface},   0.14) end)

            local el=BaseEl(card)
            el.Set=function(v)
                cur=v
                Tween(prev,{BackgroundColor3=v},0.20)
            end
            el.Get=function() return cur end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  SHORT API ALIASES  (fully compatible with v6.x)
        -- ════════════════════════════════════════════════════════
        Tab.Toggle        = Tab.CreateToggle
        Tab.Button        = Tab.CreateButton
        Tab.Slider        = Tab.CreateSlider
        Tab.Dropdown      = Tab.CreateDropdown
        Tab.MultiDropdown = Tab.CreateMultiDropdown
        Tab.Stepper       = Tab.CreateStepper
        Tab.Textbox       = Tab.CreateTextbox
        Tab.Keybind       = Tab.CreateKeybind
        Tab.Progress      = Tab.CreateProgressBar
        Tab.Picker        = Tab.CreatePicker
        Tab.Section       = Tab.CreateSection
        Tab.Label         = Tab.CreateLabel
        Tab.Separator     = Tab.CreateSeparator
        Tab.Paragraph     = Tab.CreateParagraph
        Tab.ColorDisplay  = Tab.CreateColorDisplay

        return Tab
    end -- CreateTab

    -- ════════════════════════════════════════════════════════════════
    --  WINDOW METHODS
    -- ════════════════════════════════════════════════════════════════
    function Window:SaveConfig()
        if not self.Config then return end
        local ok,e=self.Config:save()
        self:Notify({
            Title=ok and "Config Saved"  or "Save Failed",
            Text =ok and self.Config._f  or tostring(e),
            Type =ok and "Success"       or "Error",
        })
    end

    function Window:LoadConfig()
        if not self.Config then return end
        local ok,e=self.Config:load()
        self:Notify({
            Title=ok and "Config Loaded" or "Load Failed",
            Text =ok and "Settings restored." or tostring(e),
            Type =ok and "Success"            or "Warning",
        })
    end

    function Window:ResetConfig()
        if not self.Config then return end
        self.Config:reset()
        self:Notify({Title="Config Reset",Text="All settings restored to default.",Type="Info"})
    end

    function Window:IsVisible()   return self.Visible end
    function Window:GetVersion()  return NexusUI.Version end

    function Window:Toggle()
        self:SetVisible(not self.Visible)
    end

    function Window:SetVisible(v)
        self.Visible=v
        if v then showUI() else hideUI() end
    end

    function Window:Destroy()
        for _,conn in ipairs(self._connections) do
            pcall(function() conn:Disconnect() end)
        end
        table.clear(self._connections)
        pcall(function() ToggleWrap:Destroy() end)
        pcall(function() Screen:Destroy() end)
    end

    -- Short aliases
    Window.Tab      = Window.CreateTab
    Window.Show     = Window.SetVisible
    Window.Close    = Window.Destroy
    Window.Visible_ = Window.IsVisible

    return Window
end -- CreateWindow

return NexusUI
