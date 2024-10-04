local m = "__Electronic_Battle_Locomotives__"
local utd = util.table.deepcopy

if not data.raw["equipment-grid"]["Battle-Grid-01"] then
	Senpais.Functions.Create.Grid( "Battle-Grid-01", 5, 5, { "Battle-Laser", "armor" } )
end

if not data.raw["equipment-grid"]["Battle-Grid-02"] then
	Senpais.Functions.Create.Grid( "Battle-Grid-02", 10, 10, { "Battle-Laser", "armor" } )
end

if not data.raw["equipment-grid"]["Battle-Grid-03"] then
	Senpais.Functions.Create.Grid( "Battle-Grid-03", 15, 15, { "Battle-Laser", "armor" } )
end

if not data.raw["active-defense-equipment"]["laser-2"] then
	
	local le = utd( data.raw["active-defense-equipment"]["personal-laser-defense-equipment"] )
	le.name = "laser-2"
	le.sprite.filename = m .. "/graphics/laser-2.png"
	le.energy_source.buffer_capacity = "750kJ"
	le.attack_parameters =
	{
		type = "beam",
		cooldown = 20,
		range = 30,
		damage_modifier = 8,
		ammo_type =
		{
			category = "laser-turret",
			energy_consumption = "200kJ",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "beam",
					beam = "laser-beam",
					max_length = 30,
					duration = 20,
					source_offset = { 0, -1.31439 }
				}	
			}
		}
	}
	le.categories = { "Battle-Laser" }
	
	local li = utd( data.raw["item"]["personal-laser-defense-equipment"] )
	li.name = "laser-2"
	li.icon = m .. "/graphics/laser-2-i.png"
	li.placed_as_equipment_result = "laser-2"
	li.order = "d[active-defense]-ab[laser-2]"
	
	local lr = utd( data.raw["recipe"]["personal-laser-defense-equipment"] )
	lr.name = "laser-2"
	lr.ingredients =
	{
		{ "personal-laser-defense-equipment", 1 },
		{ "processing-unit", 10 },
		{ "steel-plate", 50 },
		{ "laser-turret", 5 }
	}
	lr.result = "laser-2"
	
	local lt = utd( data.raw["technology"]["personal-laser-defense-equipment"] )
	lt.name = "personal-laser-defense-equipment-2"
	lt.prerequisites = { "personal-laser-defense-equipment" }
	lt.effects = { { type = "unlock-recipe", recipe = "laser-2" } }
	lt.unit.count = 250
	
	data:extend{ { type = "equipment-category", name = "Battle-Laser" }, le, li, lr, lt }
end

Senpais.Functions.Create.Electronic_Locomotive
(
	"600kW",
	"Elec-Battle-Loco-1",
	m .. "/graphics/Elec-Battle-Loco-1.png",
	1000,
	2000,
	1.2,
	{ r = 180, g = 136, b = 0 },
	"Battle-Grid-01",
	"transport",
	"a[train-system]-fca[Elec-Battle-Loco-1]",
	5,
	{ { "Senpais-Electric-Train", 1 }, { "modular-armor", 1 } },
	"modular-armor"
)

data.raw["locomotive"]["Elec-Battle-Loco-1"].resistances = utd( data.raw["armor"]["modular-armor"].resistances )

Senpais.Functions.Create.Electronic_Locomotive
(
	"1200kW",
	"Elec-Battle-Loco-2",
	m .. "/graphics/Elec-Battle-Loco-2.png",
	1500,
	4000,
	1.4,
	{ r = 83, g = 166, b = 187 },
	"Battle-Grid-02",
	"transport",
	"a[train-system]-fcb[Elec-Battle-Loco-2]",
	5,
	{ { "Elec-Battle-Loco-1", 1 }, { "power-armor", 1 } },
	"power-armor"
)

data.raw["locomotive"]["Elec-Battle-Loco-2"].resistances = utd( data.raw["armor"]["power-armor"].resistances )


Senpais.Functions.Create.Electronic_Locomotive
(
	"1800kW",
	"Elec-Battle-Loco-3",
	m .. "/graphics/Elec-Battle-Loco-3.png",
	2000,
	6000,
	1.6,
	{ r = 157, g = 0, b = 196 },
	"Battle-Grid-03",
	"transport",
	"a[train-system]-fcc[Elec-Battle-Loco-3]",
	5,
	{ { "Elec-Battle-Loco-2", 1 }, { "power-armor-mk2", 1 } },
	"power-armor-mk2"
)

data.raw["locomotive"]["Elec-Battle-Loco-3"].resistances = utd( data.raw["armor"]["power-armor-mk2"].resistances )