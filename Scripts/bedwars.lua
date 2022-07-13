
























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































local SytroWaterMark = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextButton")
local UIGradient = Instance.new("UIGradient")
local TextLabel_2 = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")

SytroWaterMark.Name = "SytroWaterMark"
SytroWaterMark.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
SytroWaterMark.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SytroWaterMark.ResetOnSpawn = false

TextLabel.Parent = SytroWaterMark
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.000772226602, 0, 0.0343558267, 0)
TextLabel.Size = UDim2.new(0.170134634, 0, 0.0700389072, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "RektSky"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 28.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.MouseButton1Down:Connect(function()
	print("Hi")
end)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(126, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(209, 0, 0))}
UIGradient.Parent = TextLabel

TextLabel_2.Parent = TextLabel
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(-0.000772226602, 0, 0.67410934, 0)
TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "V4"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 24.000
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(126, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(209, 0, 0))}
UIGradient_2.Parent = TextLabel_2

UITextSizeConstraint.Parent = TextLabel_2
UITextSizeConstraint.MaxTextSize = 24

UITextSizeConstraint_2.Parent = TextLabel
UITextSizeConstraint_2.MaxTextSize = 27


local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
 
game.StarterGui:SetCore("SendNotification", {
    Title = "Bedwars OP Script";
    Text = "Made by the Collector"; -- what the text says (ofc)
    Duration = 30;
})
wait(1)
game.StarterGui:SetCore("SendNotification", {
    Title = "Enjoy";
    Text = "Don't Forget to Subscribe the Collector"; -- what the text says (ofc)
    Duration = 30;
})





