local MaxPower = 10667
local Signal_Couple = { type = "virtual", name = "signal-couple" }
local Signal_Uncouple = { type = "virtual", name = "signal-decouple" }

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

local function GETSIGNAL( entity, signal )
	local red = entity.get_circuit_network( defines.wire_type.red )
	local green = entity.get_circuit_network( defines.wire_type.green )
	local value = 0
	if red then
		value = red.get_signal( signal )
	end
	if green then
		value = value + green.get_signal( signal )
	end
	if value == 0 then
		return nil
	else
		return value
	end
end

local function ORIENTATIONMATCH( orient1, orient2 )
	return math.abs( orient1 - orient2 ) < 0.25 or math.abs( orient1 - orient2 ) > 0.75
end

local function GETORIENTATION( entity, target )
	local x = target.position.x - entity.position.x
	local y = target.position.y - entity.position.y
	return ( math.atan2( y, x ) / 2 / math.pi + 0.25 ) % 1
end

local function GETTILEDISTANCE( pos_a, pos_b )
	return math.abs( pos_a.x - pos_b.x ) + math.abs( pos_a.y - pos_b.y )
end

local function SWAPRAILDIR( raildir )
	if raildir == defines.rail_direction.front then
		return defines.rail_direction.back
	else
		return defines.rail_direction.front
	end
end

local function GETREALFRONT( train )
	if GETTILEDISTANCE( train.front_stock.position, train.station.position ) < GETTILEDISTANCE( train.back_stock.position, train.station.position ) then
		return train.front_stock
	else
		return train.back_stock
	end
end

local function GETREALBACK( train )
	local back = train.back_stock
	if GETTILEDISTANCE( train.front_stock.position, train.station.position ) < GETTILEDISTANCE( train.back_stock.position, train.station.position ) then
		return train.back_stock
	else
		return train.front_stock
	end
end

local function ATTEMPTCOUPLE( train, count )
	if count then
		local direction = defines.rail_direction.front
		if count < 0 then
			direction = defines.rail_direction.back
		end
		local front = GETREALFRONT( train )
		if not ORIENTATIONMATCH( front.orientation, train.station.orientation ) then
			direction = SWAPRAILDIR( direction )
		end
		if front.connect_rolling_stock( direction ) then
			return front
		end
	end
end

local function ATTEMPTUNCOUPLE( front, count )
	local frontCar = front.train.front_stock
	local backCar = front.train.back_stock
	if count and math.abs( count ) < #front.train.carriages then
		local direction = defines.rail_direction.front
		if front ~= front.train.front_stock then
			count = count * -1
		end
		local target = count
		if count < 0 then
			count = #front.train.carriages + count
			target = count + 1
		else
			count = count + 1
		end
		local wagon = front.train.carriages[count]
		if not ORIENTATIONMATCH( GETORIENTATION( wagon, front.train.carriages[target] ), wagon.orientation ) then
			direction = SWAPRAILDIR( direction )
		end
		if wagon.disconnect_rolling_stock( direction ) then
			local frontLocos = 0
			local backLocos = 0
			local wagons = frontCar.train.carriages
			for _, carriage in pairs( wagons ) do
				if carriage.type == "locomotive" then
					frontLocos = frontLocos + 1
				end
			end
			local wagons = backCar.train.carriages
			for _, carriage in pairs( wagons ) do
				if carriage.type == "locomotive" then
					backLocos = backLocos + 1
				end
			end
			if frontLocos > 0 then frontCar.train.manual_mode = false end
			if backLocos > 0 then backCar.train.manual_mode = false end
			return wagon
		end
	end
end

script.on_event( defines.events.on_train_changed_state, function( event )
	if event.train.state == defines.train_state.wait_station and settings.startup["Coupling"].value then
		local couple = false
		local train = event.train
		local station = train.station
		if station then
			local front = GETREALFRONT( train )
			local back = GETREALBACK( train )
			local schedule = train.schedule
			local changed = false
			if ATTEMPTCOUPLE( train, GETSIGNAL( station, Signal_Couple ) ) then
				changed = true
				couple = true
				train = front.train
				if front == train.front_stock or back == train.back_stock then
					front = train.front_stock
					back = train.back_stock
				else
					front = train.back_stock
					back = train.front_stock
				end
			end
			front = ATTEMPTUNCOUPLE( front, GETSIGNAL( station, Signal_Uncouple ) )
			if front then
				changed = true
			else
				front = back
			end
			if changed then
				schedule.current = ( schedule.current ) % #schedule.records + 1
				front.train.schedule = schedule
				if #front.train.locomotives > 0 or couple then front.train.manual_mode = false end
				back.train.schedule = schedule
				if #back.train.locomotives > 0 or couple then back.train.manual_mode = false end
			end
		end
	end
end )

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