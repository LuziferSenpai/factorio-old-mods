local DIRTY = function(event)
    if global.inventory then
        if not global.inventory.valid then
            global.inventory.destroy()
            global.inventory = game.surfaces["nauvis"].create_entity{name = "Shared_Inventory", position = {0, 0}}
        end
    else
        global.inventory = game.surfaces["nauvis"].create_entity{name = "Shared_Inventory", position = {0, 0}}
    end
    
    global.inventory.get_output_inventory().sort_and_merge()
    game.get_player(event.player_index).opened = global.inventory
end

script.on_event("SharedInventory", DIRTY)
script.on_event(defines.events.on_lua_shortcut, function(event)
    if event.prototype_name == "SharedInventory" then
        DIRTY(event)
    end
end)