local players = game:GetService("Players")
local lplr = players.LocalPlayer
local oldchar = lplr.Character
local cam = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local KnitClient = debug.getupvalue(require(game.Players.LocalPlayer.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil
local itemstuff = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local RenderStepTable = {}
local StepTable = {}
local connectioninfjump
local killauraswing = {["Enabled"] = true}
local killaurasound = {["Enabled"] = true}
local killaurahitdelay = {["Value"] = 2}
local killaurasoundval = {["Value"] = 1}
local speedval = {["Value"] = 1}
local testtogttt = {["Value"] = 20}
local ACC1
local ACC2
local antivoidtransparent = {["Value"] = 50}
local antivoidcolor = {["Hue"] = 0.93, ["Sat"] = 1, ["Value"] = 1}
local reachval = {["Value"] = 18}
local autoclick = {["Enabled"] = true}
local origC0 = game.ReplicatedStorage.Assets.Viewmodel.RightHand.RightWrist.C0
local killaurafirstpersonanim = {["Value"] = true}
local killauraanimval = {["Value"] = "Cool"}

local SprintCont = KnitClient.Controllers.SprintController
local SwordCont = KnitClient.Controllers.SwordController
local KnockbackTable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
local ClientHandler = Client

local function GetURL(scripturl)
	return game:HttpGet("https://raw.githubusercontent.com/7GrandLittleBrother/SytroNight4ROBLOX/main/"..scripturl, true)
end

local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function runcode(func)
	func()
end

local function playsound(id, volume) 
	local sound = Instance.new("Sound")
	sound.Parent = workspace
	sound.SoundId = id
	sound.PlayOnRemove = true 
	if volume then 
		sound.Volume = volume
	end
	sound:Destroy()
end

local function playanimation(id) 
	if isAlive() then 
		local animation = Instance.new("Animation")
		animation.AnimationId = id
		local animatior = lplr.Character.Humanoid.Animator
		animatior:LoadAnimation(animation):Play()
	end
end

function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

function getinv(plr)
	local plr = plr or lplr
	local thingy, thingytwo = pcall(function() return InventoryUtil.getInventory(plr) end)
	return (thingy and thingytwo or {
		items = {},
		armor = {},
		hand = nil
	})
end

function getsword()
	local sd
	local higherdamage
	local swordslots
	local swords = getinv().items
	for i, v in pairs(swords) do
		if v.itemType:lower():find("sword") or v.itemType:lower():find("blade") then
			if higherdamage == nil or itemstuff[v.itemType].sword.damage > higherdamage then
				sd = v
				higherdamage = itemstuff[v.itemType].sword.damage
				swordslots = i
			end
		end
	end
	return sd, swordslots
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end

local function hvFunc(cock)
	return {hashedval = cock}
end

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isPlayerTargetable(plr, target)
	return plr ~= lplr and plr and isAlive(plr) and targetCheck(plr, target)
end

local function GetAllNearestHumanoidToPosition(distance, amount)
	local returnedplayer = {}
	local currentamount = 0
	if entity.isAlive then -- alive check
		for i, v in pairs(game.Players:GetChildren()) do -- loop through players
			if isPlayerTargetable((v), true, true, v.Character ~= nil) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then -- checks
				local mag = (lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
				if mag <= distance then -- mag check
					table.insert(returnedplayer, v)
					currentamount = currentamount + 1
				end
			end
		end
		for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
			if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
				local mag = 
(lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
				if mag <= distance then -- mag check
					table.insert(returnedplayer, v)
					currentamount = currentamount + 1
				end
			end
		end
		for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
			if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
				local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
				if mag <= distance then -- magcheck
					table.insert(returnedplayer, {Name = (v2 and v2.Name or "Monster"), UserId = 1443379645, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
				end
			end
		end
	end
	return returnedplayer -- table of attackable entities
end

local function BindToRenderStep(name, num, func)
	if RenderStepTable[name] == nil then
		RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
	end
end
local function UnbindFromRenderStep(name)
	if RenderStepTable[name] then
		RenderStepTable[name]:Disconnect()
		RenderStepTable[name] = nil
	end
end

local function BindToStepped(name, num, func)
	if StepTable[name] == nil then
		StepTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end
local function UnbindFromStepped(name)
	if StepTable[name] then
		StepTable[name]:Disconnect()
		StepTable[name] = nil
	end
end

local attackentitycont = Client:Get(getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])))
local rgfejd = false
local DistVal = {["Value"] = 18}
function KillauraRemote()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
			local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if mag <= DistVal["Value"] and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") then
				if v.Character.Humanoid.Health > 0 then
					rgfejd = true
					local GBW = getsword()
					local selfPosition = lplr.Character.HumanoidRootPart.Position + (DistVal["Value"] > 14 and (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude > 14 and (CFrame.lookAt(lplr.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position).lookVector * 4) or Vector3.new(0, 0, 0))
					local Entity = v.Character
					local target = v.Character:GetPrimaryPartCFrame().Position
					attackentitycont:CallServer({
						["chargedAttack"] = {["chargeRatio"] = 1},
						["weapon"] = GBW ~= nil and GBW.tool,
						["entityInstance"] = Entity,
						["validate"] = {["targetPosition"] = {["value"] = target,
							["hash"] = hvFunc(target)},
						["raycast"] = {
							["cameraPosition"] = hvFunc(cam.CFrame.Position), 
							["cursorDirection"] = hvFunc(Ray.new(cam.CFrame.Position, v.Character:GetPrimaryPartCFrame().Position).Unit.Direction)
						},
						["selfPosition"] = {["value"] = selfPosition,
							["hash"] = hvFunc(selfPosition)
						}
						}
					})
					if killaurasound["Enabled"] then
						playsound("rbxassetid://6760544639", killaurasoundval["Value"])
					end
					if killauraswing["Enabled"] then
						playanimation("rbxassetid://4947108314")
					end
				end
			else
				rgfejd = false
			end
		end
	end
end

local itemtab = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local CombatConstant = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant
local function getEquipped()
	local typetext = ""
	local obj = (entity.isAlive and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value or nil)
	if obj then
		if obj.Name:find("sword") or obj.Name:find("blade") or obj.Name:find("baguette") or obj.Name:find("scythe") or obj.Name:find("dao") then
			typetext = "sword"
		end
		if obj.Name:find("wool") or itemtab[obj.Name]["block"] then
			typetext = "block"
		end
		if obj.Name:find("bow") then
			typetext = "bow"
		end
	end
	return {["Object"] = obj, ["Type"] = typetext}
end


function getbeds()
	local beds = {}
	local blocks = game:GetService("Workspace").Map.Blocks
	for _,Block in pairs(blocks:GetChildren()) do
		if Block.Name == "bed" and Block.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
			table.insert(beds,Block)
		end
	end
	return beds
end

function getbedsblocks()
	local blockstb = {}
	local blocks = game:GetService("Workspace").Map.Blocks
	for i,v in pairs(blocks:GetChildren()) do
		if v:IsA("Part") then
			table.insert(blockstb,v)
		end
	end
	return blockstb
end

function blocks(bed)
	local aboveblocks = 0
	local Blocks = getbedsblocks()
	for _,Block in pairs(Blocks) do
		if Block.Position.X == bed.X and Block.Position.Z == bed.Z and Block.Name ~= "bed" and (Block.Position.Y - bed.Y) <= 9 and Block.Position.Y > bed.Y then
			aboveblocks = aboveblocks + 1
		end
	end
	return aboveblocks
end

function nuker()
	local beds = getbeds()
	for _,bed in pairs(beds) do
		local bedmagnitude = (bed.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
		if bedmagnitude < 27 then
			local upnum = blocks(bed.Position)
			local x = math.round(bed.Position.X/3)
			local y = math.round(bed.Position.Y/3) + upnum
			local z = math.round(bed.Position.Z/3)
			game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.DamageBlock:InvokeServer({
				["blockRef"] = {
					["blockPosition"] = Vector3.new(x,y,z)
				},
				["hitPosition"] = Vector3.new(x,y,z),
				["hitNormal"] = Vector3.new(x,y,z),
			})
		end
	end
end










local kavoUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/EZEZEZEZZE/RektSky-Remake/main/Libraries/kavo.lua"))()
local window = kavoUi.CreateLib("RektSky ReMakeV4", "Ocean")
local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/JustDxrk/Vxpe-Entity/main/Vxpe%20Entity", true))()

do
	local oldcharacteradded = entity.characterAdded
	entity.characterAdded = function(plr, char, localcheck)
		return oldcharacteradded(plr, char, localcheck, function() end)
	end
	entity.fullEntityRefresh()
end

local colorbox
local function makeRainbowText(text)
	spawn(function()
		colorbox = Color3.fromRGB(170,0,170)
		local x = 0
		while wait() do
			colorbox = Color3.fromHSV(x,1,1)
			x = x + 4.5/255
			if x >= 1 then
				x = 0
			end
		end
	end)
	spawn(function()
		repeat
			wait()
			text.TextColor3 = colorbox
		until true == false
	end)
end
-- Tab

local Combat = window:NewTab("Combat")
local CombatSection = Combat:NewSection("Combat")
local Blatant = window:NewTab("Blatant")
local BlatantSection = Blatant:NewSection("Blatant")
local Render = window:NewTab("Render")
local RenderSection = Render:NewSection("Render")
local Utlity = window:NewTab("Utlity")
local UtlitySection = Utlity:NewSection("Utlity")
local World = window:NewTab("World")
local WorldSection = World:NewSection("World")
local Tab6 = window:NewTab("Animation")
local Tab6Section = Tab6:NewSection("Everyone Can See (Fe)")



CombatSection:NewToggle("KillAura", "Autoswing the sword if someone is near you", function(state)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Kllaura has been Enabled", 2, true) -- false is off true is on
	if state then
		BindToStepped("Killaura", 1, function()
			if entity.isAlive then
				KillauraRemote()
			end
		end)
	else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Kllaura has been Disabled", 2, false)
		UnbindFromStepped("Killaura")
	end
end)

CombatSection:NewSlider("Distance 1-40", "Increase killaura distance", 40, 1, function(val)
	DistVal["Value"] = val
end)

CombatSection:NewToggle("No Swing", "Disable killaura swing", function(state)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "No Swing has been Enabled", 2, true) -- false is off true is on
	if state then
		if killauraswing["Enabled"] == true then
			killauraswing["Enabled"] = false
		end
	else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "No Swing has been Disabled", 2, false)
		if killauraswing["Enabled"] == false then
			killauraswing["Enabled"] = true
		end
	end
end)
CombatSection:NewSlider("Sound 1-0", "Adjust killaura sound", 1, 0, function(val)
	killaurasoundval["Value"] = val
end)


BlatantSection:NewToggle("fly", "HypixelFly", function(v)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "fly has been Enabled", 2, true) -- false is off true is on
    longjumpval = v
            if longjumpval then
                workspace.Gravity = 0
                spawn(function()
                    repeat
                        if (not longjumpval) then return end
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                        wait(0.1)
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                        wait(0.1)
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
                        wait(0.1)
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
                        wait(0.1)
                        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                        wait(0.1)
                    until (not longjumpval)
                end)
        else
			local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "fly has been Disabled", 2, false)
            workspace.Gravity = 196.19999694824
            return
        end
    end)

    BlatantSection:NewToggle("Speed", "Gives Speed", function(state)
        local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Speed has been Enabled", 2, true) -- false is off true is on
        if state then
            BindToStepped("CFrameWalkSpeed", 1, function(time, delta)
                if entity.isAlive then
                    local newpos = (lplr.Character.Humanoid.MoveDirection  * (speedval["Value"] - lplr.Character.Humanoid.WalkSpeed)) * delta
    
                    local raycastparameters = RaycastParams.new()
                    raycastparameters.FilterDescendantsInstances = {lplr.Character}
                    local ray = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, newpos, raycastparameters)
                    if ray then newpos = (ray.Position - lplr.Character.HumanoidRootPart.Position) end
                    lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + newpos
                end
            end)
        else
			local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Speed has been Disabled", 2, false)
            UnbindFromStepped("CFrameWalkSpeed")
        end
    end)
    
    BlatantSection:NewSlider("Speed 1-23", "Adjust CFrame speed", 23, 1, function(s)
        speedval["Value"] = s
    end)
    
    
	BlatantSection:NewToggle("Infinite Jumps"," Infinite Jumps",function(state)

		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Infinite Jumps has been Enabled", 2, true) -- false is off true is on
if state then
		local InfJump = {["Enabled"] = true}
		connectioninfjump = uis.JumpRequest:connect(function(jump)
			if InfJump["Enabled"] then
				lplr.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
			end
		end)
	else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Infjump been Disabled", 2, false)
		connectioninfjump:Disconnect()
	end
end)


