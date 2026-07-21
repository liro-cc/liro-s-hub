--!strict

local HttpGet = game.HttpGet
local GameId: number = game.GameId

local BASE = "https://raw.githubusercontent.com/liro-cc/liro-s-hub/c91c3fdb9030cb3ad1048f146542d17f4a6521e7"

local function fetch(url: string): string?
	local ok, result = pcall(HttpGet, game, url)
	if ok then return result end
	return nil
end

local raw = fetch(BASE .. "/game-list.luau")
if not raw then
	warn("[Loader] Failed to fetch game list")
	return
end

local ok, Games = pcall(loadstring, raw)
if not ok or type(Games) ~= "function" then
	warn("[Loader] Invalid game list")
	return
end

local list: {[number]: string} = Games() :: any
local URL: string? = list[GameId]
if not URL then
	warn(("[Loader] No script for game %d"):format(GameId))
	return
end

local code = fetch(URL)
if not code then
	warn(("[Loader] Failed to fetch script for game %d"):format(GameId))
	return
end

local ok, fn = pcall(loadstring, code)
if not ok or type(fn) ~= "function" then
	warn("[Loader] Failed to load game script")
	return
end
pcall(fn)
