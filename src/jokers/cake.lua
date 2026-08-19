SMODS.Joker {
    key = 'cake',
    atlas = 'nebulajokers',
    pos = {
        x = 2,
        y = 5
    },
    rarity = 3,
    cost = 7,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
	end,
    calculate = function(self, card, context)
        if context.buying_card and context.card ~= card and context.card.ability.set == "Joker" then
				context.card:set_edition("e_polychrome", true)
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('neb_eated_ex'),
                    colour = G.C.MULT
                }
        end
    end
}