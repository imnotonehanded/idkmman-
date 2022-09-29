local dss = game:GetService('DataStoreService')
local is = dss:GetDataStore('playerInventory')
local ss = game:GetService('ServerStorage')
game:GetService('Players').PlayerAdded(function(plr)
    plr.CharacterAdded:Connect(function(c)
        for item, i in pairs(is:GetAsync(plr.UserId)) do
            local ci = ss.shopItems[item]:Clone()
            ci.Parent = plr.Backpack
        end
    end)
end)