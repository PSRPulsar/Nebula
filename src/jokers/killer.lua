SMODS.Joker {
    key = 'killer',
    atlas = 'nebulajokers',
    pos = {
        x = 5,
        y = 3
    },
    rarity = 2,
    cost = 6,
    calculate = function(self, card, context)
        if context.setting_blind then
            local face_cards = {}
            for k, v in pairs(G.playing_cards) do
                if v:is_face() then
                    table.insert(face_cards, v)
                end
            end
            if #face_cards ~= 0 then
                local card_to_destroy = pseudorandom_element(face_cards, pseudoseed('neb_killer'))
                SMODS.destroy_cards(card_to_destroy, args)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        play_sound('slice1')
                        card:juice_up(0.3, 0.5)
                    return true
                end}))
            end
        end
    end
}