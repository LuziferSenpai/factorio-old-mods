local MaxPower = 10667
local Signal_Couple = { type = "virtual", name = "signal-couple" }
local Signal_Uncouple = { type = "virtual", name = "signal-decouple" }

local function ONINIT()
	global.Register = { { name = "Senpais-Electric-Train", multy = 2 }, { name = "Senpais-Electric-Train-Heavy", multy = 5 }, { name = "Elec-Battle-Loco-1", multy = 2 },
						{ name = "Elec-Battle-Loco-2", multy = 4 }, { name = "Elec-Battle-Loco-3", multy = 6 } }
	global.SenpaisTrainsList = global.SenpaisTrainsList or {}
	global.SenpaisAccuList = global.SenpaisAccuList or {}
	global.SenpaisLines = global.SenpaisLines or {}
	global.SenpaisScheduleLines = global.SenpaisScheduleLines or {}
	global.SenpaisScheduleLinesSignals = global.SenpaisScheduleLinesSignals or {}
	global.SenpaisTrainSchedulebyID = global.SenpaisTrainSchedulebyID or {}
	for _, p in pairs( game.players ) do
		if settings.startup["Coupling"].value and not p.gui.top.SenpaisSmartTrainMainButton then
			p.gui.top.add{ type = "sprite-button", name = "SenpaisSmartTrainMainButton", sprite = "Senpais-Smart-Stop-Icon" }
		elseif p.gui.top.SenpaisSmartTrainMainButton then
			p.gui.top.SenpaisSmartTrainMainButton.destroy()
		end
	end
end

local function MAINGUI( player )
	local train_frame01 = player.gui.left.add{ type = "frame", name = "SenpaisSmartTrainMainFrame01", direction = "vertical" }
	local train_table01 = train_frame01.add{ type = "table", name = "SenpaisSmartTrainMain_Table01", column_count = 4 }
	local train_options01 = { train_table01.add{ type = "drop-down", name = "SenpaisSmartTrainMain_DropDown01", items = global.SenpaisLines },
							  train_table01.add{ type = "choose-elem-button", name = "SenpaisSmartTrainMain_ElemButton01", elem_type = "signal" },
							  train_table01.add{ type = "sprite-button", name = "SenpaisSmartTrainMain_SpriteButton01", sprite = "Senpais-plus" },
							  train_table01.add{ type = "sprite-button", name = "SenpaisSmartTrainMain_SpriteButton02", sprite = "utility/trash_bin" }
							}
end

local function ADDGUI( player )
	local train_frame02 = player.gui.left.add{ type = "frame", name = "SenpaisSmartTrainMainFrame02", direction = "vertical" }
	local train_table03 = train_frame02.add{ type = "table", name = "SenpaisSmartTrainMain_Table03", column_count = 2 }
	local train_options02 = { train_table03.add{ type = "textfield", name = "SenpaisSmartTrainMain_Textfield01" },
							  train_table03.add{ type = "choose-elem-button", name = "SenpaisSmartTrainMain_ElemButton02", elem_type = "signal" } }
	local train_options03 = train_frame02.add{ type = "button", name = "SenpaisSmartTrainMain_Button01", caption = "Add Linie" }
end

local function CLEARSCHEDULE( schedule )
	local used = {}
	for i , v in pairs( schedule.records ) do
		if used[v.station] then
			schedule.records[i] = nil
		else
			used[v.station] = true
		end
	end
	return schedule
end

local function CHECK( signal )
	if settings.startup["Coupling"].value and signal ~= nil and ( signal.name == "signal-couple" or signal.name == "signal-decouple" ) then
		signal = nil
	end
	if signal ~= nil then
		if signal.type == "fluid" then
			if not game.fluid_prototypes[signal.name] then
				signal = nil
			end
		elseif signal.type == "item" then
			if not game.item_prototypes[signal.name] then
				signal = nil
			end
		elseif signal.type == "virtual" then
			if not game.virtual_signal_prototypes[signal.name] then
				signal = nil
			end
		end
	end

	return signal
end

