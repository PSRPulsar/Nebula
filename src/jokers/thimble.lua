SMODS.Joker {
    key = 'thimble',
    atlas = 'nebulajokers',
    pos = {
        x = 1,
        y = 2
    },
    config = { extra = { chips = 0, scalar = 1 } },
    rarity = 1,
    cost = 5,
    perishable_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.scalar
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            SMODS.scale_card(card,{
                ref_table = card.ability.extra,
                ref_value = 'chips',
                scalar_value = 'scalar',
                message_colour = G.C.ATTENTION
            })
        end
        if context.joker_main then
            return {
				chips = card.ability.extra.chips,
			}
        end
    end
}