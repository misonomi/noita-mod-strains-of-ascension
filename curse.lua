
biome_layer_map = {
    $biome_coalmine = 1,
    $biome_coalmine_alt = 1,
}

function complain( player_entity )
    GamePrint("Debug: got woring curse")
end

function vertigo( player_entity )
    EntityKill(player_entity)
end

function hallucination( player_entity )
end

function hemorrhage( player_entity )
end

function sensory_deprivation( player_entity )
end

function loss_of_humanity( player_entity )
end

function death( player_entity )
    EntityKill(player_entity)
end

curse_table = {
    [0] = {
        desc = "0th: do nothing curse",
        effect = complain,
    }
    [1] = {
        desc = "1st layer: Light dizziness and nausea",
        effect = vertigo,
    },
    [2] = {
        desc = "2nd layer: Heavy nausea, headache and numbness of limbs",
        effect = headache,
    },
    [3] = {
        desc = "3rd layer: Vertigo combined with visual and auditory hallucinations",
        effect = hallucination,
    },
    [4] = {
        desc = "4th layer: Intense full-body pain, dizziness from pain and varying amounts of internal and external bleeding across the body",
        effect = hemorrhage,
    },
    [5] = {
        desc = "5th layer: Complete sensory deprivation, confusion and self-harming behavior",
        effect = sensory_deprivation,
    },
    [6] = {
        desc = "6th layer: Loss of humanity or death",
        effect = loss_of_humanity,
    },
    [7] = {
        desc = "7th layer: Certain death",
        effect = death,
    },
}
