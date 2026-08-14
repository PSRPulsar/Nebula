SMODS.Joker {
    key = 'artemis',
    atlas = 'nebulajokers',
    pos = {
        x = 0,
        y = 1
    },
    config = { extra = { hands = 2, odds = 2 } },
    rarity = 1,
    cost = 5,
    perishable_compat = false,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'neb_artemis')
        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.hands
            }
        }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == 'Planet' and SMODS.pseudorandom_probability(card, 'neb_artemis', 1, card.ability.extra.odds) then
            local _poker_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(handname) then
                    _poker_hands[#_poker_hands + 1] = handname
                end
            end
            for i=1, card.ability.extra.hands do
                local random_hand = pseudorandom_element(_poker_hands, pseudoseed('neb_artemis')) or "High Card"
                SMODS.upgrade_poker_hands({ hands = random_hand, from = card, level_up = 1})
            end
        end
    end
}