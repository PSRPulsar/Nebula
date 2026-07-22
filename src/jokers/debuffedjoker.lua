SMODS.Joker {
    key = 'debuffedjoker',
    atlas = 'nebulajokers',
    pos = {
        x = 6,
        y = 3
    },
    config = { extra = { mult = 0, scalar = 4, reset = 0 } },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.scalar,
                card.ability.extra.reset
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not context.blueprint then
            for _, pcard in ipairs(context.scoring_hand) do
                if pcard.debuff then 
                    SMODS.scale_card(card,{
                        ref_table = card.ability.extra,
                        ref_value = 'mult',
                        scalar_value = 'scalar',
                        message_colour = G.C.ATTENTION
                    })
                end
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            card.ability.extra.mult = card.ability.extra.reset
            return {
                message = localize('k_reset')
            }
        end
    end
}