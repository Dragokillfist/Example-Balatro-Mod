
SMODS.Atlas({
    object_type = "Atlas",
    key = "HandPLH",
    path = "hands.png",
    px = 53,
    py = 13,
}):register()

--[[
SMODS.PokerHand {
    key = "examplehand",
    visible = true,
    chips = 100,
    mult = 10,
    l_chips = 100,
    l_mult = 10,
	example = {
		{ "S_A", true },
		{ "S_A", true },
		{ "S_T", true },
		{ "S_T", true },
		{ "S_2", false },
	},
    atlas = "HandPLH",
    pos = { x = 0, y = 0 },
    name = "Example Hand",
    evaluate = function(parts, hand)
        return {hand = "exg_examplehand"}
    end,
    modify_display_text = function(self, hand, text)
        local hand_text = SMODS.get_localization("misc.poker_hands." .. hand.hand)
        if hand_text then
            text = hand_text
        end
        return text
    end,
}
--]]
SMODS.PokerHand {
    key = 'Royal Flush',
    chips = 110,
    mult = 9,
    l_chips = 40,
    l_mult = 4,
    example = {
        { 'S_A',    true },
        { 'S_K',    true },
        { 'S_Q',    true },
        { 'S_J',    true },
        { 'S_T',    true },
    },
    loc_txt = {
        ['en-us'] = {
            name = 'Royal Flush',
            description = {
                '5 cards in a row (consecutive ranks) with',
                'all cards sharing the same suit',
                'made of only Aces, tens, and face cards'
            }
        }
    },
    evaluate = function(parts, hand)
        if next(parts._flush) and next(parts._straight) then
            local _strush = SMODS.merge_lists(parts._flush, parts._straight)
            local royal = true
            for j = 1, #_strush do
                local rank = SMODS.Ranks[_strush[j].base.value]
                royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
            end
            if royal then return {_strush} end
        end
    end,
}


SMODS.Consumable {
    set = 'Planet',
    key = 'exampleplanet2',
    --! `h_` prefix was removed
    config = { hand_type = 'exg_royal_flush_Royal Flush' },
    pos = {x = 0, y = 0 },
    atlas = 'PLH',
    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(localize('k_planet_q'), get_type_colour(self or card.config, card), nil, 1.2)
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.hand_type } }
    end,
    can_use = function(self, card)
        return true
    end,
}