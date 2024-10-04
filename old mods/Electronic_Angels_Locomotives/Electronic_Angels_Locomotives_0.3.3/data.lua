local MODNAME = "__Electronic_Angels_Locomotives__"
local table_deepcopy = util.table.deepcopy
local locomotive_entity = {}
local burner = {
	fuel_category = "electronic",
	effictivity = 1,
	fuel_inventory_size = 1
}

if mods["angelsaddons-crawlertrain"] then
	local loconame = "electronic-crawler-locomotive"
	local locowagonname = "electronic-crawler-locomotive-wagon"
	local techname = "angels-crawler-train"
	local funcs = require("__angelsaddons-crawlertrain__/prototypes/crawler-train-functions")

	funcs.generate_train_items({
		type = "item-with-entity-data",
		name = loconame,
		icon = "__angelsaddons-crawlertrain__/graphics/icons/crawler-loco-ico.png",
		icon_size = 32,
		subgroup = "angels-vehicle-train-crawler",
		order = "ab[locomotive]",
		place_result = loconame,
		stack_size = 5
	})

	funcs.generate_train_items({
		type = "item-with-entity-data",
		name = locowagonname,
		icon = "__angelsaddons-crawlertrain__/graphics/icons/crawler-loco-wagon-ico.png",
		icon_size = 32,
		subgroup = "angels-vehicle-train-crawler",
		order = "bb[locomotive-wagon]",
		place_result = locowagonname,
		stack_size = 5
	})

	locomotive_entity = table_deepcopy(data.raw["locomotive"]["crawler-locomotive"])
	locomotive_entity.name = loconame
	locomotive_entity.icon = "__angelsaddons-crawlertrain__/graphics/icons/crawler-loco-ico.png"
	locomotive_entity.icons = nil
	locomotive_entity.minable.result = loconame
	locomotive_entity.burner = burner

	funcs.generate_train_entities(locomotive_entity)

	locomotive_entity = table_deepcopy(data.raw["locomotive"]["crawler-locomotive-wagon"])
	locomotive_entity.name = locowagonname
	locomotive_entity.icon = "__angelsaddons-crawlertrain__/graphics/icons/crawler-loco-wagon-ico.png"
	locomotive_entity.icons = nil
	locomotive_entity.minable.result = locowagonname
	locomotive_entity.burner = burner

	funcs.generate_train_entities(locomotive_entity)

	for i = 1, angelsmods.addons.crawlertrain.tier_amount do
		if i == 1 then
			local recipe01 = {
				type = "recipe",
				name = loconame,
				energy_required = 10,
				enabled = false,
				ingredients = {
					{"crawler-locomotive", 1},
					{"battery", 10},
					{"electric-engine-unit", 20}
				},
				result = loconame
			}

			local recipe02 = {
				type = "recipe",
				name = locowagonname,
				energy_required = 10,
				enabled = false,
				ingredients = {
					{"crawler-locomotive-wagon", 1},
					{"battery", 10},
					{"electric-engine-unit", 20}
				},
				result = locowagonname
			}

			if angelsmods.addons.crawlertrain.tier_amount > 1 then
				recipe01.localised_name = {"", {"recipe-name." .. loconame}, " MK" .. i}
				recipe02.localised_name = {"", {"recipe-name." .. locowagonname}, " MK" .. i}
				
				data.raw["item-with-entity-data"][loconame].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
				data.raw["item-with-entity-data"][locowagonname].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
				data.raw["locomotive"][loconame].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
				data.raw["locomotive"][locowagonname].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}

				table.insert(data.raw["item-with-entity-data"][loconame].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
				table.insert(data.raw["item-with-entity-data"][locowagonname].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
				table.insert(data.raw["locomotive"][loconame].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
				table.insert(data.raw["locomotive"][locowagonname].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
			else
				local locoitem = data.raw["item-with-entity-data"][loconame]
				locoitem.icons = {
					{icon = locoitem.icon, icon_size = 32},
					{icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}}
				}
				locoitem.icon = nil

				local locowagonitem = data.raw["item-with-entity-data"][locowagonname]
				locowagonitem.icons = {
					{icon = locowagonitem.icon, icon_size = 32},
					{icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}}
				}
				locowagonitem.icon = nil

				local locoentity = data.raw["locomotive"][loconame]
				locoentity.icons = {
					{icon = locoentity.icon, icon_size = 32},
					{icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}}
				}
				locoentity.icon = nil

				local locowagonentity = data.raw["locomotive"][locowagonname]
				locowagonentity.icons = {
					{icon = locowagonentity.icon, icon_size = 32},
					{icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}}
				}
				locowagonentity.icon = nil
			end

			data:extend{recipe01, recipe02}

			table.insert(data.raw["technology"][techname].effects, {type = "unlock-recipe", recipe = loconame})
			table.insert(data.raw["technology"][techname].effects, {type = "unlock-recipe", recipe = locowagonname})
		else
			local recipe01 = {
				type = "recipe",
				name = loconame .. "-" .. i,
				energy_required = 10,
				enabled = false,
				ingredients = {
					{"crawler-locomotive-" .. i, 1},
					{"battery", 10},
					{"electric-engine-unit", 20}
				},
				result = loconame .. "-" .. i,
				localised_name = {"", {"recipe-name." .. loconame}, " MK" .. i}
			}

			local recipe02 = {
				type = "recipe",
				name = locowagonname .. "-" .. i,
				energy_required = 10,
				enabled = false,
				ingredients = {
					{"crawler-locomotive-wagon-" .. i, 1},
					{"battery", 10},
					{"electric-engine-unit", 20}
				},
				result = locowagonname .. "-" .. i,
				localised_name = {"", {"recipe-name." .. locowagonname}, " MK" .. i}
			}

			data:extend{recipe01, recipe02}

			table.insert(data.raw["technology"][techname .. "-" .. i].effects, {type = "unlock-recipe", recipe = loconame .. "-" .. i})
			table.insert(data.raw["technology"][techname .. "-" .. i].effects, {type = "unlock-recipe", recipe = locowagonname .. "-" .. i})

			data.raw["item-with-entity-data"][loconame .. "-" .. i].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
			data.raw["item-with-entity-data"][locowagonname .. "-" .. i].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
			data.raw["locomotive"][loconame .. "-" .. i].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
			data.raw["locomotive"][locowagonname .. "-" .. i].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}

			table.insert(data.raw["item-with-entity-data"][loconame .. "-" .. i].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
			table.insert(data.raw["item-with-entity-data"][locowagonname .. "-" .. i].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
			table.insert(data.raw["locomotive"][loconame .. "-" .. i].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
			table.insert(data.raw["locomotive"][locowagonname .. "-" .. i].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
		end
	end
end

if mods["angelsaddons-petrotrain"] then
	local loconame = "electronic-petro-locomotive-1"
	local techname = "angels-petro-train"
	local funcs = require("__angelsaddons-petrotrain__/prototypes/petro-train-functions")

	funcs.generate_train_items({
		type = "item-with-entity-data",
		name = loconame,
		icon = "__angelsaddons-petrotrain__/graphics/icons/petro-loco-1-ico.png",
		icon_size = 32,
		subgroup = "angels-petrotrain",
		order = "z[angel-train]-c[petro]-ab[locomotive]",
		place_result = loconame,
		stack_size = 5
	})

	locomotive_entity = table_deepcopy(data.raw["locomotive"]["crawler-locomotive"])
	locomotive_entity.name = loconame
	locomotive_entity.icon = "__angelsaddons-petrotrain__/graphics/icons/petro-loco-1-ico.png"
	locomotive_entity.icons = nil
	locomotive_entity.minable.result = loconame
	locomotive_entity.burner = burner

	funcs.generate_train_entities(locomotive_entity)

	for i = 1, angelsmods.addons.petrotrain.tier_amount do
		if i == 1 then
			local recipe = {
				type = "recipe",
				name = loconame,
				energy_required = 10,
				enabled = false,
				ingredients = {
					{"petro-locomotive-1", 1},
					{"battery", 10},
					{"electric-engine-unit", 20}
				},
				result = loconame
			}

			if angelsmods.addons.petrotrain.tier_amount > 1 then
				recipe.localised_name = {"", {"recipe-name." .. loconame}, " MK" .. i}

				data.raw["item-with-entity-data"][loconame].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
				data.raw["locomotive"][loconame].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}

				table.insert(data.raw["item-with-entity-data"][loconame].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
				table.insert(data.raw["locomotive"][loconame].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
			else
				local locoitem = data.raw["item-with-entity-data"][loconame]
				locoitem.icons = {
					{icon = locoitem.icon, icon_size = 32},
					{icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}}
				}
				locoitem.icon = nil

				local locoentity = data.raw["locomotive"][loconame]
				locoentity.icons = {
					{icon = locoentity.icon, icon_size = 32},
					{icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}}
				}
				locoentity.icon = nil
			end

			data:extend{recipe}

			table.insert(data.raw["technology"][techname].effects, {type = "unlock-recipe", recipe = loconame})
		else
			local recipe = {
				type = "recipe",
				name = loconame .. "-" .. i,
				energy_required = 10,
				enabled = false,
				ingredients = {
					{"petro-locomotive-1-" .. i, 1},
					{"battery", 10},
					{"electric-engine-unit", 20}
				},
				result = loconame .. "-" .. i,
				localised_name = {"", {"recipe-name." .. loconame}, " MK" .. i}
			}

			data:extend{recipe}

			table.insert(data.raw["technology"][techname .. "-" .. i].effects, {type = "unlock-recipe", recipe = loconame .. "-" .. i})

			data.raw["item-with-entity-data"][loconame .. "-" .. i].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
			data.raw["locomotive"][loconame .. "-" .. i].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}

			table.insert(data.raw["item-with-entity-data"][loconame .. "-" .. i].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
			table.insert(data.raw["locomotive"][loconame .. "-" .. i].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
		end
	end
end

if mods["angelsaddons-smeltingtrain"] then
	local loconame = "electronic-smelting-locomotive-1"
	local locowagonname = "electronic-smelting-locomotive-tender"
	local techname = "angels-smelting-train"
	local funcs = require("__angelsaddons-smeltingtrain__/prototypes/smelting-train-functions")

	funcs.generate_train_items({
		type = "item-with-entity-data",
		name = loconame,
		icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-1.png",
		icon_size = 32,
		subgroup = "angels-smeltingtrain",
		order = "z[angel-train]-b[smelting]-ab[locomotive]",
		place_result = loconame,
		stack_size = 5
	})

	funcs.generate_train_items({
		type = "item-with-entity-data",
		name = locowagonname,
		icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-tender.png",
		icon_size = 32,
		subgroup = "angels-smeltingtrain",
		order = "z[angel-train]-b[smelting]-bb[locomotive-tender]",
		place_result = locowagonname,
		stack_size = 5
	})

	locomotive_entity = table_deepcopy(data.raw["locomotive"]["crawler-locomotive"])
	locomotive_entity.name = loconame
	locomotive_entity.icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-1.png"
	locomotive_entity.icons = nil
	locomotive_entity.minable.result = loconame
	locomotive_entity.burner = burner

	funcs.generate_train_entities(locomotive_entity)

	locomotive_entity = table_deepcopy(data.raw["locomotive"]["crawler-locomotive-wagon"])
	locomotive_entity.name = locowagonname
	locomotive_entity.icon = "__angelsaddons-smeltingtrain__/graphics/icons/smelting-loco-tender.png"
	locomotive_entity.icons = nil
	locomotive_entity.minable.result = locowagonname
	locomotive_entity.burner = burner

	funcs.generate_train_entities(locomotive_entity)

	for i = 1, angelsmods.addons.smeltingtrain.tier_amount do
		if i == 1 then
			local recipe01 = {
				type = "recipe",
				name = loconame,
				energy_required = 10,
				enabled = false,
				ingredients = {
					{"smelting-locomotive-1", 1},
					{"battery", 10},
					{"electric-engine-unit", 20}
				},
				result = loconame
			}

			local recipe02 = {
				type = "recipe",
				name = locowagonname,
				energy_required = 10,
				enabled = false,
				ingredients = {
					{"smelting-locomotive-tender", 1},
					{"battery", 10},
					{"electric-engine-unit", 20}
				},
				result = locowagonname
			}

			if angelsmods.addons.smeltingtrain.tier_amount > 1 then
				recipe01.localised_name = {"", {"recipe-name." .. loconame}, " MK" .. i}
				recipe02.localised_name = {"", {"recipe-name." .. locowagonname}, " MK" .. i}

				data.raw["item-with-entity-data"][loconame].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
				data.raw["item-with-entity-data"][locowagonname].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
				data.raw["locomotive"][loconame].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
				data.raw["locomotive"][locowagonname].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}

				table.insert(data.raw["item-with-entity-data"][loconame].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
				table.insert(data.raw["item-with-entity-data"][locowagonname].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
				table.insert(data.raw["locomotive"][loconame].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
				table.insert(data.raw["locomotive"][locowagonname].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
			else
				local locoitem = data.raw["item-with-entity-data"][loconame]
				locoitem.icons = {
					{icon = locoitem.icon, icon_size = 32},
					{icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}}
				}
				locoitem.icon = nil

				local locowagonitem = data.raw["item-with-entity-data"][locowagonname]
				locowagonitem.icons = {
					{icon = locowagonitem.icon, icon_size = 32},
					{icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}}
				}
				locowagonitem.icon = nil

				local locoentity = data.raw["locomotive"][loconame]
				locoentity.icons = {
					{icon = locoentity.icon, icon_size = 32},
					{icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}}
				}
				locoentity.icon = nil

				local locowagonentity = data.raw["locomotive"][locowagonname]
				locowagonentity.icons = {
					{icon = locowagonentity.icon, icon_size = 32},
					{icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}}
				}
				locowagonentity.icon = nil
			end

			data:extend{recipe01, recipe02}

			table.insert(data.raw["technology"][techname].effects, {type = "unlock-recipe", recipe = loconame})
			table.insert(data.raw["technology"][techname].effects, {type = "unlock-recipe", recipe = locowagonname})
		else
			local recipe01 = {
				type = "recipe",
				name = loconame .. "-" .. i,
				energy_required = 10,
				enabled = false,
				ingredients = {
					{"smelting-locomotive-1-" .. i, 1},
					{"battery", 10},
					{"electric-engine-unit", 20}
				},
				result = loconame .. "-" .. i,
				localised_name = {"", {"recipe-name." .. loconame}, " MK" .. i}
			}

			local recipe02 = {
				type = "recipe",
				name = locowagonname .. "-" .. i,
				energy_required = 10,
				enabled = false,
				ingredients = {
					{"smelting-locomotive-tender-" .. i, 1},
					{"battery", 10},
					{"electric-engine-unit", 20}
				},
				result = locowagonname .. "-" .. i,
				localised_name = {"", {"recipe-name." .. locowagonname}, " MK" .. i}
			}

			data:extend{recipe01, recipe02}

			table.insert(data.raw["technology"][techname .. "-" .. i].effects, {type = "unlock-recipe", recipe = loconame .. "-" .. i})
			table.insert(data.raw["technology"][techname .. "-" .. i].effects, {type = "unlock-recipe", recipe = locowagonname .. "-" .. i})

			data.raw["item-with-entity-data"][loconame .. "-" .. i].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
			data.raw["item-with-entity-data"][locowagonname .. "-" .. i].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
			data.raw["locomotive"][loconame .. "-" .. i].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}
			data.raw["locomotive"][locowagonname .. "-" .. i].icons[2].tint = {r = 30, g = 92, b = 125, a = 0.5}

			table.insert(data.raw["item-with-entity-data"][loconame .. "-" .. i].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
			table.insert(data.raw["item-with-entity-data"][locowagonname .. "-" .. i].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
			table.insert(data.raw["locomotive"][loconame .. "-" .. i].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
			table.insert(data.raw["locomotive"][locowagonname .. "-" .. i].icons, {icon = MODNAME .. "/electric.png", icon_size = 22, scale = 0.5, shift = {-11, 11}})
		end
	end
end