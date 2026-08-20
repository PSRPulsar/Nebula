SMODS.Joker {
    key = "bumper",
    rarity = 2,
    cost = 6,
    atlas = 'nebulajokers',
    pos = {
        x = 7,
        y = 1
    },
    config = { extra = { xmult = 0.5 } },
    loc_vars = function(self, info_queue, card)

        local tally = 0
        local literallyjustthenumberone = 1
        if G.playing_cards then
            for k, v in pairs(G.P_SEALS) do
                for x, y in pairs(G.playing_cards) do
                    if y.seal == v.key then
                    tally = tally + 1
                    break
                    end
                end
            end
        end
        return { vars = { card.ability.extra.xmult, literallyjustthenumberone + card.ability.extra.xmult * tally } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local tally = 0
            local literallyjustthenumberone = 1
            if G.playing_cards then
                for k, v in pairs(G.P_SEALS) do
                    for x, y in pairs(G.playing_cards) do
                        if y.seal == v.key then
                        tally = tally + 1
                        break
                        end
                    end
                end
            end
            return {
                xmult = literallyjustthenumberone + card.ability.extra.xmult * tally -- why the hell does this not like it if i do it with just the number 1 but it's fine if i use a variable that is 1?????
            }
        end
    end
}