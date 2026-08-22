SMODS.Joker {
    key = 'sulfur',
    atlas = 'nebulajokers',
    pos = {
        x = 0,
        y = 4
    },
    config = { extra = { mult = 8 } },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card.ability.name ~= "Default Base" then
            return {
                     mult = card.ability.extra.mult,
                }
        end
    end
}