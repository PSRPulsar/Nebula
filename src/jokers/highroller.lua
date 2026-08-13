SMODS.Joker {
    key = 'highroller',
    atlas = 'nebulajokers',
    pos = {
        x = 1,
        y = 3
    },
    config = { extra = { odds = 4 } },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'neb_highroller')
        return {
            vars = {
                numerator, denominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.reroll_shop and SMODS.pseudorandom_probability(card, 'neb_highroller', 1, card.ability.extra.odds) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'neb_dice',
                            key_append = 'neb_highroller'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('neb_dice_added'),
                }
        end
    end
}