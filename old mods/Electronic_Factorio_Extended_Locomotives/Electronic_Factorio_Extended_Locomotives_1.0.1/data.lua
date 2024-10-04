local table_deepcopy = util.table.deepcopy
local burner = {
    fuel_category = "electronic",
    effictivity = 1,
    fuel_inventory_size = 1
}
local name = "electronic-locomotive-mk2"

local function get_icons(icon)
    return {
        {icon = icon, icon_size = 32},
        {icon = "__Electronic_Factorio_Extended_Locomotives__/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}}
    }
end

local electronic_extended_mk2_entity = table_deepcopy(data.raw["locomotive"]["locomotive-mk2"])
electronic_extended_mk2_entity.name = name
electronic_extended_mk2_entity.icons = get_icons(electronic_extended_mk2_entity.icon)
electronic_extended_mk2_entity.icon = nil
electronic_extended_mk2_entity.icon_size = nil
electronic_extended_mk2_entity.minable.result = name
electronic_extended_mk2_entity.burner = burner

local electronic_extended_mk2_item = table_deepcopy(data.raw["item-with-entity-data"]["locomotive-mk2"])
electronic_extended_mk2_item.name = name
electronic_extended_mk2_item.icons = get_icons(electronic_extended_mk2_item.icon)
electronic_extended_mk2_item.icon = nil
electronic_extended_mk2_item.icon_size = nil
electronic_extended_mk2_item.order = "i-ab"
electronic_extended_mk2_item.place_result = name

local electronic_extended_mk2_recipe = table_deepcopy(data.raw["recipe"]["locomotive-mk2"])
electronic_extended_mk2_recipe.name = name
electronic_extended_mk2_recipe.ingredients = {
    {"locomotive-mk2", 1},
    {"battery", 10},
    {"electric-engine-unit", 20}
}
electronic_extended_mk2_recipe.result = name

name = "electronic-locomotive-mk3"

local electronic_extended_mk3_entity = table_deepcopy(data.raw["locomotive"]["locomotive-mk3"])
electronic_extended_mk3_entity.name = name
electronic_extended_mk3_entity.icons = get_icons(electronic_extended_mk3_entity.icon)
electronic_extended_mk3_entity.icon = nil
electronic_extended_mk3_entity.icon_size = nil
electronic_extended_mk3_entity.minable.result = name
electronic_extended_mk3_entity.burner = burner

local electronic_extended_mk3_item = table_deepcopy(data.raw["item-with-entity-data"]["locomotive-mk3"])
electronic_extended_mk3_item.name = name
electronic_extended_mk3_item.icons = get_icons(electronic_extended_mk3_item.icon)
electronic_extended_mk3_item.icon = nil
electronic_extended_mk3_item.icon_size = nil
electronic_extended_mk3_item.order = "i-bb"
electronic_extended_mk3_item.place_result = name

local electronic_extended_mk3_recipe = table_deepcopy(data.raw["recipe"]["locomotive-mk3"])
electronic_extended_mk3_recipe.name = name
electronic_extended_mk3_recipe.ingredients = {
    {"locomotive-mk3", 1},
    {"battery", 10},
    {"electric-engine-unit", 20}
}
electronic_extended_mk3_recipe.result = name

data:extend{electronic_extended_mk2_entity, electronic_extended_mk2_item, electronic_extended_mk2_recipe, electronic_extended_mk3_entity, electronic_extended_mk3_item, electronic_extended_mk3_recipe}

table.insert(data.raw["technology"]["railway-2"].effects, {type = "unlock-recipe", recipe = "electronic-locomotive-mk2"})
table.insert(data.raw["technology"]["railway-3"].effects, {type = "unlock-recipe", recipe = name})