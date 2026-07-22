SMODS.Joker {
    key = "divorce", -- if you don't know what this is referencing, look up "spamton divorce cake"
    blueprint_compat = false,
    atlas = 'nebulajokers',
    rarity = 2,
    cost = 6,
    pos = { x = 5, y = 0 },
    config = { extra = { hands = 10, scalar = 1 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_neb_debuffedcard
        return { vars = { card.ability.extra.hands, card.ability.extra.scalar} }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint and context.scoring_name == 'Pair' then
            for _, scored_card in ipairs(context.scoring_hand) do
                    scored_card:set_ability('m_neb_debuffedcard', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
            end
            return {
                    message = localize('neb_divorced'),
                    colour = G.C.MULT
                }
        end
        if context.after and not context.blueprint then
            if card.ability.extra.hands >= 1 then
            SMODS.scale_card(card,{
                        ref_table = card.ability.extra,
                        ref_value = 'hands',
                        scalar_value = 'scalar',
                        message_colour = G.C.ATTENTION,
                        operation = "-"
                })
            else
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('neb_eated_ex'),
                    colour = G.C.MULT
                }
            end
        end
    end
}