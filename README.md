# NexusUI — v6.1.0

> Premium iOS-inspired Roblox UI library.  
> PC · Mobile · Tablet · Zero cut-off · Clean API · Beginner-friendly

---

## What's New in v6.1 — Modern API

| Change | Details |
|---|---|
| **Short method names** | `Tab:Toggle()`, `Tab:Button()`, `Tab:Slider()` — no more `Create` prefix |
| **`Win:Tab()`** | Short alias for `Win:CreateTab()` |
| **`el:Show()` / `el:Hide()`** | Every element can now be toggled visible/invisible |
| **`el:Enable()` / `el:Disable()`** | Every element gets a dimmed overlay and blocks interaction when disabled |
| **`Toggle:SetName()`** | Update a toggle's label text after it's been created |
| **`Button:SetText()`** | Update a button's label text after it's been created |
| **`Keybind:Set(keyCode)`** | Bind a key programmatically, not just through UI |
| **`Paragraph:SetTitle()`** | Update the bold title of an info card after creation |
| **`Section:SetText()`** | Change a section header's text after creation |
| **All old `CreateX()` names still work** | Full backward compatibility — nothing breaks |

---

## Quick Start

```lua
-- Load the library
local NexusUI = loadstring(game:HttpGet("YOUR_RAW_URL"))()

-- Create a window
local Win = NexusUI:CreateWindow({
    Title     = "My Script",
    SubTitle  = "v1.0",
    Theme     = "Dark",
    ToggleKey = Enum.KeyCode.RightShift,
})

-- Create a tab (short form)
local Tab = Win:Tab("Main")

-- Add elements
Tab:Section({ Text = "Combat" })

local toggle = Tab:Toggle({
    Name     = "Auto Farm",
    Default  = false,
    Callback = function(on)
        print("Auto Farm:", on)
    end,
})

Tab:Slider({
    Name     = "Walk Speed",
    Min      = 16,
    Max      = 250,
    Default  = 16,
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end,
})

Tab:Button({
    Name     = "Teleport Hub",
    Callback = function() print("Teleporting!") end,
})

Win:Notify({ Title = "Ready", Text = "Script loaded!", Type = "Success" })
```

---

## Themes

Pass the name as a string to `CreateWindow({ Theme = "..." })`.

| Name | Accent | Background |
|---|---|---|
| `Dark` *(default)* | Blue | Deep navy |
| `Midnight` | Electric blue | Pitch-black |
| `Ocean` | Cyan | Dark teal |
| `Purple` | Vivid violet | Dark purple |
| `Rose` | Crimson-pink | Warm dark |
| `Neon` | Electric green | Near-black |
| `Sunset` | Orange | Warm amber |
| `Aqua` | Mint | Dark teal |
| `Light` | Blue | Clean white |

---

## Creating a Window

```lua
local Win = NexusUI:CreateWindow({
    Title      = "My Script",        -- Window title (required)
    SubTitle   = "v1.0",             -- Small line under title (optional)
    Theme      = "Dark",             -- Theme name (optional, default "Dark")
    ToggleKey  = Enum.KeyCode.RightShift, -- Hide/show hotkey (optional)
    ToggleIcon = "",                 -- rbxassetid://... for toggle button icon
    ConfigName = "MyScript",         -- Enables save/load (optional)
    Size       = Vector2.new(490, 575), -- Custom size (optional)
})
```

---

## Window Methods

### Creating Tabs

```lua
-- Short form (new in v6.1)
local Tab = Win:Tab("Settings")
local Tab = Win:Tab("Combat", "rbxassetid://7733960981")

-- Long form (still works)
local Tab = Win:CreateTab("Settings")
```

### Notifications

Slide-in toasts that appear in the bottom-right corner. They auto-dismiss or you can press × to close early.

```lua
Win:Notify({
    Title    = "Done!",
    Text     = "Action completed successfully.",
    Type     = "Success",  -- Success | Warning | Error | Info
    Duration = 4,          -- seconds (default: 4)
})
```

### Alert Modal

A full-screen overlay with a Confirm and Cancel button. Clicking the background also cancels.

```lua
Win:Alert({
    Title       = "Confirm",
    Text        = "Are you sure you want to reset all settings?",
    ConfirmText = "Yes, Reset",  -- default: "Confirm"
    CancelText  = "Go Back",     -- default: "Cancel"
    OnConfirm   = function() Win:ResetConfig() end,
    OnCancel    = function() end,
})
```

### Config — Save, Load, Reset

Requires `ConfigName` to be set when creating the window.

```lua
Win:SaveConfig()   -- saves all flagged elements to a JSON file
Win:LoadConfig()   -- loads and applies the saved values
Win:ResetConfig()  -- restores every flagged element to its default value
```

