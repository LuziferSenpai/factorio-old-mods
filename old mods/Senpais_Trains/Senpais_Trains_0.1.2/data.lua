Senpais = Senpais or {}
Senpais.Functions = Senpais.Functions or {}
Senpais.Functions.Create = Senpais.Functions.Create or {}

local accuname = "Senpais-Power-Provider"
local MODNAME = "__Senpais_Trains__"

local function replace_filenames_in_layer( layer, directory )
	if layer.filenames then
		for i, filename in pairs( layer.filenames ) do
			layer.filenames[i] = string.gsub( filename, "__base__/graphics/entity/diesel-locomotive", directory )
		end
	end
	if layer.filename then
		layer.file = string.gsub( filename, "__base__/graphics/entity/diesel-locomotive", directory )
	end
end

local function replace_mask_image_filenames( layers, directory )
	for _, layer in pairs( layers ) do
		if layer.apply_runtime_tint == true then
			replace_filenames_in_layer( layer, directory )
			if layer.hr_version then
				replace_filenames_in_layer( layer.hr_version, directory )
			end
		end
	end
end


function Senpais.Functions.Create.Elec_Locomotive( multiplier, name, icon, health, weight, speed, color, grid, subgroup, order, stack, ingredients, tech, directory )
	local MaxPower = multiplier * 600 .. "kW"
	local train_entity = util.table.deepcopy( data.raw["locomotive"]["locomotive"] )
	train_entity.name = name
	train_entity.icon = icon
	train_entity.minable.result = name
	train_entity.max_health = health
	train_entity.weight = weight
	train_entity.max_speed = speed
	train_entity.max_power = MaxPower
	train_entity.burner = { effictivity = 1, fuel_inventory_size = 0 }

	replace_mask_image_filenames( train_entity.pictures.layers, directory )

	train_entity.color = color
	if grid ~=  nil then
		train_entity.equipment_grid = grid
	end

	local train_item = util.table.deepcopy( data.raw["item-with-entity-data"]["locomotive"] )
	train_item.name = name
	train_item.icon = icon
	train_item.subgroup = subgroup
	train_item.order = order
	train_item.place_result = name
	train_item.stack_size = stack

	local train_recipe = util.table.deepcopy( data.raw["recipe"]["locomotive"] )
	train_recipe.name = name
	train_recipe.ingredients = ingredients
	train_recipe.result = name

	data:extend( { train_entity, train_item, train_recipe } )

	table.insert( data.raw["technology"][tech].effects, { type = "unlock-recipe", recipe = name } )
end

function Senpais.Functions.Create.Battle_Locomotive( multiplier, name, icon, health, weight, speed, color, grid, subgroup, order, stack, ingredients, tech, directory )
	local MaxPower = multiplier * 600 .. "kW"
	local train_entity = util.table.deepcopy( data.raw["locomotive"]["locomotive"] )
	train_entity.name = name
	train_entity.icon = icon
	train_entity.minable.result = name
	train_entity.max_health = health
	train_entity.weight = weight
	train_entity.max_speed = speed
	train_entity.max_power = MaxPower

	replace_mask_image_filenames( train_entity.pictures.layers, directory )

	train_entity.color = color
	train_entity.equipment_grid = grid

	local train_item = util.table.deepcopy( data.raw["item-with-entity-data"]["locomotive"] )
	train_item.name = name
	train_item.icon = icon
	train_item.subgroup = subgroup
	train_item.order = order
	train_item.place_result = name
	train_item.stack_size = stack

	local train_recipe = util.table.deepcopy( data.raw["recipe"]["locomotive"] )
	train_recipe.name = name
	train_recipe.ingredients = ingredients
	train_recipe.result = name

	data:extend( { train_entity, train_item, train_recipe } )

	table.insert( data.raw["technology"][tech].effects, { type = "unlock-recipe", recipe = name } )
end

