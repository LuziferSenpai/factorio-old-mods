game.reload_script()

for i, force in pairs(game.forces) do
  force.reset_recipes()
  force.reset_technologies()
  if force.technologies["personal-roboport-equipment"].researched then
  	force.recipes["perso-robo-nr"].enabled = true
  end
end