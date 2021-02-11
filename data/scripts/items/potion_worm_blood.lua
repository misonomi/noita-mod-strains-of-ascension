dofile_once("data/scripts/lib/utilities.lua")

local materials_standard = 
{
	{
		material="blood_worm",
		cost=200,
	},
}


local entity_id = GetUpdatedEntityID()
local x,y = EntityGetTransform( entity_id )
SetRandomSeed( x, y )
-- so that all the potions will be the same in every position with the same seed
-- local potion = random_from_array( potions )
local potion_material = "blood_worm"

-- AddMaterialInventoryMaterial( entity_id, potion.material, 1000 )
AddMaterialInventoryMaterial( entity_id, potion_material, 1000 )