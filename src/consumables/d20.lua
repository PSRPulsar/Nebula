SMODS.Consumable {
    key = 'neb_d20',
    set = 'neb_dice',
    atlas = 'nebulaconsumables',
    pos = {x=5, y=2},
    soul_pos = {x=0,y=8},
    use = function(self, card, area)
        local rolltable = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20} -- imaging setting a range for numbers. real gamers just list every single number
        local roll = pseudorandom_element(rolltable, 'neb_d20')
        
         G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1.0,
            func = function()
                card:juice_up(0.3, 0.5)
                card.children.floating_sprite:set_sprite_pos({ x = roll, y = 8 })
                return true
            end}))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 2.0,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                
                return true
            end}))
            ease_dollars(roll)
    end,
    can_use = function(self, card)
                return true 
        end

}