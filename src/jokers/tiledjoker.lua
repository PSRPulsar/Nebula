SMODS.Joker {
    key = "tiledjoker",
    rarity = 2,
    cost = 7,
    atlas = 'nebulajokers',
    pos = {
        x = 1,
        y = 5
    },
    config = { extra = { mult = 3 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_neb_tiled

        local tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_neb_tiled') then tally = tally + 1 end
            end
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * tally } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_neb_tiled') then tally = tally + 1 end
            end
            return {
                mult = card.ability.extra.mult * tally
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_neb_tiled') then
                return true
            end
        end
        return false
    end
}