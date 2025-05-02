-- this is where we will show you how to make a config menu and some other utility functions for your mod

-- the 3 lines with the localize in them are defined in the en-us file towards the bottom under dictionary
SMODS.current_mod.config_tab = function() -- the configs will be stored in config.lua and you can find the file of the configs in "Roaming/balatro/config" then ExampleMod.jkr for this mod
    local scale = 5/6
    return {n=G.UIT.ROOT, 
        config = {align = "cl", minh = G.ROOM.T.h*0.25, padding = 0.0, r = 0.1, colour = G.C.GREY}, 
        nodes = {
        {n = G.UIT.R, config = { padding = 0.05 }, 
        nodes = {
            {n = G.UIT.C, config = { minw = G.ROOM.T.w*0.25, padding = 0.05 }, 
                nodes = {
                create_toggle{ -- creats a toggle button under the config menu, there are some other type of UI options you can use on line 31 to 36, the one on line 30 is the one we are currently using
                    label = localize("example_config_label"), -- the label that shows up next to the toggle button
                    info = {localize("exg_restart"), -- the text that will show below the toggle option
                    localize("include_custom_consumable")}, -- the text that will show below the toggle option
                    active_colour = ExampleMod.badge_colour, -- the color of the toggle when it is on
                    ref_table = ExampleMod.config, -- the table of which the toggle will be added to
                    ref_value = "example_config_toggle" -- the value that this toggle uses
                }
            }}
        }},
        {n = G.UIT.C, config = { minw = G.ROOM.T.w*0.25, padding = 0.05 }, 
            nodes = {
                create_toggle{
                    label = localize("example_config_label"),
                    info = {localize("exg_restart"), localize("include_custom_consumable")},
                    active_colour = ExampleMod.badge_colour,
                    ref_table = ExampleMod.config,
                    ref_value = "extra_hands"
                }
            }
        }
    }}
end




--[[
create_toggle(args)
UIBox_button(args)
create_slider(args)
create_text_input(args)
simple_text_container(_loc, args)
create_UIBox_generic_options(args)
create_option_cycle(args)
]]