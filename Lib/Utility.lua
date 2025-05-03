-- this is where we will show you how to make a config menu and some other utility functions for your mod

-- the 3 lines with the localize in them are defined in the en-us file towards the bottom under dictionary
SMODS.current_mod.config_tab = function() -- the configs will be stored in config.lua and you can find the file of the configs in "Roaming/balatro/config" then ExampleMod.jkr for this mod
    local scale = 5/6
    return {n=G.UIT.ROOT, 
        config = {align = "cl", minh = G.ROOM.T.h*0.5, padding = 0.0, r = 0.1, colour = G.C.GREY}, 
        nodes = {
            {n = G.UIT.R, config = { padding = 0.05 }, 
                nodes = {
                    {n = G.UIT.C, config = { minw = G.ROOM.T.w*0.25, padding = 0.05 }, 
                        nodes = {
                            create_toggle{ -- creates a toggle button under the config menu, there are some other type of UI options you can use on line 83 to 88, the one on line 82 is the one we are currently using
                                label = localize("example_config_label"), -- the label that shows up next to the toggle button
                                info = {localize("exmp_restart"), -- the text that will show below the toggle option
                                localize("include_custom_consumable")}, -- the text that will show below the toggle option
                                active_colour = ExampleMod.badge_colour, -- the color of the toggle when it is on
                                ref_table = ExampleMod.config, -- the table of which the toggle will be added to
                                ref_value = "example_config_toggle" -- the value that this toggle uses
                            }
                        }
                    },
                    {n = G.UIT.C, config = { minw = G.ROOM.T.w*0.25, padding = 0.05},
                        nodes = {
                            create_toggle{
                                label = localize("only_faces"),
                                info = {localize("no_exmp_restart"), localize("insert_text_here")},
                                active_colour = ExampleMod.badge_colour,
                                ref_table = ExampleMod.config.example,
                                ref_value = "only_face_cards"
                            }
                        }
                    },
                    {n = G.UIT.C, config = { minw = G.ROOM.T.w*0.25, padding = 0.05},
                        nodes = {
                            create_toggle{
                                label = localize("random_cards"),
                                info = {localize("no_exmp_restart"), localize("insert_text_here")},
                                active_colour = ExampleMod.badge_colour,
                                ref_table = ExampleMod.config.example,
                                ref_value = "random_cards"
                            }
                        }
                    },
                }
                },
            {n = G.UIT.R, config = { minw = G.ROOM.T.w*0.25, padding = 0.05},
                nodes = {
                    create_slider{
                        label = localize("extra_hands_label"),
                        info = {localize("no_exmp_restart"), localize("insert_text_here")},
                        colour = G.C.BLUE, -- the color of the slider
                        min = 0, max = 100, -- the min and max values of the slider
                        w = G.ROOM.T.w*0.25, -- the width of the slider
                        active_colour = ExampleMod.badge_colour,
                        ref_table = ExampleMod.config.example,
                        ref_value = "bonus_starting_hands"
                    }
                }
            },
            {n = G.UIT.C, config = { minw = G.ROOM.T.w*0.25, padding = 0.05},
                nodes = {
                    create_slider{
                        label = localize("extra_discards_label"), -- the label that is displayed just above the slider
                        info = {localize("no_exmp_restart"), localize("insert_text_here")},
                        min = 0, max = 100, -- the min and max values of the slider
                        w = G.ROOM.T.w*0.25, -- the width of the slider
                        active_colour = ExampleMod.badge_colour,
                        ref_table = ExampleMod.config.example,
                        ref_value = "bonus_starting_discards"
                    }
                }
            },
            {n = G.UIT.R, config = { minw = G.ROOM.T.w*0.25, padding = 0.05},
                nodes = {
                    create_option_cycle{
                        colour = G.C.BLUE, -- the color of the slider
                        info = {("No Restart Needed"), localize("insert_text_here")},
                        options = {
                            ExampleMod.config.options.option_0, -- the text that will show up in the option cycle
                            ExampleMod.config.options.option_1, -- the text that will show up in the option cycle
                            ExampleMod.config.options.option_2,
                            ExampleMod.config.options.option_3,
                            ExampleMod.config.options.option_4,
                        },
                        label = ("Starting Money Multiplier"), -- the label that shows up next to the option cycle
                        ref_value = "example_value", -- the value that this option cycle uses
                        ref_table = ExampleMod.config.options, -- the table of which the toggle will be added to
                        opt_callback = "ExampleCallback", -- the function that will be called when the option is changed
                        current_option = ExampleMod.config.multiplier, -- the current value of the option cycle
                    }
                }
            },
        }
    }
end

G.FUNCS.ExampleCallback = function(e)
    ExampleMod.config.multiplier = e.to_key -- this is the value that will be used in the config file, and it will be saved to the config file when the game is closed
    local mult_ops = { 1, 10, 20, 30, 40 } -- this is the list of options that will be used in the option cycle, and it will be saved to the config file when the game is closed
    ExampleMod.config.example.example_value = mult_ops[e.to_key] 
end


--[[
-- implemented --
create_toggle(args)
create_option_cycle(args)
create_slider(args)
-- not implemented --
UIBox_button(args)
create_text_input(args)
simple_text_container(_loc, args)
create_UIBox_generic_options(args)
]]
local gsp = get_starting_params

function get_starting_params()
    params = gsp()
    params.hands = params.hands + ExampleMod.config.example.bonus_starting_hands
    params.discards = params.discards + ExampleMod.config.example.bonus_starting_discards
    params.no_faces = ExampleMod.config.example.only_face_cards
    params.erratic_suits_and_ranks = ExampleMod.config.example.random_cards
    params.dollars = params.dollars * ExampleMod.config.example.example_value -- this is the value that will be used in the config file, and it will be saved to the config file when the game is closed
    return params
end

