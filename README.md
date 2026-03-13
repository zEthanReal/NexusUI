# NexusUI â€” v6.0.0

> Premium iOS-inspired Roblox UI library.  
> PC Â· Mobile Â· Tablet Â· Zero cut-off Â· Clean API

---

## What's New in v6

| Feature | Details |
|---|---|
| **2 new themes** | Sunset (amber/orange), Aqua (teal/mint) â€” **9 themes** total |
| **Version badge** | Slim `v6.0` tag inside the title bar |
| **`CreateMultiDropdown`** | Multi-select with checkmarks, count badge, optional max-select cap |
| **`CreateStepper`** | Compact `âˆ’` / value / `+` integer control |
| **`Button:SetLoading(bool)`** | Pulsing dot + disabled clicks while an async action runs |
| **`Window:Alert()`** | Full modal overlay â€” title, body, Confirm + Cancel, dim backdrop |
| **`Window:ResetConfig()`** | Restores all flagged elements to their default values |
| **`Window:GetVersion()`** | Returns `"6.0.0"` |
| **Improved notifications** | 88 px tall, animated icon pulse, dedicated Ã— close button |
| **Card height** | Default raised 52 â†’ 54 px for better mobile touch targets |

---

## Quick Start

```lua
local NexusUI = loadstring(game:HttpGet("YOUR_RAW_URL"))()

local Win = NexusUI:CreateWindow({
    Title      = "My Script",
    SubTitle   = "v1.0",                  -- optional subtitle
    Theme      = "Dark",                  -- see Themes section
    ToggleKey  = Enum.KeyCode.RightShift,
    ToggleIcon = "",                       -- rbxassetid://... or "" for â˜°
    ConfigName = "MyScript",              -- omit to skip save/load
    Size       = Vector2.new(490, 575),   -- optional
})

local Tab = Win:CreateTab("Main", "rbxassetid://7733960981")

Tab:CreateSection({ Text = "Combat" })
Tab:CreateToggle({ Name = "Auto Farm", Default = false, Callback = function(v) end })
Tab:CreateSlider({ Name = "Walk Speed", Min = 16, Max = 250, Default = 16,
    Suffix = " st", Callback = function(v) end })
Tab:CreateButton({ Name = "Teleport Hub", Callback = function() end })

Win:Notify({ Title = "Ready", Text = "NexusUI v6 loaded!", Type = "Success" })
```

---

## Themes

| Name | Accent | Background |
|---|---|---|
| `Dark` *(default)* | Blue | Deep navy |
| `Midnight` | Electric blue | Pitch-black |
| `Ocean` | Cyan | Dark teal/navy |
| `Purple` | Vivid violet | Dark purple |
| `Rose` | Crimson-pink | Warm dark |
| `Neon` | Electric green | Near-black |
| `Sunset` â­ new | Orange | Warm amber dark |
| `Aqua` â­ new | Mint | Dark teal |
| `Light` | Blue | Clean white |

---

## `CreateWindow( config )` â†’ `Window`

| Key | Type | Default | Description |
|---|---|---|---|
| `Title` | string | `"NexusUI"` | Window title |
| `SubTitle` | string | nil | Optional subtitle below title |
| `Theme` | string | `"Dark"` | Theme name |
| `ToggleKey` | KeyCode | `RightShift` | Keyboard shortcut to show/hide |
| `ToggleIcon` | string | `""` | rbxassetid for floating button icon |
| `ConfigName` | string | nil | Enables save/load (required for Flags) |
| `Size` | Vector2 | `490Ã—575` | Optional window size override |

---

## Window Methods

### `Window:CreateTab( name, iconId? )` â†’ `Tab`

```lua
local Tab = Win:CreateTab("Combat")
local Tab = Win:CreateTab("Settings", "rbxassetid://7733960981")
```

---

### `Window:Notify( config )`

Slide-in toast (bottom-right). Auto-dismisses after `Duration` seconds.  
Click anywhere on it or press Ã— to dismiss early.

```lua
Win:Notify({
    Title    = "Action Complete",
    Text     = "Auto farm has been enabled.",
    Type     = "Success",   -- Success | Warning | Error | Info
    Duration = 4,
})
```

---

### `Window:Alert( config )` â­ new

Full-screen modal with dim backdrop. Clicking the backdrop cancels.

```lua
Win:Alert({
    Title       = "Confirm Reset",
    Text        = "This will clear all saved config. Continue?",
    ConfirmText = "Yes, Reset",   -- default "Confirm"
    CancelText  = "Go Back",      -- default "Cancel"
    OnConfirm   = function() Win:ResetConfig() end,
    OnCancel    = function() end,
})
```

