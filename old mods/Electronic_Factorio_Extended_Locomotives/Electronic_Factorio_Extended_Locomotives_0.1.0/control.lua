local function add()
	for _, n in pairs( { "electronic-locomotive-mk2", "electronic-locomotive-mk3" } ) do
		remote.call( "AddElectricTrain", "new", n )
	end
end

script.on_init( add )

script.on_configuration_changed( add )