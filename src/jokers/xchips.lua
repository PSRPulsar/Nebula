SMODS.Joker {
    key = 'xchips',
    atlas = 'nebulajokers',
    pos = {
        x = 9,
        y = 3
    },
    config = { extra = { xchips = 1.5, threshold = 75, chips_count = 0, chipsmult = 0} },
    rarity = 3,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
        return {
            vars = {
                card.ability.extra.xchips, card.ability.extra.threshold
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then    
            local chip_tally = 0
            local chips_mult = 0
                if not context.other_card.debuff then
                    if not SMODS.has_no_rank(context.other_card) and not SMODS.has_no_suit(context.other_card) then
                        chip_tally = chip_tally + context.other_card.base.nominal
                    end
                    chip_tally = chip_tally + (context.other_card.ability.perma_bonus or 0)
                    if SMODS.has_enhancement(context.other_card, "m_stone") then
                        chip_tally = chip_tally + 50
                    end
                    if SMODS.has_enhancement(context.other_card, "m_bonus") then
                        chip_tally = chip_tally + 30
                    end
                    if context.other_card.edition and context.other_card.edition.key == "e_foil" then
                        chip_tally = chip_tally + 50
                    end
                end
                print(chip_tally)
                card.ability.extra.chips_count = card.ability.extra.chips_count + chip_tally
                if card.ability.extra.chips_count >= card.ability.extra.threshold then
                    repeat
                        card.ability.extra.chips_count = card.ability.extra.chips_count - card.ability.extra.threshold
                        card.ability.extra.chipsmult = card.ability.extra.chipsmult + 1
                    until card.ability.extra.chips_count < card.ability.extra.threshold
                end
                chips_mult = chips_mult + card.ability.extra.chipsmult
                card.ability.extra.chipsmult = card.ability.extra.chipsmult * 0
                return {
                    xchips = card.ability.extra.xchips ^ chips_mult
                }
            end
            if context.after then
                card.ability.extra.chips_count = 0
            end
        end
}