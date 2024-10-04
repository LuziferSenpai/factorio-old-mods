require("functions")

local MODNAME = "__SenpaisOverhall__"

data:extend
(
{
 {
  type = "technology",
  name = "toolbelt-2",
  icon = "__base__/graphics/technology/toolbelt.png",
  effects = { { type = "num-quick-bars", modifier = 1 } },
  prerequisites = { "toolbelt" },
  unit = { count = 100, ingredients = { { "science-pack-1", 5 }, { "science-pack-2", 5 }, { "science-pack-3", 5 }, { "alien-science-pack", 1 } }, time = 100 },
 },
 {
  type = "technology",
  name = "bavarium",
  icon = MODNAME.."/graphics/icons/bavarium-fluid.png",
  effects = { { type = "unlock-recipe", recipe = "l-bavarium" } },
  prerequisites = { "oil-processing" },
  unit = { count = 150, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 } }, time = 30 }
 },
 {
  type = "technology",
  name = "angel-stuff",
  icon = MODNAME.."/graphics/icons/angel-fluid.png",
  effects = { { type = "unlock-recipe", recipe = "l-angel" }, { type = "unlock-recipe", recipe = "angel-cable"}, { type = "unlock-recipe", recipe = "angel-circuit" } },
  prerequisites = { "rocket-silo" },
  unit = { count = 100, ingredients = { { "science-pack-1", 10 }, { "science-pack-2", 10 }, { "science-pack-3", 10 }, { "alien-science-pack", 10 } }, time = 300 }
 },
 {
  type = "technology",
  name = "devil-stuff",
  icon = MODNAME.."/graphics/icons/devil-fluid.png",
  effects = { { type = "unlock-recipe", recipe = "l-devil" }, { type = "unlock-recipe", recipe = "devil-cable"}, { type = "unlock-recipe", recipe = "devil-circuit" } },
  prerequisites = { "rocket-silo" },
  unit = { count = 100, ingredients = { { "science-pack-1", 10 }, { "science-pack-2", 10 }, { "science-pack-3", 10 }, { "alien-science-pack", 10 } }, time = 300 }
 },
 {
  type = "technology",
  name = "alien-stuff",
  icon = MODNAME.."/graphics/icons/alien-fluid.png",
  effects = { { type = "unlock-recipe", recipe = "alien-fluid" }, { type = "unlock-recipe", recipe = "alien-cable" }, { type = "unlock-recipe", recipe = "alien-circuit" },
              { type = "unlock-recipe", recipe = "alien-repair" }, { type = "unlock-recipe", recipe = "alien-axe" }, { type = "unlock-recipe", recipe = "alien-bullet" },
              { type = "unlock-recipe", recipe = "alien-shell" }, { type = "unlock-recipe", recipe = "alien-armor" }, { type = "unlock-recipe", recipe = "alien-fusion" },
              { type = "unlock-recipe", recipe = "alien-shield" }, { type = "unlock-recipe", recipe = "alien-port" }, { type = "unlock-recipe", recipe = "alien-inserter" } },
  prerequisites = { "angel-stuff", "devil-stuff", "power-armor-2", "military-4", "faster-crafting-10", "energy-shield-mk2-equipment", "fusion-reactor-equipment", "steel-processing" },
  unit = { count = 200, ingredients = { { "science-pack-1", 20 }, { "science-pack-2", 20 }, { "science-pack-3", 20 }, { "alien-science-pack", 20 } }, time = 600 }
 },
 {
  type = "technology",
  name = "electric-energy-distribution-3",
  icon = "__base__/graphics/technology/electric-energy-distribution.png",
  effects = { { type = "unlock-recipe", recipe = "medium-pole-2"}, { type = "unlock-recipe", recipe = "big-pole-2" }, { type = "unlock-recipe", recipe = "substation-2" },
              { type = "unlock-recipe", recipe = "boiler-2" }, { type = "unlock-recipe", recipe = "steam-2" }, { type = "unlock-recipe", recipe = "solar-2" },
              { type = "unlock-recipe", recipe = "accu-2" } },
  prerequisites = { "electric-energy-distribution-2", "solar-energy", "electric-energy-accumulators-1", "angel-stuff", "devil-stuff" },
  unit = { count = 100, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "alien-science-pack", 1 } }, time = 100 }
 },
 {
  type = "technology",
  name = "electric-energy-distribution-4",
  icon = "__base__/graphics/technology/electric-energy-distribution.png",
  effects = { { type = "unlock-recipe", recipe = "medium-pole-3"}, { type = "unlock-recipe", recipe = "big-pole-3" }, { type = "unlock-recipe", recipe = "substation-3" },
              { type = "unlock-recipe", recipe = "boiler-3" }, { type = "unlock-recipe", recipe = "steam-3" }, { type = "unlock-recipe", recipe = "solar-3" },
              { type = "unlock-recipe", recipe = "accu-3" } },
  prerequisites = { "electric-energy-distribution-3" },
  unit = { count = 200, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "alien-science-pack", 1 } }, time = 200 }
 },
 {
  type = "technology",
  name = "electric-energy-distribution-5",
  icon = "__base__/graphics/technology/electric-energy-distribution.png",
  effects = { { type = "unlock-recipe", recipe = "boiler-4" }, { type = "unlock-recipe", recipe = "steam-4" }, { type = "unlock-recipe", recipe = "solar-4" },
              { type = "unlock-recipe", recipe = "accu-4" } },
  prerequisites = { "electric-energy-distribution-4" },
  unit = { count = 300, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "alien-science-pack", 1 } }, time = 300 }
 },
 {
  type = "technology",
  name = "electric-energy-distribution-6",
  icon = "__base__/graphics/technology/electric-energy-distribution.png",
  effects = { { type = "unlock-recipe", recipe = "boiler-5" }, { type = "unlock-recipe", recipe = "steam-5" }, { type = "unlock-recipe", recipe = "solar-5" },
              { type = "unlock-recipe", recipe = "accu-5" } },
  prerequisites = { "electric-energy-distribution-5" },
  unit = { count = 400, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "alien-science-pack", 1 } }, time = 400 }
 },
 {
  type = "technology",
  name = "automation-4",
  icon = "__base__/graphics/technology/automation.png",
  effects = { { type = "unlock-recipe", recipe = "assembling-4" } },
  prerequisites = { "automation-3" },
  unit = { count = 100, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "alien-science-pack", 1 } }, time = 100 }
 },
 {
  type = "technology",
  name = "automation-5",
  icon = "__base__/graphics/technology/automation.png",
  effects = { { type = "unlock-recipe", recipe = "assembling-5" }, { type = "unlock-recipe", recipe = "mining-2" }, { type = "unlock-recipe", recipe = "radar-2" }, { type = "unlock-recipe", recipe = "e-furnace-2" } },
  prerequisites = { "automation-4", "angel-stuff", "devil-stuff" },
  unit = { count = 400, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "alien-science-pack", 1 } }, time = 100 }
 },
 {
  type = "technology",
  name = "automation-6",
  icon = "__base__/graphics/technology/automation.png",
  effects = { { type = "unlock-recipe", recipe = "assembling-6" }, { type = "unlock-recipe", recipe = "mining-3" }, { type = "unlock-recipe", recipe = "e-furnace-3" } },
  prerequisites = { "automation-5", "alien-stuff" },
  unit = { count = 300, ingredients = { { "science-pack-1", 10 }, { "science-pack-2", 10 }, { "science-pack-3", 10 }, { "alien-science-pack", 5 } }, time = 300 }
 },
 {
  type = "technology",
  name = "oil-processing-2",
  icon = "__base__/graphics/technology/oil-processing.png",
  effects = { { type = "unlock-recipe", recipe = "pumpjack-2" }, { type = "unlock-recipe", recipe = "chemical-2" } },
  prerequisites = { "oil-processing" },
  unit = { count = 200, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 } }, time = 50 }
 },
 {
  type = "technology",
  name = "oil-processing-3",
  icon = "__base__/graphics/technology/oil-processing.png",
  effects = { { type = "unlock-recipe", recipe = "chemical-3" } },
  prerequisites = { "oil-processing-2", "angel-stuff", "devil-stuff", "alien-stuff" },
  unit = { count = 500, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "alien-science-pack", 1 } }, time = 100 }
 },
 {
  type = "technology",
  name = "construction-robotics-2",
  icon = "__base__/graphics/technology/construction-robotics.png",
  effects = { {type = "unlock-recipe", recipe = "roboport-2" }, { type = "unlock-recipe", recipe = "consti-2" }, },
  prerequisites = { "construction-robotics" },
  unit = { count = 200, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 } }, time = 60 },
 },
 {
  type = "technology",
  name = "logistic-robotics-2",
  icon = "__base__/graphics/technology/logistic-robotics.png",
  effects = { {type = "unlock-recipe", recipe = "roboport-2" }, { type = "unlock-recipe", recipe = "logi-2" }, },
  prerequisites = { "logistic-robotics" },
  unit = { count = 200, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 } }, time = 60 },
 },

 {
  type = "technology", 
  name = "faster-crafting-1",
  icon = "__base__/graphics/icons/repair-pack.png",
  effects = {},
  prerequisites = { "toolbelt", "research-speed-1" },
  unit = { count = 100, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 } }, time = 30 },
 },
 {
  type = "technology",
  name = "faster-crafting-2",
  icon = "__base__/graphics/icons/repair-pack.png",
  effects = {},
  prerequisites = { "faster-crafting-1", "research-speed-2", "toolbelt-2" },
  unit = { count = 150, ingredients = { { "science-pack-1", 2 }, {"science-pack-2", 1 } }, time = 45 },
 },
 {
  type = "technology",
  name = "faster-crafting-3",
  icon = "__base__/graphics/icons/repair-pack.png",
  effects = {},
  prerequisites = { "faster-crafting-2", "research-speed-3", "power-armor" },
  unit = { count = 200, ingredients = { { "science-pack-1", 3 }, { "science-pack-2", 2 }, { "science-pack-3", 1 } }, time = 60 }, 
 },
 {
  type = "technology",
  name = "faster-crafting-4",
  icon = "__base__/graphics/icons/repair-pack.png",
  effects = {},
  prerequisites = { "faster-crafting-3", "research-speed-4", "power-armor-2" },
  unit = { count = 250, ingredients = { { "science-pack-1", 4 }, { "science-pack-2", 3 }, { "science-pack-3", 2 }, { "alien-science-pack", 1 } }, time = 75 },
 },
 {
  type = "technology",
  name = "faster-crafting-5",
  icon = "__base__/graphics/icons/repair-pack.png",
  effects = {},
  prerequisites = { "faster-crafting-4" },
  unit = { count = 300, ingredients = { { "science-pack-1", 5 }, { "science-pack-2", 3 }, { "science-pack-3", 2 }, { "alien-science-pack", 1 } }, time = 90 },
 },
 {
  type = "technology",
  name = "faster-crafting-6",
  icon = "__base__/graphics/icons/repair-pack.png",
  effects = {},
  prerequisites = { "faster-crafting-5" },
  unit = { count = 350, ingredients = { { "science-pack-1", 5 }, { "science-pack-2", 4 }, { "science-pack-3", 3 }, { "alien-science-pack", 2 } }, time = 100 },
 },
 {
  type = "technology",
  name = "faster-crafting-7",
  icon = "__base__/graphics/icons/repair-pack.png",
  effects = {},
  prerequisites = { "faster-crafting-6" },
  unit = { count = 400, ingredients = { { "science-pack-1", 6 }, { "science-pack-2", 5 }, { "science-pack-3", 4 }, { "alien-science-pack", 2 } }, time = 100 },
 },
 {
  type = "technology",
  name = "faster-crafting-8",
  icon = "__base__/graphics/icons/repair-pack.png",
  effects = {},
  prerequisites = { "faster-crafting-7" },
  unit = { count = 450, ingredients = { { "science-pack-1", 7 }, { "science-pack-2", 6 }, {"science-pack-3", 5 }, { "alien-science-pack", 3 } }, time = 100 },
 },
 {
  type = "technology",
  name = "faster-crafting-9",
  icon = "__base__/graphics/icons/repair-pack.png",
  effects = {},
  prerequisites = { "faster-crafting-8" },
  unit = { count = 500, ingredients = { { "science-pack-1", 8 }, { "science-pack-2", 7 }, { "science-pack-3", 6 }, { "alien-science-pack", 4 } }, time = 100 },
 },
 {
  type = "technology",
  name = "faster-crafting-10",
  icon = "__base__/graphics/icons/repair-pack.png",
  effects = {},
  prerequisites = { "faster-crafting-9" },
  unit = { count = 600, ingredients = { { "science-pack-1", 10 }, { "science-pack-2", 10 }, { "science-pack-3", 10 }, { "alien-science-pack", 10 } }, time = 100 },
 },

 {
  type = "technology",
  name = "character-logistic-slots-7",
  icon = "__base__/graphics/technology/character-logistic-slots.png",
  effects = { { type = "character-logistic-slots", modifier = 5 } },
  prerequisites = {"character-logistic-slots-6"},
  unit = { count = 1500, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "alien-science-pack", 1 } }, time = 30 },
  upgrade = true,
  order = "c-k-e-f"
 },
 {
  type = "technology",
  name = "character-logistic-slots-8",
  icon = "__base__/graphics/technology/character-logistic-slots.png",
  effects = { { type = "character-logistic-slots", modifier = 5 } },
  prerequisites = {"character-logistic-slots-7"},
  unit = { count = 2000, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "alien-science-pack", 1 } }, time = 30 },
  upgrade = true,
  order = "c-k-e-f"
 },
 {
  type = "technology",
  name = "character-logistic-slots-9",
  icon = "__base__/graphics/technology/character-logistic-slots.png",
  effects = { { type = "character-logistic-slots", modifier = 5 } },
  prerequisites = {"character-logistic-slots-8"},
  unit = { count = 2500, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "alien-science-pack", 1 } }, time = 30 },
  upgrade = true,
  order = "c-k-e-f"
 },
 {
  type = "technology",
  name = "character-logistic-slots-10",
  icon = "__base__/graphics/technology/character-logistic-slots.png",
  effects = { { type = "character-logistic-slots", modifier = 5 } },
  prerequisites = {"character-logistic-slots-9"},
  unit = { count = 3000, ingredients = { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "alien-science-pack", 1 } }, time = 30 },
  upgrade = true,
  order = "c-k-e-f"
 },

 Senpais_fun_create_followerrobotcount(21, 1, 1, 1, 1, 2800, 15),
 Senpais_fun_create_followerrobotcount(22, 1, 1, 1, 1, 3000, 15),
 Senpais_fun_create_followerrobotcount(23, 1, 1, 1, 1, 3200, 15),
 Senpais_fun_create_followerrobotcount(24, 1, 1, 1, 1, 3400, 15),
 Senpais_fun_create_followerrobotcount(25, 1, 1, 1, 1, 3600, 15),
 Senpais_fun_create_followerrobotcount(26, 1, 1, 1, 1, 3700, 15),
 Senpais_fun_create_followerrobotcount(27, 1, 1, 1, 1, 3800, 15),
 Senpais_fun_create_followerrobotcount(28, 1, 1, 1, 1, 4000, 15),
 Senpais_fun_create_followerrobotcount(29, 1, 1, 1, 1, 4200, 15),
 Senpais_fun_create_followerrobotcount(30, 1, 1, 1, 1, 4400, 15),
}
)