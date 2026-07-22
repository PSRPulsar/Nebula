SMODS.Joker {
    key = 'misfits',
    atlas = 'nebulajokers',
    pos = {
        x = 4,
        y = 2
    },
    config = { extra = { xmult= 3 } },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_name == 'High Card' and #context.scoring_hand == 5 then
            return {
				xmult = card.ability.extra.xmult,
			}
        end
    end
}