function Senpais.Functions.Create.Battle_Wagon( name, icon, inventory, health, weight, speed, color, grid, subgroup, order, stack, ingredients, tech, directory )
	local wagon_entity = util.table.deepcopy( data.raw["cargo-wagon"]["cargo-wagon"] )
	wagon_entity.name = name
	wagon_entity.icon = icon
	wagon_entity.inventory_size = inventory
	wagon_entity.minable.result = name
	wagon_entity.max_health = health
	wagon_entity.weight = weight
	wagon_entity.max_speed = speed

	replace_mask_image_filenames( wagon_entity.pictures.layers, directory )
	replace_mask_image_filenames( wagon_entity.horizontal_doors.layers, directory )
	replace_mask_image_filenames( wagon_entity.vertical_doors.layers, directory )

	wagon_entity.color = color
	wagon_entity.equipment_grid = grid

	local wagon_item = util.table.deepcopy( data.raw["item-with-entity-data"]["cargo-wagon"] )
	wagon_item.name = name
	wagon_item.icon = icon
	wagon_item.subgroup = subgroup
	wagon_item.order = order
	wagon_item.place_result = name
	wagon_item.stack_size = stack

	local wagon_recipe = util.table.deepcopy( data.raw["recipe"]["cargo-wagon"] )
	wagon_recipe.name = name
	wagon_recipe.ingredients = ingredients
	wagon_recipe.result = name

	data:extend( { wagon_entity, wagon_item, wagon_recipe } )

	table.insert( data.raw["technology"][tech].effects, { type = "unlock-recipe", recipe = name } )
end

function Senpais.Functions.Create.Grid( name, width, height, categories )
	local grid = util.table.deepcopy( data.raw["equipment-grid"]["large-equipment-grid"] )
	grid.name = name
	grid.width = width
	grid.height = height
	grid.equipment_categories = categories

	data:extend( { grid } )
end

if settings["startup"]["Battle-Laser"].value == true then
	local laser_beam = util.table.deepcopy( data.raw["beam"]["electric-beam"] )
	laser_beam.name = "battle-laser-beam"
	laser_beam.action.action_delivery.target_effects = { { type = "damage", damage = { amount = 20, type = "electric" } } }
	laser_beam.working_sound = { { filename = MODNAME .. "/graphics/laser-beam-01.ogg", volume = 0.9 }, { filename = MODNAME .. "/graphics/laser-beam-02.ogg", volume = 0.9 }, { filename = MODNAME .. "/graphics/laser-beam-03.ogg", volume = 0.9 } }
	laser_beam.head = { filename = MODNAME .. "/graphics/laser-beam-head.png", line_length = 16, tint = { r = 232, g = 10, b = 165 }, frame_count = 12, width = 45, height = 1, blend_mode = "additive-soft" }
	laser_beam.tail = { filename = MODNAME .. "/graphics/laser-beam-tail.png", line_length = 16, tint = { r = 232, g = 10, b = 165 }, frame_count = 12, width = 48, height = 24, blend_mode = "additive-soft" }
	laser_beam.body = { { filename = MODNAME .. "/graphics/laser-beam-body.png", line_length = 16, tint = { r = 232, g = 10, b = 165 }, frame_count = 12, width = 48, height = 24, blend_mode = "additive-soft" } }

	local laser_equipment = util.table.deepcopy( data.raw["active-defense-equipment"]["personal-laser-defense-equipment"] )
	laser_equipment.name = "laser-2"
	laser_equipment.sprite.filename = MODNAME .. "/graphics/laser-2.png"
	laser_equipment.energy_source.buffer_capacity = "750kJ"
	laser_equipment.attack_parameters = { type = "beam", ammo_category = "electric", cooldown = 20, range = 25, damage_modifier = 4, ammo_type = { type = "projectile", category = "laser-turret",
										  energy_consumption = "700kW", action = { { type = "direct", action_delivery = { { type = "beam", beam = "battle-laser-beam", max_length = 20, duration = 20, source_offset = { 0, -13 } } } } } },
										  sound = { { filename = MODNAME .. "/graphics/laser-beam-01.ogg", volume = 0.5 }, { filename = MODNAME .. "/graphics/laser-beam-02.ogg", volume = 0.5 }, { filename = MODNAME .. "/graphics/laser-beam-03.ogg", volume = 0.5 } } }
	laser_equipment.categories = { "Senpais-Trains" }

	local laser_item = util.table.deepcopy( data.raw["item"]["personal-laser-defense-equipment"] )
	laser_item.name = "laser-2"
	laser_item.icon = MODNAME .. "/graphics/laser-2-i.png"
	laser_item.placed_as_equipment_result = "laser-2"
	laser_item.order = "d[active-defense]-ab[laser-2]"

	local laser_recipe = util.table.deepcopy( data.raw["recipe"]["personal-laser-defense-equipment"] )
	laser_recipe.name = "laser-2"
	laser_recipe.ingredients = { { "personal-laser-defense-equipment", 1 }, { "processing-unit", 10 }, { "steel-plate", 50 }, { "laser-turret", 5 } }
	laser_recipe.result = "laser-2"

	local laser_tech = util.table.deepcopy( data.raw["technology"]["personal-laser-defense-equipment"] )
	laser_tech.name = "personal-laser-defense-equipment-2"
	laser_tech.prerequisites = { "personal-laser-defense-equipment" }
	laser_tech.effects = { { type = "unlock-recipe", recipe = "laser-2" } }
	laser_tech.unit.count = 250

	data:extend( { laser_beam, laser_equipment, laser_item, laser_recipe, laser_tech } )
