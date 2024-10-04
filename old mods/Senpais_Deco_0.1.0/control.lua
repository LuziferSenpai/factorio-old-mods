script.on_event( defines.events.on_built_entity, function( event )
	local entity = event.created_entity

	if not string.find( entity.name, "placeable-" ) then return end

	local mapped_name = string.gsub( entity.name, "placeable%-", "" )

	local decorative_name = mapped_name

	local surface = entity.surface
	local position = entity.position

	entity.destroy()

	if global.last_build_tick and game.tick - global.last_build_tick < 5 then
		return
	end

	global.last_build_tick = game.tick

	surface.create_decoratives { decoratives = { { name = mapped_name, position = position, amount = 1 } } }
end )