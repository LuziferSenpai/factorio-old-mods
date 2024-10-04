script.on_init( function()
	local interface_name = "silo_script"
	if not remote.interfaces[interface_name] then return end
	remote.call(interface_name, "add_tracked_item", "storage-tank")
	remote.call(interface_name, "set_show_launched_without_satellite", false)
end )