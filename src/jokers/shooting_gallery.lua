SMODS.Joker {
    key = 'shooting_gallery',
    atlas = 'nebulajokers',
    pos = {
        x = 4,
        y = 1
    },
    config = { extra = { xmult = 1, scalar = 0.2, rank = 'Ace'} },
    rarity = 2,
    cost = 7,
    perishable_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.scalar,
                card.ability.extra.rank
            }
        }
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local ranks = {}
                for rank, _ in pairs(SMODS.Ranks) do
                    if rank ~= card.ability.extra.rank then
                        ranks[#ranks + 1] = rank
                    end
                end
            card.ability.extra.rank = pseudorandom_element(ranks, 'neb_gallery')
    end,
    calculate = function(self, card, context)
        if context.before and #context.full_hand == 1 and context.full_hand[1].base.value == card.ability.extra.rank then
            local ranks = {}
                for rank, _ in pairs(SMODS.Ranks) do
                    if rank ~= card.ability.extra.rank then
                        ranks[#ranks + 1] = rank
                    end
                end
            card.ability.extra.rank = pseudorandom_element(ranks, 'neb_gallery')
            
            SMODS.scale_card(card,{
                ref_table = card.ability.extra,
                ref_value = 'xmult',
                scalar_value = 'scalar',
                message_colour = G.C.ATTENTION
            })
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}