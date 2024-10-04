require "util"

local table_deepcopy = util.table.deepcopy
local cannon_spidertron = "cannon-spidertron"
local icons = {
    {icon = "__base__/graphics/icons/spidertron.png", icon_size = 64, icon_mipmaps = 4},
    {icon = "__base__/graphics/icons/tank-cannon.png", icon_size = 64, icon_mipmaps = 4, scale = 0.25, shift = {-8, 8}},
}
local spidertron_cannon = table_deepcopy(data.raw["gun"]["tank-cannon"])
spidertron_cannon.localised_name = {"item-name.spidertron-cannon"}
spidertron_cannon.icon = "__base__/graphics/icons/tank-cannon.png"
spidertron_cannon.order = "z[spider]-ab[cannon]"
spidertron_cannon.attack_parameters.projectile_creation_distance = -0.5
spidertron_cannon.attack_parameters.projectile_center = {0, 0.3}
spidertron_cannon.stack_size = 1

local spidertron_cannon_1 = table_deepcopy(spidertron_cannon)
spidertron_cannon_1.name = "spidertron-cannon-1"
spidertron_cannon_1.attack_parameters.projectile_orientation_offset = -0.0625

local spidertron_cannon_2 = table_deepcopy(spidertron_cannon)
spidertron_cannon_2.name = "spidertron-cannon-2"
spidertron_cannon_2.attack_parameters.projectile_orientation_offset = -0.03125

local spidertron_cannon_3 = table_deepcopy(spidertron_cannon)
spidertron_cannon_3.name = "spidertron-cannon-3"
spidertron_cannon_3.attack_parameters.projectile_orientation_offset = 0.03125

local spidertron_cannon_4 = table_deepcopy(spidertron_cannon)
spidertron_cannon_4.name = "spidertron-cannon-4"
spidertron_cannon_4.attack_parameters.projectile_orientation_offset = 0.0625

local cannon_spidertron_entity = table_deepcopy(data.raw["spider-vehicle"]["spidertron"])
cannon_spidertron_entity.name = cannon_spidertron
cannon_spidertron_entity.icon = nil
cannon_spidertron_entity.icon_size = nil
cannon_spidertron_entity.icon_mipmaps = nil
cannon_spidertron_entity.icons = icons
cannon_spidertron_entity.minable.result = cannon_spidertron
cannon_spidertron_entity.guns = {"spidertron-cannon-1", "spidertron-cannon-2", "spidertron-cannon-3", "spidertron-cannon-4"}

local cannon_spidertron_item = table_deepcopy(data.raw["item-with-entity-data"]["spidertron"])
cannon_spidertron_item.name = cannon_spidertron
cannon_spidertron_item.icon = nil
cannon_spidertron_item.icon_tintable = nil
cannon_spidertron_item.icon_tintable_mask = nil
cannon_spidertron_item.icon_size = nil
cannon_spidertron_item.icon_mipmaps = nil
cannon_spidertron_item.icons = icons
cannon_spidertron_item.order = "b[personal-transport]-c[spidertron]-ab[cannon-spider]"
cannon_spidertron_item.place_result = cannon_spidertron

local cannon_spidertron_recipe = table_deepcopy(data.raw["recipe"]["spidertron"])
cannon_spidertron_recipe.name = cannon_spidertron
table.insert(cannon_spidertron_recipe.ingredients, {"steel-plate", 100})
cannon_spidertron_recipe.result = cannon_spidertron

table.insert(data.raw["technology"]["spidertron"].effects, 2, {type = "unlock-recipe", recipe = cannon_spidertron})

data:extend{
    spidertron_cannon_1,
    spidertron_cannon_2,
    spidertron_cannon_3,
    spidertron_cannon_4,
    cannon_spidertron_entity,
    cannon_spidertron_item,
    cannon_spidertron_recipe
}