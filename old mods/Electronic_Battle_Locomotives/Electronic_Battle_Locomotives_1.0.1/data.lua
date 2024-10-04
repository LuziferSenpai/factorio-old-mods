local MODNAME = "__Electronic_Battle_Locomotives__"
local table_deepcopy = util.table.deepcopy
local temp01 = "Electronic-Battle-Locomotive-"
local temp02 = "Battle-Grid-"
local temp03 = "modular-armor"
local temp04 = "Electronic-Standard-Locomotive"

Senpais.Functions.Create.Electronic_Locomotive(temp01 .. "1", 1000, 2000, 1.2, "600kW", "#b48800", temp02 .. "01", "train-transport", "a[train-system]-fca[" .. temp01 .. "1]", 5, {{temp04, 1}, {temp03, 1}}, temp03)

data.raw["locomotive"][temp01 .. "1"].resistances = table_deepcopy(data.raw["armor"][temp03].resistances)

temp03 = "power-armor"

Senpais.Functions.Create.Electronic_Locomotive( temp01 .. "2", 1500, 2000, 1.2, "600kW", "#53a6bb", temp02 .. "02", "train-transport", "a[train-system]-fcb[" .. temp01 .. "2]", 5, {{temp04, 1}, {temp03, 1}}, temp03)

data.raw["locomotive"][temp01 .. "2"].resistances = table_deepcopy(data.raw["armor"][temp03].resistances)

temp03 = "power-armor-mk2"

Senpais.Functions.Create.Electronic_Locomotive( temp01 .. "3", 2000, 2000, 1.2, "600kW", "#9d00c4", temp02 .. "03", "train-transport", "a[train-system]-fcc[" .. temp01 .. "3]", 5, {{temp04, 1}, {temp03, 1}}, temp03)

data.raw["locomotive"][temp01 .. "3"].resistances = table_deepcopy(data.raw["armor"][temp03].resistances)