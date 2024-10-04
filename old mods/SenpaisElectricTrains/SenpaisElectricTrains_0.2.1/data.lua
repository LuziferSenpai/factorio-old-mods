if not Senpais then Senpais = {} end
if not Senpais.ElectricTrains then Senpais.ElectricTrains = {} end
if not Senpais.ElectricTrains.Functions then Senpais.ElectricTrains.Functions = {} end

local cargo_name = "Senpais-Electric-Cargo-Wagon"
local accuname = "Senpais-Power-Provider"
local MODNAME = "__SenpaisElectricTrains__"

function Senpais.ElectricTrains.Functions.Create_Locomotive ( nama, ican, colar, orderi, recipa, healthy, Weight, MaxSpeed, multiplyer, categore )
	local MaxPower = multiplyer * 600 .. "kW"
	local train_entity = util.table.deepcopy( data.raw["locomotive"]["diesel-locomotive"] )
	train_entity.name = nama
	train_entity.icon = ican
	train_entity.minable.result = nama
	train_entity.health = healthy
	train_entity.weight = Weight
	train_entity.max_speed = MaxSpeed
	train_entity.power = MaxPower
	train_entity.energy_source = { type = "burner", effectivity = 0.01, fuel_inventory_size = 0, smoke = { { name = "train-smoke", deviation = { 0.3, 0.3 }, frequency = 100, position = { 0, 0 }, starting_frame = 0,
								   starting_frame_deviation = 60, height = 2, height_deviation = 0.5, starting_vertical_speed = 0.2, starting_vertical_speed_deviation = 0.1 } } }
	train_entity.color = colar

	local train_item = util.table.deepcopy( data.raw["item-with-entity-data"]["diesel-locomotive"] )
	train_item.name = nama
	train_item.icon = ican
	train_item.order = orderi
	train_item.place_result = nama
	if categore ~= nil then
		train_item.category = categore
	end

	local train_recipe = util.table.deepcopy( data.raw["recipe"]["diesel-locomotive"] )
	train_recipe.name = nama
	train_recipe.ingredients = recipa
	train_recipe.result = nama

	data:extend( { train_entity, train_item, train_recipe } )

end

Senpais.ElectricTrains.Functions.Create_Locomotive( "Senpais-Electric-Train", MODNAME .. "/graphics/Senpais-Electric-Train.png", { r = 40, g = 210, b = 154 }, "a[train-system]-za[Senpais-Electric-Train]",
													{ { "diesel-locomotive", 1 }, { "battery", 10 }, { "electric-engine-unit", 20 } }, 1000, 2000, 1.2, 1 )

local accu_entity = util.table.deepcopy( data.raw["electric-energy-interface"]["electric-energy-interface"] )
accu_entity.name = accuname
accu_entity.icon = MODNAME .. "/graphics/" .. accuname .. "-i.png"
accu_entity.minable.result = accuname 
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
senpais_electric_train_tech.effects = { { type = "unlock-recipe", recipe = "Senpais-Electric-Train" }, { type = "unlock-recipe", recipe = accuname } }
senpais_electric_train_tech.prerequisites = { "railway", "electric-engine", "battery", "electric-energy-distribution-2" }
senpais_electric_train_tech.unit = { count = 150, ingredients = { { "science-pack-1", 2 }, { "science-pack-2", 2}, { "science-pack-3", 1} }, time = 50 }
senpais_electric_train_tech.order = "s-e-t"

data:extend( { accu_entity, accu_item, accu_recipe, senpais_electric_train_tech } )