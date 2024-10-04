Senpais = Senpais or {}
Senpais.ElectricTrains = Senpais.ElectricTrains or {}
Senpais.ElectricTrains.Trains = Senpais.ElectricTrains.Trains or {}
Senpais.ElectricTrains.Functions = Senpais.ElectricTrains.Functions or {}
-- if not Senpais.ElectricTrains.Numbers then Senpais.ElectricTrains.Numbers = {} end
-- if not Senpais.ElectricTrains.Numbers.TrainNumber ~= nil then Senpais.ElectricTrains.Numbers = { TrainNumber = 0, AccuNumber = 0 }	end

MaxPower = 10666.6666666667

function Senpais.ElectricTrains.Functions.ADDTRAIN ( nama, multie )
	table.insert( Senpais.ElectricTrains.Trains, { name = nama, multy = multie } )
end

Senpais.ElectricTrains.Functions.ADDTRAIN( "Senpais-Electric-Train", 1 )

--[[ local function create_gui ( player )
	local top = player.gui.top
	if player.force.technologies["Senpais-Electric-Train"].researched ~= true then
		if top["Senpais-ElectricTrains-Button"] then
			top["Senpais-ElectricTrains-Button"].destroy()
		end
		return
	else
		top.add{ type = "button", name = "Senpais-ElectricTrains-Button", caption = { "Senpais-ElectricTrains-Button-Caption" } }
	end
end

local function labels ( text )
	frame.add{ type = "label", caption = text }
end

local function gui_open_frame( player, force )
	frame = player.gui.left["Senpais-ElectricTrains-Frame"]
	if frame then
		frame.destroy()
		return
	end

	frame = player.gui.left.add { type = "frame", caption = { "Senpais-ElectricTrains-Frame-Caption" }, name = "Senpais-ElectricTrains-Frame", direction = "vertical" }
	labels( { "Text01" } )
	labels( Senpais.ElectricTrains.Numbers.TrainNumber )
	labels( { "totallocos" } )
	labels( Senpais.ElectricTrains.Numbers.AccuNumber )
	labels( { "totalaccus" } )
end ]]--

local function ONLOAD ()
	global.SenpaisTrainsList = global.SenpaisTrainsList or {}
	global.SenpaisAccuList = global.SenpaisAccuList or {}
	-- Senpais.ElectricTrains.TrainsList = Senpais.ElectricTrains.TrainsList or {}
	-- Senpais.ElectricTrains.AccuList = Senpais.ElectricTrains.AccuList or {}
end

local function ONTICK ()
	local PowerNeed = 0
	local PowerStorage = 0
	local PowerAvaible = 0
	local PowerPer = 0
	-- for _, p in pairs( Senpais.ElectricTrains.TrainsList ) do
	if global.SenpaisTrainsList ~= nil and global.SenpaisAccuList ~= nil then
		for _, p in pairs( global.SenpaisTrainsList ) do
			PowerNeed = PowerNeed + ( ( MaxPower * p.multi ) - p.entitie.energy )
		end
		-- for _, p in pairs( Senpais.ElectricTrains.AccuList ) do
		for _, p in pairs( global.SenpaisAccuList ) do
			PowerStorage = PowerStorage + p.energy
		end
		PowerAvaible = PowerStorage - PowerNeed
		if PowerAvaible >= 0 then
			-- for _, p in pairs( Senpais.ElectricTrains.TrainsList ) do
			for _, p in pairs( global.SenpaisTrainsList ) do
				p.entitie.energy = MaxPower * p.multi
			end
			-- PowerPer = PowerAvaible / #Senpais.ElectricTrains.AccuList
			PowerPer = PowerAvaible / #global.SenpaisAccuList
			-- for _, p in pairs( Senpais.ElectricTrains.AccuList ) do
			for _, p in pairs( global.SenpaisAccuList ) do
				p.energy = PowerPer
			end
		else
			-- for _, p in pairs( Senpais.ElectricTrains.AccuList ) do
			for _, p in pairs( global.SenpaisAccuList ) do
				p.energy = 0
			end
			-- PowerPer = ( PowerNeed + PowerAvaible ) / #Senpais.ElectricTrains.TrainsList
			PowerPer = ( PowerNeed + PowerAvaible ) / #global.SenpaisTrainsList
			-- for _, p in pairs( Senpais.ElectricTrains.TrainsList ) do
			for _, p in pairs( global.SenpaisTrainsList ) do
				p.entitie.energy = PowerPer
			end
		end
	end
