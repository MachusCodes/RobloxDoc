local tool = script.Parent

--raycast function

script.Parent.Shoot.OnServerEvent:Connect(function(player, mousePosition)
	local rayCastParams = RaycastParams.new()
	rayCastParams.FilterDescendantsInstances = {player.Character}
	rayCastParams.FilterType = Enum.RaycastFilterType.Exclude

	--sounds global

	local Sound = script.Parent.sound

	local raycastResult = workspace:Raycast(tool.Model.Barrel.Position, (mousePosition - tool.Model.Barrel.Position) * 300, rayCastParams)

	if raycastResult then	
		local raycastInstance = raycastResult.Instance
		local model = raycastInstance:FindFirstAncestorOfClass("Model")
		Sound["Gun Shot"]:Play()

		if	model then
			if model:FindFirstChild("Humanoid") then
				if raycastInstance.Name == "Head" then
					model:FindFirstChild("Humanoid"):TakeDamage(90)
				else
					model:FindFirstChild("Humanoid"):TakeDamage(50)
				end
			end
		end
	end
end)