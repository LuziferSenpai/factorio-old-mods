local m  = "__ColorblindCircuitNetwork_fix__"

data.raw.item["green-wire"].icon = m .. "/graphics/yi.png"
data.raw["utility-sprites"].default.green_wire.filename = m .. "/graphics/yellow-wire.png"
data.raw["utility-sprites"].default.green_wire.hr_version.filename = m .. "/graphics/hr-yellow-wire.png"
data.raw.item["red-wire"].icon = m .. "/graphics/bi.png"
data.raw["utility-sprites"].default.red_wire.filename = m .. "/graphics/blue-wire.png"
data.raw["utility-sprites"].default.red_wire.hr_version.filename = m .. "/graphics/hr-blue-wire.png"
data.raw["gui-style"].default.green_circuit_network_content_slot.default_graphical_set.position = { 111, 72 }
data.raw["gui-style"].default.red_circuit_network_content_slot.default_graphical_set.position = { 221, 72 }