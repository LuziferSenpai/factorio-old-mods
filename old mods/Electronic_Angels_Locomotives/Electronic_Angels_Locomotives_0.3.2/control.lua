local function add()
	script.on_event( defines.events.on_tick, function()
		local tablee = {}
		
		if game.active_mods["angelsaddons-crawlertrain"] then
			local loconame = "electronic-crawler-locomotive"
			local locowagonname = "electronic-crawler-locomotive-wagon"

			for i = 1, settings.startup["angels-crawlertrain-tier-amount"].value do
				if i == 1 then
					table.insert(tablee, loconame)
					table.insert(tablee, locowagonname)
				else
					table.insert(tablee, loconame .. "-" .. i)
					table.insert(tablee, locowagonname .. "-" .. i)
				end
			end
		end

		if game.active_mods["angelsaddons-petrotrain"] then
			local loconame = "electronic-petro-locomotive-1"

			for i = 1, settings.startup["angels-petrotrain-tier-amount"].value do
				if i == 1 then
					table.insert(tablee, loconame)
				else
					table.insert(tablee, loconame .. "-" .. i)
				end
			end
		end

		if game.active_mods["angelsaddons-smeltingtrain"] then
			local loconame = "electronic-smelting-locomotive-1"
			local locowagonname = "electronic-smelting-locomotive-tender"

			for i = 1, settings.startup["angels-smeltingtrain-tier-amount"].value do
				if i == 1 then
					table.insert(tablee, loconame)
					table.insert(tablee, locowagonname)
				else
					table.insert(tablee, loconame .. "-" .. i)
					table.insert(tablee, locowagonname .. "-" .. i)
				end
			end
		end

		for _, name in pairs( tablee ) do
			remote.call( "AddElectronicLocomotive", "new", name )
		end

		script.on_event( defines.events.on_tick, nil )
	end )
end

script.on_init( add )

script.on_configuration_changed( add )