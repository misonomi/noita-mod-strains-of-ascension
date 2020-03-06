dofile("mods/strains_of_ascension/curse.lua")

-- maybe it should be defined in xml? I don't know
local FORCEFIELD_INTERVAL = 200

-- TODO: handle multiple players
local max_y = 0


function OnWorldPreUpdate()
	local players = EntityGetWithTag("player_unit")
	if players == nil then return end

	for i, p in ipairs(players) do
		local x, y = EntityGetTransform(p)
		if y > max_y then max_y = y end

		if y < max_y - FORCEFIELD_INTERVAL then
			local layer = biome_layer_map[BiomeMapGetName(x, y)]
			if layer then
				local curse = curse_table[layer]
				if curse then
					GamePrintImportant("Got the curse of the abyss", curse.desc)
					curse.effect(p)
				end
			end
		end
	end
end


function OnPlayerSpawned( player_entity )
	GamePrintImportant("Hello abyss!", "you should be careful on ascending")
	max_y = select(2, EntityGetTransform(player_entity))
	
end