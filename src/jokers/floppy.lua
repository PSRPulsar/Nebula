SMODS.Joker {
    key = 'floppydisk',
    atlas = 'nebulajokers',
    pos = {
        x = 1,
        y = 0
    },
    pixel_size = { h = 71 },
    config = { extra = { chips = 0, scalar = 10 } },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.scalar
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and #G.consumeables.cards > 0 then
            SMODS.scale_card (card,{
                ref_table = card.ability.extra,
                ref_value = 'chips',
                scalar_value = 'scalar',
                message_colour = G.C.ATTENTION,
                operation = function(ref_table, ref_value, initial, change)
                    ref_table[ref_value] = initial + #G.consumeables.cards * change
                end
            })
        end
        if context.joker_main then
            return {
				chips = card.ability.extra.chips,
			}
        end
    end
}