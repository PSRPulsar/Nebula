SMODS.Atlas {
    key = 'nebulajokers',
    path = 'jokers.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'nebulaenhancements',
    path = 'enhancements.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'nebulaconsumables',
    path = 'consumables.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'nebulaboosters',
    path = 'boosters.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'nebulatags',
    path = 'tags.png',
    px = 34,
    py = 34
}
SMODS.Atlas {
    key = 'nebulavouchers',
    path = 'vouchers.png',
    px = 71,
    py = 95
}SMODS.Atlas {
    key = 'nebuladecks',
    path = 'decks.png',
    px = 71,
    py = 95
}
local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end
local consumables_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/consumables")
for _, file in ipairs(consumables_src) do
    assert(SMODS.load_file("src/consumables/" .. file))()
end
local other_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/other")
for _, file in ipairs(other_src) do
    assert(SMODS.load_file("src/other/" .. file))()
end