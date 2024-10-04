script.on_init( function()
	local n = "silo_script"

	if not remote.interfaces[n] then return end
	
	remote.call( n, "add_tracked_item", "storage-tank" )
end )