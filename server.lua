RegisterNetEvent('pinguim_halloween:server:GiveReward', function(rewardType)
    local src = source
    local rewardType = rewardType or 'candy'
    local system = Config.InventorySystem or "ox"

    local function GetItemLabel(item)
        if system == "ox" and GetResourceState('ox_inventory') == "started" then
            local items = exports.ox_inventory:Items()
            if items and items[item] and items[item].label then
                return items[item].label
            end
        elseif system == "qb" and GetResourceState('qb-core') == "started" then
            local QBCore = exports['qb-core']:GetCoreObject()
            local items = QBCore.Shared.Items or {}
            if items[item] and items[item].label then
                return items[item].label
            end
        end
        return item
    end

    if rewardType == 'money' then
        local amount = math.random(Config.MoneyReward.min or 50, Config.MoneyReward.max or 150)

        if system == "qb" and GetResourceState('qb-core') == "started" then
            local QBCore = exports['qb-core']:GetCoreObject()
            local Player = QBCore.Functions.GetPlayer(src)
            if Player then
                Player.Functions.AddMoney('cash', amount)
            end
        elseif system == "ox" and GetResourceState('ox_inventory') == "started" then
            exports.ox_inventory:AddItem(src, 'money', amount)
        end

        TriggerClientEvent('ox_lib:notify', src, {
            title = "🎃 Halloween",
            description = ("Recebeste $%s!"):format(amount),
            type = "success"
        })

    elseif rewardType == 'candy' then
        local candyItem = Config.CandyItems[math.random(#Config.CandyItems)]
        local amount = math.random(1, 5)
        local label = GetItemLabel(candyItem)

        if system == "qb" and GetResourceState('qb-core') == "started" then
            local QBCore = exports['qb-core']:GetCoreObject()
            local Player = QBCore.Functions.GetPlayer(src)
            if Player then
                -- método “oficial” QBCore
                Player.Functions.AddItem(candyItem, amount)
                -- também exibir o “item box” (opcional)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[candyItem], 'add')
            end
        elseif system == "ox" and GetResourceState('ox_inventory') == "started" then
            exports.ox_inventory:AddItem(src, candyItem, amount)
        end

        TriggerClientEvent('ox_lib:notify', src, {
            title = "🎃 Halloween",
            description = ("🍬 O morador deu-te %sx %s!"):format(amount, label),
            type = "success"
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = "🎃 Halloween",
            description = "Evento inválido de recompensa recebido no servidor.",
            type = "error"
        })
    end
end)
