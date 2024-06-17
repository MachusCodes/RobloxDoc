local userInputService = game:GetService("UserInputService")

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local tool = script.Parent
local debounce = false

local ammo = 8
local maxAmmo = 8
local reloading = false
local active = false

--Reload Function
local function reload()
	if reloading == false then
		reloading = true
		tool.sound["Gun Reload"]:Play()
		task.wait(1)
		ammo = maxAmmo
		reloading = false
	end
end

--Shooting function

tool.Activated:Connect(function()
	if debounce == false and ammo > 0 and reloading == false then
		debounce = true
		ammo -= 1
		tool.Shoot:FireServer(mouse.Hit.Position) --sending mouse data through remote event
	--	tool.sound["Gun Shot"]:Play()
		task.wait(0.2)
		debounce = false
	elseif ammo <= 0 and reloading == false then	
		reload()
	end
end)

-- User Input Reload
userInputService.InputBegan:Connect(function(inputObject, isTyping)
	if isTyping then return end
	if inputObject.KeyCode == Enum.KeyCode.R and active == true then
		reload()
	end
end)

--Equip Function

tool.Equipped:Connect(function()
	active = true
end)

tool.Unequipped:Connect(function()
	active = false
end)

