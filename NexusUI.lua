════════════════════════════════════════════════════════════════════
--  SERVICES
-- ════════════════════════════════════════════════════════════════════
local TS   = game:GetService("TweenService")
local UIS  = game:GetService("UserInputService")
local PL   = game:GetService("Players")
local HTTP = game:GetService("HttpService")
local LP   = PL.LocalPlayer

-- ════════════════════════════════════════════════════════════════════
--  THEMES  (9 built-in)
-- ════════════════════════════════════════════════════════════════════
local Themes = {
    -- ── Dark (classic deep navy) ──────────────────────────────────
    Dark = {
        Window     = Color3.fromRGB(13, 13, 20),
        Surface    = Color3.fromRGB(21, 21, 32),
        SurfaceAlt = Color3.fromRGB(29, 29, 44),
        SurfaceHov = Color3.fromRGB(36, 36, 54),
        Sidebar    = Color3.fromRGB(16, 16, 25),
        Accent     = Color3.fromRGB(100, 132, 255),
        AccentDark = Color3.fromRGB(72, 102, 225),
        Text       = Color3.fromRGB(232, 232, 255),
        TextSub    = Color3.fromRGB(128, 128, 168),
        TextMute   = Color3.fromRGB(76, 76, 108),
        Border     = Color3.fromRGB(42, 42, 64),
        BorderSoft = Color3.fromRGB(30, 30, 48),
        ToggleOff  = Color3.fromRGB(48, 48, 70),
        ToggleOn   = Color3.fromRGB(46, 204, 106),
        SliderFill = Color3.fromRGB(100, 132, 255),
        Success    = Color3.fromRGB(46, 204, 106),
        Warning    = Color3.fromRGB(255, 178, 44),
        Error      = Color3.fromRGB(255, 70, 70),
        Info       = Color3.fromRGB(100, 132, 255),
    },
    -- ── Midnight (pitch-black, electric blue) ─────────────────────
    Midnight = {
        Window     = Color3.fromRGB(7, 7, 13),
        Surface    = Color3.fromRGB(13, 13, 22),
        SurfaceAlt = Color3.fromRGB(19, 19, 33),
        SurfaceHov = Color3.fromRGB(25, 25, 43),
        Sidebar    = Color3.fromRGB(9, 9, 17),
        Accent     = Color3.fromRGB(78, 158, 255),
        AccentDark = Color3.fromRGB(52, 122, 220),
        Text       = Color3.fromRGB(218, 228, 255),
        TextSub    = Color3.fromRGB(108, 118, 160),
        TextMute   = Color3.fromRGB(62, 68, 100),
        Border     = Color3.fromRGB(28, 28, 50),
        BorderSoft = Color3.fromRGB(18, 18, 34),
        ToggleOff  = Color3.fromRGB(38, 38, 64),
        ToggleOn   = Color3.fromRGB(46, 204, 106),
        SliderFill = Color3.fromRGB(78, 158, 255),
        Success    = Color3.fromRGB(46, 204, 106),
        Warning    = Color3.fromRGB(255, 178, 44),
        Error      = Color3.fromRGB(255, 70, 70),
        Info       = Color3.fromRGB(78, 158, 255),
    },
    -- ── Ocean (deep teal / navy) ───────────────────────────────────
    Ocean = {
        Window     = Color3.fromRGB(5, 14, 27),
        Surface    = Color3.fromRGB(9, 23, 45),
        SurfaceAlt = Color3.fromRGB(13, 31, 60),
        SurfaceHov = Color3.fromRGB(17, 39, 74),
        Sidebar    = Color3.fromRGB(7, 17, 34),
        Accent     = Color3.fromRGB(0, 188, 255),
        AccentDark = Color3.fromRGB(0, 152, 210),
        Text       = Color3.fromRGB(202, 238, 255),
        TextSub    = Color3.fromRGB(92, 152, 202),
        TextMute   = Color3.fromRGB(52, 92, 138),
        Border     = Color3.fromRGB(16, 48, 88),
        BorderSoft = Color3.fromRGB(10, 32, 62),
        ToggleOff  = Color3.fromRGB(18, 46, 78),
        ToggleOn   = Color3.fromRGB(0, 188, 255),
        SliderFill = Color3.fromRGB(0, 188, 255),
        Success    = Color3.fromRGB(42, 204, 122),
        Warning    = Color3.fromRGB(255, 178, 44),
        Error      = Color3.fromRGB(255, 70, 70),
        Info       = Color3.fromRGB(0, 188, 255),
    },
    -- ── Purple (vivid violet) ──────────────────────────────────────
    Purple = {
        Window     = Color3.fromRGB(9, 6, 19),
        Surface    = Color3.fromRGB(17, 12, 35),
        SurfaceAlt = Color3.fromRGB(25, 18, 51),
        SurfaceHov = Color3.fromRGB(33, 24, 66),
        Sidebar    = Color3.fromRGB(12, 8, 27),
        Accent     = Color3.fromRGB(158, 76, 255),
        AccentDark = Color3.fromRGB(125, 52, 210),
        Text       = Color3.fromRGB(230, 220, 255),
        TextSub    = Color3.fromRGB(142, 122, 192),
        TextMute   = Color3.fromRGB(82, 68, 118),
        Border     = Color3.fromRGB(52, 34, 94),
        BorderSoft = Color3.fromRGB(34, 22, 66),
        ToggleOff  = Color3.fromRGB(42, 30, 74),
        ToggleOn   = Color3.fromRGB(158, 76, 255),
        SliderFill = Color3.fromRGB(158, 76, 255),
        Success    = Color3.fromRGB(46, 204, 106),
        Warning    = Color3.fromRGB(255, 178, 44),
        Error      = Color3.fromRGB(255, 70, 70),
        Info       = Color3.fromRGB(158, 76, 255),
    },
    -- ── Rose (crimson-pink) ────────────────────────────────────────
    Rose = {
        Window     = Color3.fromRGB(17, 9, 14),
        Surface    = Color3.fromRGB(28, 14, 22),
        SurfaceAlt = Color3.fromRGB(40, 20, 32),
        SurfaceHov = Color3.fromRGB(50, 26, 40),
        Sidebar    = Color3.fromRGB(20, 10, 17),
        Accent     = Color3.fromRGB(255, 82, 122),
        AccentDark = Color3.fromRGB(220, 52, 92),
        Text       = Color3.fromRGB(255, 226, 237),
        TextSub    = Color3.fromRGB(188, 142, 160),
        TextMute   = Color3.fromRGB(112, 76, 92),
        Border     = Color3.fromRGB(80, 36, 53),
        BorderSoft = Color3.fromRGB(52, 22, 36),
        ToggleOff  = Color3.fromRGB(62, 30, 46),
        ToggleOn   = Color3.fromRGB(255, 82, 122),
        SliderFill = Color3.fromRGB(255, 82, 122),
        Success    = Color3.fromRGB(46, 204, 106),
        Warning    = Color3.fromRGB(255, 178, 44),
        Error      = Color3.fromRGB(255, 70, 70),
        Info       = Color3.fromRGB(255, 82, 122),
    },
    -- ── Neon (dark with electric green) ───────────────────────────
    Neon = {
        Window     = Color3.fromRGB(7, 9, 7),
        Surface    = Color3.fromRGB(11, 15, 11),
        SurfaceAlt = Color3.fromRGB(15, 21, 15),
        SurfaceHov = Color3.fromRGB(19, 27, 19),
        Sidebar    = Color3.fromRGB(8, 11, 8),
        Accent     = Color3.fromRGB(0, 228, 118),
        AccentDark = Color3.fromRGB(0, 182, 88),
        Text       = Color3.fromRGB(212, 255, 222),
        TextSub    = Color3.fromRGB(98, 158, 112),
        TextMute   = Color3.fromRGB(52, 92, 62),
        Border     = Color3.fromRGB(22, 46, 28),
        BorderSoft = Color3.fromRGB(14, 30, 18),
        ToggleOff  = Color3.fromRGB(20, 40, 24),
        ToggleOn   = Color3.fromRGB(0, 228, 118),
        SliderFill = Color3.fromRGB(0, 228, 118),
        Success    = Color3.fromRGB(0, 228, 118),
        Warning    = Color3.fromRGB(255, 178, 44),
        Error      = Color3.fromRGB(255, 70, 70),
        Info       = Color3.fromRGB(0, 228, 118),
    },
    -- ── Sunset (warm amber / orange) ──────────────────────────────
    Sunset = {
        Window     = Color3.fromRGB(18, 10, 6),
        Surface    = Color3.fromRGB(28, 16, 9),
        SurfaceAlt = Color3.fromRGB(40, 22, 12),
        SurfaceHov = Color3.fromRGB(50, 28, 15),
        Sidebar    = Color3.fromRGB(22, 12, 7),
        Accent     = Color3.fromRGB(255, 138, 48),
        AccentDark = Color3.fromRGB(220, 105, 25),
        Text       = Color3.fromRGB(255, 238, 220),
        TextSub    = Color3.fromRGB(192, 148, 112),
        TextMute   = Color3.fromRGB(118, 86, 60),
        Border     = Color3.fromRGB(86, 44, 20),
        BorderSoft = Color3.fromRGB(56, 28, 12),
        ToggleOff  = Color3.fromRGB(66, 34, 16),
        ToggleOn   = Color3.fromRGB(255, 138, 48),
        SliderFill = Color3.fromRGB(255, 138, 48),
        Success    = Color3.fromRGB(46, 204, 106),
        Warning    = Color3.fromRGB(255, 178, 44),
        Error      = Color3.fromRGB(255, 70, 70),
        Info       = Color3.fromRGB(255, 138, 48),
    },
    -- ── Aqua (fresh teal / mint) ───────────────────────────────────
    Aqua = {
        Window     = Color3.fromRGB(5, 18, 18),
        Surface    = Color3.fromRGB(8, 28, 28),
        SurfaceAlt = Color3.fromRGB(12, 38, 38),
        SurfaceHov = Color3.fromRGB(16, 48, 48),
        Sidebar    = Color3.fromRGB(6, 22, 22),
        Accent     = Color3.fromRGB(0, 210, 190),
        AccentDark = Color3.fromRGB(0, 168, 150),
        Text       = Color3.fromRGB(210, 255, 252),
        TextSub    = Color3.fromRGB(100, 175, 168),
        TextMute   = Color3.fromRGB(56, 108, 104),
        Border     = Color3.fromRGB(18, 72, 68),
        BorderSoft = Color3.fromRGB(11, 48, 45),
        ToggleOff  = Color3.fromRGB(15, 58, 56),
        ToggleOn   = Color3.fromRGB(0, 210, 190),
        SliderFill = Color3.fromRGB(0, 210, 190),
        Success    = Color3.fromRGB(0, 210, 190),
        Warning    = Color3.fromRGB(255, 178, 44),
        Error      = Color3.fromRGB(255, 70, 70),
        Info       = Color3.fromRGB(0, 210, 190),
    },
    -- ── Light (clean white) ────────────────────────────────────────
    Light = {
        Window     = Color3.fromRGB(238, 238, 246),
        Surface    = Color3.fromRGB(255, 255, 255),
        SurfaceAlt = Color3.fromRGB(225, 225, 238),
        SurfaceHov = Color3.fromRGB(215, 215, 230),
        Sidebar    = Color3.fromRGB(232, 232, 242),
        Accent     = Color3.fromRGB(0, 112, 255),
        AccentDark = Color3.fromRGB(0, 85, 210),
        Text       = Color3.fromRGB(14, 14, 24),
        TextSub    = Color3.fromRGB(98, 98, 132),
        TextMute   = Color3.fromRGB(152, 152, 178),
        Border     = Color3.fromRGB(188, 188, 210),
        BorderSoft = Color3.fromRGB(212, 212, 226),
        ToggleOff  = Color3.fromRGB(168, 168, 192),
        ToggleOn   = Color3.fromRGB(32, 192, 86),
        SliderFill = Color3.fromRGB(0, 112, 255),
        Success    = Color3.fromRGB(32, 182, 83),
        Warning    = Color3.fromRGB(202, 136, 13),
        Error      = Color3.fromRGB(210, 42, 42),
        Info       = Color3.fromRGB(0, 112, 255),
    },
}

