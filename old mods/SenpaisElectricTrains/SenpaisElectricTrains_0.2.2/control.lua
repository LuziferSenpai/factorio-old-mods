if not Senpais then Senpais = {} end
if not Senpais.ElectricTrains then Senpais.ElectricTrains = {} end
if not Senpais.ElectricTrains.Trains then Senpais.ElectricTrains.Trains = {} end
if not Senpais.ElectricTrains.Functions then Senpais.ElectricTrains.Functions = {} end
if not Senpais.ElectricTrains.TrainsList then Senpais.ElectricTrains.TrainsList = {} end
if not Senpais.ElectricTrains.AccuList then Senpais.ElectricTrains.AccuList = {} end
-- if not Senpais.ElectricTrains.Numbers then Senpais.ElectricTrains.Numbers = {} end
-- if not Senpais.ElectricTrains.Numbers.TrainNumber ~= nil then Senpais.ElectricTrains.Numbers = { TrainNumber = 0, AccuNumber = 0 }	end

MaxPower = 10666.6666666667

function Senpais.ElectricTrains.Functions.ADDTRAIN ( nama, multie )
	Senpais.ElectricTrains.Trains[#Senpais.ElectricTrains.Trains + 1] = { name = nama, multy = multie }
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

local function ONTICK ()
	local PowerNeed = 0
	local PowerStorage = 0
	local PowerAvaible = 0
	local PowerPer = 0
	for i = 1, #Senpais.ElectricTrains.TrainsList do
		PowerNeed = PowerNeed + ( ( MaxPower * Senpais.ElectricTrains.TrainsList[i].multi ) - Senpais.ElectricTrains.TrainsList[i].entitie.energy )
	end
	for i = 1, #Senpais.ElectricTrains.AccuList do
		PowerStorage = PowerStorage + Senpais.ElectricTrains.AccuList[i].energy
	end
	PowerAvaible = PowerStorage - PowerNeed
	if PowerAvaible >= 0 then
		for i = 1, #Senpais.ElectricTrains.TrainsList do
			Senpais.ElectricTrains.TrainsList[i].entitie.energy = MaxPower * Senpais.ElectricTrains.TrainsList[i].multi
		end
		PowerPer = PowerAvaible / #Senpais.ElectricTrains.AccuList
		for i = 1, #Senpais.ElectricTrains.AccuList do
			Senpais.ElectricTrains.AccuList[i].energy = PowerPer
		end
	else
		for i = 1, #Senpais.ElectricTrains.AccuList do
			Senpais.ElectricTrains.AccuList[i].energy = 0
		end
		PowerPer = ( PowerNeed + PowerAvaible ) / #Senpais.ElectricTrains.TrainsList
		for i = 1, #Senpais.ElectricTrains.TrainsList do
			Senpais.ElectricTrains.TrainsList[i].entitie.energy = PowerPer
		end
	end
end

local function ONBUILT ( event )
	local entity = event.created_entity
	if entity.name == "Senpais-Power-Provider" then
		Senpais.ElectricTrains.AccuList[#Senpais.ElectricTrains.AccuList + 1] = entity
		-- Senpais.ElectricTrains.Numbers.AccuNumber = Senpais.ElectricTrains.Numbers.AccuNumber + 1
	end
	if entity.type == "locomotive" then
		for i = 1, #Senpais.ElectricTrains.Trains do
			if entity.name == Senpais.ElectricTrains.Trains[i].name then
				Senpais.ElectricTrains.TrainsList[#Senpais.ElectricTrains.TrainsList + 1] = { multi = Senpais.ElectricTrains.Trains[i].multy, entitie = entity }
				-- Senpais.ElectricTrains.Numbers.TrainNumber = Senpais.ElectricTrains.Numbers.TrainNumber + 1
				break
			end
		end
	end

end

local function ONREMOVE ( event )
	local entity = event.entity
	if entity.name == "Senpais-Power-Provider" then
		for i = 1, #Senpais.ElectricTrains.AccuList do
			if entity == Senpais.ElectricTrains.AccuList[i] then
				table.remove( Senpais.ElectricTrains.AccuList, i )
				-- Senpais.ElectricTrains.Numbers.AccuNumber = Senpais.ElectricTrains.Numbers.AccuNumber - 1
				break
			end
		end
	end
	if entity.type == "locomotive" then
		for o = 1, #Senpais.ElectricTrains.Trains do
			if entity.name == Senpais.ElectricTrains.Trains[o].name then
				for i = 1, #Senpais.ElectricTrains.TrainsList do
					if entity == Senpais.ElectricTrains.TrainsList[i].entitie then
						table.remove( Senpais.ElectricTrains.TrainsList, i )
						-- Senpais.ElectricTrains.Numbers.TrainNumber = Senpais.ElectricTrains.Numbers.TrainNumber - 1
						break
					end
				end
			end
		end
	end
end

--[[ script.on_init( function()
	for _, player in pairs( game.players ) do
		create_gui( player )
	end
end )

script.on_event( defines.events.on_gui_click, function( event )
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