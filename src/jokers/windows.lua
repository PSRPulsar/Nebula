SMODS.Joker {
    key = 'windows',
    atlas = 'nebulajokers',
    pos = {
        x = 6,
        y = 1
    },
    config = { extra = { mult = 11 } },
    rarity = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local my_pos
            for i=1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                break
                end
            end
            if my_pos == #G.jokers.cards or my_pos == (#G.jokers.cards - 1) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}