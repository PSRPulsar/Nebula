SMODS.Joker {
    key = 'pulsar',
    atlas = 'nebulajokers',
    pos = {
        x = 6,
        y = 5
    },
    soul_pos = { x = 6, y = 6 },
    config = { extra = { xmult = 1, scalar = 1.25, reset = 1} },
    rarity = 4,
    cost = 20,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult, card.ability.extra.scalar, card.ability.extra.reset
            }
        }
    end,
    calculate = function(self, card, context)
        if context.discard and not context.blueprint and context.other_card:is_suit('Clubs') then
            SMODS.scale_card(card,{
                        ref_table = card.ability.extra,
                        ref_value = 'xmult',
                        scalar_value = 'scalar',
                        message_colour = G.C.ATTENTION,
                        operation = "X"
                })
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            card.ability.extra.xmult = card.ability.extra.reset
            return {
                message = localize('k_reset')
            }
        end
    end
}