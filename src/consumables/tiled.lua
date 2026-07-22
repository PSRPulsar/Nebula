SMODS.Enhancement {
    key = 'tiled',
    atlas = 'nebulaenhancements',
    pos = { x = 2, y = 0 },
    config = {
        repetitions = 2
    },
    order = 3,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.repetitions } }
    end,
}