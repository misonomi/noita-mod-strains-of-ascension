dofile("mods/strains_of_ascension/files/forcefield.lua")

function OnWorldPreUpdate()
	local players = EntityGetWithTag("player_unit")
	if players == nil then return end
	for _, p in ipairs(players) do
		forcefield_update(p)
	end
end


function OnPlayerSpawned( player_entity )
	GamePrintImportant("Hello Abyss!", "you should be careful on ascending")
	local init_x, init_y = EntityGetTransform(player_entity)
	prev_y = init_y
	EntityLoad("mods/strains_of_ascension/files/forcefield.xml", init_x, init_y - FORCEFIELD_INTERVAL)
end