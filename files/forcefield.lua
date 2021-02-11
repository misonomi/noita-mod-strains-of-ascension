dofile("mods/strains_of_ascension/files/curse.lua")

-- maybe it should be defined in xml? I don't know
FORCEFIELD_INTERVAL = 200
FORCEFIELD_FLEX = 50

-- TODO: handle multiple players
prev_y = 0
last_ff_y = 0

function forcefield_check( player_entity )
    local x, y = EntityGetTransform(player_entity)
    if y > last_ff_y + FORCEFIELD_INTERVAL then last_ff_y = y - (y % FORCEFIELD_INTERVAL) end

    -- allow teleporting over forcefield
    if y < last_ff_y and y > prev_y + 1 then last_ff_y = y - (y % FORCEFIELD_INTERVAL) end

    if y < last_ff_y - FORCEFIELD_FLEX then
        local curse = curse_table[biome_layer_map[BiomeMapGetName(x, y)]]
        if curse and curse.valid then
            GamePrintImportant("Got the curse of the abyss", curse.desc)
            curse.ignite(player_entity)
            curse.valid = false
        end
    end
    prev_y = y
end
