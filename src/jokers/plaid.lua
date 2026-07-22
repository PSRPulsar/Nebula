SMODS.Joker {
    key = 'plaid',
    atlas = 'nebulajokers',
    pos = {
        x = 3,
        y = 4
    },
    config = { extra = { mult = 4 } },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local hearts, clubs = 0, 0
            for k, v in pairs(context.scoring_hand) do
                if v:is_suit('Hearts') then
                    hearts = hearts+1
                end
                if v:is_suit('Clubs') then
                    clubs = clubs+1
                end
            end
            if context.other_card:is_suit('Hearts') and clubs > 0 then
                return {mult = card.ability.extra.mult*clubs}
            end
            if context.other_card:is_suit('Clubs') and hearts > 0 then
                return {mult = card.ability.extra.mult*hearts}
            end
        end
    end
}