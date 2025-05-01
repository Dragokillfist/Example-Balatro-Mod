-- this file is an example of what is generally in a mian lua file 

-- When making a Sprite For balatro you need to have a 1x and a 2x file, because the sprite in the collection and the sprite of the joker you have mid run are diffrent resolutions/sizes
SMODS.Atlas({
    object_type = "Atlas",
    key = "PLH", -- this is what you put in your atlas in your joker, consumable, or any other modded item, an example of this can be found in Items/Jokers.lua on line 8
    path = "placeholders.png",-- this is the name of the file that your sprites will use from your assets folder
    px = 71,
    py = 95,-- the standard 1x size of any joker or consumable is 71x95
})

-- this is where we will regester other files from within this mods folder such as stuff from our Items folder, tho if you dont want to load that file you can comment it out by adding "--" aty the start of the line
assert(SMODS.load_file("Items/jokers.lua"))()
assert(SMODS.load_file("Items/consumables.lua"))()