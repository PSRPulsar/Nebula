SMODS.Enhancement {
    key = 'debuffedcard',
    atlas = 'nebulaenhancements',
    pos = { x = 1, y = 0 },
    order = 2,
}
SMODS.current_mod.set_debuff = function(card)
    if SMODS.has_enhancement(card, 'm_neb_debuffedcard') then return 'true' end
end