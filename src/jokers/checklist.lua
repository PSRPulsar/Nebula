SMODS.Joker {
    key = 'checklist',
    atlas = 'nebulajokers',
    pos = {
        x = 7,
        y = 3
    },
    config = { extra = { chips = 0, scalar = 8, reset = 0 } },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.scalar,
                card.ability.extra.reset
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for _, pcard in ipairs(G.hand.cards) do
                if pcard.debuff then 
                    G.E_MANAGER:add_event(Event({
                            delay = 0.5,
                            func = function()
                                pcard:juice_up()
                                return true
                            end
                        }))
                    SMODS.scale_card(card,{
                        ref_table = card.ability.extra,
                        ref_value = 'chips',
                        scalar_value = 'scalar',
                        message_colour = G.C.ATTENTION
                    })
                end
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            card.ability.extra.chips = card.ability.extra.reset
            return {
                message = localize('k_reset')
            }
        end
    end
}