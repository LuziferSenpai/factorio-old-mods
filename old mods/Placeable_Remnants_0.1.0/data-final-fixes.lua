local m = "__Placeable_Remnants__"

data:extend
{
	{
		type = "item-group",
		name = "Remnants_Pl",
		icon =  m .. "/icon.png",
		icon_size = 128,
		order = "zzz"
	},
	{
		type = "item-subgroup",
		name = "re01",
		group = "Remnants_Pl",
		order = 1
	},
	{
		type = "item-subgroup",
		name = "re02",
		group = "Remnants_Pl",
		order = 2
	}
}

local o = 0
local op = ""

for _, e in pairs( data.raw["corpse"] ) do
	o = o + 1
	if o < 10 then op = "0" else op = "" end

	data:extend
	{
		{
			type = "item",
			name = e.name,
			icons =
			{
				{ icon = e.icon, icon_size = 32 },
				{ icon = m .. "/r.png", icon_size = 32, scale = 0.5 }
			},
			subgroup = "re01",
			order = o .. op,
			place_result = e.name,
			stack_size = 50,
		},
		{
			type = "recipe",
			name = e.name,
			enabled = true,
			ingredients = {},
			result = e.name
		}
	}
end

o = 0

for _, e in pairs( data.raw["rail-remnants"] ) do
	o = 0 + 1
	if o < 10 then op = "0" else op = "" end

	data:extend
	{
		{
			type = "item",
			name = e.name,
			icons =
			{
				{ icon = e.icon, icon_size = 32 },
				{ icon = m .. "/r.png", icon_size = 32, scale = 0.5 }
			},
			subgroup = "re02",
			order = o .. op,
			place_result = e.name,
			stack_size = 50
		},
		{
			type = "recipe",
			name = e.name,
			enabled = true,
			ingredients = {},
			result = e.name
		}
	}
end