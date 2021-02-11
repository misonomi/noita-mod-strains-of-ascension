dofile("mods/strains_of_ascension/files/curse.lua")

-- maybe it should be defined in xml? I don't know
FORCEFIELD_INTERVAL = 200
FORCEFIELD_FLEX = 25

-- TODO: handle multiple players
prev_y = 0
last_ff_y = 0

function reset_ff( y )
    last_ff_y = y - (y % FORCEFIELD_INTERVAL)
end

function forcefield_check( player_entity )
    local x, y = EntityGetTransform(player_entity)

    if y > last_ff_y + FORCEFIELD_INTERVAL + FORCEFIELD_FLEX then reset_ff(y) end
    -- allow teleporting over forcefield
    if y < last_ff_y and prev_y > y + 10 then reset_ff(y) end

    if y < last_ff_y - FORCEFIELD_FLEX then
        local curse = curse_table[biome_layer_map[BiomeMapGetName(x, y)]]
        if curse and curse.valid then
            GamePrintImportant("Got the curse of the abyss", curse.desc)
            GamePlaySound("data/audio/Desktop/event_cues.snd", "event_cues/orb_distant_monster/create", x, y)
            curse.ignite(player_entity)
            curse.valid = false
        end
    end
    prev_y = y
end

function forcefield_draw( player_entity )
	local x = select(1, EntityGetTransform(player_entity))
    local ff_entity = EntityGetWithName("forcefield")
    if ff_entity == 0 then return end
    EntitySetTransform(ff_entity, x, last_ff_y, 0, 0)

    local fx, fy = EntityGetTransform(ff_entity)
end
