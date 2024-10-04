local MODNAME = "__SenpaisOverhall__"

for _, v in pairs(data.raw["electric-pole"]) do
	v.map_color = {r = 255, g = 255, b = 255}
end

for _, v in pairs(data.raw["solar-panel"]) do
	v.map_color = {r = 122, g = 47, b = 120}
end

for _, v in pairs(data.raw["generator"]) do
	v.map_color = {r = 124, g = 121, b = 124}
end

data.raw["resource"]["copper-ore"].map_color = {r = 198, g = 97, b = 2}
data.raw["resource"]["iron-ore"].map_color = {r = 4, g = 26, b = 65} 
data.raw["resource"]["stone"].map_color = {r = 81, g = 41, b = 7}

data.raw["player"]["player"].inventory_size = 180

data.raw["item"]["steam-engine"].icon = MODNAME.."/graphics/icons/steam-1.png"
data.raw["generator"]["steam-engine"].icon = MODNAME.."/graphics/icons/steam-1.png"
data.raw["generator"]["steam-engine"].horizontal_animation = { filename = MODNAME.."/graphics/entitys/steam-hori-1.png", width = 246, height = 137, frame_count = 32, line_length = 8, shift = { 1.34, -0.06 } }
data.raw["generator"]["steam-engine"].vertical_animation = { filename = MODNAME.."/graphics/entitys/steam-verti-1.png", width = 155, height = 186, frame_count = 32, line_length = 8, shift = { 0.812, 0.03125 } }

data.raw["item"]["boiler"].icon = MODNAME.."/graphics/icons/boiler-1.png"
data.raw["boiler"]["boiler"].icon = MODNAME.."/graphics/icons/boiler-1.png"
data.raw["boiler"]["boiler"].structure = {
										   left = { filename = MODNAME.."/graphics/entitys/boiler-left-1.png", priority = "extra-high", width = 46, height = 46, shift = {0.03125, 0} },
										   down = { filename = MODNAME.."/graphics/entitys/boiler-down-1.png", priority = "extra-high", width = 66, height = 72 },
										   left_down = { filename = MODNAME.."/graphics/entitys/boiler-left-down-1.png", priority = "extra-high", width = 60, height = 50 },
										   right_down = { filename = MODNAME.."/graphics/entitys/boiler-right-down-1.png", priority = "extra-high", width = 44, height = 50 },
										   left_up = { filename = MODNAME.."/graphics/entitys/boiler-left-up-1.png", priority = "extra-high", width = 66, height = 74 },
										   right_up = { filename = MODNAME.."/graphics/entitys/boiler-right-up-1.png", priority = "extra-high", width = 46, height = 72 },
										   t_down = { filename = MODNAME.."/graphics/entitys/boiler-t-down-1.png", priority = "extra-high", width = 44, height = 50 },
										   t_up = { filename = MODNAME.."/graphics/entitys/boiler-t-up-1.png", priority = "extra-high", width = 46, height = 70 }
										 }

data.raw["item"]["solar-panel"].icon = MODNAME.."/graphics/icons/solar-1.png"
data.raw["solar-panel"]["solar-panel"].icon = MODNAME.."/graphics/icons/solar-1.png"
data.raw["solar-panel"]["solar-panel"].picture = { filename = MODNAME.."/graphics/entitys/solar-1.png", priority = "high", width = 104, height = 96 }

data.raw["item"]["accumulator"].icon = MODNAME.."/graphics/icons/accu-1.png"
data.raw["accumulator"]["accumulator"].icon = MODNAME.."/graphics/icons/accu-1.png"
data.raw["accumulator"]["accumulator"].picture = { filename = MODNAME.."/graphics/entitys/accu-1.png", priority = "extra-high", width = 124, height = 103, shift = {0.6875, -0.203125} }
data.raw["accumulator"]["accumulator"].charge_animation = { filename = MODNAME.."/graphics/entitys/accu-charge-1.png", width = 138, height = 135, line_length = 8, frame_count = 24, shift = {0.46875, -0.640625}, animation_speed = 0.5 }
data.raw["accumulator"]["accumulator"].discharge_animation = { filename = MODNAME.."/graphics/entitys/accu-discharge-1.png", width = 147, height = 128, line_length = 8, frame_count = 24, shift = {0.390625, -0.53125}, animation_speed = 0.5 }

data.raw["item"]["medium-electric-pole"].icon = MODNAME.."/graphics/icons/medium-pole-1.png"
data.raw["electric-pole"]["medium-electric-pole"].icon = MODNAME.."/graphics/icons/medium-pole-1.png"
data.raw["electric-pole"]["medium-electric-pole"].pictures = { filename = MODNAME.."/graphics/entitys/medium-pole-1.png", priority = "high", width = 136, height = 122, direction_count = 4, shift = {1.4, -1.0} }

data.raw["item"]["big-electric-pole"].icon = MODNAME.."/graphics/icons/big-pole-1.png"
data.raw["electric-pole"]["big-electric-pole"].icon = MODNAME.."/graphics/icons/big-pole-1.png"

