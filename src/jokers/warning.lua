SMODS.Joker {
    key = 'warning',
    atlas = 'nebulajokers',
    pos = {
        x = 0,
        y = 6
    },
    config = { extra = { xmult = 1, multmult = 2} },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult, card.ability.extra.multmult
            }
        }
    end,
    calculate = function(self, card, context)
            local debuffed = 0
            if context.joker_main and not context.blueprint then
            for _, pcard in ipairs(context.scoring_hand) do
                if pcard.debuff then
                    debuffed = debuffed+1
                end
            end
        end
        if context.joker_main and not context.repetition and debuffed > 0 then
            return {
                xmult = card.ability.extra.xmult * card.ability.extra.multmult ^ debuffed
            }
        end
    end,
}