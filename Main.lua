local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = game.ReplicatedStorage:WaitForChild("Region4NPCs")
local Upto = game.ReplicatedStorage.NPC_Count.Value

game.Players.PlayerAdded:Connect(function(player)
	
	
	local TargetedFolder = Instance.new("Folder", player)
	TargetedFolder.Name = "TargetedFolder"
	
	local HunterFolder = Instance.new("Folder", player)
	HunterFolder.Name = "HunterFolder"
	
	
	for count = 1, Upto do
		local TargetedbyNPC = Instance.new("BoolValue", TargetedFolder)
		TargetedbyNPC.Name = "TargetedbyNPC"..count
	end 

	
	
	
	
	
	
end)

game.Players.PlayerRemoving:Connect(function(player)
	
		local Hunters = player.HunterFolder:GetChildren()
		local NPCs = game.Workspace.NPCs:GetChildren()
		for i,v in pairs(Hunters) do 
			local NPCbinded = v.Value
			for i, NPC in pairs(NPCs) do
				if NPC.Name == NPCbinded then
				NPC.HumanoidRootPart.Anchored = true
						NPC.Binded.Value = false
				v:Destroy()
				local targeted = player.TargetedFolder:WaitForChild("Targetedby"..NPC.Name)
				targeted.Value = false 
					
					local walkAnimationTrack = NPC.Humanoid:LoadAnimation(NPC.WalkAnimation)
					if walkAnimationTrack.Length ~= 0 then

					walkAnimationTrack:Play()
					walkAnimationTrack:AdjustSpeed(0)
						walkAnimationTrack.Looped = false
					end
				end
			end

		end
	
end)


game:GetService('Players').PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		character:WaitForChild("Humanoid").Died:Connect(function()
			
			print(player.Name .. " has died!")
			local Hunters = player.HunterFolder:GetChildren()
			local NPCs = game.Workspace.NPCs:GetChildren()
			for i,v in pairs(Hunters) do 
				local NPCbinded = v.Value
				for i, NPC in pairs(NPCs) do
					if NPC.Name == NPCbinded then
						NPC.HumanoidRootPart.Anchored = true
						NPC.Binded.Value = false
						v:Destroy()
						remoteEvent:FireClient(player, NPC, false)
						local targeted = player.TargetedFolder:WaitForChild("Targetedby"..NPC.Name)
						targeted.Value = false 

						local walkAnimationTrack = NPC.Humanoid:LoadAnimation(NPC.WalkAnimation)
						if walkAnimationTrack.Length ~= 0 then

							walkAnimationTrack:Play()
							walkAnimationTrack:AdjustSpeed(0)
							walkAnimationTrack.Looped = false
						end
					end
				end

			end
		end)
	end)
end)
