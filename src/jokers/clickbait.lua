SMODS.Joker {
    key = 'clickbait',
    atlas = 'nebulajokers',
    pos = {
        x = 3,
        y = 0
    },
    config = { extra = { odds = 6 } },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'neb_clickbait')
        return {
            vars = {
                numerator,
                denominator,
            }
        }
    end,
    calculate = function(self, card, context)
        local debuffcount = 0
        if context.joker_main and not context.blueprint then
            for _, pcard in ipairs(context.scoring_hand) do
                if pcard.debuff then 
                    debuffcount = debuffcount + 1
                end
            end
        end
        if context.joker_main and SMODS.pseudorandom_probability(card, 'neb_clickbait', (1 + debuffcount), card.ability.extra.odds) then
                G.E_MANAGER:add_event(Event({
                
                func = (function()
                
                local tag_pool = get_current_pool('Tag')
                local selected_tag = pseudorandom_element(tag_pool, 'neb_clickbait')
                local it = 1
                while selected_tag == 'UNAVAILABLE' do
                    it = it + 1
                    selected_tag = pseudorandom_element(tag_pool, 'neb_clickbait'..it)
                end
                if selected_tag == "tag_boss" then --horrifying, i had to reference how Cryptid does something
					it = it - 1 
				end
                add_tag(Tag(selected_tag, false, 'Small'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                return true
    
                end)}))
                return {
                    message = localize('neb_plus_tag'),
                }
        end
    end
}