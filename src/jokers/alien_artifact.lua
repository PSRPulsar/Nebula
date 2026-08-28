SMODS.Joker {
    key = 'alien_artifact', --would be suprised if a single person playing this mod Other than me gets what in the Worlds this is referencing
    atlas = 'nebulajokers',
    pos = {
        x = 0,
        y = 2
    },
    pixel_size = { w = 59 },
    config = { extra = { xmult = 3, requirement = 9 } },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        local planets_used = 0
        for _, consumable_data in pairs(G.GAME.consumeable_usage) do
            if consumable_data.set == 'Planet' then
                planets_used =
                    planets_used + 1
            end
        end
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.requirement,
                planets_used
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local planets_used = 0
            for _, consumable_data in pairs(G.GAME.consumeable_usage) do
                if consumable_data.set == 'Planet' then
                    planets_used =
                        planets_used + 1
                end
            end
            if planets_used >= 9 then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}