local Modname = "__Senpais_Invi_Tech__"

local function create_tech_invi ( number, pre, ingri, time, max )
  data:extend
  (
  {
   {
    type = "technology",
    name = "player-inventory-upgrade-" .. number,
    icon = Modname .. "/player-inventory-upgrade.png",
    icon_size = 128,
    prerequisites = pre,
    unit = { count_formula = "100*L", ingredients = ingri, time = time },
    upgrade = true,
    max_level = max,
    order = "c-k-i-a"
   }
  }
  )
end

create_tech_invi( 1, nil, { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 } }, 30, 3 )
create_tech_invi( 4, { "player-inventory-upgrade-1" }, { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "production-science-pack", 1 } }, 60, 7 )
create_tech_invi( 8, { "player-inventory-upgrade-4" }, { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "production-science-pack", 1 }, { "high-tech-science-pack", 1 } }, 60, 11 )
create_tech_invi( 12, { "player-inventory-upgrade-8" },  { { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 }, { "production-science-pack", 1 }, { "high-tech-science-pack", 1 }, { "space-science-pack", 1 } }, 60, "infinite" )