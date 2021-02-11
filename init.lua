dofile("mods/strains_of_ascension/files/forcefield.lua")

function OnWorldPreUpdate()
	local players = EntityGetWithTag("player_unit")
	if players == nil then return end
	for _, p in ipairs(players) do forcefield_check(p) end
end


function OnPlayerSpawned( player_entity )
	GamePrintImportant("Hello Abyss!", "you should be careful on ascending")
	local init_y = select(2, EntityGetTransform(player_entity))
	max_y = init_y
	prev_y = init_y
end