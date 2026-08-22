SMODS.Joker {
    key = 'bingo',
    atlas = 'nebulajokers',
    pos = {
        x = 2,
        y = 3
    },
    config = { extra = { used = 0, requirement = 5,} },
    rarity = 2,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.used,
                card.ability.extra.requirement
            }
        }
    end,
    set_sprites =  function(self, card, front)
        if not G.SETTINGS.paused then
            if card.ability then
            if card.ability.extra.used > 0 and card.ability.extra.used <= 5  then
                G.E_MANAGER:add_event(Event({
                    blocakable = false,
                    func = (function()
                        card.children.center:set_sprite_pos({x = card.ability.extra.used, y = 6})
                        return true
                    end)
                }))
            elseif card.ability.extra.used > 5 then
                G.E_MANAGER:add_event(Event({
                    blocakable = false,
                    func = (function()
                        card.children.center:set_sprite_pos({x = 5, y = 6})
                        return true
                    end)
                }))
            end
        end
        end
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            card.ability.extra.used = card.ability.extra.used + 1
            if card.ability.extra.used <= card.ability.extra.requirement then
                card.children.center:set_sprite_pos({x = card.ability.extra.used, y = 6})
                card:juice_up()
                play_sound('gold_seal', 1.2, 0.4) --can you play sounds outside of events? probably right?
            end
            if card.ability.extra.used == card.ability.extra.requirement then
                return {
                    message = localize('neb_bingo'),
                    colour = G.C.MULT
                }
            end
            
        end
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES and card.ability.extra.used >= card.ability.extra.requirement end -- from vremade DNA
            juice_card_until(card, eval, true)
        end
        if context.before and G.GAME.current_round.hands_played == 0 and card.ability.extra.used >= card.ability.extra.requirement then
            local card_copy = SMODS.copy_card(context.scoring_hand[1], {area = G.hand})
            card_copy.states.visible = nil
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_copy:start_materialize()
                    return true
                end
            }))
            return {
                message = localize('k_copied_ex'),
                colour = G.C.MULT,
                func = function() -- This is for timing purposes, it runs after the message
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.calculate_context({ playing_card_added = true, cards = { card_copy } })
                            return true
                        end
                    }))
                end
            }
        end
        if context.end_of_round and not context.individual and not context.blueprint then
            card.ability.extra.used = 0
            return {
                message = localize('k_reset'),
            }
        end
    end
}