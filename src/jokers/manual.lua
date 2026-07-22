SMODS.Joker {
    key = "manual",
    rarity = 3,
    cost = 10,
    blueprint_compat = 'false',
    atlas = 'nebulajokers',
    pos = { x = 9, y = 0 },
    loc_vars = function(self, info_queue, card)
        local manual_card = { rank = G.GAME.current_round.neb_manual_card_rank or 'Ace', suit = G.GAME.current_round.neb_manual_card_suit or 'Spades'}
        info_queue[#info_queue + 1] = G.P_CENTERS.c_soul
        return { vars = { localize(manual_card.rank, 'ranks'), localize(manual_card.suit, 'suits_plural'), colours = { G.C.SUITS[manual_card.suit] } } }
    end,
    calculate = function(self, card, context)
        local cardcheck = 0
        if context.joker_main and not context.blueprint then
            for k, v in ipairs(context.scoring_hand) do
				    if v:get_id() == SMODS.Ranks[G.GAME.current_round.neb_manual_card_rank].id and v:is_suit(G.GAME.current_round.neb_manual_card_suit) then
                        cardcheck = cardcheck + 1
                    end
            end
        end
        if context.joker_main and not context.blueprint and cardcheck >= 3 then
            G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.1,
				func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						SMODS.add_card({ key = "c_soul" })
						card:juice_up(0.3, 0.5)
					end
					return true
				end
			}))
            SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('neb_built'),
                    colour = G.C.CHIPS
                }
        end
    end
}
local function reset_neb_manual_card()
    G.GAME.current_round.neb_manual_card = G.GAME.current_round.neb_manual_card or { rank = 'Ace', suit = 'Spades' }
    local manual_suits = {}
    for _, suit_key in ipairs({ 'Spades', 'Hearts', 'Clubs', 'Diamonds' }) do
        if suit_key ~= G.GAME.current_round.neb_manual_card_suit then manual_suits[#manual_suits + 1] = suit_key end
    end
    local manual_ranks = {}
    for _, rank_key in ipairs({ 'King', 'Queen', 'Jack', '10', '9', '8', '7', '6', '5', '4', '3', '2', 'Ace' }) do
        if rank_key ~= G.GAME.current_round.neb_manual_card_rank then manual_ranks[#manual_ranks + 1] = rank_key end
    end
    G.GAME.current_round.neb_manual_card_suit = pseudorandom_element(manual_suits, 'neb_manual' .. G.GAME.round_resets.ante)
    G.GAME.current_round.neb_manual_card_rank = pseudorandom_element(manual_ranks, 'neb_manual' .. G.GAME.round_resets.ante)
end
function SMODS.current_mod.reset_game_globals(run_start)
    reset_neb_manual_card()
end