local function CHECKSIGNAL( station, signal )
	if station.get_circuit_network( defines.wire_type.red ) then
		if station.get_circuit_network( defines.wire_type.red ).get_signal( signal ) then
			return station.get_circuit_network( defines.wire_type.red ).get_signal( signal )
		end
	elseif station.get_circuit_network( defines.wire_type.green ) then
		if station.get_circuit_network( defines.wire_type.green ).get_signal( signal ) then
			return station.get_circuit_network( defines.wire_type.green ).get_signal( signal )
		end
	else
		return 0
	end
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
		for _, j in pairs( global.Register ) do
			if entity.name == j.name then
				table.insert( global.SenpaisTrainsList, { multi = j.multy, entity = entity } )
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

	if entity.train and global.SenpaisTrainSchedulebyID[entity.train.id] then
		global.SenpaisTrainSchedulebyID[entity.train.id] = nil
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

local function GETREALFRONT( train, station )
	if GETTILEDISTANCE( train.front_stock.position, station.position ) < GETTILEDISTANCE( train.back_stock.position, station.position ) then
		return train.front_stock
	else
		return train.back_stock
	end
end

local function GETREALBACK( train, station )
	local back = train.back_stock
	if GETTILEDISTANCE( train.front_stock.position, station.position ) < GETTILEDISTANCE( train.back_stock.position, station.position ) then
		return train.back_stock
	else
		return train.front_stock
	end
end

local function ATTEMPTCOUPLE( train, count, station )
	if count then
		local direction = defines.rail_direction.front
		if count < 0 then
			direction = defines.rail_direction.back
		end
		local front = GETREALFRONT( train, station )
		if not ORIENTATIONMATCH( front.orientation, station.orientation ) then
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


script.on_init( ONINIT )

script.on_configuration_changed( function()
	ONINIT()
	if settings.startup["Senpais-Power-Provider"].value and global.SenpaisTrainsList ~= nil then
		for _, f in pairs( global.SenpaisTrainsList ) do
			for _, r in pairs( global.Register ) do
				if f.entity.name == r.name and f.multi ~= r.multy then
					f.multi = r.multy
					break
				end
			end
		end
	end
end )

script.on_event( defines.events.on_gui_click, function( event )
	local element = event.element
	local name = element.name
	local player = game.players[event.player_index]
	local parent = element.parent

	if not name then return end
	if name == "SenpaisSmartTrainMainButton" then
		if player.gui.left.SenpaisSmartTrainMainFrame01 then
			player.gui.left.SenpaisSmartTrainMainFrame01.destroy()
		else
			MAINGUI( player )
		end
		return
	end
	if name == "SenpaisSmartTrainMain_SpriteButton01" then
		if player.opened and player.opened.train then
			if player.gui.left.SenpaisSmartTrainMainFrame02 then
				player.gui.left.SenpaisSmartTrainMainFrame02.destroy()
			else
				ADDGUI( player )
			end
		end
		return
	end
	if name == "SenpaisSmartTrainMain_SpriteButton02" then
		if parent.SenpaisSmartTrainMain_DropDown01.selected_index > 0 then
			global.SenpaisScheduleLinesSignals[global.SenpaisLines[parent.SenpaisSmartTrainMain_DropDown01.selected_index]] = nil
			global.SenpaisScheduleLines[global.SenpaisLines[parent.SenpaisSmartTrainMain_DropDown01.selected_index]] = nil
			table.remove( global.SenpaisLines, parent.SenpaisSmartTrainMain_DropDown01.selected_index )
			player.gui.left.SenpaisSmartTrainMainFrame01.destroy()
			MAINGUI( player )
		end
		return
	end
	if name == "SenpaisSmartTrainMain_Button01" then
		if player.opened and player.opened.train and parent.SenpaisSmartTrainMain_Table03.SenpaisSmartTrainMain_Textfield01.text ~= nil and not global.SenpaisScheduleLines[parent.SenpaisSmartTrainMain_Table03.SenpaisSmartTrainMain_Textfield01.text] then
			table.insert(global.SenpaisLines, parent.SenpaisSmartTrainMain_Table03.SenpaisSmartTrainMain_Textfield01.text )
			local clear_schedule = CLEARSCHEDULE( player.opened.train.schedule )
			global.SenpaisScheduleLines[parent.SenpaisSmartTrainMain_Table03.SenpaisSmartTrainMain_Textfield01.text] = { signal = CHECK( parent.SenpaisSmartTrainMain_Table03.SenpaisSmartTrainMain_ElemButton02.elem_value ), schedule = clear_schedule }
			global.SenpaisScheduleLinesSignals[parent.SenpaisSmartTrainMain_Table03.SenpaisSmartTrainMain_Textfield01.text] = {}
			for _, s in pairs( clear_schedule.records ) do
				table.insert( global.SenpaisScheduleLinesSignals[parent.SenpaisSmartTrainMain_Table03.SenpaisSmartTrainMain_Textfield01.text], { signal = nil, station = s.station } )
			end
			player.gui.left.SenpaisSmartTrainMainFrame02.destroy()
			player.gui.left.SenpaisSmartTrainMainFrame01.destroy()
			MAINGUI( player )
		else
			player.gui.left.SenpaisSmartTrainMainFrame02.destroy()
		end
		return
	end
end )

