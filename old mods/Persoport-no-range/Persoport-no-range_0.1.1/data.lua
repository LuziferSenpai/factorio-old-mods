data:extend
(
{
 {
  type = "roboport-equipment",
  name = "perso-robo-nr",
  take_result = "perso-robo-nr",
  sprite = { filename = "__base__/graphics/equipment/personal-roboport-equipment.png", width = 64, height = 64, priority = "medium" },
  shape = { width = 2, height = 2, type = "full" },
  energy_source =  { type = "electric", buffer_capacity = "35MJ", input_flow_limit = "3500KW", usage_priority = "secondary-input" },
  charging_energy = "1000kW",
  energy_consumption = "20kW",
  robot_limit = 10,
  construction_radius = 0,
  spawn_and_station_height = 0.4,
  charge_approach_distance = 2.6,
  recharging_animation = { filename = "__base__/graphics/entity/roboport/roboport-recharging.png", priority = "high", width = 37, height = 35, frame_count = 16, scale = 1.5, animation_speed = 0.5 },
  recharging_light = {intensity = 0.4, size = 5},
  stationing_offset = {0, -0.6},
  charging_station_shift = {0, 0.5},
  charging_station_count = 2,
  charging_distance = 1.6,
  charging_threshold_distance = 5
 },
 {
  type = "item",
  name = "perso-robo-nr",
  icon = "__base__/graphics/icons/personal-roboport-equipment.png",
  placed_as_equipment_result = "perso-robo-nr",
  flags = {"goes-to-main-inventory"},
  subgroup = "equipment",
  order = "e[robotics]-b[perso-robo-nr]",
  stack_size = 5
 },
 {
  type = "recipe",
  name = "perso-robo-nr",
  enabled = false,
  energy_required = 10,
  ingredients = { { "processing-unit", 10 }, { "iron-gear-wheel", 50 }, { "steel-plate", 30 }, { "battery", 50 } },
  result = "perso-robo-nr"
 }
}
)

table.insert(data.raw.technology["personal-roboport-equipment"].effects,{type = "unlock-recipe", recipe = "perso-robo-nr"})