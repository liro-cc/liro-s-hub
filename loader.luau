--!strict

local HttpGet = game.HttpGet
local GameId: number = game.GameId

local Games = {
	[10131390815] = "https://raw.githubusercontent.com/liro-cc/liro-s-hub/main/Games/10131390815.luau",
}

local URL: string? = Games[GameId]
if not URL then
	return
end

local ok, fn = pcall(loadstring, HttpGet(game, URL))
if ok and type(fn) == "function" then
	pcall(fn)
end