---

### Config Methods

```lua
Win:SaveConfig()     -- writes <ConfigName>_nexus.json
Win:LoadConfig()     -- reads and applies saved values
Win:ResetConfig()    -- restores all Flagged elements to their defaults
```

Requires `ConfigName` in `CreateWindow`. Uses `writefile` / `readfile` â€” executor only.

---

### Visibility

```lua
Win:SetVisible(false)    -- hide window, show floating toggle btn
Win:SetVisible(true)     -- restore window with spring animation
Win:GetVersion()         -- returns "6.0.0"
Win:Destroy()            -- destroys ScreenGui and toggle button
```

---

## Tab Elements

---

### `Tab:CreateSection({ Text })`

Uppercase section header with a left accent bar. No return value.

```lua
Tab:CreateSection({ Text = "Combat Settings" })
```

---

### `Tab:CreateToggle( config )` â†’ `{ Set, Get }`

Full iOS switch with squish animation, Quart easing, and tap debounce.

```lua
local t = Tab:CreateToggle({
    Name        = "Auto Farm",
    Description = "Farms automatically",   -- optional
    Default     = false,
    Flag        = "autoFarm",              -- optional
    Callback    = function(v) end,
})
t:Set(true);  t:Get()  -- â†’ true
```

---

### `Tab:CreateButton( config )` â†’ `{ SetLoading }`

Accent-colored with subtle ripple, chevron, and optional loading state.

```lua
local b = Tab:CreateButton({
    Name        = "Connect",
    Description = "Connect to server",   -- optional
    Icon        = "rbxassetid://...",    -- optional
    Callback    = function()
        b:SetLoading(true)
        task.delay(2, function() b:SetLoading(false) end)
    end,
})
```

`SetLoading(true)` â€” replaces label with pulsing dot, ignores clicks.

---

### `Tab:CreateSlider( config )` â†’ `{ Set, Get }`

```lua
local s = Tab:CreateSlider({
    Name      = "Walk Speed",
    Min       = 16, Max = 250, Default = 16,
    Increment = 1, Suffix = " st",
    Flag      = "walkSpeed",
    Callback  = function(v) end,
})
s:Set(100);  s:Get()  -- â†’ 100
```

---

### `Tab:CreateDropdown( config )` â†’ `{ Set, Get, Refresh }`

Single-select animated list.

```lua
local d = Tab:CreateDropdown({
    Name     = "Game Mode",
    Options  = {"Easy","Normal","Hard"},
    Default  = "Normal",
    Flag     = "mode",
    Callback = function(v) end,
})
d:Set("Hard")
d:Refresh({"Easy","Normal","Hard","Insane"})  -- replace options live
```

---

### `Tab:CreateMultiDropdown( config )` â†’ `{ Get, Set, Clear }` â­ new

Multi-select with checkmark rows and a count badge.

```lua
local md = Tab:CreateMultiDropdown({
    Name      = "Active Perks",
    Options   = {"Speed","Shield","Jump","Regen"},
    Default   = {"Speed"},   -- pre-selected (optional)
    MaxSelect = 2,           -- 0 = unlimited (default)
    Callback  = function(selected)   -- table of selected strings
        print(table.concat(selected,", "))
    end,
})
md:Set({"Shield","Regen"})   -- replace selection
md:Clear()                    -- deselect all
local sel = md:Get()          -- â†’ { "Shield", "Regen" }
```

---

### `Tab:CreateStepper( config )` â†’ `{ Set, Get }` â­ new

```lua
local st = Tab:CreateStepper({
    Name      = "Kill Threshold",
    Min       = 0, Max = 9999, Default = 10,
    Increment = 1, Suffix = " kills",
    Flag      = "killThreshold",
    Callback  = function(v) end,
})
st:Set(50);  st:Get()  -- â†’ 50
```

---

### `Tab:CreateTextbox( config )` â†’ `{ Set, Get }`

```lua
local tb = Tab:CreateTextbox({
    Name         = "Player Name",
    Placeholder  = "Enter name...",
    Default      = "",
    ClearOnFocus = false,
    MaxChars     = 24,     -- 0 = unlimited
    Callback     = function(text) end,  -- fires on Enter
})
tb:Set("hello");  tb:Get()
```

---

### `Tab:CreateKeybind( config )` â†’ `{ GetKey }`

Click to start rebinding. Shows a listening indicator dot.

