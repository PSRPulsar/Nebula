--[[ SMODS.Joker {
    key = 'ledsign',
    atlas = 'nebulajokers',
    pos = {
        x = 3,
        y = 2
    },
    config = { extra = { mult = 10 } },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
            }
        }
    end,
    calculate = function(self, card, context)
        local debuffhearts = 0
        if context.joker_main and not context.blueprint then
            for _, pcard in ipairs(context.full_hand) do
                if pcard.debuff and pcard.is_suit('Hearts', true) then
                    debuffhearts = debuffhearts + 1
                end
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult * debuffhearts
            }
        end
    end
} ]]