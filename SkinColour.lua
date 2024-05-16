local ScanBlock = script.Parent
local newWalkSpeed = 16

function onTouched(getSkin)
	print( " TOUCHING SOMETHNIG" )
	local character = getSkin.Parent
	
	if character:IsA("Model")and character:FindFirstChild("Humanoid") then
		print(" FOUND THE PERSON")
		local Humanoid = character:FindFirstChild("Humanoid")
--		local HumanoidSkinValue = Humanoid.BodyColour 
		local BodyColor = character:FindFirstChild("Body Colors")
		
		local head = character:FindFirstChild("Head")

		if head then
			local color = Color3.new(0,0,0)
--			head.BrickColor = BrickColor.new(Color3.new(0.2,0.2,0.2))	
			BodyColor.HeadColor3 = Color3.new(1,0,0)
			print("PLayer Head Color ", BodyColor.HeadColor3.R, "  ", BodyColor.HeadColor3.G," ", BodyColor.HeadColor3.B )
		end
	end
end

ScanBlock.Touched:Connect(onTouched)
--Success

