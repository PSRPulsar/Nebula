SMODS.Joker {
    key = 'candycane',
    atlas = 'nebulajokers',
    pos = {
        x = 4,
        y = 5
    },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
	end,
    calculate = function(self, card, context)
         if context.before and not context.blueprint then
            for _, scored_card in ipairs(context.scoring_hand) do
                scored_card:set_edition('e_holo', nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("holo1", 1.2 * 1.58, 0.4)
                        scored_card:juice_up()
                        return true
                        
                    end
                    }))
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