script.on_event( defines.events.on_gui_selection_state_changed, function( event )
	local element = event.element
	local parent = element.parent

	if element.name == "SenpaisSmartTrainMain_DropDown01" then
		parent.SenpaisSmartTrainMain_ElemButton01.elem_value = CHECK( global.SenpaisScheduleLines[global.SenpaisLines[element.selected_index]].signal )
		if parent.parent.SenpaisSmartTrainMain_Table02 then
			parent.parent.SenpaisSmartTrainMain_Table02.destroy()
		end

		local train_table02 = parent.parent.add{ type = "table", name = "SenpaisSmartTrainMain_Table02", column_count = 2 }
		for _, e in pairs( global.SenpaisScheduleLinesSignals[global.SenpaisLines[element.selected_index]] ) do
			local train_options04 = { train_table02.add{ type = "label", name = "SenpaisSmartTrainMainLabels_" .. e.station, caption = e.station },
									  train_table02.add{ type = "choose-elem-button", name = "SenpaisSmartTrainMainElemButton_" .. e.station, elem_type = "signal", signal = CHECK( e.signal ) } }
		end
	end
end )

script.on_event( defines.events.on_gui_elem_changed, function( event )
	local element = event.element
	local name = element.name
	local parent = element.parent

	if name == "SenpaisSmartTrainMain_ElemButton01" then
		global.SenpaisScheduleLines[global.SenpaisLines[parent.SenpaisSmartTrainMain_DropDown01.selected_index]].signal = CHECK( element.elem_value )
	end

	if parent.name == "SenpaisSmartTrainMain_Table02" then
		for _, f in pairs( global.SenpaisScheduleLinesSignals[global.SenpaisLines[parent.parent.SenpaisSmartTrainMain_Table01.SenpaisSmartTrainMain_DropDown01.selected_index]] ) do
			if name == "SenpaisSmartTrainMainElemButton_" .. f.station then
				f.signal = CHECK( element.elem_value )
			end
		end
	end
end )

script.on_event( defines.events.on_player_created, function( event )
	if settings.startup["Coupling"].value then
		game.players[event.player_index].gui.top.add{ type = "sprite-button", name = "SenpaisSmartTrainMainButton", sprite = "Senpais-Smart-Stop-Icon" }
	end
end )

