wait(3) -- For everything to load in :) --
-- Services --
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
-- Pre/Variables --
local status = script.Equiped1.Value
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local tool = script.Parent.Parent
local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
local IdleAni = Humanoid:LoadAnimation(script:WaitForChild("R6Idle"))
local CrouchAni = Humanoid:LoadAnimation(script:WaitForChild("R6Crouch"))
local RunAni = Humanoid:LoadAnimation(script:WaitForChild("R6Run"))
local ReloadAni = Humanoid:LoadAnimation(script:WaitForChild("R6Reload"))

-- Actions --
local function FullStop()
	IdleAni:Stop()
	RunAni:Stop()
end
local function Idle()
	IdleAni:Play()
end
-- Reload --
function Reload(Inputkey2,gameEvent2)
	if Inputkey2.KeyCode == Enum.KeyCode.R then
		RunAni:Stop()
		IdleAni:Play()
		Humanoid.WalkSpeed = 16
		
	end
end

-- Run --
function Run(Inputkey1,gameEvent1)
	if Inputkey1.KeyCode == Enum.KeyCode.F then
		if not RunAni.IsPlaying and status == true then
			FullStop()
			RunAni:Play()
			Humanoid.WalkSpeed = 22
			return
		else if status == true then
			RunAni:Stop()
			IdleAni:Play()
			Humanoid.WalkSpeed = 16
			end
			end
		end
end

-- Crouch (Universal) --
function Crouch(Inputkey,gameEvent)
	if Inputkey.KeyCode == Enum.KeyCode.C then
		if not CrouchAni.IsPlaying then
			CrouchAni:Play()
			Humanoid.WalkSpeed = 8
			return
		else 
			CrouchAni:Stop()
			Humanoid.WalkSpeed = 16
		end
	end
end


-- OnEquipped --
tool.Equipped:Connect(function()
	mouse.Icon = script.Cursor.Texture
	status = true
	Humanoid.WalkSpeed = 16
	Idle()
end)
-- OnUnequipped --
tool.Unequipped:Connect(function()
	FullStop()
	status = false
	mouse.Icon = ""
end)

------ Finalization ------
UserInputService.InputBegan:Connect(Crouch)
UserInputService.InputBegan:Connect(Run)
