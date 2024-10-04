function addColor(bar, rs, gs, bs, re, ge, be)
	bar.other_smooth_colors = {}
	local index = 1
	for i = 1,100 do
		bar.other_smooth_colors[i] = { less_then = (i*1.0)/100.0, color = { r = rs - i * ((rs - re)/100), g = gs - i * ((gs - ge)/100), b = bs - i * ((bs - be)/100) } }
	end
end

addColor(data.raw["gui-style"]["default"]["electric_satisfaction_progressbar_style"], 1, 0, 0, 0, 1, 0)
addColor(data.raw["gui-style"]["default"]["health_progressbar_style"], 1, 0, 0, 0, 1, 0)

data.raw["transport-belt"]["transport-belt"].friendly_map_color = {r = .98, g = .73, b = 0}
data.raw["underground-belt"]["underground-belt"].friendly_map_color = {r = .98, g = .73, b = 0}
data.raw["transport-belt"]["fast-transport-belt"].friendly_map_color = {r = .98, g = .27, b = .06}
data.raw["underground-belt"]["fast-underground-belt"].friendly_map_color = {r = .98, g = .27, b = .06}
data.raw["transport-belt"]["express-transport-belt"].friendly_map_color = {r = .15, g = .67, b = .71}
data.raw["underground-belt"]["express-underground-belt"].friendly_map_color = {r = .15, g = .67, b = .71}
data.raw["gui-style"]["default"]["train_station_listbox_style"].height = 300
data.raw["gui-style"]["default"]["train_station_schedule_listbox_style"].height = 200

require("prototypes.entitys")
require("prototypes.equipment")
require("prototypes.fluids")
require("prototypes.item-groups")
require("prototypes.items")
require("prototypes.recipes")
require("prototypes.tech")
require("prototypes.achievements")

data:extend
(
{
 {
  type = "autoplace-control",
  name = "angel-ore",
  richness = true,
  order = "z-a"
 },
 {
  type = "autoplace-control",
  name = "devil-ore",
  richness = true,
  order = "z-b"
 },
 {
  type = "autoplace-control",
  name = "bavarium",
  richness = true,
  order = "z-c"
 },
 {
  type = "noise-layer",
  name = "angel-ore"
 },
 {
  type = "noise-layer",
  name = "devil-ore"
 },
 {
  type = "noise-layer",
  name = "bavarium"
 },
 {
  type = "recipe-category",
  name = "extreme-crafting"
 }
}
)