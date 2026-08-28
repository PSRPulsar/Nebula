SMODS.Joker {
    key = 'hexaflexagon',
    atlas = 'nebulajokers',
    pos = {
        x = 7,
        y = 0
    },
    pixel_size = { h = 67, w = 61 },
    config = { extra = { hands_left = 2, max = 2} },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands_left, card.ability.extra.max
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.hands_left == 0 and card.ability.extra.hands_left > 0 then
            ease_hands_played(1)
            card.ability.extra.hands_left = card.ability.extra.hands_left - 1
            card:juice_up()
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.hands_left = card.ability.extra.max
            return {
                message = localize('k_reset')
            }
        end
	end
}