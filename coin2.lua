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
    player.CharacterAdded:Connect(function(c)
        local tDistance
        local pPos 
        task.defer(function()
            pPos = c.PrimaryPart.Position
        end)
        while task.wait(.5) and c.Humanoid.Health == 100 do
            local nPos = (c.PrimaryPart.Position - pPos).Magnitude
            if nPos >= .1 then
                tDistance += nPos
            end
            if tDistance >= 1000 then
                coinVal += 100
                coinStore:SetAsync(player.UserId, coinVal)
            end
            pPos = c.PrimaryPart.Position
        end
    end)
end)