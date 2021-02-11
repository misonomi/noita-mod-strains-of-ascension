dofile("mods/strains_of_ascension/files/forcefield.lua")

function OnWorldPreUpdate()
	local players = EntityGetWithTag("player_unit")
	if players == nil then return end
	for _, p in ipairs(players) do
		forcefield_check(p)
		forcefield_draw(p)
	end
end


function OnPlayerSpawned( player_entity )
	GamePrintImportant("Hello Abyss!", "you should be careful on ascending")
	EntityLoad("mods/strains_of_ascension/files/forcefield.xml", 0, 0)
	local init_y = select(2, EntityGetTransform(player_entity))
	prev_y = init_y
	reset_ff(init_y)
end