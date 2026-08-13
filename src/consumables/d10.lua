SMODS.Consumable {
    key = 'neb_d10',
    set = 'neb_dice',
    atlas = 'nebulaconsumables',
    pos = {x=9, y=1},
    config = {extra = {dollars = -1 }},
    soul_pos = {x=0,y=6},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,
    use = function(self, card, area)
        local rolltable = {1,2,3,4,5,6,7,8,9,10}
        local roll = pseudorandom_element(rolltable, 'neb_d10')
        
         G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1.0,
            func = function()
                card:juice_up(0.3, 0.5)
                card.children.floating_sprite:set_sprite_pos({ x = roll, y = 6 })
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
        local random_edition = SMODS.poll_edition { key = "neb_d10edition", guaranteed = true, no_negative = false }
        SMODS.add_card { set = "Joker", edition = random_edition }
        ease_dollars(card.ability.extra.dollars * roll)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end

}