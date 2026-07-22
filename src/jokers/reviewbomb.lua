SMODS.Joker {
    key = 'reviewbomb',
    atlas = 'nebulajokers',
    pos = {
        x = 2,
        y = 0
    },
    config = { extra = { dollars = 0, scalar = 1, reset = 0 } },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.scalar,
                card.ability.extra.reset
            }
        }
    end,
    calculate = function(self, card, context)
            local debuffed = 0
            if context.joker_main and not context.blueprint then
            for _, pcard in ipairs(context.scoring_hand) do
                if pcard.debuff then
                    debuffed = debuffed+1
                end
            end
        end
        if context.joker_main and not context.blueprint and not context.repetition and debuffed <= 2 then
            card.ability.extra.dollars = card.ability.extra.reset
            return {
                message = localize('k_reset')
            }
        end
        if context.joker_main and not context.blueprint and not context.repetition and debuffed >= 3 then
            SMODS.scale_card(card,{
                        ref_table = card.ability.extra,
                        ref_value = 'dollars',
                        scalar_value = 'scalar',
                        message_colour = G.C.ATTENTION
                    })
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.dollars > 0 then
            return card.ability.extra.dollars
        end
    end
}