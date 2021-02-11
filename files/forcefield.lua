dofile("mods/strains_of_ascension/files/curse.lua")

-- maybe it should be defined in xml? I don't know
FORCEFIELD_INTERVAL = 300
FORCEFIELD_FLEX = 25

-- TODO: handle multiple players
prev_y = 0

function mody( y )
    return y - (y % FORCEFIELD_INTERVAL)
end

function forcefield_update( player_entity )
    local x, y = EntityGetTransform(player_entity)
    local ff_entity = EntityGetWithName("forcefield")
	local ff_y = select(2, EntityGetTransform(ff_entity))

    if y > ff_y + FORCEFIELD_INTERVAL + FORCEFIELD_FLEX then ff_y = mody(y) end
    -- allow teleporting over forcefield
    if y < ff_y and prev_y > y + 10 then ff_y = mody(y) end

    if y < ff_y - FORCEFIELD_FLEX then
        local curse = curse_table[biome_layer_map[BiomeMapGetName(x, y)]]
        if curse and curse.valid then
            GamePrintImportant("Got the curse of the abyss", curse.desc)
            GamePlaySound("data/audio/Desktop/event_cues.snd", "event_cues/orb_distant_monster/create", x, y)
            curse.ignite(player_entity)
        end
        ff_y = mody(y)
    end
    prev_y = y
    
    EntitySetTransform(ff_entity, x, ff_y)
    forcefield_draw(ff_entity)
end

function forcefield_draw( ff_entity )
end
