local MODNAME = "__SenpaisOverhall__"

data:extend
(
{
 {
  type = "recipe",
  name = "l-plastic",
  category = "chemistry",
  enabled = false,
  energy_required = 1,
  ingredients = { { type = "item", name = "coal", amount = 1 }, { type = "fluid", name = "petroleum-gas", amount = 3 } },
  results = { { type = "fluid", name = "l-plastic", amount = 5 } },
  icon = MODNAME.."/graphics/icons/plastic.png",
  subgroup = "s-01",
  order = "a"
 },
 {
  type = "recipe",
  name = "l-angel",
  category = "chemistry",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "angel-ore", amount = 1 }, { type = "fluid", name = "water", amount = 10 }, { type = "fluid", name = "sulfuric-acid", amount = 5 } },
  results = { { type = "fluid", name = "l-angel", amount = 5 } },
  icon = MODNAME.."/graphics/icons/angel-fluid.png",
  subgroup = "s-01",
  order = "b"
 },
 {
  type = "recipe",
  name = "l-devil",
  category = "chemistry",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "devil-ore", amount = 1 }, { type = "fluid", name = "water", amount = 10 }, { type = "fluid", name = "sulfuric-acid", amount = 5 } },
  results = { { type = "fluid", name = "l-devil", amount = 5 } },
  icon = MODNAME.."/graphics/icons/devil-fluid.png",
  subgroup = "s-01",
  order = "c"
 },
 {
  type = "recipe",
  name = "alien-fluid",
  category = "chemistry",
  enabled = false,
  energy_required = 25,
  ingredients = { { type = "item", name = "alien-artifact", amount = 1 }, { type = "fluid", name = "l-angel", amount = 5 }, { type = "fluid", name = "l-devil", amount = 5 } },
  results = { { type = "fluid", name = "alien-fluid", amount = 4 } },
  icon = MODNAME.."/graphics/icons/alien-fluid.png",
  subgroup = "s-01",
  order = "d"
 },
 {
  type = "recipe",
  name = "l-bavarium",
  category = "chemistry",
  enabled = false,
  energy_required = 5,
  ingredients = { { type = "item", name = "bavarium", amount = 1 }, { type = "fluid", name = "water", amount = 10 } },
  results = { { type = "fluid", name = "l-bavarium", amount = 5 } },
  icon = MODNAME.."/graphics/icons/bavarium-fluid.png",
  subgroup = "s-01",
  order = "e"
 },
 {
  type = "recipe",
  name = "angel-cable",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "copper-cable", amount = 10 }, { type = "fluid", name = "l-angel", amount = 10 } },
  results = { { type = "item", name = "angel-cable", amount = 2 } } 
 },
 {
  type = "recipe",
  name = "angel-circuit",
  category = "advanced-crafting",
  enabled = false,
  energy_required = 20,
  ingredients = { { type = "item", name = "processing-unit", amount = 1 }, { type = "item", name = "angel-cable", amount = 3 } },
  results = { { type = "item", name = "angel-circuit", amount = 1 } }
 },
 {
  type = "recipe",
  name = "devil-cable",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "copper-cable", amount = 10 }, { type = "fluid", name = "l-devil", amount = 10 } },
  results = { { type = "item", name = "devil-cable", amount = 2 } }
 },
 {
  type = "recipe",
  name = "devil-circuit",
  category = "advanced-crafting",
  enabled = false,
  energy_required = 20,
  ingredients = { { type = "item", name = "processing-unit", amount = 1 }, { type = "item", name = "devil-cable", amount = 3 } },
  results = { { type = "item", name = "devil-circuit", amount = 1 } }
 },
 {
  type = "recipe",
  name = "alien-cable",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 20,
  ingredients = { { type = "item", name = "angel-cable", amount = 5 }, { type = "item", name = "devil-cable", amount = 5 }, { type = "fluid", name = "alien-fluid", amount = 20 } },
  results = { { type = "item", name = "alien-cable", amount = 2 } }
 },
 {
  type = "recipe",
  name = "alien-circuit",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 40,
  ingredients = { { type = "item", name = "angel-circuit", amount = 1 }, { type = "item", name = "devil-circuit", amount = 1 }, { type = "item", name = "alien-cable", amount = 10 } },
  results = { { type = "item", name = "alien-circuit", amount = 1 } }
 },

 {
  type = "recipe",
  name = "steam-2",
  enabled = false,
  ingredients = { { type = "item", name = "steam-engine", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 5 }, { type = "item", name = "steel-plate", amount = 5 } },
  results = { { type = "item", name = "steam-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "steam-3",
  enabled = false,
  energy_required = 5,
  ingredients = { { type = "item", name = "steam-2", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 10 }, { type = "item", name = "advanced-circuit", amount = 10 },
                  { type = "item", name = "steel-plate", amount = 10 } },
  results = { { type = "item", name = "steam-3", amount = 1 } }
 },
 {
  type = "recipe",
  name = "steam-4",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "steam-3", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 20 }, { type = "item", name = "advanced-circuit", amount = 20},
                  { type = "item", name = "processing-unit", amount = 20 }, { type = "item", name = "steel-plate", amount = 10 } },
  results = { { type = "item", name = "steam-4", amount = 1 } }
 },
 {
  type = "recipe",
  name = "steam-5",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 25,
  ingredients = { { type = "item", name = "steam-4", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 40 }, { type = "item", name = "advanced-circuit", amount = 40 },
                  { type = "item", name = "processing-unit", amount = 20 }, { type = "item", name = "angel-circuit", amount = 5 }, { type = "item", name = "steel-plate", amount = 40 } },
  results = { { type = "item", name = "steam-5", amount = 1 } }
 },
 {
  type = "recipe",
  name = "boiler-2",
  enabled = false,
  ingredients = { { type = "item", name = "boiler", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 5 }, { type = "item", name = "steel-plate", amount = 5 } },
  results = { { type = "item", name = "boiler-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "boiler-3",
  enabled = false,
  energy_required = 5,
  ingredients = { { type = "item", name = "boiler-2", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 10 }, { type = "item", name = "advanced-circuit", amount = 10 },
                  { type = "item", name = "steel-plate", amount = 10 } },
  results = { { type = "item", name = "boiler-3", amount = 1 } }
 },
 {
  type = "recipe",
  name = "boiler-4",
  category = "advanced-crafting",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "boiler-3", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 20 }, { type = "item", name = "advanced-circuit", amount = 20},
                  { type = "item", name = "processing-unit", amount = 20 }, { type = "item", name = "steel-plate", amount = 20 } },
  results = { { type = "item", name = "boiler-4", amount = 1 } }
 },
 {
  type = "recipe",
  name = "boiler-5",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 25,
  ingredients = { { type = "item", name = "boiler-4", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 40 }, { type = "item", name = "advanced-circuit", amount = 40 },
                  { type = "item", name = "processing-unit", amount = 20 }, { type = "item", name = "devil-circuit", amount = 5 }, { type = "item", name = "steel-plate", amount = 40 } },
  results = { { type = "item", name = "boiler-5", amount = 1 } }
 },
 {
  type = "recipe",
  name = "solar-2",
  enabled = false,
  ingredients = { { type = "item", name = "solar-panel", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 5 }, { type = "item", name = "steel-plate", amount = 5 } },
  results = { { type = "item", name = "solar-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "solar-3",
  enabled = false,
  energy_required = 5,
  ingredients = { { type = "item", name = "solar-2", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 10 }, { type = "item", name = "advanced-circuit", amount = 10 },
                  { type = "item", name = "steel-plate", amount = 10 } },
  results = { { type = "item", name = "solar-3", amount = 1 } }
 },
 {
  type = "recipe",
  name = "solar-4",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "solar-3", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 20 }, { type = "item", name = "advanced-circuit", amount = 20},
                  { type = "item", name = "processing-unit", amount = 20 }, { type = "item", name = "steel-plate", amount = 20 } },
  results = { { type = "item", name = "solar-4", amount = 1 } }
 },
 {
  type = "recipe",
  name = "solar-5",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 25,
  ingredients = { { type = "item", name = "solar-4", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 40 }, { type = "item", name = "advanced-circuit", amount = 40 },
                  { type = "item", name = "processing-unit", amount = 40 }, { type = "item", name = "angel-circuit", amount = 10 }, { type = "item", name = "steel-plate", amount = 40 } },
  results = { { type = "item", name = "solar-5", amount = 1 } }
 },
 {
  type = "recipe",
  name = "accu-2",
  enabled = false,
  ingredients = { { type = "item", name = "accumulator", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 5 }, { type = "item", name = "steel-plate", amount = 5 },
                  { type = "item", name = "battery", amount = 5 } },
  results = { { type = "item", name = "accu-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "accu-3",
  enabled = false,
  energy_required = 5,
  ingredients = { { type = "item", name = "accu-2", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 10 }, { type = "item", name = "advanced-circuit", amount = 10 },
                  { type = "item", name = "steel-plate", amount = 10 }, { type = "item", name = "battery", amount = 10 } },
  results = { { type = "item", name = "accu-3", amount = 1 } }
 },
 {
  type = "recipe",
  name = "accu-4",
  category = "advanced-crafting",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "accu-3", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 20 }, { type = "item", name = "advanced-circuit", amount = 20},
                  { type = "item", name = "processing-unit", amount = 20 }, { type = "item", name = "steel-plate", amount = 20 }, { type = "item", name = "battery", amount = 20 } },
  results = { { type = "item", name = "accu-4", amount = 1 } }
 },
 {
  type = "recipe",
  name = "accu-5",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 25,
  ingredients = { { type = "item", name = "accu-4", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 40 }, { type = "item", name = "advanced-circuit", amount = 40 },
                  { type = "item", name = "processing-unit", amount = 40 }, { type = "item", name = "devil-circuit", amount = 10 }, { type = "item", name = "steel-plate", amount = 40 },
                  { type = "item", name = "battery", amount = 40 } },
  results = { { type = "item", name = "accu-5", amount = 1 } }
 },
 {
  type = "recipe",
  name = "medium-pole-2",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "medium-electric-pole", amount = 1 }, { type = "item", name = "angel-cable", amount = 5 }, { type = "item", name = "steel-plate", amount = 5 } },
  results = { { type = "item", name = "medium-pole-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "medium-pole-3",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "medium-pole-2", amount = 1 }, { type = "item", name = "angel-cable", amount = 10 }, { type = "item", name = "steel-plate", amount = 10 } },
  results = { { type = "item", name = "medium-pole-3", amount = 1 } }
 },
 {
  type = "recipe",
  name = "big-pole-2",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "big-electric-pole", amount = 1 }, { type = "item", name = "devil-cable", amount = 5 }, { type = "item", name = "steel-plate", amount = 5 } },
  results = { { type = "item", name = "big-pole-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "big-pole-3",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "big-pole-2", amount = 1 }, { type = "item", name = "devil-cable", amount = 10 }, { type = "item", name = "steel-plate", amount = 10 } },
  results = { { type = "item", name = "big-pole-3", amount = 1 } }
 },
 {
  type = "recipe",
  name = "substation-2",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "substation", amount = 1 }, { type = "item", name = "angel-circuit", amount = 10 }, { type = "item", name = "steel-plate", amount = 10 } },
  results = { { type = "item", name = "substation-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "substation-3",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 10,
  ingredients = { { type = "item", name = "substation-2", amount = 1 }, { type = "item", name = "devil-circuit", amount = 10 }, { type = "item", name = "steel-plate", amount = 10 } },
  results = { { type = "item", name = "substation-3", amount = 1 } }
 },
 {
  type = "recipe",
  name = "assembling-4",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 25,
  ingredients = { { type = "item", name = "assembling-machine-3", amount = 2 }, { type = "item", name = "electronic-circuit", amount = 20 }, { type = "item", name = "advanced-circuit", amount = 20 },
  				  { type = "item", name = "processing-unit", amount = 20 }, { type = "item", name = "steel-plate", amount = 20 }, { type = "fluid", name = "lubricant", amount = 20 }  },
  results = { { type = "item", name = "assembling-4", amount = 1 } }
 },
 {
  type = "recipe",
  name = "assembling-5",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 50,
  ingredients = { { type = "item", name = "assembling-4", amount = 2 }, { type = "item", name = "electronic-circuit", amount = 40 }, { type = "item", name = "advanced-circuit", amount = 40 },
  				  { type = "item", name = "processing-unit", amount = 40 }, { type = "item", name = "angel-circuit", amount = 20 }, { type = "item", name = "devil-circuit", amount = 20 },
  				  { type = "item", name = "steel-plate", amount = 40 }, { type = "fluid", name = "lubricant", amount = 20 }, { type = "fluid", name = "alien-fluid", amount = 10 } },
  results = { { type = "item", name = "assembling-5", amount = 1 } }
 },
 {
  type = "recipe",
  name = "assembling-6",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "assembling-5", amount = 5 }, { type = "item", name = "electronic-circuit", amount = 100 }, { type = "item", name = "advanced-circuit", amount = 100 },
  				  { type = "item", name = "processing-unit", amount = 100 }, { type = "item", name = "angel-circuit", amount = 50 }, { type = "item", name = "devil-circuit", amount = 50 },
  				  { type = "item", name = "alien-circuit", amount = 20 }, { type = "item", name = "steel-plate", amount = 200 }, { type = "fluid", name = "lubricant", amount = 100 },
  				  { type = "fluid", name = "alien-fluid", amount = 50 } },
  results = { { type = "item", name = "assembling-6", amount = 1 } }
 },
 {
  type = "recipe",
  name = "e-furnace-2",
  category = "advanced-crafting",
  enabled = false,
  energy_required = 20,
  ingredients = { { type = "item", name = "electric-furnace", amount = 2 }, { type = "item", name = "electronic-circuit", amount = 20 }, { type = "item", name = "advanced-circuit", amount = 20 },
				  { type = "item", name = "processing-unit", amount = 20 }, { type = "item", name = "steel-plate", amount = 20 }, { type = "item", name = "stone-brick", amount = 20 } },
  results = { { type = "item", name = "e-furnace-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "e-furnace-3",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "e-furnace-2", amount = 5 }, { type = "item", name = "electronic-circuit", amount = 100 }, { type = "item", name = "advanced-circuit", amount = 100 },
				  { type = "item", name = "processing-unit", amount = 100 }, { type = "item", name = "angel-circuit", amount = 50 }, { type = "item", name = "devil-circuit", amount = 50 },
				  { type = "item", name = "alien-circuit", amount = 20 }, { type = "item", name = "steel-plate", amount = 200 }, { type = "item", name = "stone-brick", amount = 200 } },
  results = { { type = "item", name = "e-furnace-3", amount = 1 } }
 },
 {
  type = "recipe",
  name = "chemical-2",
  category = "advanced-crafting",
  enabled = false,
  energy_required = 20,
  ingredients = { { type = "item", name = "chemical-plant", amount = 2 }, { type = "item", name = "electronic-circuit", amount = 15 }, { type = "item", name = "advanced-circuit", amount = 15 },
                  { type = "item", name = "processing-unit", amount = 15 }, { type = "item", name = "steel-plate", amount = 15 }, { type = "item", name = "iron-gear-wheel", amount = 15 },
                  { type = "item", name = "pipe", amount = 15 } },
  results = { { type = "item", name = "chemical-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "chemical-3",
  category = "extreme-crafting",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "chemical-2", amount = 5 }, { type = "item", name = "electronic-circuit", amount = 100 }, { type = "item", name = "advanced-circuit", amount = 100 },
                  { type = "item", name = "processing-unit", amount = 100 }, { type = "item", name = "angel-circuit", amount = 50 }, { type = "item", name = "devil-circuit", amount = 50 },
                  { type = "item", name = "alien-circuit", amount = 20 }, { type = "item", name = "steel-plate", amount = 100 }, { type = "item", name = "iron-gear-wheel", amount = 100 },
                  { type = "item", name = "pipe", amount = 100 } },
  results = { { type = "item", name = "chemical-3", amount = 1 } }
 },
 {
  type = "recipe",
  name = "radar-2",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 20,
  ingredients = { { type = "item", name = "radar", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 15 }, { type = "item", name = "advanced-circuit", amount = 15 },
                  { type = "item", name = "processing-unit", amount = 15 }, { type = "item", name = "steel-plate", amount = 15 }, { type = "item", name = "iron-gear-wheel", amount = 15 },
                  { type = "fluid", name = "lubricant", amount = 30 } },
  results = { { type = "item", name = "radar-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "mining-2",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 50,
  ingredients = { { type = "item", name = "electric-mining-drill", amount = 2 }, { type = "item", name = "electronic-circuit", amount = 20 }, { type = "item", name = "advanced-circuit", amount = 20 },
                  { type = "item", name = "processing-unit", amount = 20 }, { type = "item", name = "steel-plate", amount = 20 }, { type = "item", name = "iron-gear-wheel", amount = 20 },
                  { type = "fluid", name = "lubricant", amount = 50 } },
  results = { { type = "item", name = "mining-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "mining-3",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "mining-2", amount = 5 }, { type = "item", name = "electronic-circuit", amount = 100 }, { type = "item", name = "advanced-circuit", amount = 100 },
                  { type = "item", name = "processing-unit", amount = 100 }, { type = "item", name = "angel-circuit", amount = 50 }, { type = "item", name = "devil-circuit", amount = 50 },
                  { type = "item", name = "alien-circuit", amount = 20}, { type = "item", name = "steel-plate", amount = 100 }, { type = "item", name = "iron-gear-wheel", amount = 100 },
                  { type = "fluid", name = "lubricant", amount = 200 }, { type = "fluid", name = "alien-fluid", amount = 50 } },
  results = { { type = "item", name = "mining-3", amount = 1 } }
 },
 {
  type = "recipe",
  name = "pumpjack-2",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 20,
  ingredients = { { type = "item", name = "pumpjack", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 15 }, { type = "item", name = "advanced-circuit", amount = 15 },
                  { type = "item", name = "processing-unit", amount = 15 }, { type = "item", name = "steel-plate", amount = 15 }, { type = "item", name = "iron-gear-wheel", amount = 15 },
                  { type = "item", name = "pipe", amount = 15 }, { type = "fluid", name = "lubricant", amount = 30 } },
  results = { { type = "item", name = "pumpjack-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "roboport-2",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 20,
  ingredients = { { type = "item", name = "roboport", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 100 }, { type = "item", name = "advanced-circuit", amount = 100 },
                  { type = "item", name = "processing-unit", amount = 100 }, { type = "item", name = "steel-plate", amount = 100 }, { type = "item", name = "iron-gear-wheel", amount = 100 },
                  { type = "fluid", name = "lubricant", amount = 200 } },
  results = { { type = "item", name = "roboport-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "consti-2",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 20,
  ingredients = { { type = "item", name = "construction-robot", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 100 }, { type = "item", name = "advanced-circuit", amount = 40 },
                  { type = "item", name = "processing-unit", amount = 20 }, { type = "fluid", name = "lubricant", amount = 100 } },
  results = { { type = "item", name = "consti-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "logi-2",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 20,
  ingredients = { { type = "item", name = "logistic-robot", amount = 1 }, { type = "item", name = "electronic-circuit", amount = 100 }, { type = "item", name = "advanced-circuit", amount = 40 },
                  { type = "item", name = "processing-unit", amount = 20 }, { type = "fluid", name = "lubricant", amount = 100 } },
  results = { { type = "item", name = "logi-2", amount = 1 } }
 },
 {
  type = "recipe",
  name = "alien-inserter",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 300,
  ingredients = { { type = "item", name = "fast-inserter", amount = 5 }, { type = "item", name = "electronic-circuit", amount = 200 }, { type = "item", name = "advanced-circuit", amount = 200 },
                  { type = "item", name = "processing-unit", amount = 100 }, { type = "item", name = "angel-circuit", amount = 50 }, { type = "item", name = "devil-circuit", amount = 50 },
                  { type = "item", name = "alien-circuit", amount = 20 }, { type = "item", name = "steel-plate", amount = 200 }, { type = "item", name = "iron-gear-wheel", amount = 200 },
                  { type = "item", name = "engine-unit", amount = 200 }, { type = "item", name = "electric-engine-unit", amount = 100 }, { type = "fluid", name = "lubricant", amount = 150 },
                  { type = "fluid", name = "alien-fluid", amount = 50 } },
  results = { { type = "item", name = "alien-inserter", amount = 1 } }
 },
 {
  type = "recipe",
  name = "alien-axe",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "steel-axe", amount = 5 }, { type = "fluid", name = "alien-fluid", amount = 50 } },
  results = { { type = "item", name = "alien-axe", amount = 1 } }
 },
 {
  type = "recipe",
  name = "alien-repair",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "repair-pack", amount = 1 }, { type = "fluid", name = "alien-fluid", amount = 50 } },
  results = { { type = "item", name = "alien-repair", amount = 1 } }
 },
 {
  type = "recipe",
  name = "alien-bullet",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "piercing-rounds-magazine", amount = 1 }, { type = "fluid", name = "alien-fluid", amount = 50 } },
  results = { { type = "item", name = "alien-bullet", amount = 1 } }
 },
 {
  type = "recipe",
  name = "alien-shell",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "piercing-shotgun-shell", amount = 1 }, { type = "fluid", name = "alien-fluid", amount = 50 } },
  results = { { type = "item", name = "alien-shell", amount = 1 } }
 },
 {
  type = "recipe",
  name = "alien-fusion",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "fusion-reactor-equipment", amount = 5 }, { type = "item", name = "alien-circuit", amount = 20 }, { type = "fluid", name = "alien-fluid", amount = 50 } },
  results = { { type = "item", name = "alien-fusion", amount = 1 } }
 },
 {
  type = "recipe",
  name = "alien-shield",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "energy-shield-mk2-equipment", amount = 5 }, { type = "item", name = "alien-circuit", amount = 20 }, { type = "fluid", name = "alien-fluid", amount = 50 } },
  results = { { type = "item", name = "alien-shield", amount = 1 } }
 },
 {
  type = "recipe",
  name = "alien-port",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "personal-roboport-equipment", amount = 5 }, { type = "item", name = "alien-circuit", amount = 20 }, { type = "fluid", name = "alien-fluid", amount = 50 } },
  results = { { type = "item", name = "alien-port", amount = 1 } }
 },
 {
  type = "recipe",
  name = "alien-armor",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 100,
  ingredients = { { type = "item", name = "power-armor-mk2", amount = 2 }, { type = "item", name = "angel-circuit", amount = 50 }, { type = "item", name = "devil-circuit", amount = 50 },
                  { type = "item", name = "alien-circuit", amount = 20 } },
  results = { { type = "item", name = "alien-armor", amount = 1 } }
 },
 {
  type = "recipe",
  name = "alien-artifact-from-small",
  category = "crafting",
  enabled = true,
  energy_required = 1,
  ingredients = { { type = "item", name = "small-alien-artifact", amount = 25 } },
  results = { { type = "item", name = "alien-artifact", amount = 1 } }
 },
}
)