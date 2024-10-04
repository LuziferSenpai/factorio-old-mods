local MODNAME = "__Battle-Train-MOD__/graphics/"

local function grid_create ( nama, numba )
	local grid = util.table.deepcopy( data.raw["equipment-grid"]["large-equipment-grid"] )
	grid.name = nama
	grid.width = numba
	grid.height = numba
	grid.equipment_categories = { "armor", "Senpais-Stuff" }

	data:extend( { grid } )
end

local function cargo_wagon_create( nama, invi_size, healtha, gridi, tinti, ingre, tech )
	local cargo_wagon_data = {}
	local cargo_pic = "__base__/graphics/entity/cargo-wagon"
	local cargo_wagon_enti = util.table.deepcopy( data.raw["cargo-wagon"]["cargo-wagon"] )
	cargo_wagon_enti.name = nama
	cargo_wagon_enti.icons = { { icon = "__base__/graphics/icons/cargo-wagon.png", tint = tinti } }
	cargo_wagon_enti.inventory_size = invi_size
	cargo_wagon_enti.minable = { mining_time = 1, result = nama }
	cargo_wagon_enti.max_health = healtha
	cargo_wagon_enti.equipment_grid = gridi
	cargo_wagon_enti.pictures = { layers = { { priority = "very-low", width = 222, height = 205, back_equals_front = true, direction_count = 128, filenames = { cargo_pic.."/cargo-wagon-1.png", cargo_pic.."/cargo-wagon-2.png", 
											   cargo_pic.."/cargo-wagon-3.png", cargo_pic.."/cargo-wagon-4.png" }, line_length = 4, lines_per_file = 8, shift = { 0, -0.796875 }, tint = tinti },
											 { flags = { "mask" }, width = 196, height = 174, direction_count = 128, back_equals_front = true, apply_runtime_tint = true, shift = { 0, -1.125 },
											   filenames = { cargo_pic.."/cargo-wagon-mask-1.png", cargo_pic.."/cargo-wagon-mask-2.png", cargo_pic.."/cargo-wagon-mask-3.png" }, line_length = 4, lines_per_file = 11, tint = tinti },
											 { flags = { "compressed" }, width = 246, height = 201, back_equals_front = true, draw_as_shadow = true, direction_count = 128, filenames = { cargo_pic.."/cargo-wagon-shadow-1.png",
											   cargo_pic.."/cargo-wagon-shadow-2.png", cargo_pic.."/cargo-wagon-shadow-3.png", cargo_pic.."/cargo-wagon-shadow-4.png" }, line_length = 4, lines_per_file = 8, shift = { 0.8, -0.078125 }, tint = tinti } } }
	cargo_wagon_enti.horizontal_doors = { layers = { { filename = cargo_pic.."/cargo-wagon-door-horizontal-end.png", line_length = 1, width = 220, height = 33, frame_count = 8, shift = { 0, -0.921875 }, tint = tinti },
													 { filename = cargo_pic.."/cargo-wagon-door-horizontal-side.png", line_length = 1, width = 186, height = 38, frame_count = 8, shift = { 0, -0.78125 }, tint = tinti },
													 { filename = cargo_pic.."/cargo-wagon-door-horizontal-side-mask.png", width = 182, height = 35, line_length = 1, frame_count = 8, shift = { 0, -0.828125 }, apply_runtime_tint = true, tint = tinti },
													 { filename = cargo_pic.."/cargo-wagon-door-horizontal-top.png", line_length = 1, width = 184, height = 28, frame_count = 8, shift = { 0.015625, -1.125 }, tint = tinti },
													 { filename = cargo_pic.."/cargo-wagon-door-horizontal-top-mask.png", width = 185, height = 23, frame_count = 8, line_length = 1, shift = { 0.015625, -1.17188 }, apply_runtime_tint = true, tint = tinti } } }
	cargo_wagon_enti.vertical_doors = { layers = { { filename = cargo_pic.."/cargo-wagon-door-vertical-end.png", line_length = 8, width = 30, height = 202, frame_count = 8, shift = { 0, -0.84375 }, tint = tinti },
												   { filename = cargo_pic.."/cargo-wagon-door-vertical-side.png", line_length = 8, width = 67, height = 169, frame_count = 8, shift = { 0.015625, -1.01563 }, tint = tinti },
												   { filename = cargo_pic.."/cargo-wagon-door-vertical-side-mask.png", line_length = 8, width = 56, height = 163, frame_count = 8, shift = { 0, -1.10938 }, apply_runtime_tint = true, tint = tinti },
												   { filename = cargo_pic.."/cargo-wagon-door-vertical-top.png", line_length = 8, width = 32, height = 168, frame_count = 8, shift = { 0, -1.125 }, tint = tint },
												   { filename = cargo_pic.."/cargo-wagon-door-vertical-top-mask.png", line_length = 8, width = 32, height = 166, frame_count = 8, shift = { 0, -1.15625 }, apply_runtime_tint = true, tint = tinti } } }
	
	table.insert( cargo_wagon_data, cargo_wagon_enti )

	local cargo_wagon_item = util.table.deepcopy( data.raw["item-with-entity-data"]["cargo-wagon"] )
	cargo_wagon_item.name = nama
	cargo_wagon_item.icons = { { icon = "__base__/graphics/icons/cargo-wagon.png", tint = tinti } }
	cargo_wagon_item.order = "a[train-system]-i["..nama.."]"
	cargo_wagon_item.place_result = nama

	table.insert( cargo_wagon_data, cargo_wagon_item )

	local cargo_wagon_recipe = util.table.deepcopy( data.raw["recipe"]["cargo-wagon"] )
	cargo_wagon_recipe.name = nama
	cargo_wagon_recipe.ingredients = ingre
	cargo_wagon_recipe.result = nama

	table.insert( cargo_wagon_data, cargo_wagon_recipe )

	data:extend( cargo_wagon_data )

	table.insert( data.raw["technology"][tech].effects, { type = "unlock-recipe", recipe = cargo_wagon_recipe.name } )
