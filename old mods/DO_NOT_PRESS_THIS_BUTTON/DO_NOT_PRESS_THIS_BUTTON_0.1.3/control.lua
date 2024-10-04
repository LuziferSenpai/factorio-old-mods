require "mod-gui"
script.on_init( function()
	for _, p in pairs( game.players ) do
		if not mod_gui.get_button_flow( p ).FUNDestroyButton then
			local button = mod_gui.get_button_flow( p ).add{ type = "button", name = "FUNDestroyButton", caption = "DO NOT PRESS" }
		end
	end
end )

script.on_event( defines.events.on_gui_click, function( event )
	local element = event.element
	local name = element.name
	local player = game.players[event.player_index]

	if not name then return end

	if name == "FUNDestroyButton" then
		local surface = player.surface
		local s = 0
		local c = 0
		for _, e in pairs( surface.find_entities_filtered( { type = "rail-signal" } ) ) do
			e.destroy()
			s = s + 1
		end
		for _, r in pairs( surface.find_entities_filtered( { type = "rail-chain-signal" } ) ) do
			r.destroy()
			c = c + 1
		end
		player.print( "Removed " .. s .. " [entity=rail-signal] and " .. c .. " [entity=rail-chain-signal]" )
	end
end )

script.on_event( defines.events.on_player_created, function( event )
	local button = mod_gui.get_button_flow( game.players[event.player_index] ).add{ type = "button", name = "FUNDestroyButton", caption = "DO NOT PRESS" }
end )