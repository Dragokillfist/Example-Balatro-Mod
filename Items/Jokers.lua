-- this file is to explain both some very simple and some advance example of jokers

SMODS.Joker{
    name ="Example Joker", -- the name that is shown when hovering over the joker in the collection
    key = "examplejoker", -- this is the key that we will use to tell the localization what joker to add the text and name to
    pos = {x = 0, y = 0}, -- this is the position of what sprite the joker will use, and this is the top left cornor of the sprite sheet
    rarity = 1, -- this is what determines the rarity of the joker (1 = common, 2 = uncommon, 3 = rare, and 4 = Legendary)
    atlas = "PLH", -- this is the key that determines what atlas the joker will use, this is the same as the key in the atlas function in main.lua
    config = { extra = {mult = 4} },  -- the config is used to make basic effects for our jokers
    cost = 6, -- this is the cost of the joker in the shop, and its sell value is half of what the cost to buy is, so this joker would sell for 3 dollars
    loc_vars = function (self, info_queue, center)
        return { vars = { center.ability.extra.mult } }
    end,
    calculate = function (self, card, context)
        if context.cardarea == G.jokers and context.joker_main then -- the context that is used to make the jokers ability trigger after cards have finished scoring
            return {mult = card.ability.extra.mult} -- this is how we make the joker give the mult, you can try replacing mult in this case with other things such as: Chips, X_mult, or X_chips
        end
    end,
}

SMODS.Joker{
    name = "Example Joker 2", -- the name that is shown when hovering over the joker in the collection
    key = "examplejoker2", -- this is the key that we will use to tell the localization what joker to add the text and name to
    pos = {x = 0, y = 0}, -- this is the position of what sprite the joker will use, and this is the top left cornor of the sprite sheet
    rarity = 1, -- this is what determines the rarity of the joker (1 = common, 2 = uncommon, 3 = rare, and 4 = Legendary)
    atlas = "PLH", -- this is the key that determines what atlas the joker will use, this is the same as the key in the atlas function in main.lua
    config = { extra = {mult = 4} },  -- the config is used to make basic effects for our jokers
    cost = 6, -- this is the cost of the joker in the shop, and its sell value is half of what the cost to buy is, so this joker would sell for 3 dollars
    loc_txt = { -- this is how you can add text to your joker without having a localization file for your mod
        name = "Example Joker 2",
        text = {
            "This is an example joker.",
            "It can be used to demonstrate how to create a joker.",
            "You can customize the text and effects as needed.",
            "this Joker give {C:mult}+#1#{} mult" -- the {C:mult} is the color of the text and #1# is the first variable that is in the jokers config and the {} ends the colored text without having to start a new line
        }
    },
    loc_vars = function (self, info_queue, center)
        return { vars = { center.ability.extra.mult } }
    end,
    calculate = function (self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return {mult = card.ability.extra.mult}
        end
    end,
}