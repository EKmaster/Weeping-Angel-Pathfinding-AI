local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local remoteFunction = game.ReplicatedStorage:WaitForChild("RemoteFunction")
local CantSee = game.ReplicatedStorage.CantSee:WaitForChild("CantSeeEvent")
local NPC = game.Workspace.NPCs:WaitForChild(script.Name)
local CanSee = game.ReplicatedStorage.CanSee:WaitForChild("CanSeeEvent")
local TweeenService = game:GetService("TweenService")
player:WaitForChild("TargetedFolder")
local targeted = player.TargetedFolder:WaitForChild("Targetedby"..NPC.Name)
test = remoteFunction:InvokeServer(NPC)
local char = player.Character or player.CharacterAdded:wait()

local RayCastFilter1 = RaycastParams.new()
RayCastFilter1.FilterType = Enum.RaycastFilterType.Whitelist
RayCastFilter1.FilterDescendantsInstances = {game.Workspace.NoSeeNPC}

if test == false then

	while true do
		task.wait()
		local camera = game.Workspace.CurrentCamera
		local worldPosition1 = NPC.LeftLowerArm.Position
		local worldPosition2 = NPC.RightLowerArm.Position
		local worldPosition3 = NPC.Head.Position
		local worldPosition4 = NPC.HumanoidRootPart.Position
		local worldPosition5 = NPC.HumanoidRootPart.Position

		local screenPosition1,  onScreen1 = camera:WorldToScreenPoint(worldPosition1)
		local screenPosition2,  onScreen2 = camera:WorldToScreenPoint(worldPosition2)
		local screenPosition3,  onScreen3 = camera:WorldToScreenPoint(worldPosition3)
		local screenPosition4,  onScreen4 = camera:WorldToScreenPoint(worldPosition4)
		local screenPosition5,  onScreen5 = camera:WorldToScreenPoint(worldPosition5)

		if onScreen1 or onScreen2 or onScreen3 or onScreen4 or onScreen5  then
			local ray = camera:ViewportPointToRay(screenPosition3.X, screenPosition3.Y)
			local result = Workspace:Raycast(ray.Origin,  ray.Direction * (worldPosition3 - char.HumanoidRootPart.Position).Magnitude,RayCastFilter1)

			if result and targeted.Value == false and char.Humanoid.Health ~= 0 then

				CantSee:FireServer(NPC, targeted)
				if NPC.Binded.Value == false then
					local sound = NPC.Head.RobotPowerOn

					local ContentProvier = game:GetService("ContentProvider")
					ContentProvier:PreloadAsync({sound})
					sound:Play()
				end
				--PLayer Cant See NPC
			elseif not result  and char.Humanoid.Health ~= 0 then

				if targeted.Value == true or NPC.Binded.Value == false then
					CanSee:FireServer(NPC, targeted)
					--Player Can See
					if NPC.Binded.Value == false then
						local sound = NPC.Head.RobotPowerOn

						local ContentProvier = game:GetService("ContentProvider")
						ContentProvier:PreloadAsync({sound})
						sound:Play()
						local TweenService = game:GetService("TweenService")


						local info = TweenInfo.new(
							2, --length(Seconds)
							Enum.EasingStyle.Sine,
							Enum.EasingDirection.Out,
							0, --Times Repeated
							true, --Reverse
							0 --Delay(Seconds)
						)

						local Goals = {

							Color = Color3.fromRGB(248, 0, 0);
						}

						local makePartBiggerTween = TweenService:Create(NPC.Head.head.eye1R, info, Goals)
						local makePartBiggerTween2 = TweenService:Create(NPC.Head.head.eye2r, info, Goals)
						wait(0.5)
						makePartBiggerTween:Play()
						makePartBiggerTween2:Play()

					end
				end
			end


		else
			if targeted.Value == false and char.Humanoid.Health ~= 0 then

				CantSee:FireServer(NPC, targeted)
				--PLayer Cant See NPC
				if NPC.Binded.Value == false then
					local sound = NPC.Head.RobotPowerOn

					local ContentProvier = game:GetService("ContentProvider")
					ContentProvier:PreloadAsync({sound})
					sound:Play()
					local TweenService = game:GetService("TweenService")
					local part = NPC.Head.head.eye1R

					local info = TweenInfo.new(
						2, --length(Seconds)
						Enum.EasingStyle.Sine,
						Enum.EasingDirection.Out,
						0, --Times Repeated
						true, --Reverse
						0 --Delay(Seconds)
					)

					local Goals = {

						Color = Color3.fromRGB(248, 0, 0);
					}

					local makePartBiggerTween = TweenService:Create(NPC.Head.head.eye1R, info, Goals)
					local makePartBiggerTween2 = TweenService:Create(NPC.Head.head.eye2r, info, Goals)
					wait(0.5)
					makePartBiggerTween:Play()
					makePartBiggerTween2:Play()

				end
			end
		end

	end
end
