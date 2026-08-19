SMODS.Joker {
    key = 'cereal',
    atlas = 'nebulajokers',
    pos = {
        x = 9,
        y = 2
    },
    config = { extra = { rounds = 3, chips = 0, chipsscalar = 3, mult = 0 , multscalar = 1, toggle = 0} },
    rarity = 2,
    perishable_compat = false,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.rounds, card.ability.extra.chips, card.ability.extra.chipsscalar, card.ability.extra.mult, card.ability.extra.multscalar, card.ability.extra.toggle
            }
        }
    end,
    calculate = function(self, card, context)
        if context.discard and not context.blueprint and card.ability.extra.rounds >= 1 then
            SMODS.scale_card(card,{
                        ref_table = card.ability.extra,
                        ref_value = 'chips',
                        scalar_value = 'chipsscalar',
                        message_colour = G.C.ATTENTION,
                })
        end
        if context.before and not context.blueprint and card.ability.extra.rounds >= 1 then
            for k, v in ipairs(context.scoring_hand) do
                G.E_MANAGER:add_event(Event({
                            delay = 0.5,
                            func = function()
                                v:juice_up()
                                return true
                            end
                        }))
                    SMODS.scale_card(card,{
                        ref_table = card.ability.extra,
                        ref_value = 'mult',
                        scalar_value = 'multscalar',
                        message_colour = G.C.ATTENTION,
                    })
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual and card.ability.extra.rounds >= 1 then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
        end
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual and card.ability.extra.rounds < 1 and card.ability.extra.toggle == 0 then
            card.ability.extra.rounds = 0
            card.ability.extra.toggle = 1
            return {
                message = localize('neb_eated_ex')
            }
        end
    end
}