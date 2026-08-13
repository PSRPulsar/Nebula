SMODS.Consumable {
    key = 'neb_d0',
    set = 'Spectral',
    hidden = true,
    soul_rate = 0.003,
    soul_set = 'neb_dice',
    atlas = 'nebulaconsumables',
    pos = {x=7, y=0},
    soul_pos = {x=4,y=0},
    config = {extra = { targets = 3 }},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return {
            vars = {
                card.ability.extra.targets
            }
        }
    end,
    use = function(self, card, area)
            local targed_cards = {}
            local temp_hand = {}

            for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
            table.sort(temp_hand,
                function(a, b)
                    return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
                end
            )

            pseudoshuffle(temp_hand, 'neb_d0_targeting') 
            for i = 1, card.ability.extra.targets do targed_cards[#targed_cards + 1] = temp_hand[i] 
            end
            for k, v in pairs(targed_cards) do
                v:set_edition('e_negative', nil, true)
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.25,
                func = function()
                play_sound('negative', 1.5 , 0.4)
                v:juice_up(0.3, 0.5)
                
                return true
            end}))
        end
    end,
    can_use = function(self, card)
        if G.hand and G.hand.cards and #G.hand.cards > 0 then
                return true 
        else
            return false
        end
    end

}