local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local CantSee = game.ReplicatedStorage.CantSee:WaitForChild("CantSeeEvent")
local WalkSound = ReplicatedStorage:WaitForChild("LocalSounds")

CantSee.OnServerEvent:Connect(function(player, NPC, targeted) 
	if  not player.HunterFolder:FindFirstChild(NPC.Name) then 
		local HunterFolder = player.HunterFolder
		local Hunter = Instance.new("StringValue", HunterFolder)
		Hunter.Name = NPC.Name --HERE
		Hunter.Value = NPC.Name
	end

	NPC.HumanoidRootPart.Anchored = false
	for _, part in pairs(NPC:GetDescendants()) do
		if part:IsA("BasePart") and part:CanSetNetworkOwnership() then
			part:SetNetworkOwner(nil)
		end
	end
print("CantSee Fired for "..NPC.Name)


	NPC.Binded.Value = true
	local PathFindingService = game:GetService("PathfindingService")

	local human = NPC:WaitForChild("Humanoid")
	local torso = NPC:WaitForChild("UpperTorso")
	torso.Anchored = false
	
	local char = player.Character or player.CharacterAdded:wait()
	targeted.Value = true
	
	local WalkStatus = true
	WalkSound:FireClient(player,WalkStatus, NPC)
	
	
	local walkAnimationTrack = human:LoadAnimation(NPC.WalkAnimation)
	
	--if walkAnimationTrack.IsPlaying == false then
	if walkAnimationTrack.Length ~= 0 then
	walkAnimationTrack:Play()
	walkAnimationTrack:AdjustSpeed(math.random(1,3)/5)
		walkAnimationTrack.Looped = true
		
	end
		--end
	
	
	
	while targeted.Value == true do
		local PathfindingService = game:GetService("PathfindingService")
		local RunService = game:GetService('RunService')

		
		local Humanoid = NPC.Humanoid

		local Destination = char.HumanoidRootPart.Position

		local Path = PathFindingService:CreatePath({AgentHeight = 7, AgentRadius = 4, AgentCanJump = false, WaypointSpacing = 1})
		
		local success, errorMessage = pcall(function()
			Path:ComputeAsync(torso.Position, char.HumanoidRootPart.Position)
		end)
		if success and Path.Status == Enum.PathStatus.Success then

		local activeCoroutine = nil
		local follow=true
		local update
		local followPath
		-- Loop update
		coroutine.wrap(function()
				while (follow) and targeted.Value == true do
				wait(1/3)
				
				 update()
			end
		end)()


		function update()
			Path:ComputeAsync(torso.Position, char.HumanoidRootPart.Position)

			local Waypoints = Path:GetWaypoints()
			table.remove(Waypoints, 1)  -- First waypoint seems to always be origin

			coroutine.wrap(followPath)(Waypoints) -- Follow new path
		end

		function followPath(waypoints)
			activeCoroutine = coroutine.running()
			for _, point in ipairs(waypoints) do
				if activeCoroutine~=coroutine.running() then
					return end  -- No longer active path

				Humanoid:MoveTo(point.Position)
				Humanoid.MoveToFinished:Wait()
				
			end
		end

		
		
		
		
			wait()
			end
	end
	wait()
end)

























