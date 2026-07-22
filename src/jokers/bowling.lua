SMODS.Joker {
    key = 'bowling',
    atlas = 'nebulajokers',
    pos = {
        x = 8,
        y = 2
    },
    config = { extra = { mult = 30 } },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        local ten = true
		if context.scoring_hand then
			for k, v in ipairs(context.scoring_hand) do
				if v:get_id() ~= 10 then
					ten = false
				end
			end
		end
          if ten and context.joker_main then
              return {
                  mult = card.ability.extra.mult
               }
        end
        
    end
}