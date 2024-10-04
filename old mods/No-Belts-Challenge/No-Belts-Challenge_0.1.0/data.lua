local MODNAME = "__No-Belts-Challenge__"

data:extend
(
{
 {
  type = "dont-build-entity-achievement",
  name = "no-belts-challenge",
  icon = MODNAME.."/no-belts.png",
  order = "f[limitation]-e[no-belts-challenge]",
  dont_build = {},
 }
}
)

for tb, belts in pairs(data.raw["transport-belt"]) do
   table.insert(data.raw["dont-build-entity-achievement"]["no-belts-challenge"].dont_build, tb)
end

for ub, underground in pairs(data.raw["underground-belt"]) do
   table.insert(data.raw["dont-build-entity-achievement"]["no-belts-challenge"].dont_build, ub)
end

for s, splitti in pairs(data.raw["splitter"]) do
   table.insert(data.raw["dont-build-entity-achievement"]["no-belts-challenge"].dont_build, s)
end