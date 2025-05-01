
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