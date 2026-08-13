SMODS.Joker {
    key = 'finrock',
    atlas = 'nebulajokers',
    pos = {
        x = 1,
        y = 4
    },
    config = { extra = { repetitions = 1 } },
    rarity = 2,
    cost = 6,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and ( SMODS.has_no_rank(context.other_card) or SMODS.has_no_suit(context.other_card) ) then
            return {
                    repetitions = card.ability.extra.repetitions
                }
        end
    end
}