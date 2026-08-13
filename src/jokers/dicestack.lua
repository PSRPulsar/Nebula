SMODS.Joker {
    key = 'dicestack',
    atlas = 'nebulajokers',
    pos = {
        x = 4,
        y = 3
    },
    config = { extra = { chips = 0, scalar = 20 } },
    rarity = 2,
    cost = 7,
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
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'neb_dice' then
            SMODS.scale_card (card,{
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