function enable_perticle_emitter( entity_name )
    local ff_entity = EntityGetWithName(entity_name)
    if ff_entity then
        c = EntityGetFirstComponent(ff_entity, "ParticleEmitterComponent")
        if c then
            ComponentSetValue2(c, "is_emitting", true)
        end
    end
end
