local function add()
	script.on_event( defines.events.on_tick, function()

		for _, name in pairs( { "electronic-locomotive-mk2", "electronic-locomotive-mk3" } ) do
			remote.call( "AddElectronicLocomotive", "new", name )
		end

		script.on_event( defines.events.on_tick, nil )
	end )
end

script.on_init( add )

script.on_configuration_changed( add )