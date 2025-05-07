-- this is where we will show you how to add enhancments to the game and a consumable to apply them in Consumables.lua

SMODS.Enhancement{
    key = "MultEnh",
    pos = {x = 5, y = 2},
    rarity = 1,
    atlas = "PLH2",
    config = { extra = {mult = 4} },
    cost = 6,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.mult } } -- for Enhancements we can not use center so we instead use card for our loc_vars
    end,
    calculate = function (self, card, context)
        -- the calculate function is not too different from the one we use for our jokers, the only constraint we have is that we cant use any sort of joker_main contexts
        if context.main_scoring and context.cardarea == G.play then
            return {mult = card.ability.extra.mult}
        end
    end,
}