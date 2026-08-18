SMODS.Joker {
    key = 'magazine',
    atlas = 'nebulajokers',
    pos = {
        x = 3,
        y = 3
    },
    config = { extra = { xmult = 2, value_requirement = 20 } },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local sell_cost = 0
        for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
                sell_cost = sell_cost + joker.sell_cost
        end
        return {
            vars = {
                card.ability.extra.xmult, card.ability.extra.value_requirement, sell_cost
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main  then
            local sell_cost = 0
            for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do
                sell_cost = sell_cost + joker.sell_cost
            end
            if sell_cost >= card.ability.extra.value_requirement then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}