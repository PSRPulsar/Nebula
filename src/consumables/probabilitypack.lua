SMODS.Booster {
    key = 'neb_probbooster1',
    config = {
        choose = 1,
        extra = 2
    },
    atlas = 'nebulaboosters',
    pos = { x = 0, y = 0 },
    group_key = 'k_neb_dice_pack',
    weight = 1.5,
    draw_hand = true,
    kind = "neb_probability",
    set_ability = function(self, card, initial, delay_sprites)
    card.ability.extra = card.ability.extra + (G.GAME.neb_charm_var or 0)
end,
    create_card = function(self, card, i)
        return {set = 'neb_dice', area = G.consumeables, skip_materialize = true, soulable = true, key_append = 'probabilityprobability'}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { math.min(card.ability.choose + (G.GAME.modifiers.booster_choice_mod or 0), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0))), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0)) } }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Tarot)
        ease_background_colour({ new_colour = HEX('3e9e4f'), special_colour = HEX('22692f'), contrast = 2 })
    end
}
SMODS.Booster {
    key = 'neb_probbooster2',
    config = {
        choose = 1,
        extra = 2
    },
    atlas = 'nebulaboosters',
    pos = { x = 1, y = 0 },
    group_key = 'k_neb_dice_pack',
    weight = 1.5,
    draw_hand = true,
    kind = "neb_probability",
    set_ability = function(self, card, initial, delay_sprites)
    card.ability.extra = card.ability.extra + (G.GAME.neb_charm_var or 0)
end,
    create_card = function(self, card, i)
        return {set = 'neb_dice', area = G.consumeables, skip_materialize = true, soulable = true, key_append = 'probabilityprobability'}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { math.min(card.ability.choose + (G.GAME.modifiers.booster_choice_mod or 0), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0))), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0)) } }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Tarot)
        ease_background_colour({ new_colour = HEX('3e9e4f'), special_colour = HEX('22692f'), contrast = 2 })
    end
}
SMODS.Booster {
    key = 'neb_probboosterjumbo',
    config = {
        choose = 1,
        extra = 4
    },
    cost = 6,
    atlas = 'nebulaboosters',
    pos = { x = 0, y = 1 },
    group_key = 'k_neb_dice_pack',
    weight = 1.5,
    draw_hand = true,
    kind = "neb_probability",
    set_ability = function(self, card, initial, delay_sprites)
    card.ability.extra = card.ability.extra + (G.GAME.neb_charm_var or 0)
end,
    create_card = function(self, card, i)
        return {set = 'neb_dice', area = G.consumeables, skip_materialize = true, soulable = true, key_append = 'probabilityprobability'}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { math.min(card.ability.choose + (G.GAME.modifiers.booster_choice_mod or 0), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0))), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0)) } }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Tarot)
        ease_background_colour({ new_colour = HEX('3e9e4f'), special_colour = HEX('22692f'), contrast = 2 })
    end
}
SMODS.Booster {
    key = 'neb_probboostermega',
    config = {
        choose = 2,
        extra = 4
    },
    cost = 8,
    atlas = 'nebulaboosters',
    pos = { x = 1, y = 1 },
    group_key = 'k_neb_dice_pack',
    weight = 0.5,
    draw_hand = true,
    kind = "neb_probability",
    set_ability = function(self, card, initial, delay_sprites)
    card.ability.extra = card.ability.extra + (G.GAME.neb_charm_var or 0)
end,
    create_card = function(self, card, i)
        return {set = 'neb_dice', area = G.consumeables, skip_materialize = true, soulable = true, key_append = 'probabilityprobability'}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { math.min(card.ability.choose + (G.GAME.modifiers.booster_choice_mod or 0), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0))), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0)) } }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Tarot)
        ease_background_colour({ new_colour = HEX('3e9e4f'), special_colour = HEX('22692f'), contrast = 2 })
    end
}