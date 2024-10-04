for i = 1, 1000 do
	local lastspeed = 0
	local lastfollower = 0
	if i == 1 then
		lastspeed = 5 
		lastfollower = 20
	else
		lastspeed = 4 + i
		lastfollower = 19 + i
	end
	local countispeed = 1000*i
	local countifollower = 3000*i
	local lvlspeed = 5 + i
	local lvlfollower = 20 + i
	data:extend
	(
	{
	 {
	  type = "technology",
	  name = "worker-robots-speed-"..lvlspeed,
	  icon = "__base__/graphics/technology/worker-robots-speed.png",
	  effects = { { type = "worker-robot-speed", modifier = 0.20 } },
	  prerequisites = { "worker-robots-speed-"..lastspeed },
	  unit = { count = countispeed, ingredients = { { "alien-science-pack", 1 }, { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 } }, time = 60 },
	  upgrade = true,
	  order = "c-k-f-e"
	 },
	 {
	  type = "technology",
	  name = "follower-robot-count-"..lvlfollower,
	  icon = "__base__/graphics/technology/follower-robots.png",
	  effects = { { type = "maximum-following-robots-count", modifier = 10 } },
	  prerequisites = { "follower-robot-count-"..lastfollower },
	  unit = { count = countifollower, ingredients = { { "alien-science-pack", 1 }, { "science-pack-1", 1 }, { "science-pack-2", 1 }, { "science-pack-3", 1 } }, time = 60 },
	  upgrade = true, 
	  order = "e-p-b-c"
	 }
	}
	)
end