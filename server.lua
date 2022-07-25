
ESX = nil

TriggerEvent(Config.Trigger, function(obj) ESX = obj end)


RegisterServerEvent('zcmg_kiko_reciclagem:dar_item')
AddEventHandler('zcmg_kiko_reciclagem:dar_item',function(estado)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if estado then
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
    else
        -- [Nome do Player] =  GetPlayerName(_source) ; [Id do Player] = _source
        -- trigger da log ou do ban!
    end
end)