### Visibility

```lua
Win:SetVisible(false)   -- hide the window (shows floating toggle button)
Win:SetVisible(true)    -- show the window

-- Short aliases (new in v6.1)
Win:Show(false)
Win:Show(true)
```

### Other

```lua
Win:GetVersion()  -- returns "6.1.0"
Win:Destroy()     -- destroys everything, including the toggle button
Win:Close()       -- short alias for Win:Destroy()
```

---

## Tab Elements

Every element method exists in two forms — a short form (v6.1) and the original long form. Both work identically.

```lua
Tab:Toggle(...)        -- same as Tab:CreateToggle(...)
Tab:Button(...)        -- same as Tab:CreateButton(...)
Tab:Slider(...)        -- same as Tab:CreateSlider(...)
Tab:Dropdown(...)      -- same as Tab:CreateDropdown(...)
Tab:MultiDropdown(...) -- same as Tab:CreateMultiDropdown(...)
Tab:Stepper(...)       -- same as Tab:CreateStepper(...)
Tab:Textbox(...)       -- same as Tab:CreateTextbox(...)
Tab:Keybind(...)       -- same as Tab:CreateKeybind(...)
Tab:Progress(...)      -- same as Tab:CreateProgressBar(...)
Tab:Picker(...)        -- same as Tab:CreatePicker(...)
Tab:Section(...)       -- same as Tab:CreateSection(...)
Tab:Label(...)         -- same as Tab:CreateLabel(...)
Tab:Separator(...)     -- same as Tab:CreateSeparator(...)
Tab:Paragraph(...)     -- same as Tab:CreateParagraph(...)
Tab:ColorDisplay(...)  -- same as Tab:CreateColorDisplay(...)
```

### Common Methods on All Elements

Every element returns an object. All objects share these methods:

```lua
el:Show()        -- make the element visible
el:Hide()        -- hide the element completely
el:Enable()      -- re-enable a disabled element
el:Disable()     -- dim and block interaction (semi-transparent overlay)
el:IsDisabled()  -- returns true/false
```

---

### Section

A labeled group header with a left accent bar. Useful for organizing a long tab.

```lua
local sec = Tab:Section({ Text = "Combat Settings" })

-- Methods
sec:SetText("PvP Settings")  -- rename the header
sec:Show()
sec:Hide()
```

---

### Toggle

An iOS-style on/off switch with smooth animation.

```lua
local tog = Tab:Toggle({
    Name        = "Auto Farm",
    Description = "Farms enemies automatically",  -- optional subtitle
    Default     = false,
    Flag        = "autoFarm",   -- optional, links to save/load system
    Callback    = function(on)
        print("Auto Farm is now:", on)
    end,
})

-- Methods
tog:Set(true)            -- turn on
tog:Set(false)           -- turn off
tog:Get()                -- returns true or false
tog:SetName("God Mode")  -- rename the label
tog:Show()
tog:Hide()
tog:Enable()
tog:Disable()
```

---

### Button

A tappable card with a subtle ripple animation. Returns a loading control.

```lua
local btn = Tab:Button({
    Name        = "Teleport Hub",
    Description = "Go to the hub island",  -- optional
    Icon        = "rbxassetid://...",       -- optional image
    Callback    = function()
        print("Button pressed!")
    end,
})

-- Methods
btn:SetText("Go to Spawn")  -- rename the button label
btn:SetLoading(true)         -- shows a pulsing dot, blocks clicks
btn:SetLoading(false)        -- restores label, re-enables clicks
btn:Show()
btn:Hide()
btn:Enable()
btn:Disable()
```

**Loading state example:**
```lua
Tab:Button({
    Name = "Connect to Server",
    Callback = function()
        btn:SetLoading(true)
        task.delay(3, function()
            btn:SetLoading(false)
        end)
    end,
})
```

---

### Slider

A draggable range control. Works with mouse and touch.

```lua
local sl = Tab:Slider({
    Name        = "Walk Speed",
    Description = "How fast you move",  -- optional
    Min         = 16,
    Max         = 250,
    Default     = 16,
    Increment   = 1,       -- step size
    Suffix      = " st",   -- shown after the value
    Flag        = "walkSpeed",
    Callback    = function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end,
})

-- Methods
sl:Set(100)  -- set value programmatically
sl:Get()     -- returns current value
sl:Show()
sl:Hide()
sl:Enable()
sl:Disable()
```

---

### Dropdown

A single-select animated list.

