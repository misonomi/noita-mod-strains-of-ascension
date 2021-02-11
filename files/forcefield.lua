dofile("mods/strains_of_ascension/files/curse.lua")

-- maybe it should be defined in xml? I don't know
FORCEFIELD_INTERVAL = 20

-- TODO: handle multiple players
max_y = 0
prev_y = 0

function forcefield_check( player_entity )
    local x, y = EntityGetTransform(player_entity)
    if y > max_y then max_y = y end

    if y < max_y - FORCEFIELD_INTERVAL and y > prev_y - 1 then
        local curse = curse_table[biome_layer_map[BiomeMapGetName(x, y)] or 1]
        if curse and curse.valid then
            GamePrintImportant("Got the curse of the abyss", curse.desc)
            curse.ignite(player_entity)
            curse.valid = false
        end
    end

    prev_y = y
end
