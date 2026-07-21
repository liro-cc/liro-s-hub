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

local Coins = {"Sapphire Coin", "Gold Coin", "Silver Coin", "Bronze Coin", "Diamond Coin", "Ruby Coin", "Emerald Coin", "Amethyst Coin", "Platinum Coin"}
local CoinLanded = game:GetService("ReplicatedStorage").Assets.Events.CoinLanded
local selectedCoin = Coins[1]

local CoinDropdown = Tab:CreateDropdown({
   Name = "Coin Type",
   Options = Coins,
   CurrentOption = selectedCoin,
   Callback = function(v)
      selectedCoin = v
   end
})

local autoThrow = false
local delay = 1

local DelaySlider = Tab:CreateSlider({
   Name = "Delay (s)",
   Range = {0.1, 5},
   Increment = 0.1,
   Default = 1,
   Callback = function(v)
      delay = v
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
               CoinLanded:FireServer(3, Vector3.new(0, 0, 0), selectedCoin)
               task.wait(delay)
            end
         end)
      end
   end
})

Rayfield:LoadConfiguration()