end

local function loco_create ( nama, healtha, gridi, tinti, ingre, tech )
	local loco_data = {}
	local loco_enti = util.table.deepcopy( data.raw["locomotive"]["diesel-locomotive"] )
	loco_enti.name = nama
	loco_enti.icon = MODNAME..nama..".png"
	loco_enti.minable = { mining_time = 1, result = nama }
	loco_enti.max_health = healtha
	loco_enti.equipment_grid = gridi
	loco_enti.color = tinti

	table.insert( loco_data, loco_enti )

	local loco_item = util.table.deepcopy( data.raw["item-with-entity-data"]["diesel-locomotive"] )
	loco_item.name = nama
	loco_item.icon = MODNAME..nama..".png"
	loco_item.order = "a[train-system]-h["..nama.."]"
	loco_item.place_result = nama

	table.insert( loco_data, loco_item )

	local loco_recipe = util.table.deepcopy( data.raw["recipe"]["diesel-locomotive"] )
	loco_recipe.name = nama
	loco_recipe.ingredients = ingre
	loco_recipe.result = nama

	table.insert( loco_data, loco_recipe )

	data:extend( loco_data )

	table.insert( data.raw["technology"][tech].effects, { type = "unlock-recipe", recipe = loco_recipe.name } )
end

local function elec_loco_create ( nama, healtha, gridi, tinti, ingre, tech )
	local loco_data = {}
	local loco_enti = util.table.deepcopy( data.raw["locomotive"]["Senpais-Electric-Train"] )
	loco_enti.name = nama
	loco_enti.icon = MODNAME..nama..".png"
	loco_enti.minable = { mining_time = 1, result = nama }
	loco_enti.max_health = healtha
	loco_enti.equipment_grid = gridi
	loco_enti.color = tinti

	table.insert( loco_data, loco_enti )

	local loco_item = util.table.deepcopy( data.raw["item-with-entity-data"]["Senpais-Electric-Train"] )
	loco_item.name = nama
	loco_item.icon = MODNAME..nama..".png"
	loco_item.order = "a[train-system]-zb["..nama.."]"
	loco_item.place_result = nama

	table.insert( loco_data, loco_item )

	local loco_recipe = util.table.deepcopy( data.raw["recipe"]["Senpais-Electric-Train"] )
	loco_recipe.name = nama
	loco_recipe.ingredients = ingre
	loco_recipe.result = nama

	table.insert( loco_data, loco_recipe )

	data:extend( loco_data )

	table.insert( data.raw["technology"][tech].effects, { type = "unlock-recipe", recipe = loco_recipe.name } )
end


grid_create( "grid-mk1", 5 )
grid_create( "grid-mk2", 8 )
grid_create( "grid-mk3", 12 )

cargo_wagon_create( "battle-cargo-1", 20, 1000, "grid-mk1", { r = 22, g = 187, b = 238 }, { { "cargo-wagon", 2 }, { "modular-armor", 2 } }, "armor-making-3" )
cargo_wagon_create( "battle-cargo-2", 40, 2000, "grid-mk2", { r = 94, g = 34, b = 6 }, { { "battle-cargo-1", 1 }, { "power-armor", 1 } }, "power-armor" )
cargo_wagon_create( "battle-cargo-3", 60, 3000, "grid-mk3", { r = 223, g = 32, b = 216 }, { { "battle-cargo-2", 1 }, { "power-armor-mk2", 1 } }, "power-armor-2" )

loco_create( "battle-loco-1", 1000, "grid-mk1", { r = 22, g = 187, b = 238 }, { { "diesel-locomotive", 2 }, { "modular-armor", 1 } }, "armor-making-3" )
loco_create( "battle-loco-2", 2000, "grid-mk2", { r = 94, g = 34, b = 6 }, { { "battle-loco-1", 1 }, { "power-armor", 1 } }, "power-armor" )
loco_create( "battle-loco-3", 3000, "grid-mk3", { r = 223, g = 32, b = 216 }, { { "battle-loco-2", 1 }, { "power-armor-mk2", 1 } }, "power-armor-2" )

