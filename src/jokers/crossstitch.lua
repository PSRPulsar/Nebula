SMODS.Joker {
    key = "crossstitch",
    rarity = 2,
    cost = 7,
    atlas = 'nebulajokers',
    pos = {
        x = 4,
        y = 4
    },
    config = { extra = { xmult = 0.1 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_neb_debuffedcard

        local tally = 0
        local literallyjustthenumberone = 1
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_neb_debuffedcard') then tally = tally + 1 end
            end
        end
        return { vars = { card.ability.extra.xmult, literallyjustthenumberone + card.ability.extra.xmult * tally } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local tally = 0
            local literallyjustthenumberone = 1
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_neb_debuffedcard') then tally = tally + 1 end
            end
            return {
                xmult = literallyjustthenumberone + card.ability.extra.xmult * tally -- why the hell does this not like it if i do it with just the number 1 but it's fine if i use a variable that is 1?????
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_neb_debuffedcard') then
                return true
            end
        end
        return false
    end
}