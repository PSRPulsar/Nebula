SMODS.Joker {
    key = 'square_hole',
    atlas = 'nebulajokers',
    pos = {
        x = 4,
        y = 0
    },
    config = { extra = { discards = 1, odds = 4 } },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'neb_square_hole')
        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.discards
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 4 and SMODS.pseudorandom_probability(card, 'neb_square_hole', 1, card.ability.extra.odds) then
            ease_discard(card.ability.extra.discards) --cannot believe it was this simple
                return {
                    message = localize('neb_plus_discard'),
                    colour = G.C.RED
                }
        end
	end
}