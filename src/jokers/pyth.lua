SMODS.Joker {
    key = 'pyth',
    atlas = 'nebulajokers',
    pos = {
        x = 7,
        y = 5
    },
    soul_pos = { x = 7, y = 6 },
    config = { extra = { xmult = 1, scalar = 1.3, reset = 1} },
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
        if context.joker_main and not context.blueprint then
            for k, v in ipairs(context.scoring_hand) do
                if v:is_suit('Diamonds') then
                    SMODS.scale_card(card,{
                        ref_table = card.ability.extra,
                        ref_value = 'xmult',
                        scalar_value = 'scalar',
                        message_colour = G.C.ATTENTION,
                        operation = "X"
                    })
                end
            end
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