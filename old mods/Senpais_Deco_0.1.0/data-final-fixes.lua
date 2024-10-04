local MODNAME = "__Senpais_Deco__"

data:extend( { { type = "item-group", name = "Senpais-Deco", icon = "__base__/graphics/icons/stone-rock.png", icon_size = 32, order = "ga" },
               { type = "item-subgroup", name = "Deco-Senpai-1", group = "Senpais-Deco", order = 1 },
               { type = "item-subgroup", name = "Deco-Senpai-2", group = "Senpais-Deco", order = 2 },
               { type = "item-subgroup", name = "Deco-Senpai-3", group = "Senpais-Deco", order = 3 },
               { type = "item-subgroup", name = "Deco-Senpai-4", group = "Senpais-Deco", order = 4 } } )

local ordertreenumber = 0

for i, proto in pairs( data.raw["tree"] ) do
    ordertreenumber = ordertreenumber + 1
    if ordertreenumber < 10 then ordertreepad = "0" else ordertreepad = "" end

    local tree_item = util.table.deepcopy( data.raw["item"]["iron-chest"] )
    tree_item.name = proto.name
    tree_item.icon = proto.icon
    tree_item.subgroup = "Deco-Senpai-1"
    tree_item.order = ordertreepad .. ordertreenumber
    tree_item.place_result = proto.name

    local tree_recipe = { type = "recipe", name = proto.name, enabled = true, ingredients = {}, result = proto.name }

    data:extend( { tree_item, tree_recipe } )
end

local orderrocknumber = 0

for i, proto in pairs( data.raw["simple-entity"] ) do
    if ( proto.name == "stone-rock" or proto.name == "red-desert-rock-big-01" or proto.name == "red-desert-rock-huge-01" or proto.name == "red-desert-rock-huge-02" ) then
        orderrocknumber = orderrocknumber + 1
        if orderrocknumber < 10 then orderrockpad = "0" else orderrockpad = "" end

        local rock_item = util.table.deepcopy( data.raw["item"]["iron-chest"] )
        rock_item.name = proto.name
        rock_item.icon = proto.icon
        rock_item.subgroup = "Deco-Senpai-2"
        rock_item.order = orderrockpad .. orderrocknumber
        rock_item.place_result = proto.name
        rock_item.localised_name = { "entity-name." .. proto.name }

        local rock_recipe = { type = "recipe", name = proto.name, enabled = true, ingredients = {}, result = proto.name }

        data:extend( { rock_item, rock_recipe } )
    end
end

local fish_item = util.table.deepcopy( data.raw["item"]["iron-chest"] )
fish_item.name = "fish"
fish_item.icon = util.table.deepcopy( data.raw["fish"]["fish"].icon )
fish_item.subgroup = "Deco-Senpai-3"
fish_item.order = 01
fish_item.place_result = "fish"

local fish_recipe = { type = "recipe", name = "fish", enabled = true, ingredients = {}, result = "fish" }

data:extend( { fish_item, fish_recipe } )

local orderdeconumber = 0

for i, proto in pairs( data.raw["optimized-decorative"] ) do
    orderdeconumber = orderdeconumber + 1
    if orderdeconumber < 10 then orderdecopad = "0" else orderdecopad = "" end

    local deco_entity = util.table.deepcopy( proto )
    deco_entity.type = "simple-entity"
    deco_entity.name = "placeable-" .. proto.name
    deco_entity.flags = { "player-creation" }
    deco_entity.minable = { hardness = 0.2, mining_time = 0.5, result = "placeable-" .. proto.name }
    deco_entity.autoplace = nil

    local deco_item = util.table.deepcopy( data.raw["item"]["iron-chest"] )
    deco_item.name = "placeable-" .. proto.name
    deco_item.icon = proto.icon
    deco_item.subgroup = "Deco-Senpai-4"
    deco_item.order = orderdecopad .. orderdeconumber
    deco_item.place_result = "placeable-" .. proto.name
    deco_item.localised_name = { "decorative-name." .. proto.name }

    local deco_recipe = { type = "recipe", name = "placeable-" .. proto.name, enabled = true, ingredients = {}, result = "placeable-" .. proto.name }

    data:extend( { deco_entity, deco_item, deco_recipe } )
end