dofile("mods/strains_of_ascension/files/utils.lua")

function gain_narehate_vision_on_get( perk_name )
	local key = nil
	for k, p in pairs(perk_list) do
		if( p.id == perk_name) then
			key = k
            break
		end
	end

	if( key ~= nil ) then
        local func = perk_list[key].func
        if func == nil then
            perk_list[key].func = function( entity_perk_item, entity_who_picked, item_name )
                enable_perticle_emitter("forcefield")
                enable_perticle_emitter("forcefield_next")
            end
        else
            perk_list[key].func = function( entity_perk_item, entity_who_picked, item_name )
                func(entity_perk_item, entity_who_picked, item_name)
                enable_perticle_emitter("forcefield")
                enable_perticle_emitter("forcefield_next")
            end
        end
	end
end

-- for testing
function gain_narehate_vision_on_get_all()
	for key, _ in pairs(perk_list) do
        local func = perk_list[key].func
        if func == nil then
            perk_list[key].func = function( entity_perk_item, entity_who_picked, item_name )
                enable_perticle_emitter("forcefield")
                enable_perticle_emitter("forcefield_next")
            end
        else
            perk_list[key].func = function( entity_perk_item, entity_who_picked, item_name )
                func(entity_perk_item, entity_who_picked, item_name)
                enable_perticle_emitter("forcefield")
                enable_perticle_emitter("forcefield_next")
            end
        end
	end
end

gain_narehate_vision_on_get("REMOVE_FOG_OF_WAR")
gain_narehate_vision_on_get("ATTACK_FOOT")
