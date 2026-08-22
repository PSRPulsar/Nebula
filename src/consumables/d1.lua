SMODS.Consumable {
    key = 'neb_d1',
    set = 'neb_dice',
    atlas = 'nebulaconsumables',
    pos = {x=8, y=0},
    config = {extra = { chips = 55 }},
    soul_pos = {x=3,y=0},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,
    use = function(self, card, area)
        local _card = pseudorandom_element(G.hand.cards, 'neb_d1') --  card.children.floating_sprite:set_sprite_pos({ x = 1, y = 2 })     <- code line for soul changing, uneeded because d1 can only roll 1
        _card.ability.perma_bonus = _card.ability.perma_bonus or 0
		_card.ability.perma_bonus = _card.ability.perma_bonus + card.ability.extra.chips
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                _card:juice_up(0.3, 0.5)
                
                return true
            end}))
    end,
    can_use = function(self, card)
        if G.hand and G.hand.cards and #G.hand.cards > 0 then
                return true 
        else
            return false
        end
    end

}