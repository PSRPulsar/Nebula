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
local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end
local consumables_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/consumables")
for _, file in ipairs(consumables_src) do
    assert(SMODS.load_file("src/consumables/" .. file))()
end