SMODS.Joker {
    key = 'combo_meal',
    atlas = 'nebulajokers',
    pos = {
        x = 0,
        y = 0
    },
    config = { extra = { adding = 2, rounds = 5} },
    rarity = 2,
    cost = 5, --this is actually really cheap but i can't be assed editing the sprite to say 6.99 instead
    attributes = {'food'},
    blueprint_compat = false,
    eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.adding, card.ability.extra.rounds
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.adding
        ease_discard(card.ability.extra.adding)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.adding
        ease_hands_played(card.ability.extra.adding)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.adding
        ease_discard(-card.ability.extra.adding)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.adding
        ease_hands_played(-card.ability.extra.adding)
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and card.ability.extra.rounds <= 0 then
            SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('neb_eated_ex'),
                    colour = G.C.RED
                }
        end
	end
}