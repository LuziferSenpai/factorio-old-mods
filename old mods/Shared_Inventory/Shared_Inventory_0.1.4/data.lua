require "util"

local MODNAME = "__Shared_Inventory__"

local car = util.table.deepcopy(data.raw["car"]["car"])
car.name = "Shared_Inventory"
car.flags = {"not-rotatable", "not-on-map", "not-blueprintable", "not-deconstructable", "hidden", "hide-alt-info", "not-flammable", "no-automated-item-removal", "no-automated-item-insertion", "no-copy-paste", "not-selectable-in-game", "not-upgradable", "not-in-kill-statistics"}
car.collision_box = nil
car.selection_box = nil
car.collision_mask = {}
car.effectivity = 0
car.braking_power = "1kW"
car.burner = {
    type = "void",
    effectivity = 1,
    fuel_inventory_size = 0,
    render_no_power_icon = false
}
car.consumption = "0kW"
car.friction = 1
car.animation = {
    filename = "__core__/graphics/empty.png",
    priority = "extra-high",
    size = 1,
    frame_count = 1,
    direction_count = 1
}
car.light = nil
car.light_animation = nil
car.turret_animation = nil
car.turret_rotation_speed = nil
car.sound_no_fuel = nil
car.stop_trigger_speed = nil
car.sound_minimum_speed = nil
car.sound_scaling_ratio = nil
car.working_sound = nil
car.guns = nil
car.inventory_size = settings.startup["Shared_Inventory_Size"].value
car.water_reflection = nil

data:extend{
    car,
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