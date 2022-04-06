local CurrentCam = game.Workspace.CurrentCamera
local JumpscareEvent = game.ReplicatedStorage.JumpscareEvent

local JumpscareCam = game.Workspace.JumpscareCam


local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local ContentProvier = game:GetService("ContentProvider")
JumpscareEvent.OnClientEvent:Connect(function()
	local JSBang = game.Workspace.EndoSkeletonRig.JumpscareBang
	ContentProvier:PreloadAsync({JSBang})
	JSBang.Volume = 200
	JSBang:Play()
	CurrentCam.CameraType = Enum.CameraType.Scriptable
	CurrentCam.CFrame = game.Workspace.EndoSkeletonRig.Head.head.hed.CFrame * CFrame.new(0, 0, -1.5) * CFrame.Angles(0, math.rad(180), 0)
	

	


	local CameraShaker = require(game.ReplicatedStorage.CameraShaker)

	local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCFrame)
		CurrentCam.CFrame = CurrentCam.CFrame * shakeCFrame
	end)

	

	camShake:Start()

	
		
			
	camShake:Shake(CameraShaker.Presets.Vibration)
			
	local JS1 = game.Workspace.EndoSkeletonRig.JS1
	local JS2 = game.Workspace.EndoSkeletonRig.JS2
	local JS3 = game.Workspace.EndoSkeletonRig.JS3
	
	
	ContentProvier:PreloadAsync({JS1})
	ContentProvier:PreloadAsync({JS2})
	ContentProvier:PreloadAsync({JS3})
	
	local JSchoosen = math.random(1,3)
	if JSchoosen == 1 then
		JS1:Play()
	elseif JSchoosen == 2 then
		JS2:Play()
	elseif JSchoosen == 3 then
		JS3:Play()
	end
	
	
	
	
	for i = 1, 20 do
		game.Workspace.EndoSkeletonRig.Head.head:SetPrimaryPartCFrame(game.Workspace.EndoSkeletonRig.Head.head:GetPrimaryPartCFrame()*CFrame.fromEulerAnglesXYZ(0,0,25))
		game.Workspace.EndoSkeletonRig.Head.head:SetPrimaryPartCFrame(game.Workspace.EndoSkeletonRig.Head.head:GetPrimaryPartCFrame()*CFrame.new(0,0,0.5))
	wait(0.03)
	game.Workspace.EndoSkeletonRig.Head.head:SetPrimaryPartCFrame(game.Workspace.EndoSkeletonRig.Head.head:GetPrimaryPartCFrame()*CFrame.fromEulerAnglesXYZ(0,0,-25))
		wait(0.04)
		game.Workspace.EndoSkeletonRig.Head.head:SetPrimaryPartCFrame(game.Workspace.EndoSkeletonRig.Head.head:GetPrimaryPartCFrame()*CFrame.new(0,0,-0.5))
	game.Workspace.EndoSkeletonRig.Head.head:SetPrimaryPartCFrame(game.Workspace.EndoSkeletonRig.Head.head:GetPrimaryPartCFrame()*CFrame.fromEulerAnglesXYZ(0,0,-25))
		wait(0.03)
		game.Workspace.EndoSkeletonRig.Head.head:SetPrimaryPartCFrame(game.Workspace.EndoSkeletonRig.Head.head:GetPrimaryPartCFrame()*CFrame.new(0,0,0.5))
	game.Workspace.EndoSkeletonRig.Head.head:SetPrimaryPartCFrame(game.Workspace.EndoSkeletonRig.Head.head:GetPrimaryPartCFrame()*CFrame.fromEulerAnglesXYZ(0,0,25))
		game.Workspace.EndoSkeletonRig.Head.head:SetPrimaryPartCFrame(game.Workspace.EndoSkeletonRig.Head.head:GetPrimaryPartCFrame()*CFrame.new(0,0,-0.5))
		wait(0.04)
		
	end

	if JS2.IsPlaying then
		JS2:Stop()
	end
	if JS3.IsPlaying then
		JS3:Stop()
	end
	CurrentCam.CameraType = Enum.CameraType.Custom
	CurrentCam.CameraSubject = player.Character.Humanoid
end)
