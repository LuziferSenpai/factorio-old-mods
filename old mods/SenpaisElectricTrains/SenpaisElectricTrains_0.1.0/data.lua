local trainname = "Senpais-Electric-Train"
local accuname = "Senpais-Power-Provider"
local MODNAME = "__SenpaisElectricTrains__/graphics/"

local train_entity = util.table.deepcopy( data.raw["locomotive"]["diesel-locomotive"] )
train_entity.name = trainname
train_entity.icon = MODNAME..trainname..".png"
train_entity.minable = { mining_time = 1, result = trainname }
train_entity.energy_source = { type = "burner", effectivity = 0.01, fuel_inventory_size = 0, smoke = { { name = "train-smoke", deviation = { 0.3, 0.3 }, frequency = 100, position = { 0, 0 }, starting_frame = 0,
							   starting_frame_deviation = 60, height = 2, height_deviation = 0.5, starting_vertical_speed = 0.2, starting_vertical_speed_deviation = 0.1 } } }
train_entity.color = { r = 40, g = 210, b = 154 }

local train_item = util.table.deepcopy( data.raw["item-with-entity-data"]["diesel-locomotive"] )
train_item.name = trainname
train_item.icon = MODNAME..trainname..".png"
train_item.order = "a[train-system]-z["..trainname.."]"
train_item.place_result = trainname

local train_recipe = util.table.deepcopy( data.raw["recipe"]["diesel-locomotive"] )
train_recipe.name = trainname
train_recipe.ingredients = { { "diesel-locomotive", 1 }, { "battery", 10 }, { "electric-engine-unit", 20 } }
train_recipe.result = trainname

local accu_entity = util.table.deepcopy( data.raw["accumulator"]["accumulator"] )
accu_entity.name = accuname
accu_entity.icon = MODNAME..accuname.."-i.png"
accu_entity.minable = { hardness = 0.2, mining_time = 0.5, result = accuname }
accu_entity.energy_source = { type = "electric", buffer_capacity = "1200KJ", usage_priority = "secondary-input", input_flow_limit = "1100KW", output_flow_limit = "0W" }
accu_entity.picture = { filename = MODNAME..accuname.."-e.png", priority = "extra-high", width = 124, height = 103, shift = { 0.6875, -0.203125 } }
accu_entity.charge_animation = { filename = MODNAME..accuname.."-charge.png", width = 138, height = 135, line_length = 8, frame_count = 24, shift = { 0.46875, -0.640625 }, animation_speed = 0.5 }
accu_entity.discharge_animation = { filename = MODNAME..accuname.."-discharge.png", width = 147, height = 128, line_length = 8, frame_count = 24, shift = { 0.390625, -0.53125 }, animation_speed = 0.5 }

local accu_item = util.table.deepcopy( data.raw["item"]["accumulator"] )
accu_item.name = accuname
accu_item.icon = MODNAME..accuname.."-i.png"
accu_item.order = "e[accumulator]-d["..accuname.."]"
accu_item.place_result = accuname

local accu_recipe = util.table.deepcopy( data.raw["recipe"]["accumulator"] )
accu_recipe.name = accuname
accu_recipe.ingredients = { { "accumulator", 2 }, { "battery", 5 }, { "electronic-circuit", 10 } }
accu_recipe.result = accuname

local senpais_electric_train_tech = util.table.deepcopy( data.raw["technology"]["railway"] )
senpais_electric_train_tech.name = trainname
senpais_electric_train_tech.icon = MODNAME.."tech.png"
senpais_electric_train_tech.icon_size = 128
senpais_electric_train_tech.effects = { { type = "unlock-recipe", recipe = trainname }, { type = "unlock-recipe", recipe = accuname } }
senpais_electric_train_tech.prerequisites = { "railway", "electric-engine", "battery", "electric-energy-distribution-2" }
senpais_electric_train_tech.unit = { count = 150, ingredients = { { "science-pack-1", 2 }, { "science-pack-2", 2}, { "science-pack-3", 1} }, time = 50 }
senpais_electric_train_tech.order = "s-e-t"

data:extend( { train_entity, train_item, train_recipe, accu_entity, accu_item, accu_recipe, senpais_electric_train_tech } )