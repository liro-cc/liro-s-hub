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
   "Prism Coin", "Galaxy Coin", "Fire Coin", "Eclipse Coin",
   "Crimson Coin", "Chronos Coin", "Aether Coin", "Eclipse Coin",
   "Mirage Coin", "Paradox Coin", "Obsidian Coin", "Tempest Coin",
   "Miracle Coin", "Soul Coin", "Nexus Coin", "Infinity Coin", "Apex Coin"
}
local CoinLanded = game:GetService("ReplicatedStorage").Assets.Events.CoinLanded
local selectedCoin = Coins[1]
local studs = 3
local throwDelay = 1
local autoThrow = false

local CoinDropdown = Tab:CreateDropdown({
   Name = "Coin Type",
   Options = Coins,
   CurrentOption = selectedCoin,
   Callback = function(v)
      selectedCoin = v
   end
})

local StudsSlider = Tab:CreateSlider({
   Name = "Distance (studs)",
   Range = {1, 100},
   Increment = 1,
   Default = 3,
   Callback = function(v)
      studs = v
   end
})

local DelaySlider = Tab:CreateSlider({
   Name = "Auto Throw Delay (s)",
   Range = {0.1, 5},
   Increment = 0.1,
   Default = 1,
   Callback = function(v)
      throwDelay = v
   end
})

local AutoToggle = Tab:CreateToggle({
   Name = "Auto Throw",
   Default = false,
   Callback = function(v)
      autoThrow = v
      if v then
         task.spawn(function()
            while autoThrow do
               CoinLanded:FireServer(studs, Vector3.new(0, 0, 0), selectedCoin)
               task.wait(throwDelay)
            end
         end)
      end
   end
})

Rayfield:LoadConfiguration()
