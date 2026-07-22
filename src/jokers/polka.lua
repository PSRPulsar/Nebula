SMODS.Joker {
    key = 'polka',
    atlas = 'nebulajokers',
    pos = {
        x = 2,
        y = 4
    },
    config = { extra = { chips = 30 } },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local spades, diamonds = 0, 0
            for k, v in pairs(context.scoring_hand) do
                if v:is_suit('Spades') then
                    spades = spades+1
                end
                if v:is_suit('Diamonds') then
                    diamonds = diamonds+1
                end
            end
            if context.other_card:is_suit('Spades') and diamonds > 0 then
                return {chips = card.ability.extra.chips*diamonds}
            end
            if context.other_card:is_suit('Diamonds') and spades > 0 then
                return {chips = card.ability.extra.chips*spades}
            end
        end
    end
}