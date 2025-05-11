-- edition examples

-- credit to most of this code being from the SMODS team

SMODS.Shader {
    key = 'gold',
    path = 'gold.fs',
    -- card can be nil if sprite.role.major is not Card
    send_vars = function (sprite, card)
        return {
            lines_offset = card and card.edition.example_gold_seed or 0
        }
    end,
}
SMODS.Edition {
    key = "gold",
    shader = "gold",
    on_apply = function (card)
        -- Randomize offset to -1..1
        -- Save in card.edition table so it persists after game restart.
        card.edition.example_gold_seed = pseudorandom('e_example_gold') * 2 - 1
    end,
}
---- CUSTOM VARS USAGE EXAMPLE END


SMODS.Shader({ key = 'flipped', path = 'flipped.fs' })
SMODS.Shader({key = 'laminated', path = 'laminated.fs'})
-- SMODS.Shader({key = 'sepia', path = 'sepia.fs'})

SMODS.Edition({
    key = "flipped",
    loc_txt = {
        name = "Flipped",
        label = "Flipped",
        text = {
            "nothin"
        }
    },
    -- Stop shadow from being rendered under the card
    disable_shadow = true,
    -- Stop extra layer from being rendered below the card.
    -- For edition that modify shape or transparency of the card.
    disable_base_shader = true,
    shader = "flipped",
    discovered = true,
    unlocked = true,
    config = {},
    in_shop = true,
    weight = 8,
    extra_cost = 6,
    apply_to_float = true,
    loc_vars = function(self)
        return { vars = {} }
    end
})

SMODS.Edition({
    key = "laminated",
    -- Stop shadow from being rendered under the card
    disable_shadow = true,
    -- Stop extra layer from being rendered below the card.
    -- For edition that modify shape or transparency of the card.
    disable_base_shader = true,
    shader = "laminated",
    discovered = true,
    unlocked = true,
    config = {},
    in_shop = true,
    weight = 8,
})