SMODS.Voucher {
    key = 'neb_genie',
    atlas = 'nebulavouchers',
    pos = {x = 1, y = 0},
    cost = 10,
    requires = {'v_neb_luckycharm'},
    config = {extra = {odds = 4 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[tag_neb_chancetag]
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'neb_highroller')
        return {
            vars = {
                numerator, denominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.ending_shop and SMODS.pseudorandom_probability(card, 'neb_genie', 1, card.ability.extra.odds) then
             G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag({ key = 'tag_neb_chancetag' })
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
        end
    end
}