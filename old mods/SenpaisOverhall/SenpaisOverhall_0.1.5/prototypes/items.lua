require("functions")

local MODNAME = "__SenpaisOverhall__"

data:extend
(
{
 {
  type = "mining-tool",
  name = "alien-axe",
  icon = MODNAME.."/graphics/icons/alien-axe.png",
  flags = {"goes-to-main-inventory"},
  action = { type="direct", action_delivery = { type = "instant", target_effects = { type = "damage", damage = { amount = 15 , type = "physical" } } } },
  durability = 100000,
  subgroup = "s-03",
  order = "a",
  speed = 50,
  stack_size = 1
 },
 {
  type = "ammo",
  name = "alien-bullet",
  icon = MODNAME.."/graphics/icons/alien-bullet.png",
  flags = {"goes-to-main-inventory"},
  ammo_type = { category = "bullet", action = { type = "direct", action_delivery = { type = "instant", source_effects = { type = "create-explosion", entity_name = "explosion-gunshot" }, 
  			    target_effects = { { type = "create-entity", entity_name = "explosion-hit" }, { type = "damage", damage = { amount = 50 , type = "physical" } } } } } },
  magazine_size = 50,
  subgroup = "s-03",
  order = "b",
  stack_size = 100
 },
 {
  type = "ammo",
  name = "alien-shell",
  icon = MODNAME.."/graphics/icons/alien-shell.png",
  flags = {"goes-to-main-inventory"},
  ammo_type = { category = "shotgun-shell", target_type = "direction", action = { { type = "direct", action_delivery =  { type = "instant", source_effects =  { { type = "create-explosion", entity_name = "explosion-gunshot" } } } },
   			  { type = "direct", repeat_count = 25, action_delivery = { type = "projectile", projectile = "shotgun-pellet", starting_speed = 5, direction_deviation = 0.3, range_deviation = 0.5, max_range = 50 } } } },
  magazine_size = 50,
  subgroup = "s-03",
  order = "c",
  stack_size = 100
 },
 {
  type = "repair-tool",
  name = "alien-repair",
  icon = MODNAME.."/graphics/icons/alien-repair.png",
  flags = {"goes-to-quickbar"},
  subgroup = "s-03",
  order = "d",
  speed = 10,
  durability = 1000,
  stack_size = 10
 },
 {
  type = "armor",
  name = "alien-armor",
  icon = MODNAME.."/graphics/icons/alien-armor.png",
  flags = {"goes-to-main-inventory"},
  resistances = { { type = "physical", decrease = 50, percent = 100 }, { type = "acid", decrease = 50, percent = 100 }, { type = "explosion", decrease = 50, percent = 100 }, { type = "fire", decrease = 25, percent = 100 } },
  durability = 100000,
  subgroup = "s-03",
  order = "e",
  stack_size = 1,
  equipment_grid = "senpais-grid",
  inventory_size_bonus = 120
 },
 {
  type = "item",
  name = "alien-fusion",
  icon = MODNAME.."/graphics/icons/alien-fusion.png",
  placed_as_equipment_result = "alien-fusion",
  flags = {"goes-to-main-inventory"},
  subgroup = "s-03",
  order = "f",
  stack_size = 1
 },
 {
  type = "item",
  name = "alien-port",
  icon = MODNAME.."/graphics/icons/alien-port.png",
  placed_as_equipment_result = "alien-port",
  flags = {"goes-to-main-inventory"},
  subgroup = "s-03",
  order = "g",
  stack_size = 1
 },
 {
  type = "item",
  name = "alien-shield",
  icon = MODNAME.."/graphics/icons/alien-shield.png",
  placed_as_equipment_result = "alien-shield",
  flags = {"goes-to-main-inventory"},
  subgroup = "s-03",
  order = "f",
  stack_size = 1
 },
 Senpais_fun_item_add2("angel-cable", "s-02", "a", 50),
 Senpais_fun_item_add2("angel-circuit", "s-02", "b", 50),
 Senpais_fun_item_add2("devil-cable", "s-02", "c", 50),
 Senpais_fun_item_add2("devil-circuit", "s-02", "d", 50),
 Senpais_fun_item_add2("alien-cable", "s-02", "e", 50),
 Senpais_fun_item_add2("alien-circuit", "s-02", "f", 50),
 Senpais_fun_item_add2("small-alien-artifact", "raw-material", "g[alien-artifact]-a[pink]-a[small]", 500),

 Senpais_fun_item_add("steam-2", "s-04", "b", 10),
 Senpais_fun_item_add("steam-3", "s-04", "d", 10),
 Senpais_fun_item_add("steam-4", "s-04", "f", 10),
 Senpais_fun_item_add("steam-5", "s-04", "h", 10),
 Senpais_fun_item_add("boiler-2", "s-04", "a", 50),
 Senpais_fun_item_add("boiler-3", "s-04", "c", 50),
 Senpais_fun_item_add("boiler-4", "s-04", "e", 50),
 Senpais_fun_item_add("boiler-5", "s-04", "g", 50),
 Senpais_fun_item_add("solar-2", "s-04", "i", 50),
 Senpais_fun_item_add("solar-3", "s-04", "k", 50),
 Senpais_fun_item_add("solar-4", "s-04", "m", 50),
 Senpais_fun_item_add("solar-5", "s-04", "o", 50),
 Senpais_fun_item_add("accu-2", "s-04", "j", 50),
 Senpais_fun_item_add("accu-3", "s-04", "l", 50),
 Senpais_fun_item_add("accu-4", "s-04", "n", 50),
 Senpais_fun_item_add("accu-5", "s-04", "p", 50),
 Senpais_fun_item_add("medium-pole-2", "s-05", "a", 50),
 Senpais_fun_item_add("medium-pole-3", "s-05", "b", 50),
 Senpais_fun_item_add("big-pole-2", "s-05", "c", 50),
 Senpais_fun_item_add("big-pole-3", "s-05", "d", 50),
 Senpais_fun_item_add("substation-2", "s-05", "e", 50),
 Senpais_fun_item_add("substation-3", "s-05", "f", 50),
 Senpais_fun_item_add("assembling-4", "s-06", "a", 50),
 Senpais_fun_item_add("assembling-5", "s-06", "b", 50),
 Senpais_fun_item_add("assembling-6", "s-06", "c", 50),
 Senpais_fun_item_add("e-furnace-2", "s-06", "d", 50),
 Senpais_fun_item_add("e-furnace-3", "s-06", "e", 50),
 Senpais_fun_item_add("chemical-2", "s-06", "f", 50),
 Senpais_fun_item_add("chemical-3", "s-06", "g", 50),
 Senpais_fun_item_add("radar-2", "s-07", "a", 50),
 Senpais_fun_item_add("mining-2", "s-07", "b", 50),
 Senpais_fun_item_add("mining-3", "s-07", "c", 50),
 Senpais_fun_item_add("pumpjack-2", "s-07", "d", 50),
 Senpais_fun_item_add("roboport-2", "s-08", "a", 10),
 Senpais_fun_item_add("consti-2", "s-08", "b", 50),
 Senpais_fun_item_add("logi-2", "s-08", "c", 50),
 Senpais_fun_item_add("alien-inserter", "s-08", "d", 50),

 Senpais_fun_item_add2("angel-ore", "s-25", "a", 50),
 Senpais_fun_item_add2("devil-ore", "s-25", "b", 50),
 Senpais_fun_item_add2("bavarium", "s-25", "c", 50)
}
)