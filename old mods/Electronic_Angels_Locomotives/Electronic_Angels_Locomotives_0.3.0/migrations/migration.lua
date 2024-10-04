for _, force in pairs( game.forces ) do
	local technologies = force.technologies
	local recipes = force.recipes
	for i = 1, settings.startup["angels-crawlertrain-tier-amount"].value do
		if i == 1 then
			if technologies["angels-crawler-train"] then
				recipes["electronic-crawler-locomotive"].enabled = technologies["angels-crawler-train"].researched
				recipes["electronic-crawler-locomotive-wagon"].enabled = technologies["angels-crawler-train"].researched
			end
		else
			if technologies["angels-crawler-train-" .. i] then
				recipes["electronic-crawler-locomotive-" .. i].enabled = technologies["angels-crawler-train-" .. i].researched
				recipes["electronic-crawler-locomotive-wagon-" .. i].enabled = technologies["angels-crawler-train-" .. i].researched
			end
		end
	end

	for i = 1, settings.startup["angels-petrotrain-tier-amount"].value do
		if i == 1 then
			if technologies["angels-petro-train"] then
				recipes["electronic-petro-locomotive-1"].enabled = technologies["angels-petro-train"].researched
			end
		else
			if technologies["angels-petro-train-" .. i] then
				recipes["electronic-petro-locomotive-1-" .. i].enabled = technologies["angels-petro-train-" .. i].researched
			end
		end
	end

	for i = 1, settings.startup["angels-smeltingtrain-tier-amount"].value do
		if i == 1 then
			if technologies["angels-smelting-train"] then
				recipes["electronic-smelting-locomotive-1"].enabled = technologies["angels-smelting-train"].researched
				recipes["electronic-smelting-locomotive-tender"].enabled = technologies["angels-smelting-train"].researched
			end
		else
			if technologies["angels-smelting-train-" .. i] then
				recipes["electronic-crawler-locomotive-" .. i].enabled = technologies["angels-smelting-train-" .. i].researched
				recipes["electronic-smelting-locomotive-tender" .. i].enabled = technologies["angels-smelting-train-" .. i].researched
			end
		end
	end
end