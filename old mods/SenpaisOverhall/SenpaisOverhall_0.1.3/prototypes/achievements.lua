local MODNAME = "__SenpaisOverhall__"

data:extend
(
{
 {
  type = "produce-per-hour-achievement",
  name = "electronic-throne-1",
  icon = MODNAME.."/graphics/achievement/electronic-throne-1.png",
  order = "d[production]-a[electronic-throne-1]",
  item_product = "electronic-circuit",
  amount = 20000
 },
 {
  type = "produce-per-hour-achievement",
  name = "electronic-throne-2",
  icon = MODNAME.."/graphics/achievement/electronic-throne-2.png",
  order = "d[production]-a[electronic-throne-2]",
  item_product = "electronic-circuit",
  amount = 200000
 },
 {
  type = "produce-per-hour-achievement",
  name = "electronic-throne-3",
  icon = MODNAME.."/graphics/achievement/electronic-throne-3.png",
  order = "d[production]-a[electronic-throne-3]",
  item_product = "electronic-circuit",
  amount = 400000
 },
 {
  type = "produce-per-hour-achievement",
  name = "electronic-throne-4",
  icon = MODNAME.."/graphics/achievement/electronic-throne-4.png",
  order = "d[production]-a[electronic-throne-4]",
  item_product = "electronic-circuit",
  amount = 1000000
 },
 {
  type = "produce-achievement",
  name = "mass-production-4",
  icon = MODNAME.."/graphics/achievement/mass-production-4.png",
  order = "d[production]-b[electronic-circuit-production]-d",
  item_product = "electronic-circuit",
  amount = 50000000,
  limited_to_one_game = false
 },
 {
  type = "produce-per-hour-achievement",
  name = "circuit-veteran-4",
  icon = MODNAME.."/graphics/achievement/circuit-veteran-4.png",
  order = "d[production]-c[advanced-circuit-production]-d",
  item_product = "advanced-circuit",
  amount = 100000
 },
 {
  type = "produce-per-hour-achievement",
  name = "computer-age-4",
  icon = MODNAME.."/graphics/achievement/computer-age-4.png",
  order = "d[production]-d[processing-unit-production]-c",
  item_product = "processing-unit",
  amount = 20000
 },
 {
  type = "produce-per-hour-achievement",
  name = "iron-throne-4",
  icon = MODNAME.."/graphics/achievement/iron-throne-4.png",
  order = "d[production]-e[iron-throne-4]",
  item_product = "iron-plate",
  amount = 1000000
 },
 --[[
 {
  type = "produce-per-hour-achievement",
  name = "copper-throne-1",
  icon = MODNAME.."/graphics/achievement/copper-throne-1.png",
  order = "d[production]-f[copper-throne-1]",
  item_product = "copper",
  amount = 20000
 },
 {
  type = "produce-per-hour-achievement",
  name = "copper-throne-2",
  icon = MODNAME.."/graphics/achievement/copper-throne-2.png",
  order = "d[production]-f[copper-throne-2]",
  item_product = "copper",
  amount = 200000
 },
 {
  type = "produce-per-hour-achievement",
  name = "copper-throne-3",
  icon = MODNAME.."/graphics/achievement/copper-throne-3.png",
  order = "d[production]-f[copper-throne-3]",
  item_product = "copper",
  amount = 500000
 },
 {
  type = "produce-per-hour-achievement",
  name = "copper-throne-4",
  icon = MODNAME.."/graphics/achievement/copper-throne-4.png",
  order = "d[production]-f[copper-throne-4]",
  item_product = "copper",
  amount = 1000000
 },]]--
}
)