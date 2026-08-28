SMODS.Consumable {
    key = 'neb_d4',
    set = 'neb_dice',
    atlas = 'nebulaconsumables',
    pos = {x=5, y=1},
    soul_pos = {x=0,y=2},
    use = function(self, card, area)
        local rolltable = {1,2,3,4}
        local roll = pseudorandom_element(rolltable, 'neb_d4')
        
         G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1.0,
            func = function()
                card:juice_up(0.3, 0.5)
                card.children.floating_sprite:set_sprite_pos({ x = roll, y = 2 })
                return true
            end}))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1
            }))
            local _poker_hands = {}
            for handname, _ in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(handname) then
                    _poker_hands[#_poker_hands + 1] = handname
                end
            end
            for i=1, roll do
                local random_hand = pseudorandom_element(_poker_hands, pseudoseed('neb_d4')) or "High Card"
                SMODS.upgrade_poker_hands({ hands = random_hand, from = card, level_up = 1})
            end
        delay(0.6)

    end,
    can_use = function(self, card)
                return true 
        end

}