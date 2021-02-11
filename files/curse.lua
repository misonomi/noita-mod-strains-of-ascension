biome_layer_map = {
    ["$biome_coalmine"] = 1,
    ["$biome_coalmine_alt"] = 1,
    ["$biome_town_under"] = 1,
    ["$biome_excavationsite"] = 2,
    ["$biome_fungicave"] = 2,
    ["$biome_snowcave"] = 3,
    ["$biome_wandcave"] = 3,
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
        desc = "0th: nothing",
        ignite = complain,
        valid = true,
    },
    [1] = {
        desc = "1st layer: Light dizziness and nausea",
        ignite = dizziness,
        valid = true,
    },
    [2] = {
        desc = "2nd layer: Heavy nausea, headache and numbness of limbs",
        ignite = headache,
        valid = true,
    },
    [3] = {
        desc = "3rd layer: Vertigo combined with visual and auditory hallucinations",
        ignite = hallucination,
        valid = true,
    },
    [4] = {
        desc = "4th layer: Intense full-body pain, dizziness from pain and varying amounts of internal and external bleeding across the body",
        ignite = hemorrhage,
        valid = true,
    },
    [5] = {
        desc = "5th layer: Complete sensory deprivation, confusion and self-harming behavior",
        ignite = sensory_deprivation,
        valid = true,
    },
    [6] = {
        desc = "6th layer: Loss of humanity or death",
        ignite = loss_of_humanity,
        valid = true,
    },
    [7] = {
        desc = "7th layer: Certain death",
        ignite = death,
        valid = true,
    },
}
