debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Liro Hub",
   Icon = 0,
   LoadingTitle = "Loading Liro Hub",
   LoadingSubtitle = "by Liro",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Liro Hub",
      FileName = "Throw a Coin"
   },
   Discord = {
      Enabled = true,
      Invite = "Zk5X53XZv5",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Liro Key System",
      Subtitle = "Enter your key to get access",
      Note = "Join discord for key",
      FileName = "Key",
      SaveKey = true,
      Key = {"lirokey123!"}
   }
})

local Tab = Window:CreateTab("Coin Thrower", 4483362458)
local Section = Tab:CreateSection("Settings")

local Coins = {
   "Fortune Coin", "Ruby Coin", "Copper Coin", "Basic Coin",
   "Volt Coin", "Void Coin", "Starlight Coin", "Sapphire Coin",
   "Prism Coin", "Galaxy Coin", "Fire Coin",
   "Crimson Coin", "Chronos Coin", "Aether Coin",
   "Mirage Coin", "Paradox Coin", "Obsidian Coin", "Tempest Coin",
   "Miracle Coin", "Soul Coin", "Nexus Coin", "Infinity Coin", "Apex Coin"
}
local Event = game:GetService("ReplicatedStorage").Assets.Events.CoinLanded
local selectedCoin = Coins[1]
local seconds = 1
local toggle = false

local CoinDropdown = Tab:CreateDropdown({
   Name = "Coin Type",
   Options = Coins,
   CurrentOption = selectedCoin,
   Callback = function(v)
      selectedCoin = v
   end
})

local SecondsSlider = Tab:CreateSlider({
   Name = "Seconds",
   Range = {0.1, 5},
   Increment = 0.1,
   Suffix = "Seconds",
   CurrentValue = 1,
   Flag = "Slider1",
   Callback = function(Value)
      seconds = Value
   end
})

local Toggle = Tab:CreateToggle({
   Name = "Toggle",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      toggle = Value
   end
})

task.spawn(function()
   while true do
      if toggle then
         Event:FireServer(3, Vector3.new(0, 0, 0), selectedCoin, nil, nil)
      end
      wait(seconds)
   end
end)

Rayfield:LoadConfiguration()
