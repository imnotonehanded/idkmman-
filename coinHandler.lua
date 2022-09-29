local dss = game:GetService('DataStoreService')
local coinStore = dss:GetDataStore('coins')
local  players = game:GetService('Players'):GetPlayers()

game.Players.PlayerAdded:Connect(function(player)
    local coinVal = Instance.new('IntValue', player)
    coinVal.Name = 'coins'
    if not coinStore:GetAsync(player.UserId) then
        coinVal.Value = 0
    else coinVal.Value = coinStore:GetAsync(player.UserId)
    end
    spawn(function()
        while wait(60) do
            coinVal.Value += 1
            coinStore:SetAsync(player.UserId, coinVal.Value)
        end
    end)
end)