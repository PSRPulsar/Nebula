SMODS.Joker {
    key = 'thejoker',
    atlas = 'nebulathejoker',
    pos = {
        x = 0,
        y = 0
    },
    config = { extra = { xmult = 2, poker_hand = 'High Card' } },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
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
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'neb_thejoker')
    end,
    calculate = function(self, card, context)
        if context.debuff_hand and context.scoring_name == card.ability.extra.poker_hand and not context.blueprint then
            return {
                debuff = true,
                debuff_source = card
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local _poker_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(handname) and handname ~= card.ability.extra.poker_hand then
                    _poker_hands[#_poker_hands + 1] = handname
                end
            end
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, 'neb_thejoker')
            return {
                message = localize('k_reset')
            }
        end
    end
}