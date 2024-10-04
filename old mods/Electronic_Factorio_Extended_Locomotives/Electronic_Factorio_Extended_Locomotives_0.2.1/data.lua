local utd = util.table.deepcopy
local name = "electronic-locomotive-mk2"

local electronic_extended_mk2_entity = utd( data.raw["locomotive"]["locomotive-mk2"] )
electronic_extended_mk2_entity.name = name
electronic_extended_mk2_entity.minable.result = name
electronic_extended_mk2_entity.burner =
{
	fuel_category = "electronic",
	effictivity = 1,
	fuel_inventory_size = 1
}

local electronic_extended_mk2_item = utd( data.raw["item"]["locomotive-mk2"] )
electronic_extended_mk2_item.name = name
electronic_extended_mk2_item.order = "i-aa"
electronic_extended_mk2_item.place_result = name

local electronic_extended_mk2_recipe = utd( data.raw["recipe"]["locomotive-mk2"] )
electronic_extended_mk2_recipe.name = name
electronic_extended_mk2_recipe.ingredients =
{ 
	{ "locomotive-mk2", 1 },
	{ "battery", 10 },
	{ "electric-engine-unit", 20 }
}
electronic_extended_mk2_recipe.result = name

name = "electronic-locomotive-mk3"

local electronic_extended_mk3_entity = utd( data.raw["locomotive"]["locomotive-mk3"] )
electronic_extended_mk3_entity.name = name
electronic_extended_mk3_entity.minable.result = name
electronic_extended_mk3_entity.burner =
{
	fuel_category = "electronic",
	effictivity = 1,
	fuel_inventory_size = 1
}

local electronic_extended_mk3_item = utd( data.raw["item"]["locomotive-mk3"] )
electronic_extended_mk3_item.name = name
electronic_extended_mk3_item.order = "i-ba"
electronic_extended_mk3_item.place_result = name

local electronic_extended_mk3_recipe = utd( data.raw["recipe"]["locomotive-mk3"] )
electronic_extended_mk3_recipe.name = name
electronic_extended_mk3_recipe.ingredients =
{ 
	{ "locomotive-mk3", 1 },
	{ "battery", 10 },
	{ "electric-engine-unit", 20 }
}
electronic_extended_mk3_recipe.result = name

data:extend
{
	electronic_extended_mk2_entity, electronic_extended_mk2_item, electronic_extended_mk2_recipe,
	electronic_extended_mk3_entity, electronic_extended_mk3_item, electronic_extended_mk3_recipe
}

table.insert( data.raw["technology"]["railway-2"].effects, { type = "unlock-recipe", recipe = "electronic-locomotive-mk2" } )
table.insert( data.raw["technology"]["railway-3"].effects, { type = "unlock-recipe", recipe = name } )