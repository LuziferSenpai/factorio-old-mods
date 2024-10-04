local function add()
	script.on_event( defines.events.on_tick, function()
		local tablee = {}
		
		if game.active_mods["angelsaddons-petrotrain"] then
			table.insert( tablee, "electronic-petro-locomotive-1" )
		end

		if game.active_mods["angelsaddons-smeltingtrain"] then
			table.insert( tablee, "electronic-smelting-locomotive-1" )
			table.insert( tablee, "electronic-smelting-locomotive-tender" )
		end

		if game.active_mods["angelsindustries"] then
			table.insert( tablee, "electronic-crawler-locomotive" )
			table.insert( tablee, "electronic-crawler-locomotive-wagon" )
		end

		for _, name in pairs( tablee ) do
			remote.call( "AddElectronicLocomotive", "new", name )
		end

		script.on_event( defines.events.on_tick, nil )
	end )
end

script.on_init( add )

script.on_configuration_changed( add )