CombatSection:NewToggle("No KnockBack","No KnockBack",function(state)
	local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "No KnockBack has been Enabled", 2, true) -- false is off true is on
if state then
		KnockbackTable["kbDirectionStrength"] = 0
		KnockbackTable["kbUpwardStrength"] = 0
	else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "No KnockBack been Disabled", 2, false)
		KnockbackTable["kbDirectionStrength"] = 100
		KnockbackTable["kbUpwardStrength"] = 100
	end
end)

BlatantSection:NewToggle("No Fall Damage", "Opens No Fall Damage", function(callback)
	local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "No Fall Damage has been Enabled", 2, true) -- false is off true is on
    local nofall = true
    if callback then
        if nofall then
            spawn(function()
                repeat
                    wait()
                    if nofall == false then
                        return end

                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.GroundHit:FireServer()
                    until nofall == false
                end)
            end
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "No Fall Damage been Disabled", 2, false)
        local nofall = false
    end
end)



RenderSection:NewToggle("Esp Box","Opens Box esp",function()
	local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Esp Box has been Enabled", 2, true) -- false is off true is on
local Player = game:GetService("Players").LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = Player:GetMouse()

local function Dist(pointA, pointB) -- magnitude errors for some reason  : (
    return math.sqrt(math.pow(pointA.X - pointB.X, 2) + math.pow(pointA.Y - pointB.Y, 2))
end

local function GetClosest(points, dest)
    local min  = math.huge 
    local closest = nil
    for _,v in pairs(points) do
        local dist = Dist(v, dest)
        if dist < min then
            min = dist
            closest = v
        end
    end
    return closest
end

local function DrawESP(plr)
    local Box = Drawing.new("Quad")
    Box.Visible = false
    Box.PointA = Vector2.new(0, 0)
    Box.PointB = Vector2.new(0, 0)
    Box.PointC = Vector2.new(0, 0)
    Box.PointD = Vector2.new(0, 0)
    Box.Color = Color3.fromRGB(255, 255, 255)
    Box.Thickness = 2
    Box.Transparency = 1

    local function Update()
        local c
        c = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local pos, vis = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if vis then 
                    local points = {}
                    local c = 0
                    for _,v in pairs(plr.Character:GetChildren()) do
                        if v:IsA("BasePart") then
                            c = c + 1
                            local p = Camera:WorldToViewportPoint(v.Position)
                            if v.Name == "HumanoidRootPart" then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, 0, -v.Size.Z)).p)
                            elseif v.Name == "Head" then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, v.Size.Y/2, v.Size.Z/1.25)).p)
                            elseif string.match(v.Name, "Left") then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(-v.Size.X/2, 0, 0)).p)
                            elseif string.match(v.Name, "Right") then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(v.Size.X/2, 0, 0)).p)
                            end
                            points[c] = p
                        end
                    end
                    local Left = GetClosest(points, Vector2.new(0, pos.Y))
                    local Right = GetClosest(points, Vector2.new(Camera.ViewportSize.X, pos.Y))
                    local Top = GetClosest(points, Vector2.new(pos.X, 0))
                    local Bottom = GetClosest(points, Vector2.new(pos.X, Camera.ViewportSize.Y))

                    if Left ~= nil and Right ~= nil and Top ~= nil and Bottom ~= nil then
                        Box.PointA = Vector2.new(Right.X, Top.Y)
                        Box.PointB = Vector2.new(Left.X, Top.Y)
                        Box.PointC = Vector2.new(Left.X, Bottom.Y)
                        Box.PointD = Vector2.new(Right.X, Bottom.Y)

                        Box.Visible = true
                    else 
						local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Esp been Disabled", 2, false)
                        Box.Visible = false
                    end
                else 
                    Box.Visible = false
                end
            else
                Box.Visible = false
                if game.Players:FindFirstChild(plr.Name) == nil then
                    c:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Update)()
