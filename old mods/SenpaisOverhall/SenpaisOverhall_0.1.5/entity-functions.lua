function pipecoverspictures ()
    return
    {
      north = { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png", priority = "extra-high", width = 44, height = 32 },
      east = { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png", priority = "extra-high", width = 32, height = 32 },
      south = { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png", priority = "extra-high", width = 46, height = 52 },
      west = { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png", priority = "extra-high", width = 32, height = 32 }
    }
end

boilerfires = {
                down = { filename = "__base__/graphics/entity/boiler/boiler-fire-down.png", priority = "extra-high", line_length = 8, width = 21, height = 34, frame_count = 48, axially_symmetrical = false, direction_count = 1, shift = {0.140625, -0.09375} },
                left = { filename = "__base__/graphics/entity/boiler/boiler-fire-left.png", priority = "extra-high", line_length = 8, width = 9, height = 33, frame_count = 48, axially_symmetrical = false, direction_count = 1, shift = {-0.453125, -0.484375} }, 
                right = { filename = "__base__/graphics/entity/boiler/boiler-fire-right.png", priority = "extra-high", line_length = 8, width = 9, height = 27, frame_count = 48, axially_symmetrical = false, direction_count = 1, shift = {0.484375, -0.359375} }
              }

function pipepictures ()
    return
    {
      straight_vertical_single = { filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-single.png", priority = "extra-high", width = 44, height = 58 },
      straight_vertical = { filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png", priority = "extra-high", width = 44, height = 42 },
      straight_vertical_window = { filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-window.png", priority = "extra-high", width = 44, height = 32 },
      straight_horizontal_window = { filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal-window.png", priority = "extra-high", width = 32, height = 42 },
      straight_horizontal = { filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png", priority = "extra-high", width = 32, height = 42 },
      corner_up_right = { filename = "__base__/graphics/entity/pipe/pipe-corner-up-right.png", priority = "extra-high", width = 32, height = 40 },
      corner_up_left = { filename = "__base__/graphics/entity/pipe/pipe-corner-up-left.png", priority = "extra-high", width = 44, height = 44 },
      corner_down_right = { filename = "__base__/graphics/entity/pipe/pipe-corner-down-right.png", priority = "extra-high", width = 32, height = 32 },
      corner_down_left = { filename = "__base__/graphics/entity/pipe/pipe-corner-down-left.png", priority = "extra-high", width = 36, height = 32 },
      t_up = { filename = "__base__/graphics/entity/pipe/pipe-t-up.png", priority = "extra-high", width = 32, height = 42 },
      t_down = { filename = "__base__/graphics/entity/pipe/pipe-t-down.png", priority = "extra-high", width = 40, height = 44 },
      t_right = { filename = "__base__/graphics/entity/pipe/pipe-t-right.png", priority = "extra-high", width = 40, height = 32 },
      t_left = { filename = "__base__/graphics/entity/pipe/pipe-t-left.png", priority = "extra-high", width = 44, height = 42 },
      cross = { filename = "__base__/graphics/entity/pipe/pipe-cross.png", priority = "extra-high", width = 40, height = 40 },
      ending_up = { filename = "__base__/graphics/entity/pipe/pipe-ending-up.png", priority = "extra-high", width = 44, height = 42 },
      ending_down = { filename = "__base__/graphics/entity/pipe/pipe-ending-down.png", priority = "extra-high", width = 44, height = 32 },
      ending_right = { filename = "__base__/graphics/entity/pipe/pipe-ending-right.png", priority = "extra-high", width = 32, height = 44 },
      ending_left = { filename = "__base__/graphics/entity/pipe/pipe-ending-left.png", priority = "extra-high", width = 58, height = 44 },
      horizontal_window_background = { filename = "__base__/graphics/entity/pipe/pipe-horizontal-window-background.png", priority = "extra-high", width = 32, height = 42 },
      vertical_window_background = { filename = "__base__/graphics/entity/pipe/pipe-vertical-window-background.png", priority = "extra-high", width = 44, height = 32 },
      fluid_background = { filename = "__base__/graphics/entity/pipe/fluid-background.png", priority = "extra-high", width = 32, height = 20 },
      low_temperature_flow = { filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png", priority = "extra-high", width = 160, height = 18 },
      middle_temperature_flow = { filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png", priority = "extra-high", width = 160, height = 18 },
      high_temperature_flow = { filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png", priority = "extra-high", width = 160, height = 18 }
    }
end

function assemblerpipepictures ()
  return { north = { filename = "__base__/graphics/entity/assembling-machine-3/pipe-north.png", priority = "extra-high", width = 40, height = 45, shift = {0.03125, 0.3125} },
  		   east = { filename = "__base__/graphics/entity/assembling-machine-3/pipe-east.png", priority = "extra-high", width = 40, height = 45, shift = {-0.78125, 0.15625} },
  		   south = { filename = "__base__/graphics/entity/assembling-machine-3/pipe-south.png", priority = "extra-high", width = 40, height = 45, shift = {0.03125, -1.0625} },
  		   west = { filename = "__base__/graphics/entity/assembling-machine-3/pipe-west.png", priority = "extra-high", width = 40, height = 45, shift = {0.8125, 0} }
  		 }
end

function flying_robot_sounds()
  return { sound = { { filename = "__base__/sound/flying-robot-1.ogg", volume = 0.6 },
  					 { filename = "__base__/sound/flying-robot-2.ogg", volume = 0.6 },
  					 { filename = "__base__/sound/flying-robot-3.ogg", volume = 0.6 },
  					 { filename = "__base__/sound/flying-robot-4.ogg", volume = 0.6 },
  					 { filename = "__base__/sound/flying-robot-5.ogg", volume = 0.6 }
  				   },
    	   max_sounds_per_type = 3,
    	   audible_distance_modifier = 0.5,
    	   probability = 1 / (3 * 60)
  		 }
end

function get_circuit_connector_sprites(mainOffset, shadowOffset, connectorNumber)
  local logisticAnimationOffsets = 
  {
    {-0.171875, -0.109375}, -- 0
    {0, 0}, -- 1 (missing)
    {0.015625, 0.015625},
    {0.140625, -0.015625},
    {0.203125, -0.109375},
    {0.140625, -0.203125}, --5
    {0.015625, -0.234375},
    {-0.109375, -0.203125},
    {-0.234375, -0.015625},
    {-0.171875, 0.109375},
    {0.015625, 0.140625}, -- 10
    {0.203125, 0.078125},
    {0.265625, -0.046875},
    {0.203125, -0.171875},
    {0.015625, -0.234375},
    {-0.203125, -0.203125}, --15
    {-0.265625, 0.046875},
    {-0.171875, 0.171875},
    {0.015625, 0.234375},
    {0.171875, 0.171875},
    {0.265625, 0.046875}, -- 20
    {0.171875, -0.109375},
    {-0.015625, -0.171875},
    {-0.203125, -0.078125},
    {-0.203125, 0.140625},
    {-0.140625, 0.234375}, --25
    {0.015625, 0.265625},
    {0.140625, 0.234375},
    {0.203125, 0.140625},
    {0.109375, -0.140625},
    {-0.015625, -0.203125}, --30
    {-0.140625, -0.078125},
  };
  local result = 
  {
    connector_main =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-main.png",
      priority = "low",
      width = 28,
      height = 27,
      x = 28*(connectorNumber%8),
      y = 27*(math.floor(connectorNumber/8)),
      shift = {0 + mainOffset[1], 0.015625 + mainOffset[2]},
    },
    led_red =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-led-red.png",
      priority = "low",
      width = 20,
      height = 16,
      x = 20*(connectorNumber%8),
      y = 16*(math.floor(connectorNumber/8)),
      shift = {0 + mainOffset[1], -0.03125 + mainOffset[2]},
    },
    led_green =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-led-green.png",
      priority = "low",
      width = 20,
      height = 16,
      x = 20*(connectorNumber%8),
      y = 16*(math.floor(connectorNumber/8)),
      shift = {0 + mainOffset[1], -0.03125 + mainOffset[2]},
    },
    led_blue =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-led-blue.png",
      priority = "low",
      width = 21,
      height = 22,
      x = 21*(connectorNumber%8),
      y = 22*(math.floor(connectorNumber/8)),
      shift = {-0.015625 + mainOffset[1], 0 + mainOffset[2]},
    },
    
    logistic_animation = 
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-logistic-animation.png",
      priority = "low",
      blend_mode = "additive",
      line_length = 4,
      width = 43,
      height = 43,
      frame_count = 15,
      shift = {0.015625 + logisticAnimationOffsets[connectorNumber+1][1] + mainOffset[1], -0.234375 + logisticAnimationOffsets[connectorNumber+1][2] + mainOffset[2]},
    },
    
    led_light =
    {
      intensity = 0.8,
      size = 0.9,
    },
    
    blue_led_light_offset = {0 + mainOffset[1], -0.03125 + mainOffset[2]},
    red_green_led_light_offset = {0 + mainOffset[1], -0.15625 + mainOffset[2]},
  };
  
  if (not (shadowOffset == nil)) then
    result.connector_shadow =
    {
      filename = "__base__/graphics/entity/circuit-connector/circuit-connector-shadow.png",
      priority = "low",
      width = 34,
      height = 26,
      x = 34*(connectorNumber%8),
      y = 26*(math.floor(connectorNumber/8)),
      shift = {0.125 + shadowOffset[1], 0.09375 + shadowOffset[2]},
    };
  end
  return result;
end

