local function add()
	for _, n in pairs( { "Elec-Battle-Loco-1", "Elec-Battle-Loco-2", "Elec-Battle-Loco-3" } ) do
		remote.call( "AddElectricTrain", "new", n )
	end
end

script.on_init( add )

script.on_configuration_changed( add )