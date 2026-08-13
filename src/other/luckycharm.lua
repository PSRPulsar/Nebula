SMODS.Voucher {
    key = 'neb_luckycharm',
    atlas = 'nebulavouchers',
    pos = {x = 0, y = 0},
    cost = 10,
    redeem = function(self, card)
        G.GAME.neb_charm_var = (G.GAME.neb_charm_var or 0) + 1
    end
}