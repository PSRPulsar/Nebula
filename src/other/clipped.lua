SMODS.Back {
    key = 'clipped',
    atlas = 'nebuladecks',
    pos = {x = 0, y = 0},
    config = { neb_dice_rate = 2, consumables = { 'c_neb_d2' } },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.neb_dice_rate, self.config.consumables[1] } } -- i dont think this does anything but ghost deck has it so it's probably needed for something?????????
    end,
    apply = function(self)
        G.GAME.neb_dice_rate = self.config.neb_dice_rate
    end
}