local rs = game:GetService('ReplicatedStorage')
local sf = rs:WaitForChild('shopRemote')
local dss = game:GetService('DataStoreService')
local is = dss:GetDataStore('playerInventory')

sf.OnServerEvent:Connect(function(plr,item)
    local itemPrice = item:GetAttribute('price')
    local coinAmount = plr:FindFirstChild('coins').Value
    if coinAmount  >= itemPrice then
        if item:GetAttribute('canBuyMultiple') then
            coinAmount -= itemPrice
        elseif not is.find(item.Name) then
            coinAmount -= itemPrice
        else
            return false
        end
    else 
        return false
    end
end)