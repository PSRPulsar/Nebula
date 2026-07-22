SMODS.Joker {
    key = 'avron',
    atlas = 'nebulajokers',
    pos = {
        x = 9,
        y = 5
    },
    soul_pos = { x = 9, y = 6 },
    config = { extra = { xmult = 1.5 } },
    rarity = 4,
    cost = 20,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and context.other_card:is_suit('Hearts') then
            return {
                     xmult = card.ability.extra.xmult,
                }
        end
    end
}