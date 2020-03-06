function OnWorldPreUpdate()
	local players = EntityGetWithTag("player_unit")
	if players == nil then return end

	for i, p in ipairs(players) do
		local y = select(2, EntityGetTransform(p))

		GamePrint(tostring(GameGetFrameNum()) .. ": " .. tostring(y / 10) .. "m")
	end
end


function OnPlayerSpawned( player_entity )
	GamePrint("Hello abyss!")
	
	local out = ""
	for i, c in ipairs(EntityGetAllComponents(player_entity)) do
		out = out .. ", " .. ComponentGetTypeName(c)
	end
	error("Debug: " .. out)
end