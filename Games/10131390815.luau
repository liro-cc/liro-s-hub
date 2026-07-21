local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Liro Hub",
	Icon = 0,
	LoadingTitle = "Loading Liro Hub",
	LoadingSubtitle = "by Liro",
	ShowText = "Liro",
	Theme = "Default",
	ToggleUIKeybind = "K",
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

local Tab = Window:CreateTab("Coin Thrower", 0)
local Section = Tab:CreateSection("Settings")

local Coins = {
	"Sapphire Coin",
	"Gold Coin",
	"Silver Coin",
	"Bronze Coin",
	"Diamond Coin",
	"Ruby Coin",
	"Emerald Coin",
	"Amethyst Coin",
	"Platinum Coin",
}

local CoinLanded = game:GetService("ReplicatedStorage").Assets.Events.CoinLanded

local selectedCoin = Coins[1]
local amount = 1
local autoThrow = false
local autoDelay = 0.5
local teleportToMouse = false

local CoinDropdown = Tab:CreateDropdown({
	Name = "Coin Type",
	Options = Coins,
	CurrentOption = selectedCoin,
	Callback = function(v)
		selectedCoin = v
	end
})

local AmountSlider = Tab:CreateSlider({
	Name = "Amount",
	Range = {1, 100},
	Increment = 1,
	Default = 1,
	Callback = function(v)
		amount = v
	end
})

local TeleportToggle = Tab:CreateToggle({
	Name = "Throw at Mouse Position",
	Default = false,
	Callback = function(v)
		teleportToMouse = v
	end
})

local function throwCoin()
	local pos = teleportToMouse and game:GetService("UserInputService"):GetMouseLocation() or Vector3.new(0, 0, 0)
	if teleportToMouse then
		local cam = workspace.CurrentCamera
		local ray = cam:ViewportPointToRay(pos.X, pos.Y)
		pos = ray.Origin + ray.Direction * 10
	end
	for _ = 1, amount do
		CoinLanded:FireServer(3, pos, selectedCoin)
		task.wait(0.05)
	end
end

Tab:CreateButton({
	Name = "Throw Coin",
	Callback = throwCoin
})

local function autoLoop()
	while autoThrow do
		throwCoin()
		task.wait(autoDelay)
	end
end

Tab:CreateToggle({
	Name = "Auto Throw",
	Default = false,
	Callback = function(v)
		autoThrow = v
		if v then
			task.spawn(autoLoop)
		end
	end
})

local AutoDelaySlider = Tab:CreateSlider({
	Name = "Auto Delay (s)",
	Range = {0.1, 5},
	Increment = 0.1,
	Default = 0.5,
	Callback = function(v)
		autoDelay = v
	end
})
