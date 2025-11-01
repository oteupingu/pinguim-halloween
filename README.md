# Pinguim Halloween Event 🎃
Festive FiveM Trick-or-Treat script for QBCore & Qbox with NPC interactions and rewards

# Preview
<img width="1355" height="940" alt="image" src="https://github.com/user-attachments/assets/b424c986-5b1b-4f7b-80bc-3f56bb51120b" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ff6d7bd9-4ecc-47af-a2a3-24bbb0fc1b1b" />

## Features
* Knock on haunted houses and interact with NPCs
* Randomized Trick-or-Treat outcomes (rewards or pranks)
  * Rewards: Candy Corn, Chocolate Skull, Ghost Marshmallow, Caramel Apple, Licorice, Eyeball Candy, Witch's Brew, Caramel Popcorn and more...
  * Pranks: Drunk effect, rat transformation, fake explosion
* Configurable reward chance and cooldown between houses
* Multiple NPC models and names for variety
* Dynamic dialogues with multiple languages (`locales/*.json`)
  * Easy to add new languages (e.g. `en.json`, `pt.json`)
  * Default language configurable via `Config.Locale`
* Integration with inventory systems: ox_inventory
* Optional map blips showing haunted houses
* Auto-remove NPC if player walks away
* Lightweight and easy to integrate into QBCore or Qbox servers

# Features coming:
- Function to qb-inventory and qb-target
- Some treats and tricks.
- Some more simple useful functions
- And more...

## Dependencies
* [ox_lib](https://github.com/overextended/ox_lib)
* [ox_target](https://github.com/overextended/ox_target)
* [oxmysql](https://github.com/overextended/oxmysql)
* [mt_lib](https://github.com/MT-Scripts/mt_lib)
  * [Documentation MT Lib](https://docs.mt-scripts.com/lib)
* [ox_inventory](https://github.com/overextended/ox_inventory)

## Installation
1. Place the resource folder in your `resources` directory.
2. Add to your `server.cfg`:
3. Configure your `Config.lua`:
   * Set `Locale` (`"en"` or `"pt"`)
   * Choose your `InventorySystem` (`"ox" You can only choose “ox” because qb inventory and qb target do not function.`)
   * Adjust cooldown, reward chance, and NPC models as desired
4. Go to ox_inventory in the data\items.lua and put this:
```lua
['halloween-candycorn'] = {
    label = 'Candy Corn',
    weight = 100,
    client = {
        status = { hunger = 250000 },
        anim = 'eating',
        prop = 'ramen',
        usetime = 3000,
        notification = 'You enjoyed a candy corn!',
        image = 'halloween-candycorn.png'
    },
},

['halloween-chocolateskull'] = {
    label = 'Chocolate Skull',
    weight = 100,
    client = {
        status = { hunger = 250000 },
        anim = 'eating',
        prop = 'ramen',
        usetime = 3000,
        notification = 'You ate a chocolate skull!',
        image = 'halloween-chocolateskull.png'
    },
},

['halloween-ghostmarshmallow'] = {
    label = 'Ghost Marshmallow',
    weight = 100,
    client = {
        status = { hunger = 250000 },
        anim = 'eating',
        prop = 'ramen',
        usetime = 3000,
        notification = 'You ate a ghost-shaped marshmallow!',
        image = 'halloween-ghostmarshmallow.png'
    },
},

['halloween-caramelapple'] = {
    label = 'Caramel Apple',
    weight = 100,
    client = {
        status = { hunger = 250000 },
        anim = 'eating',
        prop = 'ramen',
        usetime = 3000,
        notification = 'You enjoyed a caramel apple!',
        image = 'halloween-caramelapple.png'
    },
},


['halloween-licorice'] = {
    label = 'Licorice',
    weight = 100,
    client = {
        status = { hunger = 250000 },
        anim = 'eating',
        prop = 'ramen',
        usetime = 3000,
        notification = 'You chewed on some licorice!',
        image = 'halloween-licorice.png'
    },
},

['halloween-eyeballcandy'] = {
    label = 'Eyeball Candy',
    weight = 100,
    client = {
        status = { hunger = 250000 },
        anim = 'eating',
        prop = 'ramen',
        usetime = 3000,
        notification = 'You ate some eyeball candy!',
        image = 'halloween-eyeballcandy.png'
    },
},

['halloween-witchsbrew'] = {
    label = "Witch's Brew",
    weight = 120,
    client = {
        status = { thirst = 250000 },
        anim = 'drinking',
        prop = 'cup',
        usetime = 3000,
        notification = "You drank some Witch's Brew... spooky!",
        image = 'halloween-witchsbrew.png'
    },
},

['halloween-caramelpopcorn'] = {
    label = 'Caramel Popcorn',
    weight = 100,
    client = {
        status = { hunger = 250000 },
        anim = 'eating',
        prop = 'ramen',
        usetime = 3000,
        notification = 'You enjoyed some caramel popcorn!',
        image = 'halloween-caramelpopcorn.png'
    },
},

['halloween-pumpkinlollipop'] = {
    label = 'Pumpkin Lollipop',
    weight = 100,
    client = {
        status = { hunger = 250000 },
        anim = 'eating',
        prop = 'ramen',
        usetime = 3000,
        notification = 'You licked a pumpkin lollipop!',
        image = 'halloween-pumpkinlollipop.png'
    },
},

['halloween-sugarspider'] = {
    label = 'Sugar Spider',
    weight = 100,
    client = {
        status = { hunger = 250000 },
        anim = 'eating',
        prop = 'ramen',
        usetime = 3000,
        notification = 'You ate a sugar spider!',
        image = 'halloween-sugarspider.png'
    },
},


['halloween-sweetfangs'] = {
    label = 'Sweet Fangs',
    weight = 100,
    client = {
        status = { hunger = 250000 },
        anim = 'eating',
        prop = 'ramen',
        usetime = 3000,
        notification = 'You bit into some sweet fangs!',
        image = 'halloween-sweetfangs.png'
    },
},


['halloween-vampireblood'] = {
    label = 'Vampire Blood',
    weight = 100,
    client = {
        status = { thirst = 250000 },
        anim = 'drinking',
        prop = 'cup',
        usetime = 3000,
        notification = 'You drank some Vampire Blood... deliciously eerie!',
        image = 'halloween-vampireblood.png'
    },
},

['halloween-ghostlygummies'] = {
    label = 'Ghostly Gummies',
    weight = 100,
    client = {
        status = { hunger = 250000 },
        anim = 'eating',
        prop = 'ramen',
        usetime = 3000,
        notification = 'You chewed on some ghostly gummies!',
        image = 'halloween-ghostlygummies.png'
    },
},

```
