for index, force in pairs( game.forces ) do
  	local technologies = force.technologies
  	local recipes = force.recipes
  	if technologies["angels-petro-train"] then
		recipes["electronic-petro-locomotive-1"].enabled = technologies["angels-petro-train"].researched
	end

	if technologies["angels-smelting-train"] then
		recipes["electronic-smelting-locomotive-1"].enabled = technologies["angels-smelting-train"].researched
  		recipes["electronic-smelting-locomotive-tender"].enabled = technologies["angels-smelting-train"].researched
  	end

  	if technologies["angels-crawler-train"] then
  		recipes["electronic-crawler-locomotive"].enabled = technologies["angels-crawler-train"].researched
  		recipes["electronic-crawler-locomotive-wagon"].enabled = technologies["angels-crawler-train"].researched
  	end
end