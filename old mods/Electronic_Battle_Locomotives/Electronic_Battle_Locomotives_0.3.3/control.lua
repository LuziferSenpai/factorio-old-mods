local function add()
	script.on_event( defines.events.on_tick, function()		
		for _, name in pairs( { "Electronic-Battle-Locomotive-1", "Electronic-Battle-Locomotive-2", "Electronic-Battle-Locomotive-3" } ) do
			remote.call( "AddElectronicLocomotive", "new", name )
		end

		script.on_event( defines.events.on_tick, nil )
	end )
end

script.on_init( add )

script.on_configuration_changed( add )