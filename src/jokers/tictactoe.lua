SMODS.Joker {
    key = 'tictactoe',
    atlas = 'nebulajokers',
    pos = {
        x = 5,
        y = 4
    },
    config = { extra = { xmult = 2 } },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
            }
        }
    end,
    calculate = function(self, card, context)
        local debuffed = 0
        local scoring = 0
        if context.joker_main and not context.blueprint then
            for _, pcard in ipairs(context.scoring_hand) do
                if pcard.debuff then
                        debuffed = debuffed + 1
                end
            end
        end
        if context.joker_main and not context.blueprint then
            for _, pcard in ipairs(context.scoring_hand) do
                if not pcard.debuff then
                        scoring = scoring + 1
                end
            end
        end
        if context.joker_main and debuffed >= 1 and scoring >= 1 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}