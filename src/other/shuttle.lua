SMODS.Back {
    key = 'shuttle',
    atlas = 'nebuladecks',
    pos = {x = 1, y = 0},
    apply = function(self, back)
		local args = { level_up = 1, instant = true }
        SMODS.upgrade_poker_hands(args)
	end
}