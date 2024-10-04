script.on_event( defines.events.on_research_finished, function( event ) 
	local research = event.research
	local force = research.force
	local name = research.name
	if name:find( "player%-inventory%-upgrade" ) then
   		force.character_inventory_slots_bonus = force.character_inventory_slots_bonus + 10  
    end
end )