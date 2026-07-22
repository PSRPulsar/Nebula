SMODS.Joker {
    key = 'nuclear',
    atlas = 'nebulajokers',
    pos = {
        x = 5,
        y = 2
    },
    config = { extra = { poker_hand = 'High Card' , odds = 2 } },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'neb_nuclear')
        return {
            vars = {
                numerator,
                denominator,
                localize(card.ability.extra.poker_hand, 'poker_hands')
            }
        }
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {}
        for handname, _ in pairs(G.GAME.hands) do
            if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                _poker_hands[#_poker_hands + 1] = handname
            end
        end
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'neb_nuclear')
    end,
    calculate = function(self, card, context)
        if context.destroying_card and context.scoring_name == card.ability.extra.poker_hand and SMODS.pseudorandom_probability(card, 'neb_nuclear', 1, card.ability.extra.odds) then
                return {
                    remove = true
                }
            end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local _poker_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                    _poker_hands[#_poker_hands + 1] = handname
                end
            end
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'neb_nuclear')
            return {
                message = localize('k_reset')
            }
        end
    end
}