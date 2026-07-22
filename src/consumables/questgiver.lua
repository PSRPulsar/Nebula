SMODS.Consumable {
    key = 'questgiver',
    set = 'Tarot',
    order = 1,
    atlas = 'nebulaconsumables',
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 3, mod_conv = 'm_neb_sticky' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}