dofile("mods/strains_of_ascension/files/forcefield.lua")

function OnWorldPreUpdate()
	local players = EntityGetWithTag("player_unit")
	if players == nil then return end
	for _, p in ipairs(players) do
		forcefield_update(p)
	end
end

function OnModInit()
	local common = ModTextFileGetContent("data/translations/common.csv")
	local trans = ModTextFileGetContent("mods/strains_of_ascension/files/translations.csv")

	ModTextFileSetContent("data/translations/common.csv", common .. trans)
end

function OnPlayerSpawned( player_entity )
	GamePrintImportant("$soa_welcome", "$soa_caution")
	local init_x, init_y = EntityGetTransform(player_entity)
	prev_y = init_y
	EntityLoad("mods/strains_of_ascension/files/forcefield.xml", init_x, mody(init_y) - FORCEFIELD_INTERVAL)
end

ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/strains_of_ascension/files/perk_modify.lua")