end

Senpais.Functions.Create.Grid( "Senpais-Trains", 10, 10, { "Senpais-Trains" } )

local equipment_category = { type = "equipment-category", name = "Senpais-Trains" }

data:extend( { equipment_category } )

if settings["startup"]["Senpais-Power-Provider"].value == true then
	local accu_entity = util.table.deepcopy( data.raw["electric-energy-interface"]["electric-energy-interface"] )
	accu_entity.name = accuname
	accu_entity.icon = MODNAME .. "/graphics/" .. accuname .. "-i.png"
	accu_entity.minable.result = accuname 
	accu_entity.enable_gui = false
    accu_entity.allow_copy_paste = false
	accu_entity.energy_source = { type = "electric", buffer_capacity = "1200KJ", usage_priority = "primary-input", input_flow_limit = "1100KW", output_flow_limit = "0W" }
	accu_entity.energy_production = "0kW"
	accu_entity.energy_usage = "0kW"
	accu_entity.picture = { filename = MODNAME .. "/graphics/" .. accuname.. "-e.png", priority = "extra-high", width = 124, height = 103, shift = { 0.6875, -0.203125 } }
	accu_entity.charge_animation = { filename = MODNAME .. "/graphics/" .. accuname .. "-charge.png", width = 138, height = 135, line_length = 8, frame_count = 24, shift = { 0.46875, -0.640625 }, animation_speed = 0.5 }

	local accu_item = util.table.deepcopy( data.raw["item"]["accumulator"] )
	accu_item.name = accuname
	accu_item.icon = MODNAME .. "/graphics/" .. accuname .. "-i.png"
	accu_item.order = "e[accumulator]-d["..accuname.."]"
	accu_item.place_result = accuname

	local accu_recipe = util.table.deepcopy( data.raw["recipe"]["accumulator"] )
	accu_recipe.name = accuname
	accu_recipe.ingredients = { { "accumulator", 2 }, { "battery", 5 }, { "electronic-circuit", 10 } }
	accu_recipe.result = accuname

	local senpais_electric_train_tech = util.table.deepcopy( data.raw["technology"]["railway"] )
	senpais_electric_train_tech.name = "Senpais-Electric-Train"
	senpais_electric_train_tech.icon = MODNAME .. "/graphics/tech.png"
	senpais_electric_train_tech.icon_size = 128
	senpais_electric_train_tech.effects = { { type = "unlock-recipe", recipe = accuname } }
	senpais_electric_train_tech.prerequisites = { "railway", "electric-engine", "battery", "electric-energy-distribution-2" }
	senpais_electric_train_tech.unit = { count = 150, ingredients = { { "science-pack-1", 2 }, { "science-pack-2", 2}, { "science-pack-3", 1} }, time = 50 }
	senpais_electric_train_tech.order = "s-e-t"

	data:extend( { accu_entity, accu_item, accu_recipe, senpais_electric_train_tech } )
end

