-- this file is to explain both some very simple and some advance example of jokers

SMODS.Joker{
    name ="Example Joker",
    key = "examplejoker",
    pos = {x = 0, y = 0}, -- this is the position of what sprite the joker will use, and this is the top left cornor of the sprite sheet
    rarity = 1, -- this is what determines the rarity of the joker (1 = common, 2 = uncommon, 3 = rare, and 4 = Legendary)
    atlas = "PLH", -- this is the key that determines what atlas the joker will use, this is the same as the key in the atlas function in main.lua
    config = { extra = {mult = 4} },  -- the config is used to make basic effects for our jokers
    cost = 6, -- this is the cost of the joker in the shop, and its sell value is half of what the cost to buy is, so this joker would sell for 3 dollars
    loc_vars = function (self, info_queue, center)
        return { vars = { center.ability.extra.mult } }
    end,
    calculate = function (self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return {mult = card.ability.extra.mult}
        end
    end,
}