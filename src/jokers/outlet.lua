SMODS.Joker {
    key = 'outlet',
    atlas = 'nebulajokers',
    pos = {
        x = 8,
        y = 0
    },
    config = { extra = { mult = 20 } },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main  and context.scoring_hand then
            local enhanced = true
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].config.center == G.P_CENTERS.c_base then
                    enhanced = false
                end
            end
            if enhanced then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}