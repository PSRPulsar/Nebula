SMODS.Joker {
    key = 'bottle_gourd',
    atlas = 'nebulajokers',
    pos = {
        x = 2,
        y = 2
    },
    rarity = 2,
    cost = 7,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    config = { extra = { chips = 0, scalar = 1, hands = 5 } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.scalar,
                card.ability.extra.hands
            }
        }
    end,
    calculate = function(self, card, context)
         if context.before and not context.blueprint and card.ability.extra.hands >= 1 then
            local chip_tally = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if not scored_card.debuff then
                    if not SMODS.has_no_rank(scored_card) and not SMODS.has_no_suit(scored_card) then
                        chip_tally = chip_tally + scored_card.base.nominal
                    end
                    chip_tally = chip_tally + (scored_card.ability.perma_bonus or 0)
                    G.E_MANAGER:add_event(Event({
                            delay = 0.5,
                            func = function()
                                scored_card:juice_up()
                                return true
                            end
                        }))
                    SMODS.scale_card (card,{
                        ref_table = card.ability.extra,
                        ref_value = 'chips',
                        scalar_value = 'scalar',
                        message_colour = G.C.ATTENTION,
                        operation = function(ref_table, ref_value, initial, change)
                            ref_table[ref_value] = initial + chip_tally * change
                        end
                    
                    })
                end
                chip_tally = 0 --reset value before the next card is checked
             end
        end
        if context.after and card.ability.extra.hands == 1 then
            card.ability.extra.chips = card.ability.extra.chips / 5
            card.ability.extra.chips  = math.floor(card.ability.extra.chips + 0.5)
            for k, v in ipairs(context.scoring_hand) do
                v.ability.perma_bonus = v.ability.perma_bonus or 0
                v.ability.perma_bonus = v.ability.perma_bonus + card.ability.extra.chips
                G.E_MANAGER:add_event(Event({
                        delay = 2,
                        func = function()
                            v:juice_up()
                            card:juice_up()
                            return true
                        end
                    }))
			end
            SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('neb_eated_ex'),
                    colour = G.C.CHIPS
                }
        end
        if context.after and card.ability.extra.hands > 1 then
            card.ability.extra.hands = card.ability.extra.hands - 1
        end
    end
}