-- this file is an example of what is generally in a mian lua file 

ExampleMod = SMODS.current_mod
ExampleMod_config = ExampleMod.config -- this is the config file that is used to store the mods settings, and it is used to make sure that the mod is loaded correctly
ExampleMod.enabled = copy_table(ExampleMod_config) -- this is the current state of the mods settings, and it is used to make sure that the mod is loaded correctly

-- to make your config actually register and work you will need to add the lines 3, 4, and 5 to your mod, and you can replace the ExampleMod with your mods name

-- When making a Sprite For balatro you need to have a 1x and a 2x file, because the sprite in the collection and the sprite of the joker you have mid run are diffrent resolutions/sizes
SMODS.Atlas({
    object_type = "Atlas",
    key = "PLH", -- this is what you put in your atlas in your joker, consumable, or any other modded item, an example of this can be found in Items/Jokers.lua on line 8
    path = "placeholders.png",-- this is the name of the file that your sprites will use from your assets folder
    px = 71,
    py = 95,-- the standard 1x size of any joker or consumable is 71x95
})

-- this is where we will regester other files from within this mods folder such as stuff from our Items folder, tho if you dont want to load that file you can comment it out by adding "--" aty the start of the line
-- when setting the files path you need to make sure that you are using the correct capitalization, because if you dont, your mod will crash on linux platforms
assert(SMODS.load_file("Items/Jokers.lua"))()
assert(SMODS.load_file("Items/Consumables.lua"))() -- this is where you will find how you can make a custom consumable type or just create a consumable of a pre-existing type
assert(SMODS.load_file("Items/Misc.lua"))()
assert(SMODS.load_file("Lib/Utility.lua"))() -- this is the file where we add the code to initialize the config menu and other utility functions