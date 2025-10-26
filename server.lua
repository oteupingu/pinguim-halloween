local function loadLocale()
    local localePath = ('locales/%s.json'):format(Config.Locale)
    local file = LoadResourceFile(GetCurrentResourceName(), localePath)
    return file and json.decode(file) or {}
end

local Lang = loadLocale()

-- 🔹 Dar recompensa (universal)
RegisterNetEvent('pinguim_halloween:server:GiveReward', function(type)
    local src = source
    local rewardType = type or 'candy'
    local system = Config.InventorySystem

    -- 💰 Recompensa de dinheiro
    if rewardType == 'money' then
        local amount = math.random(Config.MoneyReward.min, Config.MoneyReward.max)

        if system == "ox" and GetResourceState('ox_inventory') == "started" then
            -- Se quiseres dar como item físico (ex: notas)
            exports.ox_inventory:AddItem(src, 'money', amount)
        elseif system == "qb" and GetResourceState('qb-core') == "started" then
            local QBCore = exports['qb-core']:GetCoreObject()
            local Player = QBCore.Functions.GetPlayer(src)
            if Player then
                Player.Functions.AddMoney('cash', amount)
            end
        end

        TriggerClientEvent('ox_lib:notify', src, {
            title = Lang.title or "🎃 Halloween",
            description = Lang.notify_money and Lang.notify_money:format(amount)
                or ("Recebeste $%s!"):format(amount),
            type = "success"
        })

    -- 🍬 Recompensa de doces
    elseif rewardType == 'candy' then
        local candy = Config.CandyItems[math.random(#Config.CandyItems)]

        if system == "ox" and GetResourceState('ox_inventory') == "started" then
            exports.ox_inventory:AddItem(src, candy.item, candy.amount)
        elseif system == "qb" and GetResourceState('qb-inventory') == "started" then
            exports['qb-inventory']:AddItem(src, candy.item, candy.amount)
        end

        TriggerClientEvent('ox_lib:notify', src, {
            title = Lang.title or "🎃 Halloween",
            description = Lang.notify_candy and Lang.notify_candy:format(candy.amount, candy.label)
                or ("Recebeste %sx %s!"):format(candy.amount, candy.label),
            type = "success"
        })
    end
end)
