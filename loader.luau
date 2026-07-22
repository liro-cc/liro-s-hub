if not game:IsLoaded() then
    game.Loaded:Wait()
end

local BASE = 'https://raw.githubusercontent.com/liro-cc/liro-s-hub/main/Games/'

local games = {
	[10131390815] = 'throwacoin.luau',
    [5058857198] = 'planecrashphysicsx.luau',
    [10136067263] = 'getfattobreaktape.luau'
}

local file = games[game.GameId]
if file then
    task.wait(math.random())
    loadstring(game:HttpGet(BASE .. file))()
end