--[[
╔══════════════════════════════════════════════════════════════╗
║              NexusUI  –  Demo Script                         ║
║  Shows every available component and feature.               ║
║  Run this in a Roblox executor to see the library in action. ║
╚══════════════════════════════════════════════════════════════╝

  Load the library (replace URL with your raw GitHub URL):
    local NexusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/zEthanReal/NexusUI/refs/heads/main/NexusUI.lua"))()

  For local testing, you can also do:
    local NexusUI = require(path.to.NexusUI)
]]

-- ── In production replace this with the real loadstring call ──
local NexusUI = require(game.ReplicatedStorage.NexusUI)    -- local test

-- ═══════════════════════════════════════════════════════════════
--  1. CREATE WINDOW
-- ═══════════════════════════════════════════════════════════════
local Window = NexusUI:CreateWindow({
    Title      = "NexusUI",
    SubTitle   = "Demo v2.0",
    Size       = Vector2.new(510, 550),
    Theme      = "Dark",          -- Dark | Ocean | Purple | Rose | Light
    ToggleKey  = Enum.KeyCode.RightShift,
    ConfigName = "NexusDemo",     -- enables config save/load
})

-- ═══════════════════════════════════════════════════════════════
--  2. CREATE TABS  (name, optional icon asset id)
-- ═══════════════════════════════════════════════════════════════
local MainTab     = Window:CreateTab("Main",     "rbxassetid://7733960981")
local PlayerTab   = Window:CreateTab("Player",   "rbxassetid://7734053495")
local VisualTab   = Window:CreateTab("Visuals",  "rbxassetid://7734045138")
local SettingsTab = Window:CreateTab("Settings", "rbxassetid://7733958508")

-- ═══════════════════════════════════════════════════════════════
--  3. MAIN TAB  –  Toggles & Buttons
-- ═══════════════════════════════════════════════════════════════
MainTab:CreateLabel({ Text = "AUTOMATION" })

local autoFarmToggle = MainTab:CreateToggle({
    Name        = "Auto Farm",
    Description = "Automatically collects coins",
    Default     = false,
    Flag        = "autoFarm",          -- used for config save
    Callback    = function(value)
        print("[NexusUI] Auto Farm:", value)
        -- your farm logic here
    end
})

MainTab:CreateToggle({
    Name     = "Auto Collect",
    Default  = true,
    Flag     = "autoCollect",
    Callback = function(value)
        print("[NexusUI] Auto Collect:", value)
    end
})

MainTab:CreateSeparator()
MainTab:CreateLabel({ Text = "ACTIONS" })

MainTab:CreateButton({
    Name     = "Collect All Coins",
    Callback = function()
        print("[NexusUI] Collecting coins!")
        Window:Notify({
            Title    = "Collecting",
            Text     = "Grabbing all nearby coins...",
            Type     = "Info",
            Duration = 3,
        })
    end
})

MainTab:CreateButton({
    Name     = "Teleport to Spawn",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0)
            Window:Notify({ Title = "Teleported", Text = "You are at spawn.", Type = "Success", Duration = 2 })
        end
    end
})

MainTab:CreateButton({
    Name     = "Show Error Example",
    Callback = function()
        Window:Notify({ Title = "Error", Text = "Something went wrong!", Type = "Error", Duration = 4 })
    end
})

-- ═══════════════════════════════════════════════════════════════
--  4. PLAYER TAB  –  Sliders & Textbox & Keybind
-- ═══════════════════════════════════════════════════════════════
PlayerTab:CreateLabel({ Text = "CHARACTER" })

