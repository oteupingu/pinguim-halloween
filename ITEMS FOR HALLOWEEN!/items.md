## FOR QBCORE INVENTORY (NOT FUNCTION!)
```lua
    halloween-candycorn = { name = 'halloween-candycorn', label = 'Candy Corn', weight = 100, type = 'item', image = 'halloween-candycorn.png', unique = false, useable = true, shouldClose = true, description = 'You enjoyed a candy corn!' },
    halloween-chocolateskull = { name = 'halloween-chocolateskull', label = 'Chocolate Skull', weight = 100, type = 'item', image = 'halloween-chocolateskull.png', unique = false, useable = true, shouldClose = true, description = 'You ate a chocolate skull!' },
    halloween-ghostmarshmallow = { name = 'halloween-ghostmarshmallow', label = 'Ghost Marshmallow', weight = 100, type = 'item', image = 'halloween-ghostmarshmallow.png', unique = false, useable = true, shouldClose = true, description = 'You ate a ghost-shaped marshmallow!' },
    halloween-caramelapple = { name = 'halloween-caramelapple', label = 'Caramel Apple', weight = 100, type = 'item', image = 'halloween-caramelapple.png', unique = false, useable = true, shouldClose = true, description = 'You enjoyed a caramel apple!' },
    halloween-licorice = { name = 'halloween-licorice', label = 'Licorice', weight = 100, type = 'item', image = 'halloween-licorice.png', unique = false, useable = true, shouldClose = true, description = 'You chewed on some licorice!' },
    halloween-eyeballcandy = { name = 'halloween-eyeballcandy', label = 'Eyeball Candy', weight = 100, type = 'item', image = 'halloween-eyeballcandy.png', unique = false, useable = true, shouldClose = true, description = 'You ate some eyeball candy!' },
    halloween-witchsbrew = { name = 'halloween-witchsbrew', label = "Witch's Brew", weight = 120, type = 'item', image = 'halloween-witchsbrew.png', unique = false, useable = true, shouldClose = true, description = "You drank some Witch's Brew... spooky!" },
    halloween-caramelpopcorn = { name = 'halloween-caramelpopcorn', label = 'Caramel Popcorn', weight = 100, type = 'item', image = 'halloween-caramelpopcorn.png', unique = false, useable = true, shouldClose = true, description = 'You enjoyed some caramel popcorn!' },
    halloween-pumpkinlollipop = { name = 'halloween-pumpkinlollipop', label = 'Pumpkin Lollipop', weight = 100, type = 'item', image = 'halloween-pumpkinlollipop.png', unique = false, useable = true, shouldClose = true, description = 'You licked a pumpkin lollipop!' },
    halloween-sugarspider = { name = 'halloween-sugarspider', label = 'Sugar Spider', weight = 100, type = 'item', image = 'halloween-sugarspider.png', unique = false, useable = true, shouldClose = true, description = 'You ate a sugar spider!' },
    halloween-sweetfangs = { name = 'halloween-sweetfangs', label = 'Sweet Fangs', weight = 100, type = 'item', image = 'halloween-sweetfangs.png', unique = false, useable = true, shouldClose = true, description = 'You bit into some sweet fangs!' },
    halloween-vampireblood = { name = 'halloween-vampireblood', label = 'Vampire Blood', weight = 100, type = 'item', image = 'halloween-vampireblood.png', unique = false, useable = true, shouldClose = true, description = 'You drank some Vampire Blood... deliciously eerie!' },
    halloween-ghostlygummies = { name = 'halloween-ghostlygummies', label = 'Ghostly Gummies', weight = 100, type = 'item', image = 'halloween-ghostlygummies.png', unique = false, useable = true, shouldClose = true, description = 'You chewed on some ghostly gummies!' },

```




# FOR OX INVENTORY
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
