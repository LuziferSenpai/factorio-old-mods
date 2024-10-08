require "mod-gui"
require "config"
local Functions = require "functions"
local de = defines.events
local buttons =
{
	["SenpaisTrainsSpriteButton01"] = true,
	["SenpaisTrainsSpriteButton02"] = true,
	["SenpaisTrainsSpriteButton03"] = true,
	["SenpaisTrainsSpriteButton04"] = true,
	["SenpaisTrainsSpriteButton05"] = true
}

script.on_init( function()
	Functions.Globals()
	Functions.Players()
end )

script.on_configuration_changed( function( d )
	if global.SenpaisTrainsList then
		global.TrainsList = global.SenpaisTrainsList
		global.SenpaisTrainsList = nil
	end
	if global.SenpaisAccuList then
		global.AccuList = global.SenpaisAccuList
		global.SenpaisAccuList = nil
	end
	if global.SenpaisLines then
		global.Lines = global.SenpaisLines
		global.SenpaisLines = nil
	end
	if global.SenpaisScheduleLines then
		global.ScheduleLines = global.SenpaisScheduleLines
		global.SenpaisScheduleLines = nil
	end
	if global.SenpaisScheduleLinesSignals then
		global.ScheduleLinesSignals = global.SenpaisScheduleLinesSignals
		global.SenpaisScheduleLinesSignals = nil
	end
	if global.SenpaisTrainSchedulebyID then
		global.TrainsID = global.SenpaisTrainSchedulebyID
		global.SenpaisTrainSchedulebyID = nil
	end
	Functions.Globals()
	Functions.Players()
	for _, p in pairs( game.players ) do
		local m = mod_gui.get_frame_flow( p )
		if m.SenpaisGUI then
			m.SenpaisGUI.destroy()
		end
		m = mod_gui.get_button_flow( p )
		if m.SenpaisGUIButton then
			m.SenpaisGUIButton.destroy()
		end
	end
	for _, r in pairs( global.Register ) do
		if not game.entity_prototypes[r.name] then
			r = nil
		end
	end
	if global.TrainsList ~= nil then
		for _, t in pairs( global.TrainsList ) do
			for _, r in pairs( global.Register ) do
				if t.entity.name == r.name and t.multi ~= r.multy then
					t.multi = r.multy
					break
				end
			end
		end
	end
end )