local speedSlider = PlayerTab:CreateSlider({
    Name      = "Walk Speed",
    Min       = 16,
    Max       = 250,
    Default   = 16,
    Increment = 2,
    Suffix    = " studs/s",
    Flag      = "walkSpeed",
    Callback  = function(value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = value
        end
    end
})

PlayerTab:CreateSlider({
    Name      = "Jump Power",
    Min       = 7,
    Max       = 200,
    Default   = 50,
    Increment = 1,
    Suffix    = " force",
    Flag      = "jumpPower",
    Callback  = function(value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = value
        end
    end
})

PlayerTab:CreateSeparator({ Text = "INPUT" })

PlayerTab:CreateTextbox({
    Name        = "Player Tag",
    Placeholder = "Enter a display tag...",
    Default     = "",
    Callback    = function(text)
        print("[NexusUI] Tag set to:", text)
        Window:Notify({ Title = "Tag Updated", Text = text, Type = "Success", Duration = 2 })
    end
})

PlayerTab:CreateKeybind({
    Name     = "Sprint Key",
    Default  = Enum.KeyCode.LeftShift,
    Callback = function()
        print("[NexusUI] Sprint key pressed!")
    end
})

PlayerTab:CreateSeparator()

PlayerTab:CreateDropdown({
    Name     = "Game Mode",
    Options  = { "Normal", "Hardcore", "Creative", "Spectator" },
    Default  = "Normal",
    Flag     = "gameMode",
    Callback = function(value)
        print("[NexusUI] Game mode:", value)
        Window:Notify({ Title = "Mode Changed", Text = "Now playing: " .. value, Type = "Info", Duration = 2 })
    end
})

-- ═══════════════════════════════════════════════════════════════
--  5. VISUAL TAB  –  More Examples
-- ═══════════════════════════════════════════════════════════════
VisualTab:CreateLabel({ Text = "RENDERING" })

VisualTab:CreateToggle({
    Name        = "Full Bright",
    Description = "Maximum ambient lighting",
    Default     = false,
    Callback    = function(value)
        game.Lighting.Ambient = value and Color3.fromRGB(255,255,255) or Color3.fromRGB(70,70,70)
        game.Lighting.OutdoorAmbient = value and Color3.fromRGB(255,255,255) or Color3.fromRGB(128,128,128)
    end
})

VisualTab:CreateToggle({
    Name     = "No Fog",
    Default  = false,
    Callback = function(value)
        game.Lighting.FogEnd = value and 1e6 or 1000
    end
})

VisualTab:CreateSeparator()
VisualTab:CreateLabel({ Text = "INFO" })

VisualTab:CreateParagraph({
    Title   = "About NexusUI",
    Content = "NexusUI is a professional iOS-inspired UI library for Roblox. "
           .. "Built with TweenService animations, mobile-first design, "
           .. "and a clean developer API. Supports themes, config save/load, keybinds, and more.",
})

-- ═══════════════════════════════════════════════════════════════
--  6. SETTINGS TAB  –  Theme & Config
-- ═══════════════════════════════════════════════════════════════
SettingsTab:CreateLabel({ Text = "APPEARANCE" })

SettingsTab:CreateDropdown({
    Name     = "UI Theme",
    Options  = { "Dark", "Ocean", "Purple", "Rose", "Light" },
    Default  = "Dark",
    Callback = function(value)
        Window:SetTheme(value)
    end
})

SettingsTab:CreateSeparator()
SettingsTab:CreateLabel({ Text = "CONFIG" })

SettingsTab:CreateButton({
    Name     = "Save Config",
    Callback = function()
        Window:SaveConfig()
    end
})

SettingsTab:CreateButton({
    Name     = "Load Config",
    Callback = function()
        Window:LoadConfig()
    end
})

SettingsTab:CreateSeparator()
SettingsTab:CreateLabel({ Text = "NOTIFICATIONS TEST" })

SettingsTab:CreateButton({
    Name     = "Info Notification",
    Callback = function()
        Window:Notify({ Title = "Information", Text = "This is an info toast.", Type = "Info", Duration = 3 })
    end
})

SettingsTab:CreateButton({
    Name     = "Warning Notification",
    Callback = function()
        Window:Notify({ Title = "Warning!", Text = "Something needs attention.", Type = "Warning", Duration = 4 })
    end
})

-- ═══════════════════════════════════════════════════════════════
--  7. STARTUP NOTIFICATION
-- ═══════════════════════════════════════════════════════════════
task.delay(0.5, function()
    Window:Notify({
        Title    = "NexusUI Loaded",
        Text     = "Press RightShift to toggle the UI.",
        Type     = "Success",
        Duration = 5,
    })
end)
