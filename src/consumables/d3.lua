SMODS.Consumable {
    key = 'neb_d3',
    set = 'neb_dice',
    atlas = 'nebulaconsumables',
    pos = {x=10, y=0},
    soul_pos = {x=0,y=1},
    use = function(self, card, area)
        local rolltable = {1,2,3}
        local roll = pseudorandom_element(rolltable, 'neb_d3')
        
         G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1.0,
            func = function()
                card:juice_up(0.3, 0.5)
                card.children.floating_sprite:set_sprite_pos({ x = roll, y = 1 })
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
                func = (function()
                local _tag_key = get_next_tag_key("neb_d3")
                local _tag = Tag(_tag_key)
                if _tag.key == "tag_orbital" then
                    local visible_hands = {}
                    for k, _ in pairs(G.GAME.hands) do
                        if SMODS.is_poker_hand_visible(k) then
                            visible_hands[#visible_hands + 1] = k
                        end
                    end
                    _tag.ability.orbital_hand = pseudorandom_element(visible_hands, pseudoseed('neb_tag_orbital'))
                end
                add_tag(_tag)
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end)
            }))
            end

    end,
    can_use = function(self, card)
                return true 
        end

}