```lua
local dd = Tab:Dropdown({
    Name     = "Game Mode",
    Options  = { "Easy", "Normal", "Hard" },
    Default  = "Normal",
    Flag     = "gameMode",
    Callback = function(selected)
        print("Selected:", selected)
    end,
})

-- Methods
dd:Set("Hard")                              -- change selected option
dd:Get()                                    -- returns selected string
dd:Refresh({ "Easy", "Normal", "Hard", "Insane" })  -- replace the options list live
dd:Show()
dd:Hide()
dd:Enable()
dd:Disable()
```

---

### MultiDropdown

A multi-select dropdown with checkmarks. Shows a count badge like "2 selected".

```lua
local md = Tab:MultiDropdown({
    Name      = "Active Perks",
    Options   = { "Speed", "Shield", "Jump", "Regen" },
    Default   = { "Speed" },   -- pre-selected (optional)
    MaxSelect = 2,             -- max number of picks; 0 = no limit (default)
    Callback  = function(selected)
        -- selected is a table of strings
        print(table.concat(selected, ", "))
    end,
})

-- Methods
md:Set({ "Shield", "Regen" })  -- replace selection
md:Get()                        -- returns table of selected strings
md:Clear()                      -- deselect everything
md:Show()
md:Hide()
md:Enable()
md:Disable()
```

---

### Stepper

A compact `−` / value / `+` control. Good for integer settings like kill counts or delays.

```lua
local st = Tab:Stepper({
    Name        = "Kill Threshold",
    Description = "Trigger action after N kills",  -- optional
    Min         = 0,
    Max         = 9999,
    Default     = 10,
    Increment   = 1,
    Suffix      = " kills",
    Flag        = "killThreshold",
    Callback    = function(v)
        print("Threshold:", v)
    end,
})

-- Methods
st:Set(50)  -- set value
st:Get()    -- returns current integer value
st:Show()
st:Hide()
st:Enable()
st:Disable()
```

---

### Textbox

A text input field with a clear button, focus glow, and optional character limit.

```lua
local tb = Tab:Textbox({
    Name         = "Player Name",
    Placeholder  = "Enter a username...",
    Default      = "",
    ClearOnFocus = false,   -- clear text when clicked (default: false)
    MaxChars     = 24,      -- 0 = no limit (default)
    Callback     = function(text)
        -- fires when the user presses Enter
        print("Submitted:", text)
    end,
})

-- Methods
tb:Set("hello")  -- set text programmatically
tb:Get()         -- returns current text string
tb:Show()
tb:Hide()
tb:Enable()
tb:Disable()
```

---

### Keybind

A pill-shaped key badge. Click it to start listening for a new key.

```lua
local kb = Tab:Keybind({
    Name     = "Toggle Fly",
    Default  = Enum.KeyCode.F,
    Callback = function()
        -- fires when the bound key is pressed (not while listening)
        print("Fly toggled!")
    end,
})

-- Methods
kb:GetKey()                    -- returns current Enum.KeyCode
kb:Set(Enum.KeyCode.G)         -- set key programmatically (skips the UI flow)
kb:Show()
kb:Hide()
kb:Enable()
kb:Disable()
```

---

### Progress Bar

A display-only animated fill bar. Call `Set()` to update it from your code.

```lua
local pb = Tab:Progress({
    Name    = "Health",
    Default = 100,
    Suffix  = "%",
    Color   = Color3.fromRGB(100, 220, 180),  -- optional custom fill color
})

-- Methods
pb:Set(75)   -- update fill level (0–100)
pb:Get()     -- returns current value
pb:Show()
pb:Hide()
pb:Enable()
pb:Disable()

-- Example: live health bar
game:GetService("RunService").Heartbeat:Connect(function()
    local h = game.Players.LocalPlayer.Character
        and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if h then pb:Set(h.Health / h.MaxHealth * 100) end
end)
```

---

### Picker

A horizontal row of pill buttons — single-select only.

```lua
local pk = Tab:Picker({
    Name     = "Difficulty",
    Options  = { "Easy", "Normal", "Hard" },
    Default  = "Normal",
    Callback = function(v) print("Picked:", v) end,
})

-- Methods
pk:Set("Hard")  -- select an option
pk:Get()        -- returns selected string
pk:Show()
pk:Hide()
pk:Enable()
pk:Disable()
```

---

### Label

An uppercase section divider with an underline. Good for visual grouping without a full Section header.

```lua
local lbl = Tab:Label({ Text = "Advanced Options" })

-- Methods
lbl:SetText("Expert Options")  -- change the label text
lbl:Show()
lbl:Hide()
```

---

### Separator

A thin horizontal rule, optionally with a center text label.

```lua
Tab:Separator()                    -- plain line
Tab:Separator({ Text = "— or —" }) -- line with text
```

---

### Paragraph

An info card with a bold title and wrapped body text.