data.raw["item"]["substation"].icon = MODNAME.."/graphics/icons/substation-1.png"
data.raw["electric-pole"]["substation"].icon = MODNAME.."/graphics/icons/substation-1.png"

data.raw["recipe"]["assembling-machine-1"].ingredients = { { type = "item", name = "electronic-circuit", amount = 5 }, { type = "item", name = "iron-plate", amount = 5 }, { type = "item", name = "iron-gear-wheel", amount = 5 } }

data.raw["recipe"]["assembling-machine-2"].ingredients = { { type = "item", name = "assembling-machine-1", amount = 2 }, { type = "item", name = "electronic-circuit", amount = 10 }, { type = "item", name = "iron-plate", amount = 10 },
														   { type = "item", name = "iron-gear-wheel", amount = 10 } }

data.raw["recipe"]["assembling-machine-3"].category = "crafting-with-fluid"
data.raw["recipe"]["assembling-machine-3"].ingredients = { { type = "item", name = "assembling-machine-2", amount = 2 }, { type = "item", name = "electronic-circuit", amount = 15 }, { type = "item", name = "advanced-circuit", amount = 15 },
														   { type = "item", name = "steel-plate", amount = 15 }, { type = "fluid", name = "lubricant", amount = 15 } } 

data.raw["recipe"]["electric-furnace"].ingredients = { { type = "item", name = "electronic-circuit", amount =  10 }, { type = "item", name = "advanced-circuit", amount = 10 }, { type = "item", name = "steel-plate", amount = 10 },
													   { type = "item", name = "stone-brick", amount = 10 } }

data.raw["recipe"]["explosives"].ingredients = { { type = "item", name = "coal", amount = 1 }, { type = "fluid", name = "l-bavarium", amount = 2 }, { type = "fluid", name = "water", amount = 1 } }

Senpais_fun_replace_all("plastic-bar", "l-plastic")
Senpais_fun_tech_recipe_remove("plastics", "plastic-bar")
Senpais_fun_tech_recipe_add("plastics", "l-plastic")
Senpais_fun_tech_prerequi_remove("explosives", "sulfur-processing")
Senpais_fun_tech_prerequi_add("explosives", "bavarium")
Senpais_fun_tech_prerequi_remove("logistics-3", "automation-3")
Senpais_fun_tech_prerequi_remove("automation-3", "speed-module")
Senpais_fun_tech_prerequi_remove("automation-2", "electronics")
Senpais_fun_tech_prerequi_add("automation-2", "automation")
Senpais_fun_tech_prerequi_add("gates", "advanced-electronics")
Senpais_fun_tech_prerequi_remove("engine", "automation-2")
Senpais_fun_tech_prerequi_remove("armor-making-3", "speed-module")
Senpais_fun_tech_prerequi_add("armor-making-3", "advanced-electronics-2")
Senpais_fun_tech_prerequi_remove("electronics", "automation")

for z, ur in pairs(data.raw["technology"]) do
	ur.upgrade = true
end

if data.raw.unit["small-biter"] then
  if data.raw.unit["small-biter"].loot == nil then 
    data.raw.unit["small-biter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["small-biter"].loot, {  item = "small-alien-artifact",  count_min = 1,  count_max = 1,  probability = 0.5 } )
  end
end

if data.raw.unit["small-spitter"] then
  if data.raw.unit["small-spitter"].loot == nil then 
    data.raw.unit["small-spitter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["small-spitter"].loot, {  item = "small-alien-artifact",  count_min = 1,  count_max = 1,  probability = 0.5 } )
  end
end

if data.raw.unit["medium-biter"] then
  if data.raw.unit["medium-biter"].loot == nil then 
    data.raw.unit["medium-biter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["medium-biter"].loot, {  item = "small-alien-artifact",  count_min = 1,  count_max = 3,  probability = 0.75 } )
  end
end

if data.raw.unit["medium-spitter"] then
  if data.raw.unit["medium-spitter"].loot == nil then 
    data.raw.unit["medium-spitter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["medium-spitter"].loot, {  item = "small-alien-artifact",  count_min = 1,  count_max = 3,  probability = 0.75 } )
  end
end

if data.raw.unit["big-biter"]~=nil then
  if data.raw.unit["big-biter"].loot == nil then 
    data.raw.unit["big-biter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["big-biter"].loot, {  item = "small-alien-artifact",  count_min = 1,  count_max = 4,  probability = 1 } )
  end
end

if data.raw.unit["big-spitter"]~=nil then
  if data.raw.unit["big-spitter"].loot == nil then 
    data.raw.unit["big-spitter"].loot = {}
  end
  if data.raw.item["small-alien-artifact"] then
    table.insert(data.raw.unit["big-spitter"].loot, {  item = "small-alien-artifact",  count_min = 1,  count_max = 4,  probability = 1 } )
  end
end

if not data.raw["assembling-machine"]["assembling-machine-3"].ingredient_count == 6 then
  data.raw["assembling-machine"]["assembling-machine-3"].ingredient_count = 6
end