script.on_event( { de.on_gui_click, de.on_gui_selection_state_changed, de.on_gui_checked_state_changed }, function( ee )
	local id = ee.player_index
	local p = game.players[id]
	local e = ee.element
	local n = e.name
	local pa = e.parent
	if ( n == nil or pa == nil ) then return end
	local m = mod_gui.get_frame_flow( p )
	if n == "SenpaisTrainsButton" then
		if m.SenpaisTrainsMainGui then
			m.SenpaisTrainsMainGui.destroy()
		else
			Functions.MainGui( m )
		end
	elseif n == "SenpaisTrainsButton03" then
		local et = global.PlayerDATA[id].Entity
		et.backer_name = pa.children[1].text or et.backer_name
		if settings.startup["Smarter-Trains"].value and pa.children[2].selected_index > 0 then
			for _, s in pairs( pa.children[3].children[1].children[1].children ) do
				if s.type == "radiobutton" and s.state == true then
					local st = s.name:match( "_(%a*)$" )
					local r = global.ScheduleLines[global.Lines[pa.children[2].selected_index]].schedule.records
					local et = et.train
					for u = 1, #r do
						if r[u].station == st then
							et.manual_mode = true
							et.schedule = { current = u, records = r }
							et.manual_mode = false
							break
						end
					end
					break
				end
			end
		end
		local pa2 = pa.parent.parent.children
		Functions.DestroyChildren( pa2 )
		Functions.CountTrainsMain( pa2[2] )
	elseif n == "SenpaisTrainsSpriteButton06" then
		pa.parent.parent.parent.children[3].clear()
		if p.opened and p.opened.train then
			Functions.SmarterTrainsAdd( pa.parent.parent.parent.children[3] )
		end
	elseif n == "SenpaisTrainsButton06" then
		local t = pa.children[1].children[1].text
		local o = p.opened
		if o and o.train then
			o = o.train
			if o.schedule ~= nil then
				if t ~= nil and not global.ScheduleLines[t] then
					table.insert( global.Lines, t )
					local c = Functions.ClearSchedule( o.schedule )
					global.ScheduleLines[t] = { signal = Functions.CheckSignal( pa.children[1].children[2].elem_value ), schedule = c }
					local p = {}
					for _, r in pairs( c.records ) do
						table.insert( p, { signal = nil, station = r.station } )
					end
					global.ScheduleLinesSignals[t] = p
					local pa2 = pa.parent.parent
					Functions.DestroyChildren( pa2.children )
					Functions.SmarterTrainsMain( pa2.children[2] )
				else
					pa.parent.parent.children[3].clear()
					p.print( { "Senpais-Trains.NoName" } )
				end
			else
				pa.parent.parent.children[3].clear()
				p.print( { "Senpais-Trains.NoSchedule" } )
			end
		else
			pa.parent.parent.children[3].clear()
			game.print( { "Senpais-Trains.NoTrainOpen" } )
		end
	elseif n == "SenpaisTrainsDropDown01" then
		pa.children[3].clear()
		Functions.CountTrainsEntityEditList( pa.children[3], e.selected_index )
	elseif n == "SenpaisTrainsSpriteButton07" then
		if pa.children[1].selected_index > 0 then
			local i = pa.children[1].selected_index
			local l = global.Lines[i]
			global.ScheduleLinesSignals[l] = nil
			global.ScheduleLines[l] = nil
			table.remove( global.Lines, i )
			local pa2 = pa.parent.parent.parent.children[2]
			Functions.DestroyChildren( pa2 )
			Functions.SmarterTrainsMain( pa2 )
		else
			p.print( { "Senpais-Trains.NoLineSelected" } )
		end
	elseif n == "SenpaisTrainsDropDown02" and e.selected_index > 0 then
		if pa.parent.children[2] then
			pa.parent.children[2].destroy()
		end
		pa.children[2].elem_value = Functions.CheckSignal( global.ScheduleLines[global.Lines[e.selected_index]].signal )
		Functions.SmarterTrainsList( pa.parent )
	elseif pa.name == "SenpaisTrainsFrame01" then
		if buttons[n] then
			Functions.DestroyChildren( pa.parent.parent.children )
		end
		if n == "SenpaisTrainsSpriteButton01" then
			Functions.CountTrainsMain( pa.parent.parent.children[2] )
		elseif n == "SenpaisTrainsSpriteButton02" then
			Functions.CountWagonsMain( pa.parent.parent.children[2] )
		elseif n == "SenpaisTrainsSpriteButton03" then
			Functions.CountFluidWagonsMain( pa.parent.parent.children[2] )
		elseif n == "SenpaisTrainsSpriteButton04" then
			Functions.SmarterTrainsMain( pa.parent.parent.children[2] )
		elseif n == "SenpaisTrainsSpriteButton05" then
			Functions.ElectricTrainsMain( pa.parent.parent.children[2] )
		end
	elseif pa.name == "SenpaisTrainsTable02" then
		pa.parent.parent.parent.parent.parent.children[3].clear()
		for _, t in pairs( global.PlayerDATA[id].TrainsCount ) do
			if n == "SenpaisTrainsButton01_" .. t.name then
				Functions.CountTrainsList( pa.parent.parent.parent.parent.parent.children[3], t )
				break
			end
		end
	elseif pa.name == "SenpaisTrainsTable05" then
		pa.parent.parent.parent.parent.parent.children[3].clear()
		for _, w in pairs( global.PlayerDATA[id].WagonsCount ) do
			if n == "SenpaisTrainsButton04_" .. w.name then
				Functions.CountWagonsList( pa.parent.parent.parent.parent.parent.children[3], w )
				break
			end
		end
	elseif pa.name == "SenpaisTrainsTable10" then
		pa.parent.parent.parent.parent.parent.children[3].clear()
		for _, f in pairs( global.PlayerDATA[id].FluidWagonsCount ) do
			if n == "SenpaisTrainsButton05_" .. f.name then
				Functions.CountFluidWagonsList( pa.parent.parent.parent.parent.parent.children[3], f )
				break
			end
		end
	elseif pa.name == "SenpaisTrainsTable04" then
		local c = pa.children
		for u = 1, #c do
			if c[u].type == "radiobutton" then
				c[u].state = false
			end
		end
		e.state = true
	elseif pa.name:find( "SenpaisTrainsFrame10_" ) ~= nil then
		local pd = global.PlayerDATA[id]
		for _, t in pairs( pd.TrainsCount ) do
			if t.name == pd.EntityName then
				pa.parent.parent.parent.parent.parent.parent.children[4].clear()
				local et = t.entities[tonumber( n:match( "_(%d*)$" ) )]
				global.PlayerDATA[id].Entity = et
				Functions.CountTrainsEntityEdit( pa.parent.parent.parent.parent.parent.parent.children[4], et.backer_name )
				break
			end
		end
	end
end )

