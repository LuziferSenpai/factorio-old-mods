for _, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    recipes["cannon-spidertron"].enabled = technologies["spidertron"].researched
end