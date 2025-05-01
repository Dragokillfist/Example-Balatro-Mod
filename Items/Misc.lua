
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
    evaluate = function(parts, hand)
        return {hand = "exg_examplehand"}
    end,
}
--]]
SMODS.PokerHand {
    key = 'exg_Royal_Flush',
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
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "exg_hand_Royal_Flush", set = "misc" }
    end,
    --[[loc_txt = {
        ['en-us'] = {
            name = 'Royal Flush',
            description = {
                '5 cards in a row (consecutive ranks) with',
                'all cards sharing the same suit',
                'made of only Aces, tens, and face cards'
            }
        }
    },]]
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
    config = { hand_type = "exg_Royal_Flush", softlock = true},
    pos = {x = 0, y = 0 },
    atlas = 'PLH',
    cost = 3,
    loc_vars = function(self, info_queue, card)
        return { vars = { localize("exg_hand_Royal_Flush"),
        G.GAME.hands["exg_Royal_Flush"].level,
        G.GAME.hands["exg_Royal_Flush"].l_chips,
        G.GAME.hands["exg_Royal_Flush"].l_mult,
        } }
    end,
    generate_ui = 0,
}