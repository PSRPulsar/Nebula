SMODS.Joker {
    key = 'puzzle',
    atlas = 'nebulajokers',
    pos = {
        x = 3,
        y = 1
    },
    pixel_size = { h = 80 },
    config = { extra = { xmult = 1, scalar = 0.25, odds = 3 } },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'neb_puzzle')
        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.xmult,
                card.ability.extra.scalar
            }
        }
    end,
    calculate = function(self, card, context)
        if context.stay_flipped and context.to_area == G.hand and SMODS.pseudorandom_probability(card, 'neb_puzzle', 1, card.ability.extra.odds) then
            return {
                stay_flipped = true
            }
        end
        if context.before and next(context.poker_hands['Straight']) then
            SMODS.scale_card(card,{
                ref_table = card.ability.extra,
                ref_value = 'xmult',
                scalar_value = 'scalar',
                message_colour = G.C.ATTENTION
            })
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}