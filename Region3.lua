
local NPC = script.Parent.Parent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = game.ReplicatedStorage:WaitForChild("Region4NPCs")

while true do
	
	while NPC.Binded.Value == false do
		local regionpart = script.Parent
		local min = regionpart.Position - (regionpart.Size/2)
		local max = regionpart.Position + (regionpart.Size/2)
		local region = Region3.new(min, max)
		
	 
	local list = {}
	local distances = {}
	local dictionary = {
	}
		for i, part in pairs(game.Workspace:FindPartsInRegion3(region, nil, math.huge)) do
			
			
			if part.Parent:FindFirstChild("Humanoid") ~= nil and not part.Parent:FindFirstChild("Touch") and NPC.Binded.Value == false then
			
				if part.Parent.Humanoid.Health ~= 0 then
			-- if player from part is not in table then add it in table, keep going for all parts.
					local player = game.Players:GetPlayerFromCharacter(part.Parent)
					
				if not list[player] then
						table.insert(list, player)
						
				end
			
			
			
			-- Find distance between players and npc, which ever is the closest 
			
			
			

			end
		end
		end
		
		wait()
		if #list ~= 0 then
			
	for i, player in pairs(list) do
		
		
		
		local char = player.Character
		dictionary[player] = (char.HumanoidRootPart.Position - NPC.HumanoidRootPart.Position).magnitude
		
		
	end
		
	for key, value in pairs(dictionary) do
		table.insert(distances, value)
	end

	table.sort(distances)
	--Find Player assiocated with distance
	local user
	for key, value in pairs(dictionary) do
		if value == distances[1] then
			user = key 
			
		end
		end
	local sent = false
		if user ~= nil then
				if sent == false then
					sent = true
		print(distances[1])
		local char = user.Character
		user2 = game.Players:GetPlayerFromCharacter(char)
		
		remoteEvent:FireClient(user2, NPC, true)
		end		
				end
	

	end
		wait()
	end
	wait()
end
