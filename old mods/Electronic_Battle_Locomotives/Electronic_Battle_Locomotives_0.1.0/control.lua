local function add()
	remote.call( "AddElectricTrain", "new", "Elec-Battle-Loco-1", 1 )
	remote.call( "AddElectricTrain", "new", "Elec-Battle-Loco-2", 2 )
	remote.call( "AddElectricTrain", "new", "Elec-Battle-Loco-3", 3 )
end

script.on_init( add )

script.on_configuration_changed( add )