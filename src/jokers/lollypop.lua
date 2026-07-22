SMODS.Joker {
    key = 'lollypop',
    atlas = 'nebulajokers',
    pos = {
        x = 3,
        y = 5
    },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
	end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for _, scored_card in ipairs(context.scoring_hand) do
                scored_card:set_edition('e_polychrome', nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("polychrome1", 1.2 , 0.4)
                        scored_card:juice_up()
                        return true
                    end, 
                    }))
                return {
                    sound = 'polychrome1' -- i have absolutely no idea why doing this makes only the first card get the edition, but if it works it works (this isn't even actually playing sound or anything)
                }
             end
        end
        if context.after and #context.scoring_hand > 0 and not context.blueprint then
            SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('neb_eated_ex'),
                    colour = G.C.CHIPS
                }
        end
    end
}