-- ════════════════════════════════════════════════════════════════════
--  UTILITIES
-- ════════════════════════════════════════════════════════════════════
local function Tween(obj, props, t, style, dir)
    if not obj or not obj.Parent then return end
    local ti = TweenInfo.new(
        t     or 0.26,              -- slightly longer default = feels less snappy
        style or Enum.EasingStyle.Sine,   -- Sine = silkiest natural easing
        dir   or Enum.EasingDirection.Out
    )
    local tw = TS:Create(obj, ti, props)
    tw:Play(); return tw
end

local function New(cls, props)
    local i = Instance.new(cls)
    for k, v in pairs(props) do pcall(function() i[k] = v end) end
    return i
end

local function Corner(p, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 12)
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

local function Grad(p, c0, c1, rot)
    local g = Instance.new("UIGradient")
    g.Color = ColorSequence.new(c0, c1)
    g.Rotation = rot or 90
    g.Parent = p; return g
end

local function GradSeq(p, seq, rot)
    local g = Instance.new("UIGradient")
    g.Color = seq; g.Rotation = rot or 0
    g.Parent = p; return g
end

local function ViewportSize()
    local cam = workspace:FindFirstChildOfClass("Camera")
    return cam and cam.ViewportSize or Vector2.new(1280, 720)
end

-- Subtle click ripple
local function Ripple(frame, px, py, col)
    local r = New("Frame", {
        Size = UDim2.new(0,0,0,0),
        Position = UDim2.new(0, px, 0, py),
        AnchorPoint = Vector2.new(.5,.5),
        BackgroundColor3 = col or Color3.new(1,1,1),
        BackgroundTransparency = 0.90,
        ZIndex = 30, Parent = frame,
    })
    Corner(r, 999)
    local d = math.max(frame.AbsoluteSize.X, frame.AbsoluteSize.Y) * 1.2
    Tween(r, {Size=UDim2.new(0,d,0,d), BackgroundTransparency=1}, 0.28, Enum.EasingStyle.Quad)
    task.delay(0.32, function() if r and r.Parent then r:Destroy() end end)
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

-- ════════════════════════════════════════════════════════════════════
--  CONFIG SYSTEM
-- ════════════════════════════════════════════════════════════════════
local Cfg = {}; Cfg.__index = Cfg
function Cfg.new(name)
    return setmetatable({
        _f = (name:gsub("%s","_")).."_nexus.json",
        _d = {}, _c = {},
    }, Cfg)
end
function Cfg:reg(flag, def, cb)
    if self._d[flag] == nil then self._d[flag] = def end
    self._c[flag] = { def = def, cb = cb }
end
function Cfg:set(flag, v)
    self._d[flag] = v
    if self._c[flag] then self._c[flag].cb(v) end
end
function Cfg:get(flag) return self._d[flag] end
function Cfg:save()
    if not writefile then return false, "writefile unavailable" end
    local ok,e = pcall(writefile, self._f, HTTP:JSONEncode(self._d))
    return ok, e
end
function Cfg:load()
    if not (readfile and isfile and isfile(self._f)) then
        return false, "No config file"
    end
    local ok,r = pcall(function() return HTTP:JSONDecode(readfile(self._f)) end)
    if ok and type(r) == "table" then
        for k,v in pairs(r) do self:set(k,v) end
        return true
    end
    return false, "Parse error"
end
function Cfg:reset()
    for flag, info in pairs(self._c) do
        self:set(flag, info.def)
    end
end

-- ════════════════════════════════════════════════════════════════════
--  NEXUSUI  v6
-- ════════════════════════════════════════════════════════════════════
local NexusUI = {}; NexusUI.__index = NexusUI
NexusUI.Version = "6.1.0"
NexusUI.Themes  = Themes

function NexusUI:GetVersion() return NexusUI.Version end