script.on_event( defines.events.on_gui_elem_changed, function( ee )
	local id = ee.player_index
	local p = game.players[id]
	local e = ee.element
	local n = e.name
	local pa = e.parent
	if ( n == nil or pa == nil ) then return end
	if n == "SenpaisTrainsChooseElemButton01" then
		if pa.children[1].selected_index > 0 then
			global.ScheduleLines[global.Lines[pa.children[1].selected_index]].signal = Functions.CheckSignal( e.elem_value )
		else
			p.print( "[Senpais Trains] " .. { "NoLineSelected" } )
			e.elem_value = nil
		end
	elseif pa.name == "SenpaisTrainsTable14" then
		for _, r in pairs( global.ScheduleLinesSignals[global.Lines[pa.parent.parent.parent.children[1].children[1].selected_index]] ) do
			if n == "SenpaisTrainsChooseElemButton02_" .. r.station then
				r.signal = Functions.CheckSignal( e.elem_value )
				break
			end
		end
	end
end )

script.on_event( de.on_player_created, function( ee )
	local id = ee.player_index
	local p = game.players[id]
	local m = mod_gui.get_button_flow( p )
	if not m.SenpaisTrainsButton then
		local b = Functions.AddSpriteButton( m, "SenpaisTrainsButton", "Senpais-S" )
		b.style.visible = true
	end
	global.PlayerDATA[id] = { TrainsCount = {}, WagonsCount = {}, FluidWagonsCount = {}, EntityName = "", Entity = {} }
end )

