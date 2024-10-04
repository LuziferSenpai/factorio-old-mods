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
    if force.recipes["Senpais-Electric-Train"] then
      force.recipes["elec-battle-loco-1"].enabled = true
    end
  end
  if force.technologies["power-armor"].researched then
    force.recipes["battle-cargo-2"].enabled = true
    force.recipes["battle-loco-2"].enabled = true
    if force.recipes["Senpais-Electric-Train"] then
      force.recipes["elec-battle-loco-2"].enabled = true
    end
  end
  if force.technologies["power-armor-2"].researched then
    force.recipes["battle-cargo-3"].enabled = true
    force.recipes["battle-loco-3"].enabled = true
    if force.recipes["Senpais-Electric-Train"] then
      force.recipes["elec-battle-loco-3"].enabled = true
    end
  end
  if force.recipes["angel-cable"] then
    if force.technologies["alien-stuff"] then
      force.recipes["battle-cargo-4"].enabled = true
      force.recipes["battle-loco-4"].enabled = true
      if force.recipes["Senpais-Electric-Train"] then
        force.recipes["elec-battle-loco-4"].enabled = true
      end
    end
  end
end