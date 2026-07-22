SMODS.Joker {
    key = 'normalmap',
    atlas = 'nebulajokers',
    pos = {
        x = 6,
        y = 0
    },
    config = { extra = { chips = 35 } },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.ability.name ~= "Default Base" then
            return {
                     chips = card.ability.extra.chips,
                }
        end
    end
}