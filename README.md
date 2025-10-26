# Pinguim Halloween Event 🎃
Festive FiveM Trick-or-Treat script for QBCore & Qbox with NPC interactions and rewards

# Preview
<img width="1355" height="940" alt="image" src="https://github.com/user-attachments/assets/b424c986-5b1b-4f7b-80bc-3f56bb51120b" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ff6d7bd9-4ecc-47af-a2a3-24bbb0fc1b1b" />

## Features
* Knock on haunted houses and interact with NPCs
* Randomized Trick-or-Treat outcomes (rewards or pranks)
  * Rewards: Candy, chocolate, lollipops, or money
  * Pranks: Drunk effect, rat transformation, fake explosion
* Configurable reward chance and cooldown between houses
* Multiple NPC models and names for variety
* Dynamic dialogues with multiple languages (`locales/*.json`)
  * Easy to add new languages (e.g. `en.json`, `pt.json`)
  * Default language configurable via `Config.Locale`
* Integration with inventory systems: ox_inventory or qb_inventory
* Optional map blips showing haunted houses
* Auto-remove NPC if player walks away
* Lightweight and easy to integrate into QBCore or Qbox servers

## Installation
1. Place the resource folder in your `resources` directory.
2. Add to your `server.cfg`:
3. Configure your `Config.lua`:
   * Set `Locale` (`"en"` or `"pt"`)
   * Choose your `InventorySystem` (`"ox"` or `"qb"`)
   * Adjust cooldown, reward chance, and NPC models as desired
4. Add candy or money items to your inventory system (example for QBCore):
```lua
-- Candy Items
["chocolate"] = {label = "Chocolate", weight = 1, type = "item", image = "chocolate.png", unique = false, useable = false},
["candy_corn"] = {label = "Sweet Corn", weight = 1, type = "item", image = "candy_corn.png", unique = false, useable = false},
["gummy"] = {label = "Gummy", weight = 1, type = "item", image = "gummy.png", unique = false, useable = false},
["lollipop"] = {label = "Lollipop", weight = 1, type = "item", image = "lollipop.png", unique = false, useable = false}
```

## Dependencies
* [ox_lib](https://github.com/overextended/ox_lib)
* [ox_target](https://github.com/overextended/ox_target)
* [oxmysql](https://github.com/overextended/oxmysql)
* [mt_lib](https://github.com/MT-Scripts/mt_lib)
  * [Documentation MT Lib](https://docs.mt-scripts.com/lib)
* [ox_inventory](https://github.com/overextended/ox_inventory) or [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
