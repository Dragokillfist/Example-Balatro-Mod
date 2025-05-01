-- this is an Example file of how to make a tarot, spectal, planet and your own custom consumables for balatro

SMODS.Consumable {
	object_type = "Consumable",
	set = "Tarot",
	name = "example tarot",
	key = "exampletarot",
	pos = { x = 1, y = 2 },
  cost=3,
	atlas = "PLH",
	can_use = function(self, card)
		return #G.hand.highlighted <= card.ability.extra.max_selected and #G.hand.highlighted > 0
	end,
  config = { extra = {max_selected = 3}},
	loc_vars = function(self, info_queue, card)
    if card then
	    return { vars = { card.ability.extra.max_selected } }
    else
	    return { vars = { 0 } }
    end
	end,
	use = function(self, card, area, copier)
        local used_tarot = card or copier
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            used_tarot:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() SMODS.change_base(G.hand.highlighted[i],'Diamonds',nil);return true end }))
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        delay(0.5)
	end,
}

SMODS.Consumable {
	object_type = "Consumable",
	set = "Spectral",
	name = "example spectral",
	key = "examplespectral",
	pos = { x = 0, y = 0 },
	hidden = false, -- set to true to hide the item from the collection
	order = 21,
	atlas = "PLH",
	can_use = function(self, card)
		return true
	end,
  config = { extra = {num_jokers = 3}},
	loc_vars = function(self, info_queue, card)
	  info_queue[#info_queue + 1] = { key = "e_negative_consumable", set = "Edition", config = { extra = 1 } }
	  return { vars = { card.ability.extra.num_jokers } }
	end,
	use = function(self, card, area, copier)
    local used_tarot = card or copier
  G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
    play_sound('timpani')
      used_tarot:juice_up(0.3, 0.5)
      return true end }))
    for i=1,card.ability.extra.num_jokers do
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
				local card = create_card("Joker", G.jokers, nil, nil, nil, nil, nil, "exg_examplespectral")
        card:set_edition({negative = true}, true)
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		delay(0.6)
  end
	end,
}

SMODS.Consumable {
  set = "Planet",
  name = "example planet",
  key = "exampleplanet",
  config = { hand_type = "exg_examplehand" },
  cost = 3,
  atlas = "PLH",
  pos = { x = 0, y = 0 },
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.hand_type, } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = card or copier
        return{
            play_sound("timpani"),
            used_tarot:juice_up(0.3, 0.5),
            function()
                local hand = SMODS.PokerHand(self.config.hand_type)
                hand:upgrade()
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    play_sound('timpani')
                    used_tarot:juice_up(0.3, 0.5)
                    return true end }))
            end,
        }
    end,
}