if settings["startup"]["Senpais-Electric-Train"].value == true then
	Senpais.Functions.Create.Elec_Locomotive( 1, "Senpais-Electric-Train", MODNAME .. "/graphics/Senpais-Electric-Train.png", 1000, 2000, 1.2, { r = 83, g = 187, b = 144 }, nil,
										  	  "transport", "a[train-system]-faa[Senpais-Electric-Train]", 5, { { "locomotive", 1 }, { "battery", 10 }, { "electric-engine-unit", 20 } },
										  	  "Senpais-Electric-Train", MODNAME .. "/graphics" )
end

if settings["startup"]["Senpais-Electric-Train-Heavy"].value == true then
	local senpais_electric_train_tech_2 = util.table.deepcopy( data.raw["technology"]["Senpais-Electric-Train"] )
	senpais_electric_train_tech_2.name = "Senpais-Electric-Train-2"
	senpais_electric_train_tech_2.effects = {}
	senpais_electric_train_tech_2.prerequisites = { "Senpais-Electric-Train" }
	senpais_electric_train_tech_2.unit.count = 300

	data:extend( { senpais_electric_train_tech_2 } )

	Senpais.Functions.Create.Elec_Locomotive( 4, "Senpais-Electric-Train-Heavy", MODNAME .. "/graphics/Senpais-Electric-Train-Heavy.png", 2000, 5000, 1.2, { r = 166, g = 26, b = 26 }, nil,
											  "transport", "a[train-system]-fab[Senpais-Electric-Train-Heavy]", 5, { { "Senpais-Electric-Train", 1 }, { "battery", 20 }, { "electric-engine-unit", 20 } },
											  "Senpais-Electric-Train-2", MODNAME .. "/graphics" )
end

if settings["startup"]["Battle-Loco-1"].value == true then
	Senpais.Functions.Create.Battle_Locomotive( 1, "Battle-Loco-1", MODNAME .. "/graphics/Battle-Loco-1.png", 1000, 2000, 1.2, { r = 213, g = 105, b = 33 }, "Senpais-Trains", "transport",
												"a[train-system]-fba[Battle-Loco-1]", 5, { { "locomotive", 1 }, { "modular-armor", 1 } }, "modular-armor", MODNAME .. "/graphics" )
end

if settings["startup"]["Battle-Loco-2"].value == true then
	Senpais.Functions.Create.Battle_Locomotive( 2, "Battle-Loco-2", MODNAME .. "/graphics/Battle-Loco-2.png", 2000, 4000, 1.4, { r = 101, g = 33, b = 213 }, "Senpais-Trains", "transport",
												"a[train-system]-fbb[Battle-Loco-2]", 5, { { "Battle-Loco-1", 1 }, { "power-armor", 1 } }, "power-armor", MODNAME .. "/graphics" )
end

if settings["startup"]["Battle-Loco-3"].value == true then
	Senpais.Functions.Create.Battle_Locomotive( 3, "Battle-Loco-3", MODNAME .. "/graphics/Battle-Loco-3.png", 3000, 6000, 1.6, { r = 196, g = 0, b = 74 }, "Senpais-Trains", "transport",
												"a[train-system]-fbc[Battle-Loco-3]", 5, { { "Battle-Loco-2", 1 }, { "power-armor-mk2", 1 } }, "power-armor-2", MODNAME .. "/graphics" )
end

if settings["startup"]["Battle-Wagon-1"].value == true then
	Senpais.Functions.Create.Battle_Wagon( "Battle-Wagon-1", "__base__/graphics/icons/cargo-wagon.png", 20, 1000, 2000, 1.2, { r = 19, g = 122, b = 156 }, "Senpais-Trains", "transport",
										   "a[train-system]-gaa[Battle-Wagon-1]", 5, { { "locomotive", 1 }, { "modular-armor", 1 } }, "modular-armor", MODNAME .. "/graphics" )

	data.raw["item-with-entity-data"]["Battle-Wagon-1"].icon = nil
	data.raw["item-with-entity-data"]["Battle-Wagon-1"].icons = { { icon = "__base__/graphics/icons/cargo-wagon.png", tint = { r = 19, g = 122, b = 156 } } }
end

