game.reload_script()

for _, f in pairs( game.forces ) do
	f.reset_recipes()
	f.reset_technologies()
	local t = f.technologies
	local r = f.recipes
	if t["railway-2"].researched then
		if r["electronic-locomotive-mk2"] then r["electronic-locomotive-mk2"].enabled = true end
	end
	if t["railway-3"].researched then
		if r["electronic-locomotive-mk3"] then r["electronic-locomotive-mk3"].enabled = true end
	end
end