local ReplicatedStorage = game:GetService("ReplicatedStorage")


local CanSee = game.ReplicatedStorage.CanSee:WaitForChild("CanSeeEvent")

local WalkSound = ReplicatedStorage:WaitForChild("LocalSounds")
CanSee.OnServerEvent:Connect(function(player, NPC, targeted) --HERE
	
	
	local walkAnimationTrack = NPC.Humanoid:LoadAnimation(NPC.WalkAnimation)
	
		
	if walkAnimationTrack.Length ~= 0 then
		walkAnimationTrack:Play()
		walkAnimationTrack:AdjustSpeed(0)
		walkAnimationTrack.Looped = false
		end
	local WalkStatus = false
	WalkSound:FireClient(player,WalkStatus, NPC)
	
	print("CantSee Fired for "..NPC.Name)
	targeted.Value = false
	NPC.HumanoidRootPart.Anchored = true
	NPC.Binded.Value = true
	
	if not player.HunterFolder:FindFirstChild(NPC.Name) then --HERE
		local HunterFolder = player.HunterFolder
		local Hunter = Instance.new("StringValue", HunterFolder)
		Hunter.Name = NPC.Name --HERE
		Hunter.Value = NPC.Name
	end
end)

