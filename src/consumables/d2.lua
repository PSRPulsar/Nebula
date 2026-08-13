SMODS.Consumable {
    key = 'neb_d2',
    set = 'neb_dice',
    atlas = 'nebulaconsumables',
    pos = {x=9, y=0},
    soul_pos = {x=0,y=0},

    use = function(self, card, area)
        local rolltable = {1,2}
        local roll = pseudorandom_element(rolltable, 'neb_d2')
        
         G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1.0,
            func = function()
                card:juice_up(0.3, 0.5)
                card.children.floating_sprite:set_sprite_pos({ x = roll, y = 0 })
                return true
            end}))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 2.0,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                
                return true
            end}))
            local targed_cards = {}
            local temp_hand = {}

            for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
            table.sort(temp_hand,
                function(a, b)
                    return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
                end
            )

            pseudoshuffle(temp_hand, 'neb_d2_target') 
            for i = 1, roll do targed_cards[#targed_cards + 1] = temp_hand[i] 
            end
            for k, v in pairs(targed_cards) do
                
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.25,
                func = function()
                local random_seal = SMODS.poll_seal {key = "neb_d2_seals", guaranteed = true}
                v:set_seal(random_seal, nil, true)
                play_sound('tarot1')
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