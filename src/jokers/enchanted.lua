SMODS.Joker {
    key = 'enchanted',
    atlas = 'nebulajokers',
    pos = {
        x = 2,
        y = 1
    },
    config = { extra = { sell_value = 3} },
    rarity = 2,
    cost = 5,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.sell_value
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                local other_joker
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then 
                        other_joker = G.jokers.cards[i + 1]
                    end
                end
                  if other_joker.set_cost then
                        other_joker.ability.extra_value = (other_joker.ability.extra_value or 0) + card.ability.extra.sell_value
                    other_joker:set_cost()
                  end
              return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end
}