for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    recipes["electronic-locomotive-mk2"].enabled = technologies["railway-2"].researched
    recipes["electronic-locomotive-mk3"].enabled = technologies["railway-3"].researched
end