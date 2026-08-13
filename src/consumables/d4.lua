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
            delay = 2.0,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                
                return true
            end}))
           for i = 1, roll do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                func = function()
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Planet', key_append = "neb_d4" })
                        card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)

    end,
    can_use = function(self, card)
                return true 
        end

}