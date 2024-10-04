local table_deepcopy = util.table.deepcopy
local name = ""
local oldname = ""
local locomotive_entity = {}
local locomotive_item = {}
local locomotive_recipe = {}
local burner =
{
		fuel_category = "electronic",
		effictivity = 1,
		fuel_inventory_size = 1
	}

if mods["angelsaddons-petrotrain"] then
	name = "electronic-petro-locomotive-1"
	oldname = "petro-locomotive-1"
	locomotive_entity = table_deepcopy( data.raw["locomotive"][oldname] )
	locomotive_entity.name = name
	locomotive_entity.minable.name = name
	locomotive_entity.burner = table_deepcopy( burner )

	locomotive_item = table_deepcopy( data.raw["item-with-entity-data"][oldname] )
	locomotive_item.name = name
	locomotive_item.order = "aa"
	locomotive_item.place_result = name

	locomotive_recipe = table_deepcopy( data.raw["recipe"][oldname] )
	locomotive_recipe.name = name
	locomotive_recipe.ingredients = { { oldname, 1 }, { "battery", 10 }, { "electric-engine-unit", 20 } }
	locomotive_recipe.result = name

	data:extend{ locomotive_entity, locomotive_item, locomotive_recipe }

	table.insert( data.raw["technology"]["angels-petro-train"].effects, { type = "unlock-recipe", recipe = name } )
end

if mods["angelsaddons-smeltingtrain"] then
	name = "electronic-smelting-locomotive-1"
	oldname = "smelting-locomotive-1"
	locomotive_entity = table_deepcopy( data.raw["locomotive"][oldname] )
	locomotive_entity.name = name
	locomotive_entity.minable.name = name
	locomotive_entity.burner = table_deepcopy( burner )

	locomotive_item = table_deepcopy( data.raw["item-with-entity-data"][oldname] )
	locomotive_item.name = name
	locomotive_item.order = "aa"
	locomotive_item.place_result = name

	locomotive_recipe = table_deepcopy( data.raw["recipe"][oldname] )
	locomotive_recipe.name = name
	locomotive_recipe.ingredients = { { oldname, 1 }, { "battery", 10 }, { "electric-engine-unit", 20 } }
	locomotive_recipe.result = name

	data:extend{ locomotive_entity, locomotive_item, locomotive_recipe }

	table.insert( data.raw["technology"]["angels-smelting-train"].effects, { type = "unlock-recipe", recipe = name } )

	name = "electronic-smelting-locomotive-tender"
	oldname = "smelting-locomotive-tender"
	locomotive_entity = table_deepcopy( data.raw["locomotive"][oldname] )
	locomotive_entity.name = name
	locomotive_entity.minable.name = name
	locomotive_entity.burner = table_deepcopy( burner )

	locomotive_item = table_deepcopy( data.raw["item-with-entity-data"][oldname] )
	locomotive_item.name = name
	locomotive_item.order = "ba"
	locomotive_item.place_result = name

	locomotive_recipe = table_deepcopy( data.raw["recipe"][oldname] )
	locomotive_recipe.name = name
	locomotive_recipe.ingredients = { { oldname, 1 }, { "battery", 10 }, { "electric-engine-unit", 20 } }
	locomotive_recipe.result = name

	data:extend{ locomotive_entity, locomotive_item, locomotive_recipe }

	table.insert( data.raw["technology"]["angels-smelting-train"].effects, { type = "unlock-recipe", recipe = name } )
end

if mods["angelsindustries"] then
	name = "electronic-crawler-locomotive"
	oldname = "crawler-locomotive"
	locomotive_entity = table_deepcopy( data.raw["locomotive"][oldname] )
	locomotive_entity.name = name
	locomotive_entity.minable.name = name
	locomotive_entity.burner = table_deepcopy( burner )

	locomotive_item = table_deepcopy( data.raw["item-with-entity-data"][oldname] )
	locomotive_item.name = name
	locomotive_item.order = "aa"
	locomotive_item.place_result = name

	locomotive_recipe = table_deepcopy( data.raw["recipe"][oldname] )
	locomotive_recipe.name = name
	locomotive_recipe.ingredients = { { oldname, 1 }, { "battery", 10 }, { "electric-engine-unit", 20 } }
	locomotive_recipe.result = name

	data:extend{ locomotive_entity, locomotive_item, locomotive_recipe }

	table.insert( data.raw["technology"]["angels-crawler-train"].effects, { type = "unlock-recipe", recipe = name } )

	name = "electronic-crawler-locomotive-wagon"
	oldname = "crawler-locomotive-wagon"
	locomotive_entity = table_deepcopy( data.raw["locomotive"][oldname] )
	locomotive_entity.name = name
	locomotive_entity.minable.name = name
	locomotive_entity.burner = table_deepcopy( burner )

	locomotive_item = table_deepcopy( data.raw["item-with-entity-data"][oldname] )
	locomotive_item.name = name
	locomotive_item.order = "ba"
	locomotive_item.place_result = name

	locomotive_recipe = table_deepcopy( data.raw["recipe"][oldname] )
	locomotive_recipe.name = name
	locomotive_recipe.ingredients = { { oldname, 1 }, { "battery", 10 }, { "electric-engine-unit", 20 } }
	locomotive_recipe.result = name

	data:extend{ locomotive_entity, locomotive_item, locomotive_recipe }

	table.insert( data.raw["technology"]["angels-crawler-train"].effects, { type = "unlock-recipe", recipe = name } )
end