-- example of a challenge

SMODS.Challenge{
    loc_txt = "Vanilla Challenge", -- the name of the challenge
    key = 'example_challenge', -- the key for the challenge
    rules = { -- the ruleset for this challenge
        custom = {},
        modifiers = {
            {id = 'joker_slots', value = 5}, -- sets joker slots to 5
        },
    },
    jokers = {
        {id = 'j_joker', edition = 'negative', eternal = true}, -- start with a negative joker
    },
    consumeables = {
        {id = 'c_hermit'}, -- start with a hermit card
    },
    vouchers = {
        {id = 'v_overstock_plus'}, -- start with a overstock plus voucher
    },
    restrictions = { -- the cards that are banned from appearing in this challenge
        banned_cards = {
            {id = 'j_exmp_examplejoker4'},
            {id = 'j_exmp_examplejoker2'},
            {id = 'j_exmp_examplejoker'},
            {id = 'j_exmp_examplejoker5'},
            {id = 'j_exmp_examplejoker6'},
            {id = 'j_exmp_examplejoker7'},
            {id = 'j_exmp_Lucky_seven'},
            {id = 'm_exmp_MultEnh'},
            {id = 'e_exmp_gold'},
            {id = 'e_exmp_flipped'},
            {id = 'e_exmp_laminated'},
            {id = 'c_exmp_exampletarot'},
            {id = 'c_exmp_examplespectral'},
            {id = 'c_exmp_exampleplanet'},
            {id = 'c_exmp_ExampleEnhTarot'},
            {id = 'v_blank'},
            {id = 'v_antimatter'},
        },
        banned_tags = {}, -- diffrent banned tags
        banned_other = {} -- for banning set of stuff like blinds from showing up
    }
}