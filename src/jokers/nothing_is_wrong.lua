SMODS.Joker {
    key = 'nothing_is_wrong',
    atlas = 'nebulajokers',
    pos = {
        x = 1,
        y = 1
    },
    config = { extra = { mult = 15, poker_hand = 'Guh'  } }, -- Guh Hand
    rarity = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_name == card.ability.extra.poker_hand then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.after then
            card.ability.extra.poker_hand = context.scoring_name
        end
    end
}