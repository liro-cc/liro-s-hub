local function n(t,d)game.StarterGui:SetCore("SendNotification",{Title="Liro's Hub",Text=t,Duration=d or 5})end
if not game:IsLoaded()then game.Loaded:Wait()end
local f=({
	[10131390815]="throwacoin.luau",
	[5058857198]="planecrashphysicsx.luau",
	[10136067263]="getfattobreaktape.luau"
})[game.GameId]
if f then n("Loading...",3)task.wait(math.random(1,3))local s,e=pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/liro-cc/liro-s-hub/main/Games/"..f)))n(s and"Loaded!"or"Error: "..e,s and 3 or 5)else n("Game not supported.")end