function NexusUI:CreateWindow(cfg)
    cfg = cfg or {}
    local T         = Themes[cfg.Theme] or Themes.Dark
    local title     = cfg.Title    or "NexusUI"
    local subtitle  = cfg.SubTitle
    local toggleKey = cfg.ToggleKey or Enum.KeyCode.RightShift
    local cfgSys    = cfg.ConfigName and Cfg.new(cfg.ConfigName) or nil
    local MARGIN    = 18
    local INSET     = 36   -- Roblox top-bar safe zone

    -- ── Responsive sizing ──────────────────────────────────────────
    local vp  = ViewportSize()
    local W   = math.floor(math.min(cfg.Size and cfg.Size.X or 490, vp.X - MARGIN*2))
    local H   = math.floor(math.min(cfg.Size and cfg.Size.Y or 575, vp.Y - INSET - MARGIN*2))
    local SB  = math.floor(math.clamp(W * 0.228, 90, 120))
    local TH  = subtitle and 56 or 50

    local cx  = math.floor(vp.X / 2)
    local cy  = math.floor(INSET + (vp.Y - INSET) / 2)

    -- ── ScreenGui ──────────────────────────────────────────────────
    local Screen = MakeScreen("NexusUI_" .. title)

    -- ── Root (transparent draggable wrapper) ───────────────────────
    local Root = New("Frame", {
        Name = "Root", AnchorPoint = Vector2.new(.5,.5),
        Position = UDim2.new(0, cx, 0, cy),
        Size = UDim2.new(0, W, 0, H),
        BackgroundTransparency = 1,
        ClipsDescendants = false, ZIndex = 1, Parent = Screen,
    })

    -- ── Two-layer shadow ───────────────────────────────────────────
    local function makeShadow(sz, oy, tr, z)
        return New("ImageLabel", {
            AnchorPoint = Vector2.new(.5,.5),
            Size = UDim2.new(1,sz,1,sz),
            Position = UDim2.new(.5,0,.5,oy),
            BackgroundTransparency = 1,
            Image = "rbxassetid://6014261993",
            ImageColor3 = Color3.fromRGB(0,0,0),
            ImageTransparency = tr, ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(49,49,450,450),
            ZIndex = z, Parent = Root,
        })
    end
    local ShadowOuter = makeShadow(84, 10, 1, 0)
    local ShadowInner = makeShadow(46, 5,  1, 0)

    -- ── Main window ────────────────────────────────────────────────
    local WinFrame = New("Frame", {
        Name = "WinFrame", Size = UDim2.new(1,0,1,0),
        BackgroundColor3 = T.Window, BorderSizePixel = 0,
        ClipsDescendants = true, ZIndex = 2, Parent = Root,
    })
    Corner(WinFrame, 18)
    local WinStroke = Stroke(WinFrame, T.Border, 1.5, 1)

    -- ── Open animation ─────────────────────────────────────────────
    Root.Size = UDim2.new(0, W*0.82, 0, H*0.82)
    WinFrame.BackgroundTransparency = 1
    task.defer(function()
        Tween(Root,        {Size = UDim2.new(0,W,0,H)},    0.50, Enum.EasingStyle.Back,  Enum.EasingDirection.Out)
        Tween(WinFrame,    {BackgroundTransparency = 0},    0.40, Enum.EasingStyle.Sine)
        Tween(WinStroke,   {Transparency = 0},              0.40, Enum.EasingStyle.Sine)
        Tween(ShadowOuter, {ImageTransparency = 0.52},      0.60, Enum.EasingStyle.Sine)
        Tween(ShadowInner, {ImageTransparency = 0.70},      0.60, Enum.EasingStyle.Sine)
    end)

    -- ════════════════════════════════════════════════════════════════
    --  TITLE BAR
    -- ════════════════════════════════════════════════════════════════
    local TitleBar = New("Frame", {
        Name = "TitleBar", Size = UDim2.new(1,0,0,TH),
        BackgroundColor3 = T.Sidebar, BorderSizePixel = 0,
        ClipsDescendants = true, ZIndex = 6, Parent = WinFrame,
    })
    Corner(TitleBar, 18)
    -- Flatten bottom corners with a matching-color frame
    local tbFlat = New("Frame", {
        Size = UDim2.new(1,0,0,20), Position = UDim2.new(0,0,1,-20),
        BackgroundColor3 = T.Sidebar, BorderSizePixel = 0, ZIndex = 6, Parent = TitleBar,
    }); Corner(tbFlat, 0)
    -- Subtle top-down gradient overlay
    do
        local tg = Instance.new("UIGradient")
        tg.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.06),
            NumberSequenceKeypoint.new(1, 0.00),
        })
        tg.Rotation = 90; tg.Parent = TitleBar
    end

    -- ── Accent stripe: 3px gradient across the top edge ───────────
    local accentStripe = New("Frame", {
        Size = UDim2.new(1,0,0,3), Position = UDim2.new(0,0,0,0),
        BackgroundColor3 = T.Accent, BorderSizePixel = 0, ZIndex = 10, Parent = TitleBar,
    })
    GradSeq(accentStripe, ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, Color3.new(0,0,0)),
        ColorSequenceKeypoint.new(0.15, T.Accent),
        ColorSequenceKeypoint.new(0.85, T.Accent),
        ColorSequenceKeypoint.new(1.00, Color3.new(0,0,0)),
    }), 0)

    -- Bottom border
    New("Frame", {
        Size = UDim2.new(1,0,0,1), Position = UDim2.new(0,0,1,-1),
        BackgroundColor3 = T.Border, BorderSizePixel = 0, ZIndex = 7, Parent = TitleBar,
    })

    -- Logo: glow halo + solid dot
    local LogoGlow = New("Frame", {
        Size = UDim2.new(0,16,0,16), Position = UDim2.new(0,14,0.5,-8),
        BackgroundColor3 = T.Accent, BackgroundTransparency = 0.65,
        BorderSizePixel = 0, ZIndex = 7, Parent = TitleBar,
    }); Corner(LogoGlow, 8)
    local LogoDot = New("Frame", {
        Size = UDim2.new(0,8,0,8), Position = UDim2.new(0,18,0.5,-4),
        BackgroundColor3 = T.Accent, BorderSizePixel = 0, ZIndex = 8, Parent = TitleBar,
    }); Corner(LogoDot, 4)

    -- Title + subtitle
    New("TextLabel", {
        Size = UDim2.new(1,-82,0,subtitle and 20 or 22),
        Position = subtitle and UDim2.new(0,38,0,8) or UDim2.new(0,38,0.5,-11),
        BackgroundTransparency = 1, Text = title,
        TextColor3 = T.Text, TextSize = 15, Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8, Parent = TitleBar,
    })
    if subtitle then
        New("TextLabel", {
            Size = UDim2.new(1,-82,0,14), Position = UDim2.new(0,38,0,29),
            BackgroundTransparency = 1, Text = subtitle,
            TextColor3 = T.TextSub, TextSize = 10, Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8, Parent = TitleBar,
        })
    end

    -- Version badge (top-right corner of title bar)
    local verBadge = New("Frame", {
        Size = UDim2.new(0,40,0,16), Position = UDim2.new(1,-78,0,5),
        BackgroundColor3 = T.Border, BackgroundTransparency = 0.3,
        BorderSizePixel = 0, ZIndex = 8, Parent = TitleBar,
    }); Corner(verBadge, 5)
    New("TextLabel", {
        Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1,
        Text = "v6.0", TextColor3 = T.TextMute, TextSize = 9,
        Font = Enum.Font.GothamBold, ZIndex = 9, Parent = verBadge,
    })

    -- Close button
    local CloseBg    = Color3.fromRGB(255,65,65)
    local CloseHov   = Color3.fromRGB(230,38,38)
    local CloseBtn   = New("TextButton", {
        Size = UDim2.new(0,28,0,28), Position = UDim2.new(1,-38,0.5,-14),
        BackgroundColor3 = CloseBg, BorderSizePixel = 0,
        Text = "✕", TextColor3 = Color3.new(1,1,1), TextSize = 12,
        Font = Enum.Font.GothamBold, AutoButtonColor = false, ZIndex = 9, Parent = TitleBar,
    }); Corner(CloseBtn, 8)
    CloseBtn.MouseEnter:Connect(function() Tween(CloseBtn,{BackgroundColor3=CloseHov},0.10) end)
    CloseBtn.MouseLeave:Connect(function() Tween(CloseBtn,{BackgroundColor3=CloseBg },0.10) end)

    -- ════════════════════════════════════════════════════════════════
    --  BODY
    -- ════════════════════════════════════════════════════════════════
    local Body = New("Frame", {
        Name = "Body", Size = UDim2.new(1,0,1,-TH),
        Position = UDim2.new(0,0,0,TH),
        BackgroundTransparency = 1, ClipsDescendants = false,
        ZIndex = 3, Parent = WinFrame,
    })

    -- ── Sidebar ────────────────────────────────────────────────────
    local Sidebar = New("Frame", {
        Name = "Sidebar", Size = UDim2.new(0,SB,1,0),
        BackgroundColor3 = T.Sidebar, BorderSizePixel = 0,
        ZIndex = 4, Parent = Body,
    }); Corner(Sidebar, 0)  -- no visual corner, but ensures UICorner present on all frames
    New("Frame", {  -- right border line
        Size = UDim2.new(0,1,1,0), Position = UDim2.new(1,-1,0,0),
        BackgroundColor3 = T.Border, BorderSizePixel = 0, ZIndex = 5, Parent = Sidebar,
    })
    local TabScroll = New("ScrollingFrame", {
        Size = UDim2.new(1,0,1,-6), Position = UDim2.new(0,0,0,4),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        ScrollBarThickness = 2, ScrollBarImageColor3 = T.Accent,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0,0,0,0), ZIndex = 5, Parent = Sidebar,
    })
    Pad(TabScroll, 5,5,5,5); ListY(TabScroll, 3)

    -- ── Right content panel ────────────────────────────────────────
    local RightPanel = New("Frame", {
        Name = "RightPanel",
        Size = UDim2.new(1,-SB,1,0), Position = UDim2.new(0,SB,0,0),
        BackgroundTransparency = 1, ClipsDescendants = true,
        ZIndex = 4, Parent = Body,
    })

    -- ── Notification stack (screen bottom-right, independent) ──────
    local NotifHolder = New("Frame", {
        Name = "Notifs", Size = UDim2.new(0,308,1,-INSET-10),
        Position = UDim2.new(1,-318,0,INSET+5),
        BackgroundTransparency = 1, ZIndex = 88, Parent = Screen,
    })
    local NL = Instance.new("UIListLayout")
    NL.SortOrder = Enum.SortOrder.LayoutOrder
    NL.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NL.HorizontalAlignment = Enum.HorizontalAlignment.Right
    NL.Padding = UDim.new(0,6); NL.Parent = NotifHolder
    Pad(NotifHolder,0,0,14,0)

    -- ════════════════════════════════════════════════════════════════
    --  FLOATING TOGGLE BUTTON  (top-center when UI is hidden)
    -- ════════════════════════════════════════════════════════════════
    --[[
        ICON CONFIG:
        Pass  ToggleIcon = "rbxassetid://..."  in CreateWindow cfg,
        or leave empty / omit to show the default ☰ menu symbol.
    ]]
    local TICON  = cfg.ToggleIcon or ""
    local TB_SZ  = 44

    local ToggleWrap = New("Frame", {
        Name = "ToggleWrap", AnchorPoint = Vector2.new(.5,0),
        Position = UDim2.new(.5,0,0,20),
        Size = UDim2.new(0,TB_SZ+12,0,TB_SZ+12),
        BackgroundTransparency = 1, ZIndex = 92, Visible = false, Parent = Screen,
    })
    local TBGlow = New("Frame", {
        AnchorPoint = Vector2.new(.5,.5), Position = UDim2.new(.5,0,.5,0),
        Size = UDim2.new(1,8,1,8),
        BackgroundColor3 = T.Accent, BackgroundTransparency = 0.66,
        BorderSizePixel = 0, ZIndex = 92, Parent = ToggleWrap,
    }); Corner(TBGlow, (TB_SZ+20)/2)

    local TBtn = New("ImageButton", {
        Name = "ToggleBtn", AnchorPoint = Vector2.new(.5,.5),
        Position = UDim2.new(.5,0,.5,0),
        Size = UDim2.new(0,TB_SZ,0,TB_SZ),
        BackgroundColor3 = T.Accent, BorderSizePixel = 0,
        Image = TICON, ImageColor3 = Color3.new(1,1,1),
        ImageTransparency = TICON=="" and 1 or 0,
        ScaleType = Enum.ScaleType.Fit, AutoButtonColor = false,
        ZIndex = 94, Parent = ToggleWrap,
    }); Corner(TBtn, TB_SZ/2)
    Stroke(TBtn, T.AccentDark, 1.5, 0.1)
    New("TextLabel", {
        Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1,
        Text = "☰", TextColor3 = Color3.new(1,1,1), TextSize = 20,
        Font = Enum.Font.GothamBold,
        Visible = TICON == "", ZIndex = 95, Parent = TBtn,
    })

    TBtn.MouseEnter:Connect(function()
        Tween(TBGlow,{BackgroundTransparency=0.48},0.12)
        Tween(TBtn,  {BackgroundColor3=T.AccentDark},0.12)
    end)
    TBtn.MouseLeave:Connect(function()
        Tween(TBGlow,{BackgroundTransparency=0.66},0.14)
        Tween(TBtn,  {BackgroundColor3=T.Accent},0.14)
    end)
    TBtn.MouseButton1Down:Connect(function()
        Tween(TBtn,{Size=UDim2.new(0,TB_SZ-5,0,TB_SZ-5)},0.08)
    end)
    TBtn.MouseButton1Up:Connect(function()
        Tween(TBtn,{Size=UDim2.new(0,TB_SZ,0,TB_SZ)},0.18,Enum.EasingStyle.Back)
    end)

    -- show / hide helpers
    local function showUI()
        ToggleWrap.Visible = false
        Root.Visible = true
        Tween(Root,       {Size=UDim2.new(0,W,0,H)},    0.44, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        Tween(WinFrame,   {BackgroundTransparency=0},    0.34, Enum.EasingStyle.Sine)
        Tween(WinStroke,  {Transparency=0},              0.34, Enum.EasingStyle.Sine)
        Tween(ShadowOuter,{ImageTransparency=0.52},      0.48, Enum.EasingStyle.Sine)
        Tween(ShadowInner,{ImageTransparency=0.70},      0.48, Enum.EasingStyle.Sine)
    end
    local function hideUI()
        Tween(Root,       {Size=UDim2.new(0,W*0.92,0,H*0.92)},0.22,Enum.EasingStyle.Sine)
        Tween(WinFrame,   {BackgroundTransparency=1},   0.20, Enum.EasingStyle.Sine)
        Tween(WinStroke,  {Transparency=1},             0.20, Enum.EasingStyle.Sine)
        Tween(ShadowOuter,{ImageTransparency=1},        0.16, Enum.EasingStyle.Sine)
        Tween(ShadowInner,{ImageTransparency=1},        0.16, Enum.EasingStyle.Sine)
        task.delay(0.24, function()
            Root.Visible = false
            ToggleWrap.Visible = true
            TBtn.Size = UDim2.new(0,TB_SZ*0.65,0,TB_SZ*0.65)
            Tween(TBtn,{Size=UDim2.new(0,TB_SZ,0,TB_SZ)},0.36,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
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
    --  DRAG  (clamped to safe area)
    -- ════════════════════════════════════════════════════════════════
    do
        local drag, ds, rs = false, nil, nil
        local function clamp(x, y)
            local sv = ViewportSize()
            local hw,hh = Root.AbsoluteSize.X/2, Root.AbsoluteSize.Y/2
            return math.clamp(x, hw+MARGIN, sv.X-hw-MARGIN),
                   math.clamp(y, hh+INSET,  sv.Y-hh-MARGIN)
        end
        TitleBar.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then
                drag=true; ds=i.Position; rs=Root.Position
            end
        end)
        UIS.InputChanged:Connect(function(i)
            if not drag then return end
            if i.UserInputType==Enum.UserInputType.MouseMovement
            or i.UserInputType==Enum.UserInputType.Touch then
                local d = i.Position - ds
                local x2,y2 = clamp(rs.X.Offset+d.X, rs.Y.Offset+d.Y)
                Root.Position = UDim2.new(0,x2,0,y2)
            end
        end)
        UIS.InputEnded:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then drag=false end
        end)
    end

    -- Toggle key
    UIS.InputBegan:Connect(function(i, proc)
        if proc then return end
        if i.KeyCode == toggleKey then
            if Root.Visible then hideUI() else showUI() end
        end
    end)

    -- ════════════════════════════════════════════════════════════════
    --  WINDOW OBJECT
    -- ════════════════════════════════════════════════════════════════
    local Window = {
        _screen = Screen, _root = Root, _win = WinFrame,
        _notifCt = 0, _tabs = {}, _activeTab = nil,
        Visible = true, Config = cfgSys, Theme = T,
    }

    -- ════════════════════════════════════════════════════════════════
    --  NOTIFICATION SYSTEM  (v6: 88px, X close, animated icon)
    -- ════════════════════════════════════════════════════════════════
    function Window:Notify(c)
        c = c or {}
        local nTitle = c.Title    or "Notice"
        local nText  = c.Text     or ""
        local nDur   = c.Duration or 4
        local nType  = c.Type     or "Info"
        local colMap = {Success=T.Success,Warning=T.Warning,Error=T.Error,Info=T.Info}
        local icoMap = {Success="✓",Warning="!",Error="✕",Info="i"}
        local col    = colMap[nType] or T.Info
        local ico    = icoMap[nType] or "i"

        self._notifCt = self._notifCt + 1
        local ord = self._notifCt

        local nf = New("Frame", {
            Name = "N"..ord, Size = UDim2.new(1,0,0,88),
            BackgroundColor3 = T.Surface, BorderSizePixel = 0,
            LayoutOrder = -ord, ClipsDescendants = true,
            ZIndex = 90, Parent = NotifHolder,
        }); Corner(nf,14); Stroke(nf,T.Border,1.2,0.08)

        -- Left accent bar
        local acBar = New("Frame", {
            Size = UDim2.new(0,4,1,0), BackgroundColor3 = col,
            BorderSizePixel = 0, ZIndex = 92, Parent = nf,
        }); Corner(acBar, 2)

        -- Animated icon circle
        local ic = New("Frame", {
            Size = UDim2.new(0,36,0,36), Position = UDim2.new(0,12,0.5,-18),
            BackgroundColor3 = col, BackgroundTransparency = 0.78,
            BorderSizePixel = 0, ZIndex = 92, Parent = nf,
        }); Corner(ic,10)
        local icInner = New("Frame", {
            Size = UDim2.new(0,24,0,24), AnchorPoint = Vector2.new(.5,.5),
            Position = UDim2.new(.5,0,.5,0),
            BackgroundColor3 = col, BackgroundTransparency = 0.55,
            BorderSizePixel = 0, ZIndex = 93, Parent = ic,
        }); Corner(icInner,8)
        New("TextLabel", {
            Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1,
            Text = ico, TextColor3 = col, TextSize = 14,
            Font = Enum.Font.GothamBold, ZIndex = 94, Parent = icInner,
        })
        -- Pulse the icon on appear
        task.defer(function()
            Tween(ic,{BackgroundTransparency=0.58},0.22)
            task.delay(0.22,function() Tween(ic,{BackgroundTransparency=0.78},0.30) end)
        end)

        -- X close button (top-right)
        local xBtn = New("TextButton", {
            Size = UDim2.new(0,22,0,22), Position = UDim2.new(1,-26,0,6),
            BackgroundTransparency = 1, Text = "×",
            TextColor3 = T.TextMute, TextSize = 16,
            Font = Enum.Font.GothamBold,
            AutoButtonColor = false, ZIndex = 93, Parent = nf,
        }); Corner(xBtn, 11)
        xBtn.MouseEnter:Connect(function() xBtn.TextColor3 = T.Text end)
        xBtn.MouseLeave:Connect(function() xBtn.TextColor3 = T.TextMute end)

        -- Title + body text
        New("TextLabel", {
            Size = UDim2.new(1,-62,0,20), Position = UDim2.new(0,56,0,10),
            BackgroundTransparency = 1, Text = nTitle,
            TextColor3 = T.Text, TextSize = 13, Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 93, Parent = nf,
        })
        New("TextLabel", {
            Size = UDim2.new(1,-62,0,34), Position = UDim2.new(0,56,0,30),
            BackgroundTransparency = 1, Text = nText,
            TextColor3 = T.TextSub, TextSize = 11, Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true, ZIndex = 93, Parent = nf,
        })

        -- Progress timer bar
        local pb = New("Frame", {
            Size = UDim2.new(1,-16,0,3), Position = UDim2.new(0,8,1,-6),
            BackgroundColor3 = T.BorderSoft, BorderSizePixel = 0, ZIndex = 91, Parent = nf,
        }); Corner(pb,2)
        local pf = New("Frame", {
            Size = UDim2.new(1,0,1,0), BackgroundColor3 = col,
            BorderSizePixel = 0, ZIndex = 92, Parent = pb,
        }); Corner(pf,2)
        Tween(pf,{Size=UDim2.new(0,0,1,0)},nDur,Enum.EasingStyle.Linear)

        -- Slide in from right
        nf.Position = UDim2.new(0,328,0,0)
        Tween(nf,{Position=UDim2.new(0,0,0,0)},0.38,Enum.EasingStyle.Back,Enum.EasingDirection.Out)

        local gone = false
        local function dismiss()
            if gone then return end; gone = true
            Tween(nf,{Position=UDim2.new(0,328,0,0),BackgroundTransparency=1},0.24)
            task.delay(0.28,function() if nf and nf.Parent then nf:Destroy() end end)
        end
        xBtn.MouseButton1Click:Connect(dismiss)
        nf.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then dismiss() end
        end)
        task.delay(nDur, dismiss)
    end

    -- ════════════════════════════════════════════════════════════════
    --  ALERT MODAL  (v6 new — full-screen overlay)
    -- ════════════════════════════════════════════════════════════════
    function Window:Alert(c)
        c = c or {}
        local aTitle   = c.Title       or "Alert"
        local aText    = c.Text        or ""
        local confTxt  = c.ConfirmText or "Confirm"
        local canTxt   = c.CancelText  or "Cancel"
        local onConf   = c.OnConfirm   or function() end
        local onCanc   = c.OnCancel    or function() end

        -- Dim overlay
        local overlay = New("Frame", {
            Size = UDim2.new(1,0,1,0), BackgroundColor3 = Color3.new(0,0,0),
            BackgroundTransparency = 1, ZIndex = 200, Parent = Screen,
        })
        Tween(overlay,{BackgroundTransparency=0.55},0.22)

        -- Modal card
        local modal = New("Frame", {
            AnchorPoint = Vector2.new(.5,.5),
            Position = UDim2.new(.5,0,.5,30),
            Size = UDim2.new(0,320,0,0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = T.Surface, BorderSizePixel = 0,
            ZIndex = 202, Parent = Screen,
        }); Corner(modal,18); Stroke(modal,T.Border,1.5,0)
        Pad(modal,22,22,22,22); ListY(modal,14)

        -- Accent top bar on modal
        local mStripe = New("Frame", {
            Size = UDim2.new(1,0,0,3), Position = UDim2.new(0,0,0,0),
            BackgroundColor3 = T.Accent, BorderSizePixel = 0, ZIndex = 203, Parent = modal,
        })
        GradSeq(mStripe, ColorSequence.new({
            ColorSequenceKeypoint.new(0.00, Color3.new(0,0,0)),
            ColorSequenceKeypoint.new(0.20, T.Accent),
            ColorSequenceKeypoint.new(0.80, T.Accent),
            ColorSequenceKeypoint.new(1.00, Color3.new(0,0,0)),
        }), 0)

        New("TextLabel", {
            Size = UDim2.new(1,0,0,0), AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1, Text = aTitle,
            TextColor3 = T.Text, TextSize = 16, Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true, LayoutOrder = 1, ZIndex = 203, Parent = modal,
        })
        New("TextLabel", {
            Size = UDim2.new(1,0,0,0), AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1, Text = aText,
            TextColor3 = T.TextSub, TextSize = 12, Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true, LayoutOrder = 2, ZIndex = 203, Parent = modal,
        })

        -- Button row
        local btnRow = New("Frame", {
            Size = UDim2.new(1,0,0,38), LayoutOrder = 3,
            BackgroundTransparency = 1, ZIndex = 203, Parent = modal,
        })
        local bl = Instance.new("UIListLayout")
        bl.FillDirection = Enum.FillDirection.Horizontal
        bl.SortOrder = Enum.SortOrder.LayoutOrder
        bl.HorizontalAlignment = Enum.HorizontalAlignment.Right
        bl.Padding = UDim.new(0,10); bl.Parent = btnRow

        local function closeModal()
            Tween(overlay,{BackgroundTransparency=1},0.18)
            Tween(modal,  {BackgroundTransparency=1,Position=UDim2.new(.5,0,.5,50)},0.22)
            task.delay(0.26,function()
                overlay:Destroy(); modal:Destroy()
            end)
        end

        local function MBtn(txt, bg, hov, ord, action)
            local b = New("TextButton", {
                Size = UDim2.new(0,0,1,0), AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = bg, BorderSizePixel = 0,
                Text = txt, TextColor3 = Color3.new(1,1,1),
                TextSize = 12, Font = Enum.Font.GothamSemibold,
                AutoButtonColor = false, LayoutOrder = ord, ZIndex = 204, Parent = btnRow,
            }); Corner(b,9); Pad(b,0,16,0,16)
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
        MBtn(confTxt, T.Accent,     T.AccentDark,  2, onConf)

        -- Pop-in animation
        modal.BackgroundTransparency = 1
        task.defer(function()
            Tween(modal,{BackgroundTransparency=0,Position=UDim2.new(.5,0,.5,0)},
                  0.34,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
        end)

        -- Close on overlay click
        overlay.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1
            or i.UserInputType==Enum.UserInputType.Touch then
                closeModal(); task.defer(onCanc)
            end
        end)
    end

    -- ════════════════════════════════════════════════════════════════
    --  TAB CREATION
    -- ════════════════════════════════════════════════════════════════
    function Window:CreateTab(name, iconId)

        -- Sidebar pill button
        local tabBtn = New("TextButton", {
            Name = name.."_Btn", Size = UDim2.new(1,0,0,40),
            BackgroundColor3 = T.SurfaceAlt, BackgroundTransparency = 1,
            BorderSizePixel = 0, Text = "",
            AutoButtonColor = false, LayoutOrder = #self._tabs+1,
            ZIndex = 6, Parent = TabScroll,
        }); Corner(tabBtn,9); Corner(tabBtn,9)

        -- Active gradient pill background
        local activePill = New("Frame", {
            Size = UDim2.new(1,0,1,0), BackgroundColor3 = T.SurfaceAlt,
            BackgroundTransparency = 1, BorderSizePixel = 0,
            ZIndex = 6, Parent = tabBtn,
        }); Corner(activePill,9)

        -- Left accent bar (shown when active)
        local activeBar = New("Frame", {
            Size = UDim2.new(0,3,0,20), Position = UDim2.new(0,0,0.5,-10),
            BackgroundColor3 = T.Accent, BackgroundTransparency = 1,
            BorderSizePixel = 0, ZIndex = 7, Parent = tabBtn,
        }); Corner(activeBar,2)

        -- Optional icon
        local txOff = 10
        local tabIcon
        if iconId then
            tabIcon = New("ImageLabel", {
                Size = UDim2.new(0,16,0,16), Position = UDim2.new(0,12,0.5,-8),
                BackgroundTransparency = 1, Image = iconId,
                ImageColor3 = T.TextSub, ZIndex = 7, Parent = tabBtn,
            })
            txOff = 34
        end

        local tabLbl = New("TextLabel", {
            Size = UDim2.new(1,-(txOff+6),1,0), Position = UDim2.new(0,txOff,0,0),
            BackgroundTransparency = 1, Text = name,
            TextColor3 = T.TextSub, TextSize = 12, Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 7, Parent = tabBtn,
        })

        -- Content scroll
        local scroll = New("ScrollingFrame", {
            Name = name.."_Scroll", Size = UDim2.new(1,0,1,0),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            ScrollBarThickness = 3, ScrollBarImageColor3 = T.Accent,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(0,0,0,0),
            ScrollingDirection = Enum.ScrollingDirection.Y,
            Visible = false, ZIndex = 5, Parent = RightPanel,
        })
        Pad(scroll,10,10,16,10); ListY(scroll,6)

        local Tab = {
            _content = scroll, _btn = tabBtn,
            _bar = activeBar, _pill = activePill,
            _lbl = tabLbl, _icon = tabIcon,
            _idx = 0, T = T,
        }

        local function activate()
            if Window._activeTab and Window._activeTab ~= Tab then
                local p = Window._activeTab
                p._content.Visible = false
                Tween(p._pill,{BackgroundTransparency=1},   0.16)
                Tween(p._lbl, {TextColor3=T.TextSub},       0.16)
                Tween(p._bar, {BackgroundTransparency=1},   0.16)
                p._lbl.Font = Enum.Font.Gotham
                if p._icon then Tween(p._icon,{ImageColor3=T.TextSub},0.16) end
            end
            Window._activeTab = Tab
            scroll.Visible = true
            Tween(activePill,{BackgroundTransparency=0.87}, 0.20)
            Tween(tabLbl,    {TextColor3=T.Accent},         0.20)
            Tween(activeBar, {BackgroundTransparency=0},    0.20)
            tabLbl.Font = Enum.Font.GothamSemibold
            if tabIcon then Tween(tabIcon,{ImageColor3=T.Accent},0.20) end
        end

        tabBtn.MouseButton1Click:Connect(activate)
        tabBtn.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.Touch then activate() end
        end)
        tabBtn.MouseEnter:Connect(function()
            if Window._activeTab ~= Tab then
                Tween(activePill,{BackgroundTransparency=0.94},0.12)
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if Window._activeTab ~= Tab then
                Tween(activePill,{BackgroundTransparency=1},0.12)
            end
        end)

        if #self._tabs == 0 then task.defer(activate) end
        table.insert(self._tabs, Tab)

        -- ════════════════════════════════════════════════════════
        --  ELEMENT HELPERS
        -- ════════════════════════════════════════════════════════
        local function nextIdx() Tab._idx = Tab._idx+1; return Tab._idx end

        local function Card(h, noClip)
            local f = New("Frame", {
                Size = UDim2.new(1,0,0,h or 54),
                LayoutOrder = nextIdx(),
                BackgroundColor3 = T.Surface,
                BorderSizePixel = 0,
                ClipsDescendants = not noClip,
                ZIndex = 6, Parent = scroll,
            }); Corner(f,12); Stroke(f,T.Border,1,0.40)
            return f
        end

        local function NameLbl(parent, text, yOff)
            return New("TextLabel", {
                Size = UDim2.new(1,-98,0,18),
                Position = yOff~=nil and UDim2.new(0,14,0,yOff) or UDim2.new(0,14,0.5,-9),
                BackgroundTransparency = 1, Text = text,
                TextColor3 = T.Text, TextSize = 13, Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 7, Parent = parent,
            })
        end

        local function DescLbl(parent, text, yOff)
            return New("TextLabel", {
                Size = UDim2.new(1,-24,0,12), Position = UDim2.new(0,14,0,yOff or 0),
                BackgroundTransparency = 1, Text = text,
                TextColor3 = T.TextSub, TextSize = 10, Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 7, Parent = parent,
            })
        end

        local function HitBtn(parent, z)
            return New("TextButton", {
                Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1,
                Text = "", AutoButtonColor = false,
                ZIndex = z or 9, Parent = parent,
            })
        end

        -- ════════════════════════════════════════════════════════
        --  BASE ELEMENT  — wraps any card frame and provides
        --  Show / Hide / Enable / Disable on all elements.
        --  Usage: local el = BaseEl(card)
        --         el.Set = ...;  return el
        -- ════════════════════════════════════════════════════════
        local function BaseEl(frame, cornerR)
            local disabled = false
            local veil      -- lazy-created click-blocker overlay
            local el = {}
            el.Show    = function() frame.Visible = true  end
            el.Hide    = function() frame.Visible = false end
            el.Enable  = function()
                if not disabled then return end
                disabled = false
                if veil then veil.Visible = false end
                Tween(frame, {BackgroundTransparency = frame:IsA("Frame") and 0 or 0}, 0.14)
            end
            el.Disable = function()
                if disabled then return end
                disabled = true
                if not veil then
                    veil = New("TextButton", {
                        Size = UDim2.new(1,0,1,0),
                        BackgroundColor3 = Color3.fromRGB(0,0,0),
                        BackgroundTransparency = 0.54,
                        Text = "", AutoButtonColor = false,
                        BorderSizePixel = 0, ZIndex = 50,
                        Parent = frame,
                    }); Corner(veil, cornerR or 12)
                end
                veil.Visible = true
            end
            el.IsDisabled = function() return disabled end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  SECTION HEADER
        -- ════════════════════════════════════════════════════════
        function Tab:CreateSection(c)
            c = c or {}
            local f = New("Frame", {
                Size = UDim2.new(1,0,0,28), LayoutOrder = nextIdx(),
                BackgroundTransparency = 1, ZIndex = 6, Parent = scroll,
            })
            local lb = New("Frame", {
                Size = UDim2.new(0,3,0.72,0), Position = UDim2.new(0,0,0.14,0),
                BackgroundColor3 = T.Accent, BorderSizePixel = 0, ZIndex = 7, Parent = f,
            }); Corner(lb,2)
            local lbl = New("TextLabel", {
                Size = UDim2.new(1,-10,1,0), Position = UDim2.new(0,9,0,0),
                BackgroundTransparency = 1, Text = (c.Text or "Section"):upper(),
                TextColor3 = T.TextMute, TextSize = 10, Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 7, Parent = f,
            })
            local el = BaseEl(f, 0)
            el.SetText = function(t) lbl.Text = t:upper() end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  TOGGLE  (iOS switch — full rebuild, debounced)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateToggle(c)
            c = c or {}
            local nm   = c.Name        or "Toggle"
            local desc = c.Description
            local def  = c.Default     or false
            local cb   = c.Callback    or function() end
            local flag = c.Flag

            local card = Card(desc and 62 or 54)
            local nameLblRef = NameLbl(card, nm, desc and 9)
            if desc then DescLbl(card,desc,30) end

            -- Track: 52×30, exact iOS proportions
            local TW,TH2,KD,INS = 52,30,24,3
            local track = New("Frame", {
                Size = UDim2.new(0,TW,0,TH2),
                Position = UDim2.new(1,-(TW+13),0.5,-TH2/2),
                BackgroundColor3 = def and T.ToggleOn or T.ToggleOff,
                BorderSizePixel = 0, ZIndex = 7, Parent = card,
            }); Corner(track,TH2/2)
            Stroke(track,Color3.fromRGB(0,0,0),1,0.86)

            local kOFF = UDim2.new(0,INS,0.5,-KD/2)
            local kON  = UDim2.new(0,TW-KD-INS,0.5,-KD/2)
            local knob = New("Frame", {
                Size = UDim2.new(0,KD,0,KD),
                Position = def and kON or kOFF,
                BackgroundColor3 = Color3.new(1,1,1),
                BorderSizePixel = 0, ZIndex = 9, Parent = track,
            }); Corner(knob,KD/2)
            Stroke(knob,Color3.fromRGB(0,0,0),1,0.90)

            local val = def; local busy = false
            local function setVal(v, silent)
                if busy then return end; busy = true; val = v
                local sqW = KD+6
                Tween(knob,{Size=UDim2.new(0,sqW,0,KD)},0.07)
                if v then
                    Tween(track,{BackgroundColor3=T.ToggleOn},0.22,Enum.EasingStyle.Sine)
                    task.delay(0.07,function()
                        Tween(knob,{Position=UDim2.new(0,TW-sqW-INS,0.5,-KD/2),
                            Size=UDim2.new(0,KD,0,KD)},0.22,Enum.EasingStyle.Sine)
                    end)
                else
                    Tween(track,{BackgroundColor3=T.ToggleOff},0.22,Enum.EasingStyle.Sine)
                    task.delay(0.07,function()
                        Tween(knob,{Position=kOFF,Size=UDim2.new(0,KD,0,KD)},
                            0.22,Enum.EasingStyle.Sine)
                    end)
                end
                task.delay(0.30,function() busy=false end)
                if not silent then cb(v) end
            end

            -- Track-side hit (priority target on mobile)
            local th = New("TextButton", {
                Size = UDim2.new(0,TW+22,1,0),
                Position = UDim2.new(1,-(TW+24),0,0),
                BackgroundTransparency = 1, Text = "",
                AutoButtonColor = false, ZIndex = 10, Parent = card,
            })
            th.MouseButton1Click:Connect(function() setVal(not val) end)
            th.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then setVal(not val) end
            end)
            -- Full-card hit (desktop convenience)
            local ch = HitBtn(card,9)
            ch.MouseButton1Click:Connect(function() setVal(not val) end)
            ch.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then setVal(not val) end
            end)

            if flag and cfgSys then cfgSys:reg(flag,def,setVal) end
            local el = BaseEl(card)
            el.Set     = setVal
            el.Get     = function() return val end
            el.SetName = function(t) nameLblRef.Text = t end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  BUTTON  (v6: SetLoading support, accent ripple)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateButton(c)
            c = c or {}
            local nm   = c.Name        or "Button"
            local desc = c.Description
            local ico  = c.Icon
            local cb   = c.Callback    or function() end

            local card = Card(desc and 62 or 54, true)
            local xOff = ico and 44 or 14

            local nameLbl = New("TextLabel", {
                Size = UDim2.new(1,-52,0,18),
                Position = desc and UDim2.new(0,xOff,0,9) or UDim2.new(0,xOff,0.5,-9),
                BackgroundTransparency = 1, Text = nm,
                TextColor3 = T.Accent, TextSize = 13, Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 7, Parent = card,
            })
            if desc then DescLbl(card,desc,30) end
            if ico then
                New("ImageLabel", {
                    Size = UDim2.new(0,20,0,20), Position = UDim2.new(0,14,0.5,-10),
                    BackgroundTransparency = 1, Image = ico,
                    ImageColor3 = T.Accent, ZIndex = 7, Parent = card,
                })
            end
            New("TextLabel", {
                Size = UDim2.new(0,22,1,0), Position = UDim2.new(1,-26,0,0),
                BackgroundTransparency = 1, Text = "›",
                TextColor3 = T.Accent, TextSize = 22, Font = Enum.Font.GothamBold,
                ZIndex = 7, Parent = card,
            })

            -- Loading spinner dot (hidden by default)
            local loadDot = New("Frame", {
                Size = UDim2.new(0,10,0,10), AnchorPoint = Vector2.new(.5,.5),
                Position = UDim2.new(0.5,0,0.5,0),
                BackgroundColor3 = T.Accent, BorderSizePixel = 0,
                Visible = false, ZIndex = 8, Parent = card,
            }); Corner(loadDot,5)

            local loading = false
            local hit = HitBtn(card)
            local function press(px,py)
                if loading then return end
                Ripple(card,px,py,T.Accent)
                Tween(card,{BackgroundColor3=T.SurfaceHov},0.08)
                task.delay(0.14,function() Tween(card,{BackgroundColor3=T.Surface},0.18) end)
                cb()
            end
            hit.MouseButton1Click:Connect(function()
                local mp = UIS:GetMouseLocation()
                press(mp.X-card.AbsolutePosition.X, mp.Y-card.AbsolutePosition.Y)
            end)
            hit.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then
                    press(i.Position.X-card.AbsolutePosition.X, i.Position.Y-card.AbsolutePosition.Y)
                end
            end)
            hit.MouseEnter:Connect(function()
                if not loading then Tween(card,{BackgroundColor3=T.SurfaceAlt},0.14) end
            end)
            hit.MouseLeave:Connect(function()
                if not loading then Tween(card,{BackgroundColor3=T.Surface   },0.14) end
            end)

            local el = BaseEl(card)
            el.SetLoading = function(_, v)
                loading = v
                nameLbl.Visible = not v
                loadDot.Visible = v
                if v then
                    card.BackgroundColor3 = T.SurfaceAlt
                    local function pulse()
                        if not loading then return end
                        Tween(loadDot,{Size=UDim2.new(0,14,0,14)},0.30)
                        task.delay(0.32,function()
                            if not loading then return end
                            Tween(loadDot,{Size=UDim2.new(0,8,0,8)},0.30)
                            task.delay(0.32,pulse)
                        end)
                    end
                    pulse()
                else
                    card.BackgroundColor3 = T.Surface
                end
            end
            el.SetText = function(t)
                nameLbl.Text = t
            end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  SLIDER  (accent gradient fill, tall touch zone)
        -- ════════════════════════════════════════════════════════
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

            local card = Card(desc and 78 or 66)
            NameLbl(card,nm,9)

            local vBg = New("Frame", {
                Size = UDim2.new(0,62,0,22), Position = UDim2.new(1,-72,0,7),
                BackgroundColor3 = T.SurfaceAlt, BorderSizePixel = 0,
                ZIndex = 7, Parent = card,
            }); Corner(vBg,7)
            local vLbl = New("TextLabel", {
                Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1,
                Text = tostring(def)..suf, TextColor3 = T.Accent,
                TextSize = 12, Font = Enum.Font.GothamBold,
                ZIndex = 8, Parent = vBg,
            })

            if desc then DescLbl(card,desc,30) end

            local trkY = desc and 54 or 42
            local trkBg = New("Frame", {
                Size = UDim2.new(1,-26,0,6), Position = UDim2.new(0,13,0,trkY),
                BackgroundColor3 = T.SurfaceAlt, BorderSizePixel = 0,
                ZIndex = 7, Parent = card,
            }); Corner(trkBg,3)

            local fill = New("Frame", {
                Size = UDim2.new(0,0,1,0), BackgroundColor3 = T.Accent,
                BorderSizePixel = 0, ZIndex = 8, Parent = trkBg,
            }); Corner(fill,3)
            Grad(fill, T.Accent, T.AccentDark, 0)

            local knob = New("Frame", {
                Size = UDim2.new(0,18,0,18), AnchorPoint = Vector2.new(.5,.5),
                Position = UDim2.new(0,0,0.5,0), BackgroundColor3 = Color3.new(1,1,1),
                BorderSizePixel = 0, ZIndex = 9, Parent = trkBg,
            }); Corner(knob,9); Stroke(knob,T.Accent,2,0)

            local curVal = def; local sliding = false
            local function snap(v) return math.clamp(math.round(v/inc)*inc,mn,mx) end
            local function applyAlpha(a)
                a = math.clamp(a,0,1)
                local sv = snap(mn+(mx-mn)*a); curVal = sv
                local ta = (sv-mn)/(mx-mn)
                fill.Size = UDim2.new(ta,0,1,0)
                knob.Position = UDim2.new(ta,0,0.5,0)
                vLbl.Text = tostring(sv)..suf
                cb(sv)
            end
            local function fromInput(i)
                applyAlpha((i.Position.X-trkBg.AbsolutePosition.X)/trkBg.AbsoluteSize.X)
            end

            local hitZ = New("Frame", {
                Size = UDim2.new(1,0,0,44), Position = UDim2.new(0,0,0.5,-22),
                BackgroundTransparency = 1, ZIndex = 10, Parent = trkBg,
            }); Corner(hitZ, 3)
            local hitB = New("TextButton", {
                Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1,
                Text = "", AutoButtonColor = false, ZIndex = 11, Parent = hitZ,
            }); Corner(hitB, 3)
            hitB.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.MouseButton1
                or i.UserInputType==Enum.UserInputType.Touch then
                    sliding=true; fromInput(i)
                end
            end)
            UIS.InputChanged:Connect(function(i)
                if not sliding then return end
                if i.UserInputType==Enum.UserInputType.MouseMovement
                or i.UserInputType==Enum.UserInputType.Touch then fromInput(i) end
            end)
            UIS.InputEnded:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.MouseButton1
                or i.UserInputType==Enum.UserInputType.Touch then sliding=false end
            end)

            local ia = (def-mn)/(mx-mn)
            fill.Size = UDim2.new(ia,0,1,0); knob.Position = UDim2.new(ia,0,0.5,0)
            if flag and cfgSys then cfgSys:reg(flag,def,function(v) applyAlpha((v-mn)/(mx-mn)) end) end
            local el = BaseEl(card)
            el.Set = function(v) applyAlpha((v-mn)/(mx-mn)) end
            el.Get = function() return curVal end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  DROPDOWN  (animated list, search built-in)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateDropdown(c)
            c = c or {}
            local nm   = c.Name     or "Dropdown"
            local opts = c.Options  or {}
            local def  = c.Default  or opts[1] or "None"
            local cb   = c.Callback or function() end
            local flag = c.Flag

            --[[
                ACCORDION PATTERN:
                The card starts at HEADER_H tall.
                When open it grows to HEADER_H + list_height + GAP.
                The list is positioned just below the header row, INSIDE
                the card — so the ScrollingFrame never clips it.
            ]]
            local HEADER_H = 54
            local OPT_H    = 46   -- tall enough for easy finger tapping
            local MAX_OPTS = 5    -- max visible rows before internal scroll
            local GAP      = 6    -- gap between header and list top

            -- Card: ClipsDescendants=true, starts collapsed
            local card = New("Frame", {
                Size = UDim2.new(1,0,0,HEADER_H), LayoutOrder = nextIdx(),
                BackgroundColor3 = T.Surface, BorderSizePixel = 0,
                ClipsDescendants = true, ZIndex = 6, Parent = scroll,
            }); Corner(card,12); Stroke(card,T.Border,1,0.40)

            -- Fixed header row (always visible)
            local header = New("Frame", {
                Size = UDim2.new(1,0,0,HEADER_H), Position = UDim2.new(0,0,0,0),
                BackgroundTransparency = 1, ZIndex = 7, Parent = card,
            })
            NameLbl(header, nm, nil)

            local selLbl = New("TextLabel", {
                Size = UDim2.new(0.44,0,1,0), Position = UDim2.new(0.50,0,0,0),
                BackgroundTransparency = 1, Text = def,
                TextColor3 = T.TextSub, TextSize = 12, Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 8, Parent = header,
            })
            local arrow = New("TextLabel", {
                Size = UDim2.new(0,26,0,HEADER_H), Position = UDim2.new(1,-30,0,0),
                BackgroundTransparency = 1, Text = "⌄",
                TextColor3 = T.Accent, TextSize = 16, Font = Enum.Font.GothamBold,
                ZIndex = 8, Parent = header,
            })

            -- Hit button over the entire header (large, easy to press)
            local dropHit = New("TextButton", {
                Size = UDim2.new(1,0,0,HEADER_H), Position = UDim2.new(0,0,0,0),
                BackgroundTransparency = 1, Text = "",
                AutoButtonColor = false, ZIndex = 10, Parent = card,
            }); Corner(dropHit, 12)

            -- List container — positioned just below the header inside the card
            local listScroll = New("ScrollingFrame", {
                Size = UDim2.new(1,-8,0,0),
                Position = UDim2.new(0,4,0,HEADER_H + GAP),
                BackgroundColor3 = T.SurfaceAlt,
                BorderSizePixel = 0,
                ScrollBarThickness = 2,
                ScrollBarImageColor3 = T.Accent,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.new(0,0,0,0),
                ScrollingDirection = Enum.ScrollingDirection.Y,
                ZIndex = 8, Parent = card,
            }); Corner(listScroll, 10); Stroke(listScroll, T.Border, 1, 0.20)
            Pad(listScroll, 4,4,4,4); ListY(listScroll, 2)

            local selVal = def; local isOpen = false

            local function listH()
                return math.min(#opts, MAX_OPTS) * OPT_H + 8
            end

            local function close()
                isOpen = false
                Tween(card,       {Size=UDim2.new(1,0,0,HEADER_H)},         0.26, Enum.EasingStyle.Sine)
                Tween(listScroll, {Size=UDim2.new(1,-8,0,0)},               0.22, Enum.EasingStyle.Sine)
                Tween(arrow,      {Rotation=0, TextColor3=T.Accent},         0.20, Enum.EasingStyle.Sine)
            end
            local function open()
                isOpen = true
                local lh = listH()
                Tween(card,       {Size=UDim2.new(1,0,0,HEADER_H+GAP+lh+6)},0.30, Enum.EasingStyle.Sine)
                Tween(listScroll, {Size=UDim2.new(1,-8,0,lh)},               0.26, Enum.EasingStyle.Sine)
                Tween(arrow,      {Rotation=180, TextColor3=T.Accent},        0.20, Enum.EasingStyle.Sine)
            end

            local function rebuild(o)
                for _, ch in pairs(listScroll:GetChildren()) do
                    if ch:IsA("TextButton") then ch:Destroy() end
                end
                for i, opt in ipairs(o) do
                    local sel=(opt==selVal)
                    local ob=New("TextButton",{
                        Size=UDim2.new(1,0,0,OPT_H-2),
                        BackgroundColor3=sel and T.Accent or T.Surface,
                        BackgroundTransparency=sel and 0.85 or 1,
                        BorderSizePixel=0, Text=opt,
                        TextColor3=sel and T.Accent or T.Text,
                        TextSize=13,
                        Font=sel and Enum.Font.GothamSemibold or Enum.Font.Gotham,
                        AutoButtonColor=false, LayoutOrder=i,
                        ZIndex=11, Parent=listScroll,
                    }); Corner(ob, 8)
                    ob.MouseEnter:Connect(function()
                        Tween(ob,{BackgroundColor3=T.SurfaceHov,BackgroundTransparency=0},0.12)
                    end)
                    ob.MouseLeave:Connect(function()
                        Tween(ob,{
                            BackgroundColor3 = sel and T.Accent or T.Surface,
                            BackgroundTransparency = sel and 0.85 or 1,
                        },0.12)
                    end)
                    local fired = false
                    local function pick()
                        if fired then return end; fired = true
                        selVal = opt; selLbl.Text = opt
                        close(); cb(opt); rebuild(o)
                    end
                    ob.MouseButton1Down:Connect(pick)   -- catches fast taps
                    ob.MouseButton1Click:Connect(pick)  -- catches normal clicks
                    ob.InputBegan:Connect(function(inp)
                        if inp.UserInputType == Enum.UserInputType.Touch then pick() end
                    end)
                end
            end
            rebuild(opts)

            local function tog() if isOpen then close() else open() end end
            dropHit.MouseButton1Click:Connect(tog)
            dropHit.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.Touch then tog() end
            end)
            dropHit.MouseEnter:Connect(function()
                if not isOpen then Tween(card,{BackgroundColor3=T.SurfaceAlt},0.14) end
            end)
            dropHit.MouseLeave:Connect(function()
                Tween(card,{BackgroundColor3=T.Surface},0.14)
            end)

            if flag and cfgSys then cfgSys:reg(flag,def,function(v) selVal=v;selLbl.Text=v;cb(v) end) end
            local el = BaseEl(card)
            el.Set     = function(v) selVal=v; selLbl.Text=v; cb(v) end
            el.Get     = function() return selVal end
            el.Refresh = function(o) opts=o; rebuild(o) end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  MULTI-DROPDOWN  (v6 new — check-mark multi-select)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateMultiDropdown(c)
            c = c or {}
            local nm     = c.Name      or "MultiSelect"
            local opts   = c.Options   or {}
            local def    = c.Default   or {}   -- table of pre-selected option strings
            local maxSel = c.MaxSelect or 0    -- 0 = unlimited
            local cb     = c.Callback  or function() end

            -- Convert default array to set for fast lookup
            local selected = {}
            for _,v in ipairs(def) do selected[v] = true end

            local card = New("Frame", {
                Size = UDim2.new(1,0,0,54), LayoutOrder = nextIdx(),
                BackgroundColor3 = T.Surface, BorderSizePixel = 0,
                ClipsDescendants = false, ZIndex = 10, Parent = scroll,
            }); Corner(card,12); Stroke(card,T.Border,1,0.40)

            NameLbl(card,nm,nil)

            -- Count badge (shows "2 selected")
            local countBg = New("Frame", {
                Size = UDim2.new(0,0,0,22), AutomaticSize = Enum.AutomaticSize.X,
                Position = UDim2.new(1,-70,0.5,-11),
                BackgroundColor3 = T.Accent, BackgroundTransparency = 0.78,
                BorderSizePixel = 0, ZIndex = 11, Parent = card,
            }); Corner(countBg,6); Pad(countBg,0,8,0,8)

            local countLbl = New("TextLabel", {
                Size = UDim2.new(0,0,1,0), AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1, Text = "None",
                TextColor3 = T.Accent, TextSize = 11, Font = Enum.Font.GothamBold,
                ZIndex = 12, Parent = countBg,
            })

            local arrow = New("TextLabel", {
                Size = UDim2.new(0,22,1,0), Position = UDim2.new(1,-26,0,0),
                BackgroundTransparency = 1, Text = "⌄",
                TextColor3 = T.TextSub, TextSize = 14, Font = Enum.Font.GothamBold,
                ZIndex = 11, Parent = card,
            })

            local list = New("Frame", {
                Size = UDim2.new(1,0,0,0), Position = UDim2.new(0,0,1,5),
                BackgroundColor3 = T.Surface, BorderSizePixel = 0,
                ClipsDescendants = true, ZIndex = 20, Visible = false, Parent = card,
            }); Corner(list,12); Stroke(list,T.Border,1,0.05)
            Pad(list,4,4,4,4); ListY(list,2)

            local OPT_H=46; local MAX_H=220
            local isOpen=false
            local optBtns = {}

            local function getSelected()
                local t={}
                for v,_ in pairs(selected) do table.insert(t,v) end
                return t
            end

            local function updateCount()
                local s = getSelected()
                local n = #s
                if n == 0 then
                    countLbl.Text = "None"
                    Tween(countBg,{BackgroundTransparency=0.78},0.12)
                else
                    countLbl.Text = tostring(n)
                    Tween(countBg,{BackgroundTransparency=0.60},0.12)
                end
            end

            local function refreshRow(opt)
                local btn = optBtns[opt]
                if not btn then return end
                local sel = selected[opt] == true
                Tween(btn._bg,{BackgroundColor3=sel and T.Accent or T.SurfaceAlt,
                               BackgroundTransparency=sel and 0 or 1},0.14)
                btn._check.Text = sel and "✓" or ""
                btn._lbl.TextColor3 = sel and T.Accent or T.Text
                btn._lbl.Font = sel and Enum.Font.GothamSemibold or Enum.Font.Gotham
            end

            local function close()
                isOpen=false
                Tween(list,{Size=UDim2.new(1,0,0,0)},0.18)
                Tween(arrow,{Rotation=0},0.18)
                task.delay(0.20,function() list.Visible=false end)
            end
            local function open()
                isOpen=true; list.Visible=true
                local h=math.min(#opts*OPT_H+8,MAX_H)
                Tween(list,{Size=UDim2.new(1,0,0,h)},0.22,Enum.EasingStyle.Back)
                Tween(arrow,{Rotation=180},0.18)
            end

            -- Build option rows
            for i, opt in ipairs(opts) do
                local row = New("Frame", {
                    Size = UDim2.new(1,0,0,OPT_H-2),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0, LayoutOrder = i, ZIndex = 21, Parent = list,
                })
                local rowBg = New("Frame", {
                    Size = UDim2.new(1,0,1,0),
                    BackgroundColor3 = T.SurfaceAlt, BackgroundTransparency = 1,
                    BorderSizePixel = 0, ZIndex = 21, Parent = row,
                }); Corner(rowBg,8)

                -- Checkmark box
                local chkBox = New("Frame", {
                    Size = UDim2.new(0,18,0,18), Position = UDim2.new(0,8,0.5,-9),
                    BackgroundColor3 = T.Accent, BackgroundTransparency = selected[opt] and 0 or 1,
                    BorderSizePixel = 0, ZIndex = 22, Parent = row,
                }); Corner(chkBox,5); Stroke(chkBox,T.Accent,1.5,0)
                local chkLbl = New("TextLabel", {
                    Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1,
                    Text = selected[opt] and "✓" or "",
                    TextColor3 = Color3.new(1,1,1), TextSize = 11,
                    Font = Enum.Font.GothamBold, ZIndex = 23, Parent = chkBox,
                })

                local optLbl = New("TextLabel", {
                    Size = UDim2.new(1,-36,1,0), Position = UDim2.new(0,34,0,0),
                    BackgroundTransparency = 1, Text = opt,
                    TextColor3 = selected[opt] and T.Accent or T.Text,
                    TextSize = 12,
                    Font = selected[opt] and Enum.Font.GothamSemibold or Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 22, Parent = row,
                })

                optBtns[opt] = {_bg=rowBg,_check=chkLbl,_lbl=optLbl}

                local hitBtn = New("TextButton", {
                    Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1,
                    Text = "", AutoButtonColor = false, ZIndex = 26, Parent = row,
                })
                local mFired = false
                local function pick()
                    if mFired then return end; mFired = true
                    if selected[opt] then
                        selected[opt] = nil
                    else
                        if maxSel>0 and #getSelected()>=maxSel then mFired=false; return end
                        selected[opt] = true
                    end
                    refreshRow(opt)
                    updateCount()
                    cb(getSelected())
                    task.delay(0.05, function() mFired = false end)
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

            local dropHit = New("TextButton", {
                Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1,
                Text = "", AutoButtonColor = false, ZIndex = 12, Parent = card,
            })
            local function tog() if isOpen then close() else open() end end
            dropHit.MouseButton1Click:Connect(tog)
            dropHit.InputBegan:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then tog() end
            end)
            dropHit.MouseEnter:Connect(function() Tween(card,{BackgroundColor3=T.SurfaceAlt},0.12) end)
            dropHit.MouseLeave:Connect(function() Tween(card,{BackgroundColor3=T.Surface   },0.12) end)

            local el = BaseEl(card)
            el.Get   = getSelected
            el.Set   = function(arr)
                selected = {}
                for _,v in ipairs(arr) do selected[v]=true end
                for _,opt in ipairs(opts) do refreshRow(opt) end
                updateCount(); cb(getSelected())
            end
            el.Clear = function()
                selected = {}
                for _,opt in ipairs(opts) do refreshRow(opt) end
                updateCount(); cb({})
            end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  STEPPER  (v6 new — +/- integer control)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateStepper(c)
            c = c or {}
            local nm   = c.Name        or "Stepper"
            local desc = c.Description
            local mn   = c.Min         or 0
            local mx   = c.Max         or 100
            local def  = c.Default     or mn
            local inc  = c.Increment   or 1
            local suf  = c.Suffix      or ""
            local cb   = c.Callback    or function() end
            local flag = c.Flag

            local card = Card(desc and 62 or 54)
            NameLbl(card,nm, desc and 9)
            if desc then DescLbl(card,desc,30) end

            -- Step control group (right-aligned)
            local CTRL_W = 118; local BTN_SZ = 30

            local ctrlFrame = New("Frame", {
                Size = UDim2.new(0,CTRL_W,0,BTN_SZ),
                Position = UDim2.new(1,-(CTRL_W+12),0.5,-BTN_SZ/2),
                BackgroundColor3 = T.SurfaceAlt,
                BorderSizePixel = 0, ZIndex = 7, Parent = card,
            }); Corner(ctrlFrame,10)
            Stroke(ctrlFrame,T.Border,1,0.30)

            local curVal = math.clamp(def,mn,mx)

            -- Value display label (center)
            local valLbl = New("TextLabel", {
                Size = UDim2.new(1,-BTN_SZ*2,1,0), Position = UDim2.new(0,BTN_SZ,0,0),
                BackgroundTransparency = 1, Text = tostring(curVal)..suf,
                TextColor3 = T.Text, TextSize = 13, Font = Enum.Font.GothamBold,
                ZIndex = 8, Parent = ctrlFrame,
            })

            -- Minus button
            local function StepBtn(xPos, symbol, delta)
                local b = New("TextButton", {
                    Size = UDim2.new(0,BTN_SZ,1,0), Position = UDim2.new(0,xPos,0,0),
                    BackgroundColor3 = T.SurfaceAlt, BackgroundTransparency = 1,
                    BorderSizePixel = 0, Text = symbol,
                    TextColor3 = T.Accent, TextSize = 18, Font = Enum.Font.GothamBold,
                    AutoButtonColor = false, ZIndex = 9, Parent = ctrlFrame,
                }); Corner(b, 10)
                local function step()
                    curVal = math.clamp(curVal+delta, mn, mx)
                    valLbl.Text = tostring(curVal)..suf
                    -- Brief flash
                    Tween(b,{TextColor3=Color3.new(1,1,1)},0.06)
                    task.delay(0.08,function() Tween(b,{TextColor3=T.Accent},0.14) end)
                    cb(curVal)
                end
                b.MouseButton1Click:Connect(step)
                b.InputBegan:Connect(function(i)
                    if i.UserInputType==Enum.UserInputType.Touch then step() end
                end)
                b.MouseEnter:Connect(function() Tween(b,{BackgroundTransparency=0.88},0.10) end)
                b.MouseLeave:Connect(function() Tween(b,{BackgroundTransparency=1   },0.10) end)
                return b
            end

            StepBtn(0,              "−", -inc)
            StepBtn(CTRL_W-BTN_SZ, "+",  inc)

            -- Vertical divider lines
            New("Frame",{Size=UDim2.new(0,1,0.6,0),Position=UDim2.new(0,BTN_SZ,0.2,0),
                BackgroundColor3=T.Border,BorderSizePixel=0,ZIndex=8,Parent=ctrlFrame})
            New("Frame",{Size=UDim2.new(0,1,0.6,0),Position=UDim2.new(1,-BTN_SZ-1,0.2,0),
                BackgroundColor3=T.Border,BorderSizePixel=0,ZIndex=8,Parent=ctrlFrame})

            if flag and cfgSys then
                cfgSys:reg(flag,def,function(v)
                    curVal=math.clamp(v,mn,mx); valLbl.Text=tostring(curVal)..suf
                end)
            end
            local el = BaseEl(card)
            el.Set = function(v) curVal=math.clamp(v,mn,mx); valLbl.Text=tostring(curVal)..suf end
            el.Get = function() return curVal end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  TEXTBOX  (focus glow, clear button, char limit)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateTextbox(c)
            c = c or {}
            local nm   = c.Name        or "Textbox"
            local ph   = c.Placeholder or "Type here..."
            local def  = c.Default     or ""
            local cof  = c.ClearOnFocus~=nil and c.ClearOnFocus or false
            local cb   = c.Callback    or function() end
            local maxC = c.MaxChars    or 0

            local card = Card(80)
            NameLbl(card,nm,8)

            local ibg = New("Frame", {
                Size = UDim2.new(1,-26,0,34), Position = UDim2.new(0,13,0,34),
                BackgroundColor3 = T.SurfaceAlt, BorderSizePixel = 0,
                ZIndex = 7, Parent = card,
            }); Corner(ibg,10)
            local ist = Stroke(ibg,T.Border,1,0.18)

            local ib = New("TextBox", {
                Size = UDim2.new(1,-36,1,0), Position = UDim2.new(0,10,0,0),
                BackgroundTransparency = 1, Text = def,
                PlaceholderText = ph, TextColor3 = T.Text,
                PlaceholderColor3 = T.TextMute,
                TextSize = 12, Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Left,
                ClearTextOnFocus = cof, ZIndex = 8, Parent = ibg,
            })

            local clrBtn = New("TextButton", {
                Size = UDim2.new(0,24,0,24), Position = UDim2.new(1,-28,0.5,-12),
                BackgroundTransparency = 1, Text = "×",
                TextColor3 = T.TextMute, TextSize = 16, Font = Enum.Font.GothamBold,
                AutoButtonColor = false, ZIndex = 9,
                Visible = def~="", Parent = ibg,
            })
            clrBtn.MouseButton1Click:Connect(function() ib.Text=""; clrBtn.Visible=false end)
            ib:GetPropertyChangedSignal("Text"):Connect(function()
                clrBtn.Visible = ib.Text~=""
                if maxC>0 and #ib.Text>maxC then ib.Text=ib.Text:sub(1,maxC) end
            end)
            ib.Focused:Connect(function()
                Tween(ibg,{BackgroundColor3=T.Surface},0.14)
                Tween(ist,{Color=T.Accent,Transparency=0},0.14)
            end)
            ib.FocusLost:Connect(function(enter)
                Tween(ibg,{BackgroundColor3=T.SurfaceAlt},0.14)
                Tween(ist,{Color=T.Border,Transparency=0.18},0.14)
                if enter then cb(ib.Text) end
            end)
            return (function()
                local el = BaseEl(card)
                el.Set = function(v) ib.Text=v end
                el.Get = function() return ib.Text end
                return el
            end)()
        end

        -- ════════════════════════════════════════════════════════
        --  KEYBIND  (pill badge, listening state)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateKeybind(c)
            c = c or {}
            local nm   = c.Name    or "Keybind"
            local def  = c.Default or Enum.KeyCode.F
            local cb   = c.Callback or function() end

            local card = Card(54)
            NameLbl(card,nm,nil)

            local kbg = New("Frame", {
                Size = UDim2.new(0,96,0,28), Position = UDim2.new(1,-108,0.5,-14),
                BackgroundColor3 = T.SurfaceAlt, BorderSizePixel = 0,
                ZIndex = 7, Parent = card,
            }); Corner(kbg,9); Stroke(kbg,T.Border,1,0.10)

            local klbl = New("TextButton", {
                Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1,
                Text = def.Name, TextColor3 = T.Accent,
                TextSize = 11, Font = Enum.Font.GothamBold,
                AutoButtonColor = false, ZIndex = 8, Parent = kbg,
            })

            -- Listening indicator dot
            local lisDot = New("Frame", {
                Size = UDim2.new(0,6,0,6), Position = UDim2.new(0,8,0.5,-3),
                BackgroundColor3 = T.Warning, BorderSizePixel = 0,
                Visible = false, ZIndex = 9, Parent = kbg,
            }); Corner(lisDot,3)

            local bound = def; local listening = false
            klbl.MouseButton1Click:Connect(function()
                listening = true; klbl.Text = "   press key"
                klbl.TextColor3 = T.Warning
                lisDot.Visible = true
                Tween(kbg,{BackgroundColor3=T.Surface},0.12)
            end)
            UIS.InputBegan:Connect(function(inp,proc)
                if listening and inp.UserInputType==Enum.UserInputType.Keyboard then
                    listening=false; bound=inp.KeyCode
                    klbl.Text=inp.KeyCode.Name; klbl.TextColor3=T.Accent
                    lisDot.Visible=false
                    Tween(kbg,{BackgroundColor3=T.SurfaceAlt},0.12)
                elseif not listening and not proc and inp.KeyCode==bound then
                    cb()
                end
            end)
            local el = BaseEl(card)
            el.GetKey = function() return bound end
            el.Set    = function(keyCode)   -- set key programmatically
                bound = keyCode
                klbl.Text = keyCode.Name
                klbl.TextColor3 = T.Accent
                lisDot.Visible = false
                listening = false
                Tween(kbg,{BackgroundColor3=T.SurfaceAlt},0.12)
            end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  PROGRESS BAR  (display-only, animated fill)
        -- ════════════════════════════════════════════════════════
        function Tab:CreateProgressBar(c)
            c = c or {}
            local nm   = c.Name    or "Progress"
            local def  = math.clamp(c.Default or 0, 0, 100)
            local col  = c.Color
            local suf  = c.Suffix  or "%"

            local card = Card(64)
            NameLbl(card,nm,9)

            local fillCol = col or T.Accent
            local vLbl = New("TextLabel", {
                Size = UDim2.new(0,54,0,16), Position = UDim2.new(1,-62,0,9),
                BackgroundTransparency = 1,
                Text = tostring(math.floor(def))..suf,
                TextColor3 = T.Accent, TextSize = 11, Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 7, Parent = card,
            })

            local trkBg = New("Frame", {
                Size = UDim2.new(1,-26,0,8), Position = UDim2.new(0,13,0,40),
                BackgroundColor3 = T.SurfaceAlt, BorderSizePixel = 0,
                ZIndex = 7, Parent = card,
            }); Corner(trkBg,4)

            local fill = New("Frame", {
                Size = UDim2.new(def/100,0,1,0), BackgroundColor3 = fillCol,
                BorderSizePixel = 0, ZIndex = 8, Parent = trkBg,
            }); Corner(fill,4)
            Grad(fill, fillCol, col and fillCol or T.AccentDark, 0)

            -- Sheen
            local sheen = New("Frame", {
                Size = UDim2.new(1,0,0.5,0), BackgroundColor3 = Color3.new(1,1,1),
                BackgroundTransparency = 0.86, BorderSizePixel = 0, ZIndex = 9, Parent = fill,
            }); Corner(sheen, 4)

            local curVal = def
            local function setVal(v)
                v = math.clamp(v,0,100); curVal = v
                Tween(fill,{Size=UDim2.new(v/100,0,1,0)},0.32,Enum.EasingStyle.Sine)
                vLbl.Text = tostring(math.floor(v))..suf
            end
            local el = BaseEl(card)
            el.Set = setVal
            el.Get = function() return curVal end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  MULTI-PICKER  (horizontal pill row — single select)
        -- ════════════════════════════════════════════════════════
        function Tab:CreatePicker(c)
            c = c or {}
            local nm   = c.Name     or "Mode"
            local opts = c.Options  or {}
            local def  = c.Default  or opts[1]
            local cb   = c.Callback or function() end

            local card = Card(70)
            NameLbl(card,nm,9)

            local row = New("Frame", {
                Size = UDim2.new(1,-26,0,32), Position = UDim2.new(0,13,0,32),
                BackgroundColor3 = T.SurfaceAlt, BorderSizePixel = 0,
                ZIndex = 7, Parent = card,
            }); Corner(row,9)
            local pl = Instance.new("UIListLayout")
            pl.FillDirection = Enum.FillDirection.Horizontal
            pl.SortOrder = Enum.SortOrder.LayoutOrder
            pl.Padding = UDim.new(0,3)
            pl.VerticalAlignment = Enum.VerticalAlignment.Center
            pl.Parent = row; Pad(row,3,3,3,3)

            local pills = {}; local selVal = def
            local function setActive(opt,silent)
                selVal = opt
                for o,btn in pairs(pills) do
                    local a = (o==opt)
                    Tween(btn,{BackgroundColor3=a and T.Accent or T.Surface,
                               BackgroundTransparency=a and 0 or 1},0.16)
                    btn.TextColor3 = a and Color3.new(1,1,1) or T.TextSub
                    btn.Font = a and Enum.Font.GothamSemibold or Enum.Font.Gotham
                end
                if not silent then cb(opt) end
            end
            for i,opt in ipairs(opts) do
                local btn = New("TextButton",{
                    Size=UDim2.new(1/#opts,-(3*(#opts+1)/#opts),1,0),
                    BackgroundColor3=T.Surface, BackgroundTransparency=1,
                    BorderSizePixel=0, Text=opt, TextColor3=T.TextSub, TextSize=11,
                    Font=Enum.Font.Gotham, AutoButtonColor=false,
                    LayoutOrder=i, ZIndex=8, Parent=row,
                }); Corner(btn,7); pills[opt]=btn
                btn.MouseButton1Click:Connect(function() setActive(opt) end)
                btn.InputBegan:Connect(function(inp)
                    if inp.UserInputType==Enum.UserInputType.Touch then setActive(opt) end
                end)
            end
            task.defer(function() setActive(def,true) end)
            local el = BaseEl(card)
            el.Set = function(v) setActive(v,false) end
            el.Get = function() return selVal end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  LABEL / SEPARATOR / PARAGRAPH / COLOR DISPLAY
        -- ════════════════════════════════════════════════════════
        function Tab:CreateLabel(c)
            c = c or {}
            local f = New("Frame",{
                Size=UDim2.new(1,0,0,22),LayoutOrder=nextIdx(),
                BackgroundTransparency=1,ZIndex=6,Parent=scroll,
            })
            local lbl = New("TextLabel",{
                Size=UDim2.new(1,-6,1,0),Position=UDim2.new(0,4,0,0),
                BackgroundTransparency=1,Text=(c.Text or "Label"):upper(),
                TextColor3=T.TextMute,TextSize=10,Font=Enum.Font.GothamBold,
                TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7,Parent=f,
            })
            New("Frame",{
                Size=UDim2.new(1,-4,0,1),Position=UDim2.new(0,2,1,-1),
                BackgroundColor3=T.BorderSoft,BorderSizePixel=0,ZIndex=6,Parent=f,
            })
            local el = BaseEl(f, 0)
            el.SetText = function(t) lbl.Text = t:upper() end
            return el
        end

        function Tab:CreateSeparator(c)
            c = c or {}
            local f = New("Frame",{
                Size=UDim2.new(1,0,0,16),LayoutOrder=nextIdx(),
                BackgroundTransparency=1,ZIndex=6,Parent=scroll,
            })
            if c.Text then
                New("TextLabel",{
                    Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,
                    Text=c.Text,TextColor3=T.TextMute,TextSize=10,
                    Font=Enum.Font.GothamSemibold,ZIndex=7,Parent=f,
                })
            else
                New("Frame",{
                    Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0.5,0),
                    BackgroundColor3=T.BorderSoft,BorderSizePixel=0,
                    BackgroundTransparency=0.3,ZIndex=7,Parent=f,
                })
            end
            return BaseEl(f, 0)
        end

        function Tab:CreateParagraph(c)
            c = c or {}
            local f = New("Frame",{
                Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
                LayoutOrder=nextIdx(),BackgroundColor3=T.Surface,
                BorderSizePixel=0,ZIndex=6,Parent=scroll,
            }); Corner(f,12); Stroke(f,T.Border,1,0.40)
            Pad(f,12,14,12,14); ListY(f,5)
            local tl
            if c.Title and c.Title~="" then
                tl = New("TextLabel",{
                    Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
                    BackgroundTransparency=1,Text=c.Title,
                    TextColor3=T.Text,TextSize=13,Font=Enum.Font.GothamBold,
                    TextXAlignment=Enum.TextXAlignment.Left,
                    TextWrapped=true,LayoutOrder=1,ZIndex=7,Parent=f,
                })
            end
            local cl = New("TextLabel",{
                Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
                BackgroundTransparency=1,Text=c.Content or "",
                TextColor3=T.TextSub,TextSize=11,Font=Enum.Font.Gotham,
                TextXAlignment=Enum.TextXAlignment.Left,
                TextWrapped=true,LayoutOrder=2,ZIndex=7,Parent=f,
            })
            local el = BaseEl(f, 12)
            el.SetContent = function(t) cl.Text = t end
            el.SetTitle   = function(t) if tl then tl.Text = t end end
            return el
        end

        function Tab:CreateColorDisplay(c)
            c = c or {}
            local nm  = c.Name    or "Color"
            local def = c.Default or Color3.fromRGB(100,150,255)
            local cb  = c.Callback or function() end
            local cur = def

            local card = Card(54)
            NameLbl(card,nm,nil)
            local prev = New("Frame",{
                Size=UDim2.new(0,36,0,36),Position=UDim2.new(1,-50,0.5,-18),
                BackgroundColor3=def,BorderSizePixel=0,ZIndex=7,Parent=card,
            }); Corner(prev,10); Stroke(prev,T.Border,1,0.08)
            HitBtn(card).MouseButton1Click:Connect(function() cb(cur) end)
            local el = BaseEl(card)
            el.Set = function(v) cur=v; prev.BackgroundColor3=v end
            el.Get = function() return cur end
            return el
        end

        -- ════════════════════════════════════════════════════════
        --  SHORT API ALIASES  (v6.1)
        --  Tab:Toggle()         → Tab:CreateToggle()
        --  Tab:Button()         → Tab:CreateButton()
        --  Tab:Slider()         → Tab:CreateSlider()
        --  Tab:Dropdown()       → Tab:CreateDropdown()
        --  Tab:MultiDropdown()  → Tab:CreateMultiDropdown()
        --  Tab:Stepper()        → Tab:CreateStepper()
        --  Tab:Textbox()        → Tab:CreateTextbox()
        --  Tab:Keybind()        → Tab:CreateKeybind()
        --  Tab:Progress()       → Tab:CreateProgressBar()
        --  Tab:Picker()         → Tab:CreatePicker()
        --  Tab:Section()        → Tab:CreateSection()
        --  Tab:Label()          → Tab:CreateLabel()
        --  Tab:Separator()      → Tab:CreateSeparator()
        --  Tab:Paragraph()      → Tab:CreateParagraph()
        --  Tab:ColorDisplay()   → Tab:CreateColorDisplay()
        --  All old CreateX() calls continue to work unchanged.
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
    end  -- CreateTab

    -- ════════════════════════════════════════════════════════════════
    --  WINDOW METHODS
    -- ════════════════════════════════════════════════════════════════
    function Window:SaveConfig()
        if not self.Config then return end
        local ok,e = self.Config:save()
        self:Notify({
            Title = ok and "Config Saved"  or "Save Failed",
            Text  = ok and self.Config._f  or tostring(e),
            Type  = ok and "Success"       or "Error",
        })
    end

    function Window:LoadConfig()
        if not self.Config then return end
        local ok,e = self.Config:load()
        self:Notify({
            Title = ok and "Config Loaded" or "Load Failed",
            Text  = ok and "Settings restored." or tostring(e),
            Type  = ok and "Success"            or "Warning",
        })
    end

    function Window:ResetConfig()
        if not self.Config then return end
        self.Config:reset()
        self:Notify({Title="Config Reset",Text="All settings restored to default.",Type="Info"})
    end

    function Window:GetVersion()
        return NexusUI.Version
    end

    function Window:SetVisible(v)
        if v then showUI() else hideUI() end
    end

    function Window:Destroy()
        ToggleWrap:Destroy(); Screen:Destroy()
    end

    -- ════════════════════════════════════════════════════════════════
    --  WINDOW SHORT ALIASES  (v6.1)
    -- ════════════════════════════════════════════════════════════════
    Window.Tab    = Window.CreateTab   -- Win:Tab("Main") instead of Win:CreateTab("Main")
    Window.Show   = Window.SetVisible  -- Win:Show(true/false)
    Window.Close  = Window.Destroy     -- Win:Close()

    return Window
end  -- CreateWindow

return NexusUI
