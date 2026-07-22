return {
    descriptions = {
        Joker = {
            j_neb_thimble = {
                name = 'Thimble',
                text = {
                    'Gains {C:chips}+#2#{} Chip when',
                    'each played card is scored',
                    '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)'
                }
            },
            j_neb_summer = {
                name = 'Summer',
                text = {
                    'Retriggers every played',
                    '{C:diamonds}Diamonds{} card'
                }
            },
            j_neb_autumn = {
                name = 'Autumn',
                text = {
                    'Retriggers every played',
                    '{C:clubs}Clubs{} card'
                }
            },
            j_neb_winter = {
                name = 'Winter',
                text = {
                    'Retriggers every played',
                    '{C:spades}Spades{} card'
                }
            },
            j_neb_spring = {
                name = 'Spring',
                text = {
                    'Retriggers every played',
                    '{C:hearts}Hearts{} card'
                }
            },
            j_neb_normalmap = {
                name = 'Normal Map',
                text = {
                    'Played cards with {C:attention}Enhancements{} ',
                    'give {C:chips}+#1#{} Chips '
                }
            },
            j_neb_floppydisk = {
                name = 'Floppy Disk',
                text = {
                    'Gains {C:chips}+#2#{} Chips for ',
                    'every {C:attention}Consumable{} held',
                    'when {C:attention}Blind{} is {C:attention}defeated{}',
                    '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)'
                }
            },
            j_neb_misfits = {
                name = 'The Misfits',
                text = {
                    'If {C:attention}poker hand{} is a ',
                    '{C:attention}High Card{} and has {C:attention}5{}',
                    'scoring cards, {X:mult,C:white} X#1# {} Mult' 
                }
            },
            j_neb_outlet = {
                name = 'Power Outlet',
                text = {
                    '{C:mult}+#1#{} Mult if all scored cards',
                    'have an {C:attention}Enhancement{}'
                }
            },
            j_neb_bowling = {
                name = 'Bowling Scorecard',
                text = {
                    '{C:mult}+#1#{} Mult if all scored',
                    'cards are {C:attention}10s{}'
                }
            },
            j_neb_debuffedjoker = {
                name = 'Debuffed Joker',
                text = {
                    'Gains {C:mult}+#2#{} Mult for each "scoring"',
                    '{C:attention}Debuffed{} card played {C:attention}this round{}',
                    '{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)'
                }
            },
            j_neb_plaid = {
                name = 'Plaid Joker',
                text = {
                    'Scored {C:hearts}Hearts{} cards give',
                    '{C:mult}+#1#{} Mult per scored {C:clubs}Clubs{} card',
                    '(and {C:attention}vice versa{})'
                }
            },
            j_neb_polka = {
                name = 'Polka Dot Joker',
                text = {
                    'Scored {C:spades}Spades{} cards give',
                    '{C:chips}+#1#{} Chips per scored {C:diamonds}Diamonds{} card',
                    '(and {C:attention}vice versa{})'
                }
            },
            j_neb_reviewbomb = {
                name = 'Review Bombing',
                text = {
                    'Gains {C:money}$#2#{} for each hand played',
                    'with 3 or more "scoring" {C:attention}Debuffed{}',
                    'cards, {C:attention}resets{} if {C:attention}2 or fewer{}',
                    '{C:attention}Debuffed{} cards are "scored"',
                    '{C:inactive}(Currently {C:money}$#1#{C:inactive})'
                }
            },
            j_neb_tictactoe = {
                name = 'Tic Tac Toe',
                text = {
                    '{X:mult,C:white}X#1#{} Mult if hand contains',
                    'a {C:attention}Debuffed{} "scoring" card and a',
                    '{C:attention}undebuffed{} scoring card'
                }
            },
            j_neb_treasure = {
                name = 'Treasure Map',
                text = {
                    '{C:money}$#1#{} if hand contains',
                    '5 scoring cards, and',
                    '{C:attention}exactly one{} is {C:attention}Debuffed{}'
                }
            },
            j_neb_monolith = {
                name = 'Green Monolith',
                text = {
                    'Gain a random {C:purple}Tarot{} card if',
                    '{C:attention}poker hand{} is a {C:attention}#1#{},',
                    "poker hand changes",
                    "at end of round"
                }
            },
            j_neb_nuclear = {
                name = 'Nuclear Pulse Drive',
                text = {
                    '{C:green}1 in 2{} chance for each',
                    'scored card to be destroyed if',
                    '{C:attention}poker hand{} is a {C:attention}#3#{},',
                    "poker hand changes",
                    "at end of round"
                    
                }
            },
            j_neb_candycane = {
                name = 'Candy cane',
                text = {
                    '{C:attention}Next scored{} hand',
                    'becomes {C:dark_edition}Holographic{}'
                    
                }
            },
            j_neb_lollypop = {
                name = 'Lollypop',
                text = {
                    '{C:attention}Next scored{} card',
                    'becomes {C:dark_edition}Polychrome{}'
                    
                }
            },
            j_neb_rockcandy = {
                name = 'Rock Candy',
                text = {
                    '{C:attention}All held{} cards',
                    'become {C:dark_edition}Foil{} when',
                    'hand is played'
                    
                }
            },
            j_neb_tiledjoker = {
                name = 'Tiled Joker',
                text = {
                    'Gives {C:mult}+#1#{} Mult for',
                    'each {C:attention}Tiled Card{}',
                    'in your {C:attention}full deck',
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                    
                }
            },
            j_neb_crossstitch = {
                name = 'Cross Stitch',
                text = {
                    'Gives {X:mult,C:white}X#1#{} Mult for each',
                    'card with the {C:attention}Debuffed Card{}',
                    'Enhancement in your {C:attention}full deck',
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                    
                }
            },
            j_neb_warning = {
                name = 'Warning',
                text = {
                    'Gives {X:mult,C:white}X#1#{} Mult,',
                    'Multiply this value by {X:mult,C:white}X#2#{}',
                    'for each "scoring"',
                    '{C:attention}debuffed{} card'
                }
            },
            j_neb_pulsar = {
                name = 'Pulsar',
                text = {
                    "Multiply this Joker's Mult by",
                    '{X:mult,C:white}X#2#{} Mult for each {C:clubs}Clubs{} card',
                    'discarded {C:attention}this round{}',
                    '{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)'
                }
            },
            j_neb_pyth = {
                name = 'Pythadodendron',
                text = {
                    "Multiply this Joker's Mult by",
                    '{X:mult,C:white}X#2#{} Mult for each {C:diamonds}Diamonds{} card',
                    'played and scored {C:attention}this round{}',
                    '{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)'
                }
            },
            j_neb_sokra = {
                name = 'Sokra',
                text = {
                    "{X:mult,C:white}X#1#{} Mult for each",
                    'Scored {C:spades}spades{} card'
                }
            },
            j_neb_avron = {
                name = 'Avron',
                text = {
                    "{X:mult,C:white}X#1#{} Mult for",
                    'each {C:hearts}Hearts{} card',
                    '{C:attention}held in hand{}'
                }
            },
            j_neb_divorce = {
                name = 'Divorce Cake',
                text = {
                    'If played hand is a {C:attention}Pair{}',
                    'All scored cards gain',
                    '{C:attention}Debuffed Card{}',
                    '{C:inactive} (#1# hands left)'
                }
            },
            j_neb_manual = {
                name = 'Instruction Manual',
                text = {
                    'If played hand contains at least',
                    '{C:attention}three{} scoring {C:attention}#1# of {V:1}#2#{},',
                    'create a {C:dark_edition}Negative{} {C:spectral}The Soul{}',
                    'and {C:attention}Self Destruct{}',
                    '{C:inactive} (Rank and Suit change at end of round)'
                }
            }
            

            
            --[[ j_neb_ledsign = {
                name = 'Those Red LED Signs That Are Always Broken For Some Reason',
                text = {
                    '{C:mult}+#1#{} Mult for each',
                    'played {C:attention}Debuffed{} {C:hearts}Hearts{} card'
                }
            }, ]]
        },
        Enhanced = {
            m_neb_sticky = {
                name = 'Sticky Note',
                text = {
                    'Always scores'
                }
            },
            m_neb_tiled = {
                name = 'Tiled Card',
                text = {
                    '{C:attention}Retriggers{} #1# times',
                    'no rank or suit'
                }
            },
            m_neb_debuffedcard = {
                name = 'Debuffed Card',
                text = {
                    '{C:attention}Debuffs{} self'
                }
            }
        },
        Tarot = {
            c_neb_dungeon = {
                name = 'The Dungeon',
                text = {
                    '"Enhances" {C:attention}#1#',
                    "selected cards to",
                    "{C:attention}#2#s",
                }
            },
            c_neb_questgiver = {
                name = 'The Questgiver',
                text = {
                    'Enhances {C:attention}#1#',
                    "selected cards to",
                    "{C:attention}#2#s",
                }
            }
        }
        
    },
    misc = {
        dictionary = {
            neb_eated_ex = 'Eated!',
            neb_divorced = 'Divorced!',
            neb_built = 'Built!'
        }
    }
}