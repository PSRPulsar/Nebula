SMODS.Consumable {
    key = 'neb_d12',
    set = 'neb_dice',
    atlas = 'nebulaconsumables',
    pos = {x=10, y=1},
    soul_pos = {x=0,y=7},
    use = function(self, card, area)
        local rolltable = {1,2,3,4,5,6,7,8,9,10,11,12}
        local roll = pseudorandom_element(rolltable, 'neb_d12')
        
         G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1.0,
            func = function()
                card:juice_up(0.3, 0.5)
                card.children.floating_sprite:set_sprite_pos({ x = roll, y = 7 })
                return true
            end}))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 2.0,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                local joker_target = pseudorandom_element(G.jokers.cards, 'neb_d12_joker')
                joker_target.ability.extra_value = joker_target.ability.extra_value or 0
                joker_target.ability.extra_value = joker_target.ability.extra_value + roll
                joker_target:set_cost()
                joker_target:juice_up(0.3, 0.5)
                return true
            end}))
        
            
    end,
    can_use = function(self, card)
      return #G.jokers.cards >= 1
    end
}