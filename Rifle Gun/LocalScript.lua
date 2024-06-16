local userInputService = game:GetService("UserInputService")

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local tool = script.Parent
local debounce = false

local ammo = 32
local maxAmmo = 32
local reloading = false
local nor = true
local firing = false
local active = false

--Reload Function
local function reload()
	if reloading == false and active == true then
		
		nor = false
		reloading = true
		tool.sound["Gun Reload"]:Play()
		task.wait(3)
		ammo = maxAmmo
		reloading = false
		nor = true
	end
end

--Shooting function
local function shoot()
	if debounce == false and ammo > 0 and reloading == false then
					
		debounce = true
		ammo -= 1
		tool.Shoot:FireServer(mouse.Hit.Position) -- sending mouse data through remote event
--		tool.sound["Gun Shot"]:Play()
		task.wait(0.1)
		debounce = false
		print(ammo)
	
	else	
		if ammo <= 0 and reloading == false then	
			reload()	
		end
	end
end


-- Continuous fire while mouse button is held down
userInputService.InputBegan:Connect(function(inputObject, isTyping)
	if isTyping then 
		return 
	end
	if active == false then return end
	
	if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
		while inputObject.UserInputState == Enum.UserInputState.Begin and reloading == false and debounce == false do
			shoot() -- Adjust this value to control the firing rate
		end
	end
end)


-- User Input Reload
userInputService.InputBegan:Connect(function(inputObject, isTyping)
	if isTyping then return end
	if inputObject.KeyCode == Enum.KeyCode.R then
		reload()
	end
end)

-- Equip Function

tool.Equipped:Connect(function()
	
	if nor == true then	
	reloading = false
		debounce = false
		active =true	
	end
end)

tool.Unequipped:Connect(function()
	
	if reloading == true then
		active = false
		return end
	
		nor = false
		reloading = true
		debounce = true
		nor = true
		
end)

-- if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
--while inputObject.UserInputState == Enum.UserInputState.Begin and reloading == false and debounce == false do
--shoot()
--		end