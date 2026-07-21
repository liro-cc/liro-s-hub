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
local time = 1
local toggle = false

local CoinDropdown = Tab:CreateDropdown({
   Name = "Coin Type",
   Options = Coins,
   CurrentOption = selectedCoin,
   Callback = function(v)
      selectedCoin = v
   end
})

local TimeSlider = Tab:CreateSlider({
   Name = "Time",
   Range = {0.1, 5},
   Increment = 0.1,
   Default = 1,
   Callback = function(v)
      time = v
   end
})

Tab:CreateToggle({
   Name = "Toggle",
   Default = false,
   Callback = function(v)
      toggle = v
      if v then
         task.spawn(function()
            while toggle do
               Event:FireServer(3, Vector3.new(0, 0, 0), selectedCoin, nil, nil)
               wait(time)
            end
         end)
      end
   end
})

Rayfield:LoadConfiguration()
