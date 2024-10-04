script.on_init(function() On_Load() end)
script.on_load(function() On_Load() end)
script.on_event(defines.events.on_tick, function() On_Tick() end)

script.on_event(defines.events.on_built_entity, function(event) On_Built(event) end)
script.on_event(defines.events.on_robot_built_entity, function(event) On_Built(event) end)
script.on_event(defines.events.on_preplayer_mined_item, function(event) On_Removed(event) end)
script.on_event(defines.events.on_robot_pre_mined, function(event) On_Removed(event) end)
script.on_event(defines.events.on_entity_died, function(event) On_Removed(event) end)

PowerMax = 10666.6666666667

function On_Load()
	if not global.SenpaisTrainsList then
		global.SenpaisTrainsList = {}
	end
	if not global.SenpaisAccuList then
		global.SenpaisAccuList = {}
	end
end

function On_Tick()
	local NeededPower = 0
	for i=1,#global.SenpaisTrainsList do
		NeededPower = NeededPower + (PowerMax - global.SenpaisTrainsList[i].energy)
	end
	local StoredPower = 0
	for i=1,#global.SenpaisAccuList do
		StoredPower = StoredPower + global.SenpaisAccuList[i].energy
	end
	local AvaiblePower = 0
	AvaiblePower = StoredPower - NeededPower
	if AvaiblePower >= 0 then
		for i=1,#global.SenpaisTrainsList do
			global.SenpaisTrainsList[i].energy = PowerMax
		end
		local PerPower = 0
		PerPower = AvaiblePower / #global.SenpaisAccuList 
		for i=1,#global.SenpaisAccuList do
			global.SenpaisAccuList[i].energy = PerPower
		end
	else
		for i=1,#global.SenpaisAccuList do
			global.SenpaisAccuList[i].energy = 0
		end
		PerPower = (NeededPower + AvaiblePower) / #global.SenpaisTrainsList
		for i=1,#global.SenpaisTrainsList do
			global.SenpaisTrainsList[i].energy = PerPower
		end
	end
end

function On_Built(event)
	local entity = event.created_entity
	if entity.name == "Senpais-Power-Provider" then
    	global.SenpaisAccuList[#global.SenpaisAccuList + 1] = entity
    end
	if entity.name == "Senpais-Electric-Train" then
    	global.SenpaisTrainsList[#global.SenpaisTrainsList + 1] = entity
    end
    if entity.name == "elec-battle-loco-1" then
    	global.SenpaisTrainsList[#global.SenpaisTrainsList + 1] = entity
    end
    if entity.name == "elec-battle-loco-2" then
    	global.SenpaisTrainsList[#global.SenpaisTrainsList + 1] = entity
    end
    if entity.name == "elec-battle-loco-3" then
    	global.SenpaisTrainsList[#global.SenpaisTrainsList + 1] = entity
    end
    if entity.name == "elec-battle-loco-4" then
    	global.SenpaisTrainsList[#global.SenpaisTrainsList + 1] = entity
    end
end

function On_Removed(event)
	local entity = event.entity
	if entity.name == "Senpais-Power-Provider" then
		for i=1,#global.SenpaisAccuList do
			if entity == global.SenpaisAccuList[i] then
				table.remove( global.SenpaisAccuList, i )
				return
			end
		end
    end
	if entity.name == "Senpais-Electric-Train" then
		for i=1,#global.SenpaisTrainsList do
			if entity == global.SenpaisTrainsList[i] then
				table.remove(global.SenpaisTrainsList, i)
				return
			end
		end
    end
	if entity.name == "Senpais-Power-Provider" then
		for i=1,#global.SenpaisAccuList do
			if entity == global.SenpaisAccuList[i] then
				table.remove(global.SenpaisAccuList, i)
				return
			end
		end
    end
    if entity.name == "elec-battle-loco-1" then
		for i=1,#global.SenpaisTrainsList do
			if entity == global.SenpaisTrainsList[i] then
				table.remove(global.SenpaisTrainsList, i)
				return
			end
		end
    end
    if entity.name == "elec-battle-loco-2" then
		for i=1,#global.SenpaisTrainsList do
			if entity == global.SenpaisTrainsList[i] then
				table.remove(global.SenpaisTrainsList, i)
				return
			end
		end
    end
    if entity.name == "elec-battle-loco-3" then
		for i=1,#global.SenpaisTrainsList do
			if entity == global.SenpaisTrainsList[i] then
				table.remove(global.SenpaisTrainsList, i)
				return
			end
		end
    end
    if entity.name == "elec-battle-loco-4" then
		for i=1,#global.SenpaisTrainsList do
			if entity == global.SenpaisTrainsList[i] then
				table.remove(global.SenpaisTrainsList, i)
				return
			end
		end
    end
end