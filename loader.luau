--!strict

local HttpGet = game.HttpGet
local GameId: number = game.GameId

local Games: {[number]: string} = loadstring(
  HttpGet(game, "https://raw.githubusercontent.com/liro-cc/liro-s-hub/refs/heads/main/game-list.luau")
)() :: any

local URL: string? = Games[GameId]
if not URL then return end

loadstring(HttpGet(game, URL))()