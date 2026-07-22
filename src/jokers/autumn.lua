SMODS.Joker {
    key = 'autumn',
    atlas = 'nebulajokers',
    pos = {
        x = 7,
        y = 4
    },
    config = { extra = { repetitions = 1 } },
    rarity = 3,
    cost = 8,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card:is_suit('Clubs')then
            return {
                    repetitions = card.ability.extra.repetitions
                }
        end
    end
}