
-- maybe it should be defined in xml? I don't know
local FORCEFIELD_INTERVAL = 20

-- TODO: handle multiple players
local max_y = 0


function OnWorldPreUpdate()
	local players = EntityGetWithTag("player_unit")
	if players == nil then return end

	for i, p in ipairs(players) do
		local y = select(2, EntityGetTransform(p)) / 10
		if y > max_y then max_y = y end

		GamePrint(tostring(GameGetFrameNum()) .. ": " .. tostring(y) .. "m")
		GamePrint(tostring(GameGetFrameNum()) .. ": " .. tostring(max_y) .. "m")

		if y < max_y - FORCEFIELD_INTERVAL then
			GamePrint(tostring("Got the curse of the abyss")
		end
	end
end


function OnPlayerSpawned( player_entity )
	GamePrint("Hello abyss!")
	max_y = select(2, EntityGetTransform(player_entity))
	
	local out = ""
	for i, c in ipairs(EntityGetAllComponents(player_entity)) do
		out = out .. ", " .. ComponentGetTypeName(c)
	end
	error("Debug: " .. out)
end