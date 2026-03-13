# NexusUI  –  Roblox UI Library  v2.0
### iOS-Inspired · Mobile + PC · Easy API · Production-Quality

---

## Quick Start

```lua
local NexusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/zEthanReal/NexusUI/refs/heads/main/NexusUI.lua"))()

local Window = NexusUI:CreateWindow({
    Title     = "My Script",
    SubTitle  = "v1.0",
    Size      = Vector2.new(510, 550),
    Theme     = "Dark",
    ToggleKey = Enum.KeyCode.RightShift,
})

local Tab = Window:CreateTab("Main", "rbxassetid://7733960981")

Tab:CreateToggle({ Name = "Auto Farm", Default = false, Callback = function(v) print(v) end })
Tab:CreateButton({ Name = "Do Thing",  Callback = function() print("clicked") end })

Window:Notify({ Title = "Loaded", Text = "Hello!", Type = "Success", Duration = 3 })
```

---

## CreateWindow  Options

| Property    | Type            | Default            | Description                         |
|-------------|-----------------|-------------------|-------------------------------------|
| `Title`     | string          | `"NexusUI"`       | Main window title                   |
| `SubTitle`  | string          | `nil`             | Smaller subtitle under title        |
| `Size`      | Vector2         | `500 × 550`       | Window dimensions in pixels         |
| `Theme`     | string          | `"Dark"`          | Theme name (see Themes below)       |
| `ToggleKey` | Enum.KeyCode    | `RightShift`      | Key to show/hide the window         |
| `ConfigName`| string          | `nil`             | Enables config save/load if set     |
| `Position`  | UDim2           | `centered`        | Override starting position          |

---

## Themes

| Name     | Style                              |
|----------|------------------------------------|
| `Dark`   | Dark charcoal + blue accent        |
| `Ocean`  | Deep navy + cyan accent            |
| `Purple` | Dark purple + violet accent        |
| `Rose`   | Dark maroon + pink accent          |
| `Light`  | Light grey + iOS blue accent       |

---

## Window Methods

```lua
-- Show a notification
Window:Notify({ Title, Text, Type, Duration })
--   Type: "Info" | "Success" | "Warning" | "Error"

-- Toggle UI key (set on creation, also toggleable at runtime)
-- Press ToggleKey to show/hide

-- Save / Load config (requires ConfigName set on creation)
Window:SaveConfig()
Window:LoadConfig()

-- Destroy the window
Window:Destroy()
```

---

## Tab Methods

```lua
local Tab = Window:CreateTab("Name", "rbxassetid://ICON_ID")
```

---

## Element Reference

### Toggle  (iOS Switch)
```lua
local toggle = Tab:CreateToggle({
    Name        = "Auto Farm",
    Description = "Optional subtitle",  -- optional
    Default     = false,
    Flag        = "autoFarm",           -- optional, for config system
    Callback    = function(value: boolean) end,
})
toggle:Set(true)     -- programmatic update
toggle:Get()         -- returns current boolean
```

### Button
```lua
Tab:CreateButton({
    Name     = "Click Me",
    Icon     = "rbxassetid://...",   -- optional image
    Callback = function() end,
})
```

### Slider
```lua
local slider = Tab:CreateSlider({
    Name      = "Speed",
    Min       = 0,
    Max       = 200,
    Default   = 16,
    Increment = 1,
    Suffix    = " stud/s",           -- optional
    Flag      = "speed",             -- optional
    Callback  = function(value: number) end,
})
slider:Set(50)
slider:Get()   -- returns number
```

### Dropdown
```lua
local dd = Tab:CreateDropdown({
    Name     = "Mode",
    Options  = {"A", "B", "C"},
    Default  = "A",
    Flag     = "mode",
    Callback = function(value: string) end,
})
dd:Set("B")
dd:Get()              -- returns string
dd:Refresh(newTable)  -- replace option list
```

### Textbox
```lua
local tb = Tab:CreateTextbox({
    Name         = "Player Name",
    Placeholder  = "Type here...",
    Default      = "",
    ClearOnFocus = false,
    Callback     = function(text: string) end,  -- fires on Enter
})
tb:Set("hello")
tb:Get()  -- returns string
```

### Keybind
```lua
local kb = Tab:CreateKeybind({
    Name     = "Sprint",
    Default  = Enum.KeyCode.LeftShift,
    Callback = function() end,   -- fires when key is pressed
})
kb:GetKey()  -- returns current Enum.KeyCode
```
> Click the key badge in the UI and press any key to rebind.

### Label  (Section header)
```lua
local lbl = Tab:CreateLabel({ Text = "SECTION NAME" })
lbl:SetText("NEW TEXT")
```

### Separator
```lua
Tab:CreateSeparator()               -- horizontal line
Tab:CreateSeparator({ Text = "OR" }) -- line with centered text
```

### Paragraph  (Info card)
```lua
Tab:CreateParagraph({
    Title   = "About",
    Content = "Long descriptive text goes here...",
})
```

### Color Display
```lua
local col = Tab:CreateColorDisplay({
    Name     = "Accent Color",
    Default  = Color3.fromRGB(100, 150, 255),
    Callback = function(color: Color3) end,  -- fires on click
})
col:Set(Color3.fromRGB(255, 80, 80))
col:Get()  -- returns Color3
```

---

## Config System

When `ConfigName` is set on the window, every element with a `Flag` property
is automatically registered with the config manager.

```lua
local Window = NexusUI:CreateWindow({ ..., ConfigName = "MyScript" })

-- Inside a tab:
Tab:CreateToggle({ Name = "Auto Farm", Flag = "autoFarm", ... })
Tab:CreateSlider({ Name = "Speed",     Flag = "speed",    ... })

-- Save / Load
Window:SaveConfig()  -- writes  MyScript_config.json
Window:LoadConfig()  -- reads   MyScript_config.json  and calls all callbacks
```

> Requires `writefile` / `readfile` executor APIs. Silently skips if unavailable.

---

## Notifications API

```lua
Window:Notify({
    Title    = "Title",
    Text     = "Description text.",
    Type     = "Success",   -- Info | Success | Warning | Error
    Duration = 4,           -- seconds before auto-dismiss
})
```

- Slides in from the right with a **progress bar**  
- **Click** any notification to dismiss it early  
- Multiple notifications **stack vertically**  

---

## Mobile Compatibility

| Feature              | Implementation                                 |
|----------------------|------------------------------------------------|
| Dragging             | `Touch` input events on title bar              |
| Slider dragging      | `Touch` move tracked globally                  |
| Button taps          | `InputBegan` Touch event with ripple           |
| Toggle taps          | Full-card hitbox, large enough for fingers     |
| Dropdown             | Touch-friendly option rows (34px height min)   |
| Scroll areas         | Native `ScrollingFrame` with touch scroll      |

---

## File Structure

```
NexusUI.lua          ← The library (upload to GitHub raw)
NexusUI_Demo.lua     ← Full demo showing all elements
README.md            ← This file
```

---

## Performance Notes

- **No `RunService` loops** – all animation is TweenService-driven  
- Slider input uses a single global `UserInputService.InputChanged` connection  
- Dragging uses a single global connection, not per-frame polling  
- All `task.delay` calls clean themselves up automatically  
- Dropdown lists are lazily shown/hidden, not created on every open  

---

## License

Free to use in any Roblox script. Credit appreciated but not required.
