require "util"


script.on_event(defines.events.on_research_finished, function(event) 
    local research = event.research
	local force = research.force
	local name = research.name
    if name == "faster-crafting-1" then
        force.manual_crafting_speed_modifier = 0.4
    end      
    if name == "faster-crafting-2" then
        force.manual_crafting_speed_modifier = 0.8
    end
    if name == "faster-crafting-3" then
        force.manual_crafting_speed_modifier = 1.2
    end
	if name == "faster-crafting-4" then
        force.manual_crafting_speed_modifier = 1.6
    end
	if name == "faster-crafting-5" then
        force.manual_crafting_speed_modifier = 2
    end
	if name == "faster-crafting-6" then
        force.manual_crafting_speed_modifier = 2.4
    end
	if name == "faster-crafting-7" then
        force.manual_crafting_speed_modifier = 2.8
    end
	if name == "faster-crafting-8" then
        force.manual_crafting_speed_modifier = 3.2
    end
	if name == "faster-crafting-9" then
        force.manual_crafting_speed_modifier = 3.6
    end
	if name == "faster-crafting-10" then
        force.manual_crafting_speed_modifier = 4
    end
end   
)