```lua
local para = Tab:Paragraph({
    Title   = "About This Script",
    Content = "NexusUI v6.1 is a modern Roblox UI library with iOS-style visuals.",
})

-- Methods
para:SetContent("New body text here.")
para:SetTitle("Updated Title")
para:Show()
para:Hide()
para:Enable()
para:Disable()
```

---

### ColorDisplay

A color swatch. Fires its callback when clicked — use it to open a color picker of your choice.

```lua
local cd = Tab:ColorDisplay({
    Name     = "Trail Color",
    Default  = Color3.fromRGB(100, 180, 255),
    Callback = function(currentColor)
        -- open your own color picker here, then update with cd:Set()
        print("Clicked swatch, color:", currentColor)
    end,
})

-- Methods
cd:Set(Color3.fromRGB(255, 80, 80))  -- update the displayed color
cd:Get()                              -- returns current Color3
cd:Show()
cd:Hide()
cd:Enable()
cd:Disable()
```

---

## Config / Flag System

Attach a `Flag` string to any element to link it to the automatic save/load system. Set `ConfigName` on the window to enable it.

```lua
local Win = NexusUI:CreateWindow({
    Title      = "My Script",
    ConfigName = "MyScript",   -- required for save/load
})

local Tab = Win:Tab("Settings")

Tab:Toggle({ Name = "God Mode",   Flag = "godMode",   Default = false, Callback = ... })
Tab:Slider({ Name = "Walk Speed", Flag = "walkSpeed", Default = 16,    Callback = ... })
Tab:Dropdown({ Name = "Mode",     Flag = "mode",      Default = "Easy", Callback = ... })

-- Then use window methods to persist state
Win:SaveConfig()    -- writes MyScript_nexus.json
Win:LoadConfig()    -- reads and applies saved values
Win:ResetConfig()   -- restores every flagged element to its Default
```

> Config files are stored using `writefile` / `readfile`. These are only available inside supported Roblox script executors, not inside Studio.

---

## Show / Hide / Enable / Disable

Any element returned by a `Tab:X()` call has these four methods.

```lua
local tog = Tab:Toggle({ Name = "Feature", Default = false, Callback = function() end })
local btn = Tab:Button({ Name = "Action",  Callback = function() end })

-- Hide the toggle until a condition is met
tog:Hide()
task.delay(5, function() tog:Show() end)

-- Disable the button while loading
btn:Disable()
task.delay(2, function() btn:Enable() end)

-- Check if disabled
if btn:IsDisabled() then
    print("button is currently locked")
end
```

---

## Toggle Button (Floating Button)

When the user closes the window (× button or toggle key), a small floating button appears at the top-center of the screen. Pressing it reopens the window with a spring animation.

```lua
-- Set a custom icon for the floating button
local Win = NexusUI:CreateWindow({
    ToggleIcon = "rbxassetid://7733960981",  -- any ImageLabel asset
    ToggleKey  = Enum.KeyCode.RightShift,
})

-- Programmatically show/hide
Win:SetVisible(false)   -- hide
Win:SetVisible(true)    -- show
Win:Show(false)         -- short alias
Win:Show(true)
```

---

## Changelog

### v6.1.0
- Short API aliases: `Tab:Toggle()`, `Tab:Button()`, `Tab:Slider()`, etc.
- `Win:Tab()` short alias for `Win:CreateTab()`
- `Win:Show()` short alias for `Win:SetVisible()`
- `Win:Close()` short alias for `Win:Destroy()`
- `BaseEl` system: every element now has `Show()`, `Hide()`, `Enable()`, `Disable()`, `IsDisabled()`
- `Toggle:SetName()` — rename label after creation
- `Button:SetText()` — rename button label after creation
- `Section:SetText()` — change section header text
- `Label:SetText()` — change label text
- `Keybind:Set(keyCode)` — bind a key programmatically
- `Paragraph:SetTitle()` — update the bold title of an info card
- Full backward compatibility — all old `CreateX()` calls unchanged

### v6.0.0
- New themes: Sunset, Aqua (9 total)
- `CreateMultiDropdown` with checkmarks, count badge, MaxSelect
- `CreateStepper` −/+ integer control
- `Button:SetLoading(bool)` async loading state
- `Window:Alert()` modal overlay
- `Window:ResetConfig()` / `Window:GetVersion()`
- Notifications: 88 px, icon pulse, × button
- Version badge in title bar, card height 54 px

### v5.0.0
- Ground-up element rewrite, 7 themes
- Multi-layer shadow, accent stripe, iOS toggle

### v3.x – v4.x
- Floating top-center toggle button
- iOS toggle squish + Quart easing
- Ripple, slider gradient fill

### v2.x
- Initial public release

