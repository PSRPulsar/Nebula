SMODS.Joker {
    key = 'weighted',
    atlas = 'nebulajokers',
    pos = {
        x = 0,
        y = 3
    },
    config = { extra = { odds = 2, toggle = 0 } },
    rarity = 2,
    cost = 7,
    perishable_compat = false,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'neb_weighted')
        return {
            vars = {
                numerator, denominator , card.ability.extra.toggle
            }
        }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'neb_dice' and card.ability.extra.toggle == 0 and SMODS.pseudorandom_probability(card, 'neb_weighted', 1, card.ability.extra.odds) then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            card.ability.extra.toggle = card.ability.extra.toggle + 1
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
        if context.end_of_round then
			card.ability.extra.toggle = card.ability.extra.toggle * 0
        end
    end
}