```lua
local kb = Tab:CreateKeybind({
    Name     = "Toggle Fly",
    Default  = Enum.KeyCode.F,
    Callback = function() end,
})
kb:GetKey()  -- â†’ Enum.KeyCode.F
```

---

### `Tab:CreateProgressBar( config )` â†’ `{ Set, Get }`

Display-only animated gradient fill bar.

```lua
local pb = Tab:CreateProgressBar({
    Name    = "Health",
    Default = 100,
    Suffix  = "%",
    Color   = Color3.fromRGB(100,220,180),  -- optional
})
pb:Set(75);  pb:Get()  -- â†’ 75
```

---

### `Tab:CreatePicker( config )` â†’ `{ Set, Get }`

Horizontal pill row â€” single-select.

```lua
local pk = Tab:CreatePicker({
    Name     = "Difficulty",
    Options  = {"Easy","Normal","Hard"},
    Default  = "Normal",
    Callback = function(v) end,
})
```

---

### `Tab:CreateLabel({ Text })`

Uppercase divider with underline. No return.

```lua
Tab:CreateLabel({ Text = "Advanced Options" })
```

---

### `Tab:CreateSeparator({ Text? })`

```lua
Tab:CreateSeparator()                  -- thin line
Tab:CreateSeparator({ Text = "or" })   -- with center text
```

---

### `Tab:CreateParagraph( config )` â†’ `{ SetContent }`

```lua
local p = Tab:CreateParagraph({
    Title   = "About",
    Content = "NexusUI v6 â€” premium Roblox UI library.",
})
p:SetContent("Updated body text.")
```

---

### `Tab:CreateColorDisplay( config )` â†’ `{ Set, Get }`

Color swatch that fires callback on click.

```lua
local cd = Tab:CreateColorDisplay({
    Name     = "Trail Color",
    Default  = Color3.fromRGB(100,180,255),
    Callback = function(c) end,
})
cd:Set(Color3.fromRGB(255,80,80));  cd:Get()
```

---

## Config / Flag System

Link any element to the save/load system by assigning a `Flag` string.

```lua
local Win = NexusUI:CreateWindow({ ConfigName = "MyScript", ... })

Tab:CreateToggle({ Flag = "godMode",   Default = false, ... })
Tab:CreateSlider({ Flag = "walkSpeed", Default = 16,    ... })

Win:SaveConfig()    -- saves to MyScript_nexus.json
Win:LoadConfig()    -- reads and re-applies saved values
Win:ResetConfig()   -- restores all flagged elements to their Default
```

---

## Toggle Button System

Pressing **Close (âœ•)** or the toggle key hides the window and reveals a small floating button at the top-center of the screen. Pressing it brings the window back with a spring pop-in.

```lua
-- Custom icon:
NexusUI:CreateWindow({ ToggleIcon = "rbxassetid://7733960981" })

-- Programmatic:
Win:SetVisible(false)  -- hide
Win:SetVisible(true)   -- show
```

---

## Window Architecture

```
ScreenGui  (IgnoreGuiInset=true, DisplayOrder=999)
  Root              â€” draggable transparent wrapper, no clip
    ShadowOuter     â€” wide soft shadow (ImageLabel)
    ShadowInner     â€” tight dark shadow (ImageLabel)
    WinFrame        â€” main window, ClipsDescendants=true
      TitleBar      â€” accent stripe, logo, title/subtitle, version badge, close btn
      Body
        Sidebar     â€” tab pills, gradient active highlight, scroll
        RightPanel  â€” content (ClipsDescendants=true)
          [ScrollingFrame per tab]
  NotifHolder       â€” bottom-right notification stack, screen-level
  ToggleWrap        â€” top-center floating toggle button
```

---

## Changelog

### v6.0.0
- New themes: Sunset, Aqua (9 total)
- `CreateMultiDropdown` with checkmarks, count badge, MaxSelect cap
- `CreateStepper` âˆ’ / + integer control
- `Button:SetLoading(bool)` pulsing dot loading state
- `Window:Alert()` modal overlay with confirm/cancel
- `Window:ResetConfig()` restore defaults
- `Window:GetVersion()` version string
- Notifications: 88 px, icon pulse, Ã— button
- Version badge in title bar
- Card height 52 â†’ 54 px

### v5.0.0
- 7 themes, ground-up element rewrite
- Multi-layer shadow, accent stripe, sliding toggle
- `Window:Alert()`, `Window:GetVersion()`

### v3.x â€“ v4.x
- Floating top-center toggle button
- iOS toggle rebuilt (squish + Quart easing)
- Subtle ripple, slider value badge, gradient fill

### v2.x
- Initial public release
