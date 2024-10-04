for i = 1, 5 do
    if i == 1 then
        data:extend{
            {
                type = "string-setting",
                name = "electronic_loco_register_add_electronic-crawler-locomotive",
                setting_type = "startup",
                order = "01",
                default_value = "more_800",
                hidden = true
            },
            {
                type = "string-setting",
                name = "electronic_loco_register_add_electronic-crawler-locomotive-wagon",
                setting_type = "startup",
                order = "06",
                default_value = "more_1000",
                hidden = true
            },
            {
                type = "string-setting",
                name = "electronic_loco_register_add_electronic-petro-locomotive-1",
                setting_type = "startup",
                order = "11",
                default_value = "more_800",
                hidden = true
            },
            {
                type = "string-setting",
                name = "electronic_loco_register_add_electronic-smelting-locomotive-1",
                setting_type = "startup",
                order = "16",
                default_value = "more_900",
                hidden = true
            },
            {
                type = "string-setting",
                name = "electronic_loco_register_add_electronic-smelting-locomotive-tender",
                setting_type = "startup",
                order = "21",
                default_value = "more_1000",
                hidden = true
            },
        }
    else
        local multiplier = math.pow(1.25, i - 1)
        
        data:extend{
            {
                type = "string-setting",
                name = "electronic_loco_register_add_electronic-crawler-locomotive-" .. i,
                setting_type = "startup",
                order = string.format( "%02d", i + 1),
                default_value = "more_" .. 800 * multiplier,
                hidden = true
            },
            {
                type = "string-setting",
                name = "electronic_loco_register_add_electronic-crawler-locomotive-wagon-" .. i,
                setting_type = "startup",
                order = string.format( "%02d", i + 6),
                default_value = "more_" .. 1000 * multiplier,
                hidden = true
            },
            {
                type = "string-setting",
                name = "electronic_loco_register_add_electronic-petro-locomotive-1-" .. i,
                setting_type = "startup",
                order = string.format( "%02d", i + 11),
                default_value = "more_" .. 800 * multiplier,
                hidden = true
            },
            {
                type = "string-setting",
                name = "electronic_loco_register_add_electronic-smelting-locomotive-1-" .. i,
                setting_type = "startup",
                order = string.format( "%02d", i + 16),
                default_value = "more_" .. 900 * multiplier,
                hidden = true
            },
            {
                type = "string-setting",
                name = "electronic_loco_register_add_electronic-smelting-locomotive-tender-" .. i,
                setting_type = "startup",
                order = string.format( "%02d", i + 21),
                default_value = "more_" .. 1000 * multiplier,
                hidden = true
            },
        }
    end
end