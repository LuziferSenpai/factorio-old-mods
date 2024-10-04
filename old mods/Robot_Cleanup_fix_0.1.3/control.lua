function deconstruct_from_roboport(event)
  local roboport = event.created_entity
  if not roboport.logistic_cell then return end
  local surface = roboport.surface
  local force = roboport.force
  local range = roboport.logistic_cell.construction_radius
  if range <= 0 then return end
  local position = roboport.position
  local area = {{position.x-range,position.y-range},{position.x+range,position.y+range}}
  for k, junk in pairs (surface.find_entities_filtered{area = area, force = "neutral"}) do
    if junk.position.x >= area[1][1] and 
        junk.position.y >= area[1][2] and 
        junk.position.x <= area[2][1] and 
        junk.position.y <= area[2][2] then
      junk.order_deconstruction(force)
    end
  end
end

script.on_event(defines.events.on_robot_built_entity, deconstruct_from_roboport)
script.on_event(defines.events.on_built_entity, deconstruct_from_roboport)