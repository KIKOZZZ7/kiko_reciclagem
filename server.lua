
ESX = nil

TriggerEvent(Config.Trigger, function(obj) ESX = obj end)


RegisterServerEvent('zcmg_kiko_reciclagem:dar_item')
AddEventHandler('zcmg_kiko_reciclagem:dar_item',function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if Config.NumeroItens == 1 then
        xPlayer.addInventoryItem(Config.Item1, Config.Quantidade_Item1)
    elseif Config.NumeroItens == 2 then
        xPlayer.addInventoryItem(Config.Item1, Config.Quantidade_Item1)
        xPlayer.addInventoryItem(Config.Item2, Config.Quantidade_Item2)
    elseif Config.NumeroItens == 3 then
        xPlayer.addInventoryItem(Config.Item1, Config.Quantidade_Item1)
        xPlayer.addInventoryItem(Config.Item2, Config.Quantidade_Item2)
        xPlayer.addInventoryItem(Config.Item3, Config.Quantidade_Item3)
    elseif Config.NumeroItens == 4 then
        xPlayer.addInventoryItem(Config.Item1, Config.Quantidade_Item1)
        xPlayer.addInventoryItem(Config.Item2, Config.Quantidade_Item2)
        xPlayer.addInventoryItem(Config.Item3, Config.Quantidade_Item3)
        xPlayer.addInventoryItem(Config.Item4, Config.Quantidade_Item4)
    elseif Config.NumeroItens == 5 then
        xPlayer.addInventoryItem(Config.Item1, Config.Quantidade_Item1)
        xPlayer.addInventoryItem(Config.Item2, Config.Quantidade_Item2)
        xPlayer.addInventoryItem(Config.Item3, Config.Quantidade_Item3)
        xPlayer.addInventoryItem(Config.Item4, Config.Quantidade_Item4)
        xPlayer.addInventoryItem(Config.Item5, Config.Quantidade_Item5)
    end
end)