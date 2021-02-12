biome_layer_map = {
    ["$biome_coalmine"] = 1,
    ["$biome_coalmine_alt"] = 1,
    ["$biome_town_under"] = 1,
    ["$biome_excavationsite"] = 2,
    ["$biome_snowcave"] = 3,
    ["$biome_snowcastle"] = 4,
    ["$biome_rainforest"] = 5,
    ["$biome_vault"] = 6,
    ["$biome_crypt"] = 7,
}

function complain( player_entity )
    GamePrint("Debug: got unknown curse")
end

function dizziness( player_entity )
    -- XXX: swap drug effect component in a bad manner
    local drug_component = EntityGetFirstComponent(player_entity, "DrugEffectComponent")
    if drug_component then
        EntityRemoveComponent(player_entity, drug_component)
    end
    EntityLoadToEntity("mods/strains_of_ascension/files/curses/dizziness.xml", player_entity)
end

function headache( player_entity )
    local drug_component = EntityGetFirstComponent(player_entity, "DrugEffectComponent")
    if drug_component then
        EntityRemoveComponent(player_entity, drug_component)
    end
    EntityLoadToEntity("mods/strains_of_ascension/files/curses/headache.xml", player_entity)
end

function hallucination( player_entity )
    local drug_component = EntityGetFirstComponent(player_entity, "DrugEffectComponent")
    if drug_component then
        EntityRemoveComponent(player_entity, drug_component)
    end
    EntityLoadToEntity("mods/strains_of_ascension/files/curses/hallucination.xml", player_entity)
end

function hemorrhage( player_entity )
    EntityLoadToEntity("mods/strains_of_ascension/files/curses/hemorrhage.xml", player_entity)
end

function sensory_deprivation( player_entity )
    LoadGameEffectEntityTo(player_entity, "mods/strains_of_ascension/files/curses/sensory_deprivation.xml")
end

function loss_of_humanity( player_entity )
    LoadGameEffectEntityTo(player_entity, "mods/strains_of_ascension/files/curses/loss_of_humanity.xml")
end

function death( player_entity )
    local x, y = EntityGetTransform(player_entity)
    EntityLoad("mods/strains_of_ascension/files/curses/death.xml", x, y)
end

function tick_curse()
    local curse = EntityGetWithName("curse")
    if curse == 0 then
        print("Debug: no curse")
        return
    end 

    local x, y = EntityGetTransform(curse)

    print("Debug: curse at [" .. x .. ", " .. y .. "]" )
end

curse_table = {
    [0] = {
        desc = "$soa_0th",
        ignite = complain,
        valid = true,
    },
    [1] = {
        desc = "$soa_1st",
        ignite = dizziness,
        valid = true,
    },
    [2] = {
        desc = "$soa_2nd",
        ignite = headache,
        valid = true,
    },
    [3] = {
        desc = "$soa_3rd",
        ignite = hallucination,
        valid = true,
    },
    [4] = {
        desc = "$soa_4th",
        ignite = hemorrhage,
        valid = true,
    },
    [5] = {
        desc = "$soa_5th",
        ignite = sensory_deprivation,
        valid = true,
    },
    [6] = {
        desc = "$soa_6th",
        ignite = loss_of_humanity,
        valid = true,
    },
    [7] = {
        desc = "$soa_7th",
        ignite = death,
        valid = true,
    },
}
