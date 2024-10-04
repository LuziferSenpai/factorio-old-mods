game.reload_script()

for index, force in pairs(game.forces) do
  force.reset_recipes()
  force.reset_technologies()
end

for index, force in pairs(game.forces) do
  local tech = force.technologies
  local recipes = force.recipes
  if force.technologies["armor-making-3"].researched then
    force.recipes["battle-cargo-1"].enabled = true
    force.recipes["battle-loco-1"].enabled = true
  end
  if force.technologies["power-armor"].researched then
    force.recipes["battle-cargo-2"].enabled = true
    force.recipes["battle-loco-2"].enabled = true
  end
  if force.technologies["power-armor-2"].researched then
    force.recipes["battle-cargo-3"].enabled = true
    force.recipes["battle-loco-3"].enabled = true
  end
end