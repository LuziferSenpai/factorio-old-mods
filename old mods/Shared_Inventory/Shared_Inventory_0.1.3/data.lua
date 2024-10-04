require "util"

local MODNAME = "__Shared_Inventory__"

local chest = util.table.deepcopy(data.raw["car"]["car"])
chest.name = "Shared_Inventory"
chest.flags = {"not-rotatable", "not-on-map", "not-blueprintable", "not-deconstructable", "hidden", "hide-alt-info", "not-flammable", "no-automated-item-removal", "no-automated-item-insertion", "no-copy-paste", "not-selectable-in-game", "not-upgradable", "not-in-kill-statistics"}
chest.collision_box = nil
chest.selection_box = nil
chest.collision_mask = {}
chest.effectivity = 0
chest.braking_power = "1kW"
chest.burner = {
    type = "void",
    effectivity = 1,
    fuel_inventory_size = 0,
    render_no_power_icon = false
}
chest.consumption = "0kW"
chest.friction = 1
chest.animation = {
    filename = "__core__/graphics/empty.png",
    priority = "extra-high",
    size = 1,
    frame_count = 1,
    direction_count = 1
}
chest.light = nil
chest.turret_animation = nil
chest.turret_rotation_speed = nil
chest.sound_no_fuel = nil
chest.stop_trigger_speed = nil
chest.sound_minimum_speed = nil
chest.sound_scaling_ratio = nil
chest.working_sound = nil
chest.guns = nil
chest.inventory_size = settings.startup["Shared_Inventory_Size"].value
chest.water_reflection = nil

data:extend{
    chest,
    {
        type = "custom-input",
        name = "SharedInventory",
        action = "lua",
        key_sequence = "CONTROL + SHIFT + I",
        localised_name = {"SharedInventory.Shortcut"}
    },
    {
        type = "shortcut",
        name = "SharedInventory",
        localised_name = {"SharedInventory.Shortcut"},
        order = "a[Shared Inventory]",
        action = "lua",
        associated_control_input = "SharedInventory",
        style = "default",
        icon = {
            filename = MODNAME .. "/inventory.png",
            priority = "extra-high-no-scale",
            size = 64,
            scale = 1,
            flags = {"icon"}
        },
        small_icon = {
            filename = MODNAME .. "/inventory.png",
            priority = "extra-high-no-scale",
            size = 64,
            scale = 1,
            flags = {"icon"}
        },
        disabled_small_icon = {
            filename = MODNAME .. "/inventory.png",
            priority = "extra-high-no-scale",
            size = 64,
            scale = 1,
            flags = {"icon"}
        }
    }
}