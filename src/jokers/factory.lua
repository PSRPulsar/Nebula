SMODS.Joker {
    key = 'factory',
    atlas = 'nebulajokers',
    pos = {
        x = 8,
        y = 3
    },
    config = { extra = { odds = 2 } },
    rarity = 2,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'neb_factory')
        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.hands
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_ability and context.unchanged and G.P_CENTERS[context.new].set == 'Enhanced' and SMODS.pseudorandom_probability(card, 'neb_factory', 1, card.ability.extra.odds) then
            local random_edition = SMODS.poll_edition { key = "neb_factory", guaranteed = true, no_negative = true }
            context.other_card:set_edition(random_edition)
        end
    end
}