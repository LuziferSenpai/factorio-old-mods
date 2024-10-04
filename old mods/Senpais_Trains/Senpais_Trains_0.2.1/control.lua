local MaxPower = 10667

local function ONLOAD()
	global.Register = { Trains = {} }
	global.SenpaisTrainsList = global.SenpaisTrainsList or {}
	global.SenpaisAccuList = global.SenpaisAccuList or {}
end

local function ONTICK()
	local PowerNeed = 0
	local PowerStorage = 0
	local PowerPer = 0
	if global.SenpaisTrainsList ~= nil and global.SenpaisAccuList ~= nil then
		for _, p in pairs( global.SenpaisTrainsList ) do
			PowerNeed = PowerNeed + ( ( MaxPower * p.multi ) - p.entity.energy )
		end
		for _, a in pairs( global.SenpaisAccuList ) do
			PowerStorage = PowerStorage + a.energy
		end
		if PowerStorage >= PowerNeed then
			for _, u in pairs( global.SenpaisTrainsList ) do
				u.entity.energy = MaxPower * u.multi
			end
			PowerPer = PowerNeed / #global.SenpaisAccuList
			for _, o in pairs( global.SenpaisAccuList ) do
				o.energy = o.energy - PowerPer
			end
		else
			for _, w in pairs( global.SenpaisAccuList ) do
				w.energy = 0
			end
			PowerPer = PowerStorage / #global.SenpaisTrainsList
			for _, n in pairs( global.SenpaisTrainsList ) do
				n.entity.energy = PowerPer
			end
		end
	end
end

local function ONBUILD( event )
	local entity = event.created_entity
	if entity.name == "Senpais-Power-Provider" then
		table.insert( global.SenpaisAccuList, entity )
	end
	if entity.type == "locomotive" then
		for _, h in pairs( global.Register.Trains ) do
			if entity.name == h.name then
				table.insert( global.SenpaisTrainsList, { multi = h.multy, entity = entity } )
				break
			end
		end
	end
end

local function ONREMOVE( event )
	local entity = event.entity
	if entity.name == "Senpais-Power-Provider" then
		if global.SenpaisAccuList ~= nil then
			for index, l in pairs( global.SenpaisAccuList ) do
				if entity == l then
					global.SenpaisAccuList[index] = nil
					break
				end
			end
		end
	end
	if entity.type == "locomotive" then
		if global.SenpaisTrainsList ~= nil then
			for index, l in pairs( global.SenpaisTrainsList ) do
				if entity == l.entity then
					global.SenpaisTrainsList[index] = nil
					break
				end
			end
		end
	end
end

script.on_init( function()
	ONLOAD()
	table.insert( global.Register.Trains, { name = "Senpais-Electric-Train", multy = 1 } )
	table.insert( global.Register.Trains, { name = "Senpais-Electric-Train-Heavy", multy = 4 } )
	table.insert( global.Register.Trains, { name = "Elec-Battle-Loco-1", multy = 1 } )
	table.insert( global.Register.Trains, { name = "Elec-Battle-Loco-2", multy = 2 } )
	table.insert( global.Register.Trains, { name = "Elec-Battle-Loco-3", multy = 3 } )
end )

remote.add_interface( "ADDTRAIN", { ADDTRAIN = function( name, multiplier ) table.insert( global.Register.Trains, { name = name, multy = multiplier } ) end } )

script.on_event( defines.events.on_tick, ONTICK )
script.on_event( defines.events.on_built_entity, ONBUILD )
script.on_event( defines.events.on_robot_built_entity, ONBUILD )
script.on_event( defines.events.on_pre_player_mined_item, ONREMOVE )
script.on_event( defines.events.on_robot_pre_mined, ONREMOVE )
script.on_event( defines.events.on_entity_died, ONREMOVE )