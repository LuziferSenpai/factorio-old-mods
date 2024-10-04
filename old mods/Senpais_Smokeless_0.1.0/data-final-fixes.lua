for _, entity in pairs( data.raw ) do
	for _, raw in pairs( entity ) do
		if raw.energy_source then
			if raw.energy_source.smoke then
				raw.energy_source.smoke = nil
			end
		end

		if raw.smoke then
			if not ( raw.type == "construction-robot" or raw.type == "explosion" or raw.type == "flame-thrower-explosion" ) then
				raw.smoke = nil
			end
		end

		if raw.burner then
			if raw.burner.smoke then
				raw.burner.smoke = nil
			end
		end
	end
end

