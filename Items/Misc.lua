
SMODS.Atlas({
    object_type = "Atlas",
    key = "HandPLH",
    path = "hands.png",
    px = 53,
    py = 13,
}):register()

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
        local hand = G.hand:find_hand(parts)
        if hand then
            hand:juice_up(0.3, 0.5)
            hand:highlight()
            return true
        end
    end,
}