script.on_event( de.on_train_changed_state, function( ee )
	local t = ee.train
	local d = defines.train_state.wait_station
	if t.state == d then
		local s = t.station
		local c = { s = s, c = false, st = false }
		if settings.startup["Coupling"].value and ( s.get_circuit_network( defines.wire_type.red ) or s.get_circuit_network( defines.wire_type.green ) ) then
			c.c = true
		end
		if settings.startup["Smarter-Trains"].value and s.get_circuit_network( defines.wire_type.red ) and s.get_circuit_network( defines.wire_type.green ) then
			c.st = true
		end
		global.TrainsID[t.id] = c
	elseif ee.old_state == d and global.TrainsID[t.id] then
		local tg = global.TrainsID[t.id]
		global.TrainsID[t.id] = nil
		local s = tg.s
		if not s then return end
		if not s.valid then return end
		if tg.st then
			t.manual_mode = true
			local r = s.get_circuit_network( defines.wire_type.red )
			local g = s.get_circuit_network( defines.wire_type.green )
			local ls = {}
			local si = {}
			for l, ss in pairs( global.ScheduleLines ) do
				si = Functions.CheckSignal( ss.signal )
				if si ~= nil then
					table.insert( ls, { s = si, l = l } )
				end
			end
			local lhs = { s = nil, v = 0, l = nil }
			for _, y in pairs( ls ) do
				si = r.get_signal( y.s )
				if si ~= nil and si > lhs.v then
					lhs = { s = y.signal, v = si, l = y.l }
				end
			end
			if lhs.l ~= nil then
				local sig = {}
				for _, ss in pairs( global.ScheduleLinesSignals[lhs.l] ) do
					si = Functions.CheckSignal( ss.signal )
					if si ~= nil then
						table.insert( sig, { s = si, st = ss.station } )
					end
				end
				local shs = { s = nil, v = 0, st = nil }
				for _, y in pairs( sig ) do
					si = g.get_signal( y.s )
					if si ~= nil and si > shs.v then
						shs = { s = y.signal, v = si, st = y.st }
					end
				end
				if shs.st ~= nil then
					local c = 0
					local re = global.ScheduleLines[lhs.l].schedule.records
					for i = 1, #re do
						if re[i].station == shs.st then
							c = i
							break
						end
					end
					t.schedule = { current = c, records = re }
				end
			end
			t.manual_mode = false
		end
		if tg.c then
			local c = false
			local f = Functions.GetRealFront( t, s )
			local b = Functions.GetRealBack( t, s )
			local se = t.schedule
			local ch = false
			if Functions.AttemptCouple( t, Functions.GetSignal( s, Senpais.Signals["Signal_Couple"] ), s ) then
				ch = true
				c = true
				t = f.train
				if f == t.front_stock or b == t.back_stock then
					f = t.front_stock
					b = t.back_stock
				else
					f = t.back_stock
					b = t.front_stock
				end
			else
				f = Functions.AttemptUncouple( f, Functions.GetSignal( s, Senpais.Signals["Signal_Uncouple"] ) )
				if f then
					ch = true
				else
					f = b
				end
			end
			if ch then
				f = f.train
				b = b.train
				f.schedule = se
				b.schedule = se
				if #f.locomotives > 0 or couple then f.manual_mode = false end
				if #b.locomotives > 0 or couple then b.manual_mode = false end
			end
		end
	end
end )

script.on_event( de.on_tick, function( ee )
	if ee.tick % ( game.speed * 15 ) == 0 and settings.startup["Senpais-Power-Provider"].value then
		for _, p in pairs( game.players ) do
			local m = mod_gui.get_frame_flow( p ).SenpaisTrainsMainGui
			if m then
				local mm = m.children[1].children[2].children[1]
				if mm and mm.name == "SenpaisTrainsFrame30" then
					Functions.DestroyChildren( m.children[1].children )
					Functions.ElectricTrainsMain( m.children[1].children[2] )
				end
			end
		end
	end
	local pn = 0
	local ps = 0
	local pp = 0
	local e = {}
	if #global.TrainsList > 0 and #global.AccuList > 0 then
		for i = #global.TrainsList, 1, -1 do
			e = global.TrainsList[i].entity
			if e.valid then
				e = e.burner
				pn = pn + ( e.heat_capacity - e.heat )
			else
				global.TrainsList[i] = global.TrainsList[#global.TrainsList]
				global.TrainsList[#global.TrainsList] = nil
			end
		end
		for i = #global.AccuList, 1, -1 do
			local a = global.AccuList[i]
			if a.valid then
				ps = ps + a.energy
			else
				global.AccuList[i] = global.AccuList[#global.AccuList]
				global.AccuList[#global.AccuList] = nil
			end
		end
		local tt = global.TrainsList
		local aa = global.AccuList
		if ps >= pn then
			for _, t in pairs( tt ) do
				e = t.entity.burner
				e.heat = e.heat_capacity
			end
			pp = pn / #aa
			for _, a in pairs( aa ) do
				a.energy = a.energy - pp
			end
		else
			for _, a in pairs( aa ) do
				a.energy = 0
			end
			pp = ps / #tt
			for _, t in pairs( tt ) do
				t.entity.burner.heat = pp
			end
		end
	end
end )

script.on_event( { de.on_built_entity, de.on_robot_built_entity, de.script_raised_built }, function( ee )
	if ee.created_entity and ee.created_entity.valid then
		Functions.OnBuild( ee )
	end
end )

remote.add_interface( "Addtrain",
	{
		new = function( n, m )
			if game.entity_prototypes[n] then
				table.insert( global.Register, { name = n, multy = m } )
			end
		end
	}
)