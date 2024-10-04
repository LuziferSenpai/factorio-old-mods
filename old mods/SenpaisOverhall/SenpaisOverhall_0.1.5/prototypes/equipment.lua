local MODNAME = "__SenpaisOverhall__"

data:extend
(
{
 {
  type = "generator-equipment",
  name = "alien-fusion",
  sprite = { filename = MODNAME.."/graphics/equipment/alien-fusion.png", width = 128, height = 128, priority = "medium" },
  shape = { width = 4, height = 4, type = "full" },
  energy_source = { type = "electric", usage_priority = "primary-output" },
  power = "50000kW",
  categories = { "armor" }
 },
 {
  type = "roboport-equipment",
  name = "alien-port",
  take_result = "alien-port",
  sprite = { filename = MODNAME.."/graphics/equipment/alien-port.png", width = 64, height = 64, priority = "medium" },
  shape = { width = 2, height = 2, type = "full" },
  energy_source = { type = "electric", buffer_capacity = "1000MJ", input_flow_limit = "50MW", usage_priority = "secondary-input" },
  charging_energy = "3000kW",
  energy_consumption = "3000kW",
  robot_limit = 50,
  construction_radius = 100,
  spawn_and_station_height = 0.4,
  charge_approach_distance = 2.6,
  recharging_animation = { filename = "__base__/graphics/entity/roboport/roboport-recharging.png", priority = "high", width = 37, height = 35, frame_count = 16,   scale = 1.5, animation_speed = 0.5 },
  recharging_light = {intensity = 0.4, size = 5},
  stationing_offset = {0, -0.6},
  charging_station_shift = {0, 0.5},
  charging_station_count = 10,
  charging_distance = 1.6,
  charging_threshold_distance = 5,
  categories = { "armor" }
 },
 {
  type = "energy-shield-equipment",
  name = "alien-shield",
  sprite = { filename = MODNAME.."/graphics/equipment/alien-shield.png", width = 64, height = 64, priority = "medium" },
  shape = { width = 2, height = 2, type = "full" },
  max_shield_value = 300,
  energy_source = { type = "electric", buffer_capacity = "400kJ", input_flow_limit = "750kW", usage_priority = "primary-input" },
  energy_per_shield = "100kJ",
  categories = { "armor" }
 }
}
)