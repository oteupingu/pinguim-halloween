Config = {}

-- 🌍 Language: "pt" or "en"
Config.Locale = "en"

-- ⚙️ Inventory to use: "ox(ox_inventory)", "qb(qb_inventory)"
Config.InventorySystem = "ox" -- PLEASE DO NOT TOUCH HERE!

-- 💃 Reloadskin command: "reloadskin", "refreshskin", etc
Config.Reloadskin = "reloadskin"

-- 🎁 Reward Chance (0.0 to 1.0)
Config.RewardChance = 0.6

-- ⏰ Cooldown between houses (in seconds)
Config.Cooldown = 60

-- 🧍 Possible NPCs
Config.NPCModels = {
    'a_m_m_business_01',
    'a_f_y_business_02',
    'a_m_m_farmer_01',
    'a_f_y_bevhills_02',
    'a_m_y_vinewood_01',
    'a_f_y_hipster_04'
}

-- 🏠 Haunted Houses
Config.Houses = {
    { coords = vector3(329.38, -1845.84, 26.75), heading = 60.75 },
    { coords = vector3(368.77, -1895.7, 25.18), heading = 125.38 },
    { coords = vector3(312.21, -218.53, 54.22), heading = 160.0 },
    { coords = vector3(1324.22, -1650.43, 52.24), heading = 250.0 },
    { coords = vector3(-103.33, 367.12, 112.34), heading = 45.0 }
}

-- 🍬 Sweet Rewards
Config.CandyItems = {
    'halloween-candycorn',
    'halloween-chocolateskull',
    'halloween-ghostmarshmallow',
    'halloween-caramelapple',
    'halloween-licorice',
    'halloween-eyeballcandy',
    'halloween-witchsbrew',
    'halloween-caramelpopcorn',
    'halloween-pumpkinlollipop',
    'halloween-sugarspider',
    'halloween-sweetfangs',
    'halloween-vampireblood',
    'halloween-ghostlygummies'
}

-- 💰 Money (range)
Config.MoneyReward = { min = 50, max = 150 }

