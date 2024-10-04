require "util"

local MODNAME = "__Shared_Inventory__"

local chest = util.table.deepcopy(data.raw["container"]["steel-chest"])
chest.name = "Shared_Inventory"
chest.flags = {"not-rotatable", "not-on-map", "not-blueprintable", "not-deconstructable", "hidden", "hide-alt-info", "not-flammable", "no-automated-item-removal", "no-automated-item-insertion", "no-copy-paste", "not-selectable-in-game", "not-upgradable", "not-in-kill-statistics"}
chest.collision_box = nil
chest.selection_box = nil
chest.collision_mask = {}
chest.fast_replaceable_group = nil
chest.inventory_size = 500
chest.enable_inventory_bar = false
chest.picture = {layers = {util.empty_sprite()}}

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