if data.raw["locomotive"]["Senpais-Electric-Train"] then
	elec_loco_create( "elec-battle-loco-1", 1000, "grid-mk1", { r = 22, g = 187, b = 238 }, { { "Senpais-Electric-Train", 2 }, { "modular-armor", 1 } }, "armor-making-3" )
	elec_loco_create( "elec-battle-loco-2", 2000, "grid-mk2", { r = 94, g = 34, b = 6 }, { { "elec-battle-loco-1", 1 }, { "power-armor", 1 } }, "power-armor" )
	elec_loco_create( "elec-battle-loco-3", 3000, "grid-mk3", { r = 223, g = 32, b = 216 }, { { "elec-battle-loco-2", 1 }, { "power-armor-mk2", 1 } }, "power-armor-2" )
end

if data.raw["item"]["angel-cable"] then
	grid_create( "grid-mk4", 20 )
	cargo_wagon_create( "battle-cargo-4", 80, 4000, "grid-mk4", { r = 156, g = 24, b = 199 }, { { "battle-cargo-3", 1 }, { "alien-armor", 1 } }, "alien-stuff" )
	loco_create( "battle-loco-4", 4000, "grid-mk4", { r = 156, g = 24, b = 199 }, { { "battle-loco-3", 1 }, { "alien-armor", 1 } }, "alien-stuff" )
	if data.raw["locomotive"]["Senpais-Electric-Train"] then
		elec_loco_create( "elec-battle-loco-4", 4000, "grid-mk4", { r = 156, g = 24, b = 199 }, { { "elec-battle-loco-3", 1 }, { "alien-armor", 1 } }, "alien-stuff" )
	end
end

local equi_cate = { type = "equipment-category", name = "Senpais-Stuff" }

local laser_beam =
{
 type = "beam",
 name = "battle-laser-beam",
 flags = { "not-on-map" },
 width = 0.5,
 damage_interval = 20,
 light = { intensity = 0.5, size = 10 },
 working_sound = { { filename = MODNAME.."laser-beam-01.ogg", volume = 0.9 }, { filename = MODNAME.."laser-beam-02.ogg", volume = 0.9 }, { filename = MODNAME.."laser-beam-03.ogg", volume = 0.9 } },
 action = { type = "direct", action_delivery = { type = "instant", target_effects = { { type = "damage", damage = { amount = 20, type = "laser" } } } } },
 head = { filename = MODNAME.."laser-beam-head.png", line_length = 16, tint = { r = 232, g = 10, b = 165 }, frame_count = 12, x = 45*4, width = 45, height = 1, priority = "high", animation_speed = 0.5, blend_mode = "additive-soft" },
 tail = { filename = MODNAME.."laser-beam-tail.png", line_length = 16, tint = { r = 232, g = 10, b = 165 }, frame_count = 12, x = 48*4, width = 48, height = 24, priority = "high", animation_speed = 0.5, blend_mode = "additive-soft" },
 body = { { filename = MODNAME.."laser-beam-body.png", line_length = 16, tint = { r = 232, g = 10, b = 165 }, frame_count = 12, x = 48*4, width = 48, height = 24, priority = "high", animation_speed = 0.5, blend_mode = "additive-soft" } }
}

local laser_equi = util.table.deepcopy( data.raw["active-defense-equipment"]["personal-laser-defense-equipment"] )
laser_equi.name = "laser-2"
laser_equi.sprite = { filename = MODNAME.."laser-2.png", width = 64, height = 96, priority = "medium" }
laser_equi.energy_source = { type = "electric", usage_priority = "secondary-input", buffer_capacity = "750kJ" }
laser_equi.attack_parameters = { type = "beam", ammo_category = "electric", cooldown = 20, range = 25, damage_modifier = 4, ammo_type = { type = "projectile", category = "laser-turret", energy_consumption = "700kW", action =
							   { { type = "direct", action_delivery = { { type = "beam", beam = "battle-laser-beam", max_length = 20, duration = 20, source_offset = { 0, -1.3 } } } } } }, 
								sound = { { filename = MODNAME.."laser-beam-01.ogg", volume = 0.5 }, { filename = MODNAME.."laser-beam-02.ogg", volume = 0.5 }, { filename = MODNAME.."laser-beam-03.ogg", volume = 0.5 } } }
laser_equi.categories = { "Senpais-Stuff" }

local laser_item = util.table.deepcopy( data.raw["item"]["personal-laser-defense-equipment"] )
laser_item.name = "laser-2"
laser_item.icon = MODNAME.."laser-2-i.png"
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
laser_tech.unit = { count = 200,  ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, {"alien-science-pack", 1 } }, time = 50 }

data:extend( { equi_cate, laser_equi, laser_item, laser_recipe, laser_tech, laser_beam } )