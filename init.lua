dofile("mods/strains_of_ascension/files/curse.lua")

-- maybe it should be defined in xml? I don't know
local FORCEFIELD_INTERVAL = 20

-- TODO: handle multiple players
local max_y = 0
local prev_y = 0


function OnWorldPreUpdate()
	local players = EntityGetWithTag("player_unit")
	if players == nil then return end

	for i, p in ipairs(players) do
		local x, y = EntityGetTransform(p)
		GamePrint(BiomeMapGetName(x, y))
		-- GamePrint("Debug: player at [" .. x .. ", " .. y .. "]" )
		if y > max_y then max_y = y end

		if y < max_y - FORCEFIELD_INTERVAL and y > prev_y - 1 then
			local layer = biome_layer_map[BiomeMapGetName(x, y)]
			if layer then
				local curse = curse_table[layer]
				if curse and curse.valid then
					GamePrintImportant("Got the curse of the abyss", curse.desc)
					curse.ignite(p)
					curse.valid = false
				end
			end
		end

		tick_curse()
		prev_y = y
	end
end


function OnPlayerSpawned( player_entity )
	GamePrintImportant("Hello abyss!", "you should be careful on ascending")
	local init_y = select(2, EntityGetTransform(player_entity))
	max_y = init_y
	prev_y = init_y
end