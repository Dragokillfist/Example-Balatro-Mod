return{ -- things in this file ARE case sensitive, so make sure you are using the correct capitalization
    descriptions = {
        back ={
            
        },
        Joker = {
            j_exg_examplejoker = {
                name = "Example Joker",
                text = {
                    "This is an example joker.",
                    "It can be used to demonstrate how to create a joker.",
                    "You can customize the text and effects as needed.",
                    "this Joker give {C:mult}+#1#{} mult" -- the {C:mult} is the color of the text and #1# is the first variable that is in the jokers config and the {} ends the colored text without having to start a new line
                }
            },
            -- example joker 3 is used for people to see if htey can identify the problems and fix it, its not a requierment, but it is a good way for people to understand how you would fix some of these weird bugs and unintentional behavior
            j_exg_examplejoker3 = {
                name = "Example Joker 3",
                text = {
                    "This is an example joker.",
                    "It can be used to demonstrate how to create a joker.",
                    "You can customize the text and effects as needed.",
                    "this Joker give {C:white}+#2# mult"
                }
            },
        },
        Tarot = {
            c_exg_exampletarot = {
                name = "Example Tarot",
                text = {
                    "This is an example tarot.",
                    "It can be used to demonstrate how to create a tarot.",
                    "You can customize the text and effects as needed.",
                    "Convert up to {C:attention}#1#{} selected cards to diamonds" -- the {C:attention} is the color of the text and #1# is the first variable that is in the Tarot's config and the {} ends the colored text without having to start a new line
                }
            },
        },
        Spectral = {
            c_exg_examplespectral = {
                name = "Example Spectral",
                text = {
                    "This is an example spectral.",
                    "It can be used to demonstrate how to create a spectral.",
                    "You can customize the text and effects as needed.",
                    "creates #1# negative jokers"
                }
            },
        },
        Planet = {
            c_exg_exampleplanet = {
                name = "Example Planet",
                text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Mult and",
					"{C:chips}+#4#{} chips",
                }
            },
        },
        ExampleSet = { -- this is how we add localization for a custom consumable type
            c_exg_exampleconsume ={
                name = "Example Custom Consumable",
                text = {
                    "this is a consumable of a custom type added by the mod",
                    "when used it will give you {C:attention}#1#{} random planet cards",
                }
            }
        },
    },
    misc = {
        dictionary = {
            exg_hand_Royal_Flush = "Royal Flush",

            exg_restart = "Requires a restart to take effect",
            include_custom_consumable = "Enables the custom example consumable",
            example_config_label = "Example Label",
        },
        poker_hand_descriptions = {
            ["exg_Royal_Flush"] = {
                "5 cards in a row (consecutive ranks) with",
                "all cards sharing the same suit",
                "made of only Aces, tens, and face cards"
            },
        },
        poker_hands = {
            ["exg_Royal_Flush"] = "Royal Flush",
        },
    },
}