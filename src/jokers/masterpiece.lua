SMODS.Joker {
    key = 'masterpiece',
    atlas = 'nebulajokers',
    pos = {
        x = 8,
        y = 1
    },
    config = { extra = { stonedestroyed = 0, requirement = 3,} },
    rarity = 3,
    cost = 10,
    pixel_size = { h = 85, w = 43 },
    loc_vars = function(self, info_queue, card)
        local main_end = {}
        if G.jokers and G.jokers.cards then
            for _, joker in ipairs(G.jokers.cards) do
                if joker.edition and joker.edition.negative then
                    localize { type = 'other', key = 'remove_negative', nodes = main_end, vars = {} }
                    break
                end
            end
        end
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        return {
            vars = {
                card.ability.extra.requirement,
                card.ability.extra.requirement - card.ability.extra.stonedestroyed
            },
            main_end = main_end[1]
        }
    end,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.selling_self then
            local other_joker
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
            end
            if #G.jokers.cards > 0 then
                if #G.jokers.cards <= G.jokers.config.card_limit then
                    other_joker = SMODS.copy_card(other_joker, {strip_edition = other_joker.edition and other_joker.edition.negative})
                    if other_joker.ability.invis_rounds then other_joker.ability.invis_rounds = 0 end
                    if other_joker.ability.stonedestroyed then other_joker.ability.stonedestroyed = 0 end
                    if type(other_joker.ability.extra) == "table" and other_joker.ability.extra.invis_rounds then other_joker.ability.extra.invis_rounds = 0 end
                    if type(other_joker.ability.extra) == "table" and other_joker.ability.extra.stonedestroyed then other_joker.ability.extra.stonedestroyed = 0 end
                    return { message = localize('k_duplicated_ex') }
                else
                    return { message = localize('k_no_room_ex') }
                end
            else
                return { message = localize('k_no_other_jokers') }
            end
        end
        if context.remove_playing_cards and not context.blueprint and card.ability.extra.stonedestroyed < card.ability.extra.requirement then
            for _, removed_card in ipairs(context.removed) do
                if SMODS.has_enhancement(removed_card, "m_stone") then 
                    card.ability.extra.stonedestroyed = card.ability.extra.stonedestroyed + 1 
                    card:juice_up()
                    play_sound('neb_stonecutter')
                    
                end
            end
        end
        if context.remove_playing_cards and not context.blueprint and card.ability.extra.stonedestroyed >= card.ability.extra.requirement then
            return {
                message = localize('neb_chiseled'),
                colour = G.C.SECONDARY_SET.Default
            }
        end
    end
}