script.on_event( defines.events.on_train_changed_state, function( event )
	local train = event.train
	if train.state == defines.train_state.wait_station then
		local station = train.station
		if settings.startup["Coupling"].value and ( CHECKSIGNAL( station, Signal_Couple ) > 0 or CHECKSIGNAL( station, Signal_Uncouple ) > 0 ) then
			global.SenpaisTrainSchedulebyID[train.id] = { coupling = { station = station } }
		end
		if settings.startup["Smarter-Trains"].value and station.get_circuit_network( defines.wire_type.red ) and station.get_circuit_network( defines.wire_type.green ) then
			local red = station.get_circuit_network( defines.wire_type.red )
			local green = station.get_circuit_network( defines.wire_type.green )
			local LinieSignals = {}
			for o, p in pairs( global.SenpaisScheduleLines ) do
				if p.signal ~= nil then
					table.insert( LinieSignals, { signal = CHECK( { type = p.signal.type, name = p.signal.name } ), linie = o } )
				end
			end
			local LinieHighestSignal = { signal = nil, value = 0, linie = nil }
			for _, u in pairs( LinieSignals ) do
				if red.get_signal( u.signal ) and red.get_signal( u.signal ) > LinieHighestSignal.value then
					LinieHighestSignal = { signal = u.signal, value = red.get_signal( u.signal ), linie = u.linie }
				end
			end
			if LinieHighestSignal.linie ~= nil then
				local StationSignals = {}
				for _, b in pairs( global.SenpaisScheduleLinesSignals[LinieHighestSignal.linie] ) do
					if b.signal ~= nil then
						table.insert( StationSignals, { signal = CHECK( { type = b.signal.type, name = b.signal.name } ), station = b.station } )
					end
				end
				local StationHighestSignal = { signal = nil, value = 0, station = nil }
				for _, d in pairs( StationSignals ) do
					if green.get_signal( d.signal ) and green.get_signal( d.signal ) > StationHighestSignal.value then
						StationHighestSignal = { signal = d.signal, value = green.get_signal( d.signal ), station = d.station }
					end
				end
				if StationHighestSignal.station ~= nil then
					local currentvalue = 0
					local records = global.SenpaisScheduleLines[LinieHighestSignal.linie].schedule.records
					for i = 1, #records do
						if records[i].station == StationHighestSignal.station then
							currentvalue = i
							break
						end
					end
					local schedule = { current = currentvalue, records = global.SenpaisScheduleLines[LinieHighestSignal.linie].schedule.records }
					if global.SenpaisTrainSchedulebyID[train.id] then
						table.insert( global.SenpaisTrainSchedulebyID[train.id], schedule )
					else
						global.SenpaisTrainSchedulebyID[train.id] = { schedule = schedule }
					end
				end
			end
		end
	end
	if train.state == defines.train_state.on_the_path and event.old_state == defines.train_state.wait_station and global.SenpaisTrainSchedulebyID[train.id] then
		local train_global = global.SenpaisTrainSchedulebyID[train.id]
		global.SenpaisTrainSchedulebyID[train.id] = nil
		if train_global.schedule and not train_global.coupling then
			train.manual_mode = true
			train.schedule = train_global.schedule
			train.manual_mode = false
		end
		if train_global.coupling then
			local couple = false
			local station = train_global.coupling.station
			local front = GETREALFRONT( train, station )
			local back = GETREALBACK( train, station )
			local schedule = nil
			if train_global.schedule then
				schedule = train_global.schedule
			else
				schedule = train.schedule
			end
			local changed = false
			if ATTEMPTCOUPLE( train, GETSIGNAL( station, Signal_Couple ), station ) then
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
				front.train.schedule = schedule
				if #front.train.locomotives > 0 or couple then front.train.manual_mode = false end
				back.train.schedule = schedule
				if #back.train.locomotives > 0 or couple then back.train.manual_mode = false end
			end
		end
	end
end )

script.on_event( defines.events.on_tick, ONTICK )
script.on_event( defines.events.on_built_entity, ONBUILD )
script.on_event( defines.events.on_robot_built_entity, ONBUILD )
script.on_event( defines.events.on_pre_player_mined_item, ONREMOVE )
script.on_event( defines.events.on_robot_pre_mined, ONREMOVE )
script.on_event( defines.events.on_entity_died, ONREMOVE )

remote.add_interface( "ADDTRAIN", { ADDTRAIN = function( name, multiplier ) table.insert( global.Register, { name = name, multy = multiplier } ) end } )