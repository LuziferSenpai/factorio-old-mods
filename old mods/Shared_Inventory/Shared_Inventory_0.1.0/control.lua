local DIRTY = function(event)
    if not global.inventory then
        global.inventory = game.surfaces["nauvis"].create_entity{name = "Shared_Inventory", position = {0, 0}}
    end
    game.get_player(event.player_index).opened = global.inventory
end

script.on_event("SharedInventory", DIRTY)
script.on_event(defines.events.on_lua_shortcut, function(event)
    if event.prototype_name == "SharedInventory" then
        DIRTY(event)
    end
end)