if settings["startup"]["Battle-Wagon-2"].value == true then
	Senpais.Functions.Create.Battle_Wagon( "Battle-Wagon-2", "__base__/graphics/icons/cargo-wagon.png", 40, 2000, 4000, 1.4, { r = 29, g = 127, b = 12 }, "Senpais-Trains", "transport",
										   "a[train-system]-gab[Battle-Wagon-2]", 5, { { "Battle-Wagon-1", 1 }, { "power-armor", 1 } }, "power-armor", MODNAME .. "/graphics" )

	data.raw["item-with-entity-data"]["Battle-Wagon-2"].icon = nil
	data.raw["item-with-entity-data"]["Battle-Wagon-2"].icons = { { icon = "__base__/graphics/icons/cargo-wagon.png", tint = { r = 29, g = 127, b = 12 } } }
end

if settings["startup"]["Battle-Wagon-3"].value == true then
	Senpais.Functions.Create.Battle_Wagon( "Battle-Wagon-3", "__base__/graphics/icons/cargo-wagon.png", 60, 2000, 6000, 1.6, { r = 156, g = 66, b = 150 }, "Senpais-Trains", "transport",
										   "a[train-system]-gac[Battle-Wagon-3]", 5, { { "Battle-Wagon-2", 1 }, { "power-armor-mk2", 1 } }, "power-armor-2", MODNAME .. "/graphics" )

	data.raw["item-with-entity-data"]["Battle-Wagon-3"].icon = nil
	data.raw["item-with-entity-data"]["Battle-Wagon-3"].icons = { { icon = "__base__/graphics/icons/cargo-wagon.png", tint = { r = 156, g = 66, b = 150 } } }
end

if settings["startup"]["Elec-Battle-Loco-1"].value == true then
	Senpais.Functions.Create.Elec_Locomotive( 1, "Elec-Battle-Loco-1", MODNAME .. "/graphics/Elec-Battle-Loco-1.png", 1000, 2000, 1.2, { r = 180, g = 136, b = 0 }, "Senpais-Trains", "transport",
												"a[train-system]-fca[Elec-Battle-Loco-1]", 5, { { "Senpais-Electric-Train", 1 }, { "modular-armor", 1 } }, "modular-armor", MODNAME .. "/graphics" )
end

if settings["startup"]["Elec-Battle-Loco-2"].value == true then
	Senpais.Functions.Create.Elec_Locomotive( 2, "Elec-Battle-Loco-2", MODNAME .. "/graphics/Elec-Battle-Loco-2.png", 2000, 4000, 1.4, { r = 83, g = 166, b = 187 }, "Senpais-Trains", "transport",
												"a[train-system]-fcb[Elec-Battle-Loco-2]", 5, { { "Elec-Battle-Loco-1", 1 }, { "power-armor", 1 } }, "power-armor", MODNAME .. "/graphics" )
end

if settings["startup"]["Elec-Battle-Loco-3"].value == true then
	Senpais.Functions.Create.Elec_Locomotive( 3, "Elec-Battle-Loco-3", MODNAME .. "/graphics/Elec-Battle-Loco-3.png", 3000, 6000, 1.6, { r = 157, g = 0, b = 196 }, "Senpais-Trains", "transport",
												"a[train-system]-fcc[Elec-Battle-Loco-3]", 5, { { "Elec-Battle-Loco-2", 1 }, { "power-armor-mk2", 1 } }, "power-armor-2", MODNAME .. "/graphics" )
end

if settings["startup"]["braking-force-8"].value == true then
	local braking_force_8 = util.table.deepcopy( data.raw["technology"]["braking-force-7"] )
	braking_force_8.name = "braking-force-8"
	braking_force_8.effects = { { type = "train-braking-force-bonus", modifier = 0.30 } }
	braking_force_8.prerequisites = { "braking-force-7" }
	braking_force_8.unit.count = 800

	data:extend( { braking_force_8 } )
end

if settings["startup"]["braking-force-9"].value == true then
	local braking_force_9 = util.table.deepcopy( data.raw["technology"]["braking-force-7"] )
	braking_force_9.name = "braking-force-9"
	braking_force_9.effects = { { type = "train-braking-force-bonus", modifier = 0.50 } }
	braking_force_9.prerequisites = { "braking-force-8" }
	braking_force_9.unit.count = 1000

	data:extend( { braking_force_9 } )
end