script.on_event(defines.events.on_player_died, function(event)
    local cause = event.cause

    if cause then
        local train = cause.train
        if train then
            local locomotives = train.locomotives
            local killed_players = train.killed_players
            local playerlist = {}
            local name = game.players[event.player_index].name

            game.print({"", "[color=#FFFFFF][font=default-dialog-button]Another one bites the dust! A ", cause.localised_name, " has succesfully hunted and killed [color=#FF0000]", name, "[/color]![/font][/color]"})

            for i, kills in pairs(killed_players) do
                playerlist[game.players[i].name] = kills or 1
            end

            if playerlist[name] then
                playerlist[name] = playerlist[name] + 1
            else
                playerlist[name] = 1
            end

            local count = table_size(playerlist)
            local number = 0

            if (#locomotives.back_movers > 0 or #locomotives.front_movers > 0) and count > 0 then
                local backer_name = "[font=default-dialog-button][color=#FF0000]"

                for playername, kills in pairs(playerlist) do
                    number = number + 1
                    backer_name = backer_name .. playername .. "(" .. kills .. ")"

                    if number == count then
                        backer_name = backer_name .. " KILLER[/color][/font]"
                    elseif (number + 1) == count then
                        backer_name = backer_name .. " AND "
                    else
                        backer_name = backer_name .. ", "
                    end
                end

                for _, locomotive in pairs(locomotives.back_movers) do
                    locomotive.backer_name = backer_name
                end

                for _, locomotive in pairs(locomotives.front_movers) do
                    locomotive.backer_name = backer_name
                end
            end
        end
    end
end)