end

for _,v in pairs(game:GetService("Players"):GetChildren()) do
    if v.Name ~= Player.Name then 
        DrawESP(v)
    end
end

game:GetService("Players").PlayerAdded:Connect(function(v)
    DrawESP(v)
end)
end)


Tab6Section:NewButton("Zombie" , "Plays Zombie Animation",function()
	local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Zombie Animation been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Ninja","Plays Ninja Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Ninja Animation Enabled", 2, true) -- false is off true is on
	loadstring(game:HttpGet("https://pastebin.com/raw/bwGLPVV7",true))()
	end)
	
	Tab6Section:NewButton("Robot","Plays Robot Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Robot Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
	end)
	
	Tab6Section:NewButton("Toy","Opens Toy Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Toy Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
	end)
	
	Tab6Section:NewButton("Levitation"," Levitation Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Levitation Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Astronaut" , "Astronaut Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Astronaut Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Bubbly" , "Bubbly Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Bubbly Animationhas been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
	Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
	Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Cartoony" , "Cartoony Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Cartoony Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Elder" , "Elder Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Elder Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Knight" , "Knight Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Knight Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Mage" , "Mage Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Mage Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Pirate" , "Pirate Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Pirate Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Stylish" , "Stylish Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Stylish Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Super Hero" , "Super Hero Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Super Hero has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Vampire" , "Vampire Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Vampire Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("WereWolf" , "WereWolf Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "WereWolf Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("CowBoy" , "CowBoy Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "CowBoy Animationhas been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	
	Tab6Section:NewButton("Patrol" , "Patrol Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Patrol Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Confident" , "Confident Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Confident Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("PopStar" , "PopStar Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "PopStar Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Ghost" , "Ghost Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Ghost Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
	Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616012453"
	Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616011509"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Sneaky" , "Sneaky Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Sneaky Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	Tab6Section:NewButton("Princess" , "Princess Animation",function()
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Princess Animation has been Enabled", 2, true) -- false is off true is on
	local Animate =
	game.Players.LocalPlayer.Character.Animate
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=941003647"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=941013098"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=941028902"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=941015281"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=941008832"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=940996062"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=941000007"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)

	local shopthingyshopshop = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2)
local oldnexttier
local oldtiered
local bypassstpidshoptiers = false
RenderSection:NewToggle("ShopTierBypass", "bypassesShopTierBypass", function(v)
	local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "ShopTierBypass has been Enabled", 2, true) -- false is off true is on
		if (bypassstpidshoptiers) then
            for i,v in pairs(shopthingyshopshop) do
                oldtiered = oldtiered or v.tiered
                oldnexttier = oldnexttier or v.nextTier
            end
            for i,v in pairs(shopthingyshopshop) do
                v.tiered = nil
                v.nextTier = nil
            end
    else
        for i,v in pairs(shopthingyshopshop) do
			v.tiered = oldtiered
			v.nextTier = oldnexttier
		end
    end
end)

WorldSection:NewToggle("Night", "Your Bedtime Little Boy", function(v)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Night has been Enabled", 2, true) -- false is off true is on
    if v then
        game.Lighting.TimeOfDay = "00:00:00"
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Night has been Disabled", 2, false)
        game.Lighting.TimeOfDay = "13:00:00"
    end
end)

WorldSection:NewToggle("Ocean", "Ocean", function(v)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Ocean has been Enabled", 2, true) -- false is off true is on
    if v then
        game.Lighting.Ambient = Color3.fromRGB(0,0,255)
        game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Ocean has been Disabled", 2, false)
        game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
    end
end)


 
    if v then
        wait(0.0)
            game.Lighting.Ambient = Color3.fromRGB(0, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

WorldSection:NewToggle("Grass", "Grass", function(v)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end
createnotification("Notification", "Grass has been Enabled", 2, true) -- false is off true is on

    if v then
        game.Lighting.Ambient = Color3.fromRGB(0,255,0)
        game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Grass has been Disabled", 2, false)
        game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
    end
end)


WorldSection:NewToggle("Blood", "Blood", function(v)
    local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "Blood has been Enabled", 2, true) -- false is off true is on
    if v then
         game.Lighting.Ambient = Color3.fromRGB(255,0,0)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end



createnotification("Notification", "Blood has been Disabled", 2, false)
        game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
    end
end)

WorldSection:NewToggle("RektskyAmbience", "RektskyAmbience", function(v)
local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "RektskyAmbienceed has been Enabled", 4, true)
    if v then
        wait(0.5)
            game.Lighting.Ambient = Color3.fromRGB(0, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    else
		local Guitwo = game.CoreGui.RektskyNotificationGui

local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if Guitwo:FindFirstChild("Background") then Guitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = Guitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end

createnotification("Notification", "RektskyAmbienceed has been Disabled", 2, false)
        game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
    end
end)
end
runcode(function()
	local antivoidp
end)

local AntiVoid = World:NewSection("AntiVoid")
AntiVoid:NewToggle("AntiVoid", "Give's you a second chance to get back on land", function(state)
	if state then
		antivoidp = Instance.new("Part", workspace)
		antivoidp.Name = "AntiVoid"
		antivoidp.CanCollide = true
		antivoidp.Size = Vector3.new(2048, 1, 2048)
		antivoidp.Anchored = true
		antivoidp.Transparency = 1 - (antivoidtransparent["Value"] / 100)
		antivoidp.Material = Enum.Material.Neon
		antivoidp.Color = Color3.fromHSV(antivoidcolor["Hue"], antivoidcolor["Sat"], antivoidcolor["Value"])
		antivoidp.Position = Vector3.new(0, 23.5, 0)
		antivoidp.Touched:connect(function(touchedvoid)
			if touchedvoid.Parent:FindFirstChild("Humanoid") and touchedvoid.Parent.Name == lplr.Name then
				lplr.Character.Humanoid.Jump = true
				lplr.Character.Humanoid:ChangeState("Jumping")
				wait(0.2)
				lplr.Character.Humanoid:ChangeState("Jumping")
				wait(0.2)
				lplr.Character.Humanoid:ChangeState("Jumping")
			end
		end)
	else
		if antivoidp then
			antivoidp:Remove()
		end
	end
end)

AntiVoid:NewColorPicker("Color", "Adjust antivoid color", Color3.fromHSV(antivoidcolor["Hue"], antivoidcolor["Sat"], antivoidcolor["Value"]), function(val)
	if antivoidp then
		antivoidp.Color = (val)
	end
end)

AntiVoid:NewSlider("Invisible 1-100", "Adjust antivoid transparency", 100, 0, function(val)
	if antivoidp then
		antivoidp.Transparency = 1 - (val / 100)
	end
end)

local UI = UI:NewSection("Colors")
for theme, color in pairs(colors) do
	UI:NewColorPicker(theme, "Change your "..theme, color, function(color3)
		kavoUi:ChangeColor(theme, color3)
	end)
end