end

local function ONBUILT ( event )
	local entity = event.created_entity
	if entity.name == "Senpais-Power-Provider" then
		-- table.insert( Senpais.ElectricTrains.AccuList, entity )
		table.insert( global.SenpaisAccuList, entity )
		-- Senpais.ElectricTrains.Numbers.AccuNumber = Senpais.ElectricTrains.Numbers.AccuNumber + 1
	end
	if entity.type == "locomotive" then
		for _, o in pairs( Senpais.ElectricTrains.Trains ) do
			if entity.name == o.name then
				-- table.insert( Senpais.ElectricTrains.TrainsList, { multi = o.multy, entitie = entity } )
				table.insert( global.SenpaisTrainsList, { multi = o.multy, entitie = entity } )
				-- Senpais.ElectricTrains.Numbers.TrainNumber = Senpais.ElectricTrains.Numbers.TrainNumber + 1
			end
		end
	end

end

local function ONREMOVE ( event )
	local entity = event.entity
	if entity.name == "Senpais-Power-Provider" then
		-- for index, l in pairs( Senpais.ElectricTrains.AccuList ) do
		if global.SenpaisAccuList ~= nil then
			for index, l in pairs( global.SenpaisAccuList ) do
				if entity == l then
					-- Senpais.ElectricTrains.AccuList[index] = nil
					global.SenpaisAccuList[index] = nil
					-- Senpais.ElectricTrains.Numbers.AccuNumber = Senpais.ElectricTrains.Numbers.AccuNumber - 1
				end
			end
		end
	end
	if entity.type == "locomotive" then
		-- for index, l in pairs( Senpais.ElectricTrains.TrainsList ) do
		if global.SenpaisTrainsList ~= nil then
			for index, l in pairs( global.SenpaisTrainsList ) do
				if entity == l.entitie then
					-- Senpais.ElectricTrains.TrainsList[index] = nil
					global.SenpaisTrainsList[index] = nil
					-- Senpais.ElectricTrains.Numbers.TrainNumber = Senpais.ElectricTrains.Numbers.TrainNumber - 1
				end
			end
		end
	end
end

script.on_configuration_changed( function() ONLOAD() end )

script.on_init( function()
	ONLOAD()
	--[[ for _, player in pairs( game.players ) do
		create_gui( player )
	end ]]--
end )

--[[ script.on_event( defines.events.on_gui_click, function( event )
	local ele = event.element
	local player = game.players[event.player_index]
	local force = player.force
	if ele.name == "Senpais-ElectricTrains-Button" then
		gui_open_frame( player, force )
	end
end )

script.on_event( defines.events.on_research_finished, function( event )
	local research = event.research
	local name = research.name

	if name == "Senpais-Electric-Train" then
		for _, player in pairs( game.players ) do
            create_gui( player )
        end
        return
    end
end )

script.on_event( defines.events.on_player_created, function( event )
	create_gui( game.players[event.player_index] )
end ) ]]--

script.on_event( defines.events.on_tick, ONTICK )
script.on_event( defines.events.on_built_entity, ONBUILT )
script.on_event( defines.events.on_robot_built_entity, ONBUILT )
script.on_event( defines.events.on_preplayer_mined_item, ONREMOVE )
script.on_event( defines.events.on_robot_pre_mined, ONREMOVE )
script.on_event( defines.events.on_entity_died, ONREMOVE )