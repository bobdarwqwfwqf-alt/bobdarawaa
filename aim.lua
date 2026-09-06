-- This file was generated at discord.gg/syncrypt

local t1 = {}
local v2 = unpack or table.unpack
t1.value1 = game:GetService("Players")
t1.value2 = game:GetService("RunService")
t1.value3 = game:GetService("UserInputService")
t1.value4 = game:GetService("ReplicatedStorage")
t1.value5 = game:GetService("Debris")
t1.value6 = game:GetService("Lighting")
t1.value7 = game:GetService("HttpService")
t1.value8 = game:GetService("TeleportService")
t1.value9 = game:GetService("Workspace")
t1.value10 = t1.value1.LocalPlayer
t1.value11 = workspace.CurrentCamera
t1.value12 = t1.value10:WaitForChild("PlayerGui")
t1.value13 = require(t1.value4.Modules.Game.Sprint)
t1.value14 = nil
pcall(function()
    t1.value14 = require(t1.value4.Modules.Game.CrateSystem.Crate)
end)
t1.value15 = not t1.value3.TouchEnabled
t1.value16 = 1000000
t1.value17 = false
t1.value18 = 120
t1.value19 = true
t1.value20 = {}
t1.value21 = Color3.fromRGB(255, 35, 50)
t1.value22 = 1
t1.value23 = nil
t1.value24 = nil
t1.value25 = false
t1.value26 = false
t1.value27 = false
t1.value28 = false
t1.value29 = false
t1.value30 = false
t1.value31 = false
t1.value32 = false
t1.value33 = false
t1.value34 = false
t1.value35 = false
t1.value36 = false
t1.value37 = 1000
t1.value38 = 1
t1.value39 = false
t1.value40 = 2
t1.value41 = 0.05
t1.value42 = false
t1.value43 = 31.41592653589793
t1.value44 = false
t1.value45 = 0.08
t1.value46 = false
t1.value47 = 57
t1.value48 = 1
t1.value49 = false
t1.value50 = false
t1.value51 = 50
t1.value52 = false
t1.value53 = 10
t1.value54 = false
t1.value55 = false
t1.value56 = nil
t1.value57 = false
t1.value58 = {}
t1.value59 = nil
t1.value60 = {
	SprintBar = nil,
	OriginalSprintUpdate = nil,
	SprintLoop = nil
}
t1.value61 = nil
t1.value62 = {
	Loop = nil,
	Busy = false,
	LastUse = 0
}
t1.value63 = {}
t1.value64 = {}
t1.value65 = {
	LastCharacter = nil,
	LastBackpack = nil
}
t1.value66 = {
	Humanoid = nil,
	OriginalUseJumpPower = nil,
	OriginalJumpPower = nil,
	OriginalJumpHeight = nil,
	JumpConnection = nil,
	StateConnection = nil,
	DeathConnection = nil,
	HasDoubleJumped = false,
	HasLeftGround = false,
	Platform = nil
}
t1.value67 = {
	Connection = nil,
	BaseY = nil,
	Root = nil
}
t1.value68 = {
	Connection = nil
}
t1.value69 = {
	Connection = nil,
	Humanoid = nil,
	OriginalAutoRotate = nil
}
t1.value70 = {
	Connection = nil,
	HiddenCFrame = nil,
	ReturnCFrame = nil,
	Root = nil,
	Platform = nil,
	LastFlicker = 0,
	FlickerOutside = false
}
t1.value71 = nil
function t1.value71()
    if t1.value66.Platform then
        pcall(function()
            t1.value66.Platform:Destroy()
        end)
        t1.value66.Platform = nil
    end
end
function t1.value72()
    if t1.value66.JumpConnection then
        t1.value66.JumpConnection:Disconnect()
        t1.value66.JumpConnection = nil
    end

    if t1.value66.StateConnection then
        t1.value66.StateConnection:Disconnect()
        t1.value66.StateConnection = nil
    end

    if t1.value66.DeathConnection then
        t1.value66.DeathConnection:Disconnect()
        t1.value66.DeathConnection = nil
    end

    t1.value66.HasDoubleJumped = false
    t1.value66.HasLeftGround = false
    t1.value66.Humanoid = nil
    t1.value71()
end
t1.value73 = nil
t1.value74 = nil
function t1.value75(p1)
    t1.value71()

    if not p1 or not p1.Parent then
        return
    end

    local Part = Instance.new("Part")

    Part.Name = "FreddyDoubleJumpPlatform"
    Part.Size = Vector3.new(4.5, 0.18, 4.5)
    Part.CFrame = CFrame.new(p1.Position.X, p1.Position.Y - t1.value48, p1.Position.Z)
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.Material = Enum.Material.Neon
    Part.Color = Color3.fromRGB(255, 55, 55)
    Part.Transparency = 0.25
    Part.Parent = t1.value9
    t1.value66.Platform = Part
    task.delay(0.28, function()
        if t1.value66.Platform == Part then
            t1.value66.Platform = nil
            pcall(function()
                Part:Destroy()
            end)
        end
    end)
end
t1.value74 = nil
t1.value76 = nil
function t1.value76()
    t1.value72()

    if not t1.value46 then
        return
    end

    local Character = t1.value10.Character
    local v43 = Character and Character:FindFirstChildOfClass("Humanoid")

    if not v43 or v43.Health <= 0 then
        return
    end

    t1.value66.Humanoid = v43
    t1.value66.JumpConnection = t1.value3.JumpRequest:Connect(function()
        if not t1.value46 or (t1.value66.Humanoid ~= v43 or v43.Health <= 0) then
            return
        end

        local Character2 = t1.value10.Character
        local v617 = Character2 and Character2:FindFirstChild("HumanoidRootPart")

        if not v617 then
            return
        end

        local State = v43:GetState()

        if State == Enum.HumanoidStateType.Landed or (State == Enum.HumanoidStateType.Running or State == Enum.HumanoidStateType.RunningNoPhysics) then
            t1.value66.HasDoubleJumped = false
            t1.value66.HasLeftGround = false

            return
        end

        if State == Enum.HumanoidStateType.Freefall then
            t1.value66.HasLeftGround = true
        end

        if not t1.value66.HasLeftGround or State ~= Enum.HumanoidStateType.Freefall then
            return
        end

        if t1.value66.HasDoubleJumped then
            return
        end

        t1.value66.HasDoubleJumped = true

        local AssemblyLinearVelocity = v617.AssemblyLinearVelocity

        pcall(function()
            v43:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
        v617.AssemblyLinearVelocity = Vector3.new(AssemblyLinearVelocity.X, math.max(AssemblyLinearVelocity.Y, t1.value47), AssemblyLinearVelocity.Z)
        t1.value75(v617)
    end)
    t1.value66.StateConnection = v43.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Freefall then
            t1.value66.HasLeftGround = true

            return
        end

        if newState == Enum.HumanoidStateType.Landed or (newState == Enum.HumanoidStateType.Running or newState == Enum.HumanoidStateType.RunningNoPhysics) then
            t1.value66.HasDoubleJumped = false
            t1.value66.HasLeftGround = false
            t1.value71()
        end
    end)
    t1.value66.DeathConnection = v43.Died:Connect(function()
        if t1.value66.Humanoid ~= v43 then
            return
        end

        t1.value46 = false
        t1.value74()
        t1.value72()
    end)
end
function t1.value74()
    local Humanoid = t1.value66.Humanoid

    if Humanoid and Humanoid.Parent then
        pcall(function()
            if t1.value66.OriginalUseJumpPower ~= nil then
                Humanoid.UseJumpPower = t1.value66.OriginalUseJumpPower
            end

            if t1.value66.OriginalJumpPower ~= nil then
                Humanoid.JumpPower = t1.value66.OriginalJumpPower
            end

            if t1.value66.OriginalJumpHeight ~= nil then
                Humanoid.JumpHeight = t1.value66.OriginalJumpHeight
            end
        end)
    end

    t1.value66.Humanoid = nil
    t1.value66.OriginalUseJumpPower = nil
    t1.value66.OriginalJumpPower = nil
    t1.value66.OriginalJumpHeight = nil
end
function t1.value73()
    local Character = t1.value10.Character
    local v48 = Character and Character:FindFirstChildOfClass("Humanoid")

    if not v48 or v48.Health <= 0 then
        return
    end

    if v48 ~= t1.value66.Humanoid then
        t1.value74()
        t1.value66.Humanoid = v48
        t1.value66.OriginalUseJumpPower = v48.UseJumpPower
        t1.value66.OriginalJumpPower = v48.JumpPower
        t1.value66.OriginalJumpHeight = v48.JumpHeight
    end

    pcall(function()
        v48.UseJumpPower = true
        v48.JumpPower = t1.value47
    end)
end
function t1.value77(p3)
    t1.value46 = p3

    if not p3 then
        t1.value74()
        t1.value72()

        return
    end

    t1.value73()
    t1.value76()
end
function t1.value78()
    if t1.value68.Connection then
        t1.value68.Connection:Disconnect()
        t1.value68.Connection = nil
    end
end
function t1.value79(p4)
    t1.value39 = p4 == true
    t1.value78()

    if not t1.value39 then
        return
    end

    t1.value68.Connection = t1.value2.RenderStepped:Connect(function()
        if not t1.value39 then
            return
        end

        local Character = t1.value10.Character
        local v623 = Character and Character:FindFirstChildOfClass("Humanoid")
        local v624 = Character and Character:FindFirstChild("HumanoidRootPart")

        if not v623 or (v623.Health <= 0 or not v624) then
            return
        end

        local MoveDirection = v623.MoveDirection

        if MoveDirection.Magnitude > 0 then
            v624.CFrame = v624.CFrame + MoveDirection.Unit * (t1.value40 * t1.value41)
        end
    end)
end
function t1.value80()
    if t1.value69.Connection then
        t1.value69.Connection:Disconnect()
        t1.value69.Connection = nil
    end

    if t1.value69.Humanoid and (t1.value69.Humanoid.Parent and t1.value69.OriginalAutoRotate ~= nil) then
        pcall(function()
            t1.value69.Humanoid.AutoRotate = t1.value69.OriginalAutoRotate
        end)
    end

    t1.value69.Humanoid = nil
    t1.value69.OriginalAutoRotate = nil
end
function t1.value81(p5)
    t1.value42 = p5 == true
    t1.value80()

    if not t1.value42 then
        return
    end

    t1.value69.Connection = t1.value2.Heartbeat:Connect(function(dt)
        if not t1.value42 then
            return
        end

        local Character = t1.value10.Character
        local v633 = Character and Character:FindFirstChildOfClass("Humanoid")
        local v634 = Character and Character:FindFirstChild("HumanoidRootPart")

        if not v633 or (v633.Health <= 0 or not v634) then
            return
        end

        if v633 ~= t1.value69.Humanoid then
            if t1.value69.Humanoid and (t1.value69.Humanoid.Parent and t1.value69.OriginalAutoRotate ~= nil) then
                pcall(function()
                    t1.value69.Humanoid.AutoRotate = t1.value69.OriginalAutoRotate
                end)
            end

            t1.value69.Humanoid = v633
            t1.value69.OriginalAutoRotate = v633.AutoRotate
        end

        v633.AutoRotate = false

        local v635 = tonumber(dt) or 0.016666666666667

        v634.CFrame = v634.CFrame * CFrame.Angles(0, t1.value43 * v635, 0)
    end)
end
function t1.value82()
    local Character = t1.value10.Character
    local v54 = Character and Character:FindFirstChildOfClass("Humanoid")

    if not v54 then
        return false
    end

    if v54.Health <= 0 then
        return false
    end

    return v54:GetAttribute("HasBeenDowned") or v54:GetAttribute("IsDead")
end
function t1.value83()
    local Character = t1.value10.Character

    return Character and Character:FindFirstChild("HumanoidRootPart")
end
t1.value84 = nil
function t1.value84(p6, p7)
    local v51 = not p6

    if not v51 then
        v51 = not p6.Parent or not p7
    end

    if v51 then
        return false
    end

    local p6Parent = p6.Parent

    if not p6Parent:IsA("Model") then
        return false
    end

    p6Parent:PivotTo(p7 * p6Parent:GetPivot():ToObjectSpace(p6.CFrame):Inverse())
    p6.AssemblyLinearVelocity = Vector3.zero
    p6.AssemblyAngularVelocity = Vector3.zero

    return true
end
function t1.value85()
    if t1.value70.Platform then
        pcall(function()
            t1.value70.Platform:Destroy()
        end)
        t1.value70.Platform = nil
    end
end
local function v3()
    local v67 = t1.value83()

    if not v67 or not v67.Parent then
        return false
    end

    t1.value85()
    t1.value70.Root = v67
    t1.value70.ReturnCFrame = v67.CFrame

    local v68 = v67.Position + Vector3.new(0, 2, 0)
    local Part = Instance.new("Part")

    Part.Name = "FreddysAntiKillPlatform"
    Part.Size = Vector3.new(64, 0.35, 64)
    Part.CFrame = CFrame.new(v68)
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.Material = Enum.Material.SmoothPlastic
    Part.Color = Color3.fromRGB(185, 185, 195)
    Part.Transparency = 1
    Part.LocalTransparencyModifier = 1
    Part.CastShadow = false
    Part.Parent = workspace
    t1.value70.Platform = Part
    t1.value70.HiddenCFrame = CFrame.new(v68.X, v68.Y, v68.Z)

    return t1.value84(v67, t1.value70.HiddenCFrame)
end
function t1.value86(p8)
    local v61 = not p8
    local HiddenCFrame = t1.value70.HiddenCFrame

    if not v61 then
        v61 = not p8.Parent or not HiddenCFrame
    end

    if v61 then
        return
    end

    local elapsed = os.clock()

    if elapsed - t1.value70.LastFlicker < t1.value45 then
        return
    end

    t1.value70.LastFlicker = elapsed

    if t1.value70.FlickerOutside then
        t1.value84(p8, HiddenCFrame)
        t1.value70.FlickerOutside = false

        return
    end

    local v64 = math.random() * 3.141592653589793 * 2
    local v65 = Vector3.new(math.cos(v64), 0, (math.sin(v64))) * 30

    t1.value84(p8, HiddenCFrame + v65)
    t1.value70.FlickerOutside = true
end
function t1.value87()
    local v66 = t1.value83()

    if v66 and (v66 == t1.value70.Root and t1.value70.ReturnCFrame) then
        t1.value84(v66, t1.value70.ReturnCFrame)
    end

    t1.value85()
    t1.value70.HiddenCFrame = nil
    t1.value70.ReturnCFrame = nil
    t1.value70.Root = nil
    t1.value70.LastFlicker = 0
    t1.value70.FlickerOutside = false
end
t1.value88 = nil
function t1.value88()
    if t1.value70.Connection then
        t1.value70.Connection:Disconnect()
        t1.value70.Connection = nil
    end

    t1.value87()
end
function t1.value89(p9)
    t1.value44 = p9 == true
    t1.value88()

    if not t1.value44 then
        return
    end

    t1.value70.Connection = t1.value2.Heartbeat:Connect(function()
        if not t1.value44 then
            return
        end

        local v636 = t1.value83()

        if not v636 or not t1.value82() then
            t1.value87()

            return
        end

        if v636 ~= t1.value70.Root or (not t1.value70.Platform or not t1.value70.Platform.Parent) then
            t1.value87()

            if not v3() then
                return
            end
        end

        t1.value86(v636)
    end)
end
t1.value90 = nil
function t1.value90(p10, p11)
    if not p10 or not p10.Parent then
        return false
    end

    local v39 = p11 - t1.value53 - p10.Position.Y

    if math.abs(v39) > 0.01 then
        p10.CFrame = p10.CFrame * CFrame.new(0, v39, 0)
    end

    return true
end
function t1.value91()
    local Character = t1.value10.Character
    local v72 = Character and Character:FindFirstChild("HumanoidRootPart")

    if not v72 then
        return false
    end

    return t1.value90(v72, v72.Position.Y)
end
function t1.value92(p12)
    t1.value52 = p12 == true

    if t1.value67.Connection then
        t1.value67.Connection:Disconnect()
        t1.value67.Connection = nil
    end

    t1.value67.BaseY = nil
    t1.value67.Root = nil

    if not t1.value52 then
        return
    end

    local Character = t1.value10.Character
    local v58 = Character and Character:FindFirstChild("HumanoidRootPart")

    if not v58 then
        return
    end

    t1.value67.Root = v58
    t1.value67.BaseY = v58.Position.Y
    t1.value67.Connection = t1.value2.Heartbeat:Connect(function()
        if not t1.value52 then
            return
        end

        local Character3 = t1.value10.Character
        local v627 = Character3 and Character3:FindFirstChildOfClass("Humanoid")
        local v628 = Character3 and Character3:FindFirstChild("HumanoidRootPart")
        local v629 = not v627

        if not v629 then
            v629 = v627.Health <= 0 or (not v628 or v628 ~= t1.value67.Root)
        end

        if v629 then
            return
        end

        local v630 = t1.value67.BaseY - t1.value53 - v628.Position.Y

        if math.abs(v630) > 0.01 then
            v628.CFrame = v628.CFrame * CFrame.new(0, v630, 0)
        end
    end)
end
function t1.value93()
    local Character = t1.value10.Character
    local v21 = Character and Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = t1.value9:FindFirstChild("Vehicles")

    if not v21 or not Vehicles then
        return false
    end

    local GetChildren = Vehicles.GetChildren

    for _, v in ipairs(GetChildren(Vehicles)) do
        local v26 = v

        if v26:IsA("Model") and v26:GetAttribute("OwnerUserId") == t1.value10.UserId then
            return (pcall(function()
                v26:PivotTo(v21.CFrame * CFrame.new(0, 5, -5))
            end))
        end
    end

    return false
end
function t1.value94(p13)
    local v30 = type(getupvalue) == "function" and getupvalue

    if v30 then
        local ok, result, v33 = pcall(v30, p13, 2)

        if ok then
            if type(result) == "table" then
                return result
            end

            if type(v33) == "table" then
                return v33
            end
        end
    end

    if debug and type(debug.getupvalue) == "function" then
        local success, result, v36 = pcall(debug.getupvalue, p13, 2)
        if success then
            if type(result) == "table" then
                return result
            end

            if type(v36) == "table" then
                return v36
            end
        end
    end

    return nil
end
function t1.value95()
    if t1.value60.SprintLoop then
        pcall(function()
            task.cancel(t1.value60.SprintLoop)
        end)
        t1.value60.SprintLoop = nil
    end

    if t1.value61 then
        pcall(function()
            t1.value61(false)
        end)
    end

    local SprintBar = t1.value60.SprintBar
    local OriginalSprintUpdate = t1.value60.OriginalSprintUpdate

    if SprintBar and OriginalSprintUpdate then
        pcall(function()
            SprintBar.update = OriginalSprintUpdate
        end)
    end

    t1.value60.SprintBar = nil
    t1.value60.OriginalSprintUpdate = nil
end
local function v4(p14)
    t1.value49 = p14 == true
    t1.value95()

    if not t1.value49 then
        return
    end

    local v74 = t1.value13 and t1.value13.consume_stamina
    local v75 = v74 and t1.value94(v74)
    local v76 = v75 and v75.sprint_bar

    if not v76 or type(v76.update) ~= "function" then
        t1.value49 = false

        return
    end

    local update = v76.update

    t1.value60.SprintBar = v76
    t1.value60.OriginalSprintUpdate = update

    function v76.update(...)
        return update(function()
            return 1
        end)
    end

    t1.value60.SprintLoop = task.spawn(function()
        while t1.value49 do
            pcall(function()
                if t1.value61 then
                    t1.value61(true)
                end
            end)
            task.wait(0.5)

            if not t1.value49 then
                break
            end

            pcall(function()
                if t1.value61 then
                    t1.value61(false)
                end
            end)
            task.wait(0.1)
        end

        pcall(function()
            if t1.value61 then
                t1.value61(false)
            end
        end)
    end)
end
t1.value96 = {
	"HealthRestoreAmount",
	"HealAmount",
	"HealthAmount",
	"RestoreHealth",
	"HealthRestore",
	"RestoreAmount",
	"HealingAmount",
	"Medical",
	"Healing",
	"Heal"
}
t1.value97 = {
	"bloodbag",
	"bloodvial",
	"bloodpack",
	"medkit",
	"medicalkit",
	"medic",
	"firstaid",
	"bandage",
	"healing",
	"health"
}
function t1.value98(p15)
    local lower = string.lower
    local _tostring = tostring

    if not p15 then
        p15 = ""
    end

    return lower(_tostring(p15)):gsub("[^%w]", "")
end
t1.value99 = nil
function t1.value99(p16)
    if not p16 then
        return 0
    end

    for _, v in ipairs(t1.value96) do
        local num = tonumber((p16:GetAttribute(v)))

        if num and num > 0 then
            return num
        end
    end

    return 0
end
function t1.value100(p17)
    if not p17 or not p17:IsA("Tool") then
        return false
    end

    if t1.value99(p17) > 0 then
        return true
    end

    local concat = table.concat
    local str = tostring(p17.Name or "")
    local str2 = tostring(p17:GetAttribute("DisplayName") or "")
    local str3 = tostring(p17:GetAttribute("ItemName") or "")
    local GetAttribute = p17.GetAttribute
    local v91 = concat({
		str,
		str2,
		str3,
		tostring(GetAttribute(p17, "ItemType") or ""),
		tostring(p17:GetAttribute("Category") or ""),
		tostring(p17.ToolTip or "")
	}, " ")
    local v92 = t1.value98(v91)
    local v93, v94, v95 = ipairs(t1.value97)

    repeat
        local v96

        v95, v96 = v93(v94, v95)

        if not v95 then
            for _, v in ipairs({
				"Medical",
				"Healing",
				"IsHealing",
				"ConsumableType"
			}) do
                local v9 = p17:GetAttribute(v)

                if v9 == true or (string.find(t1.value98(v9), "heal", 1, true) or string.find(t1.value98(v9), "medical", 1, true)) then
                    return true
                end
            end

            return false
        end
    until string.find(v92, v96, 1, true)

    return true
end
local function v5(p18)
    if not p18 then
        return nil
    end
    local v101
    local n1 = 0
    for _, child in ipairs(p18:GetChildren()) do
        if t1.value100(child) then
            local v105 = t1.value99(child)

            if not v101 or n1 < v105 then
                v101 = child
                n1 = v105
            end
        end
    end

    return v101
end
t1.value101 = nil
function t1.value101(p19)
    if not p19 then
        return
    end

    local GetDescendants = p19.GetDescendants

    for _, v in ipairs(GetDescendants(p19)) do
        if v:IsA("Animator") then
            for _, v10 in ipairs(v:GetPlayingAnimationTracks()) do
                local v113 = v10
                local v114 = string.lower((tostring(v113.Name or "")))
                local Animation = v113.Animation

                if Animation then
                    v114 ..= " " .. string.lower((tostring(Animation.Name or "")))
                end

                local v116 = string.find(v114, "heal", 1, true)

                if not v116 then
                    v116 = string.find(v114, "med", 1, true)

                    if not v116 then
                        v116 = string.find(v114, "blood", 1, true)

                        if not v116 then
                            v116 = string.find(v114, "bandage", 1, true) or (string.find(v114, "use", 1, true) or string.find(v114, "consume", 1, true))
                        end
                    end
                end

                local v117 = v113.Priority == Enum.AnimationPriority.Action

                if not v117 then
                    v117 = v113.Priority == Enum.AnimationPriority.Action2 or (v113.Priority == Enum.AnimationPriority.Action3 or v113.Priority == Enum.AnimationPriority.Action4)
                end

                if v116 or v117 then
                    pcall(function()
                        v113:Stop(0)
                    end)
                end
            end
        end
    end
end
function t1.value102(p20, p21)
    if not t1.value28 or not t1.value100(p20) then
        return
    end

    local v120 = tick() + 0.65

    while t1.value28 and v120 > tick() do
        t1.value101(p21)
        t1.value101(p20)
        task.wait()
    end
end
t1.value103 = {
	Token = 0,
	AnimatorConnection = nil,
	CharacterConnection = nil
}
local function v6()
    if t1.value103.AnimatorConnection then
        pcall(function()
            t1.value103.AnimatorConnection:Disconnect()
        end)
        t1.value103.AnimatorConnection = nil
    end

    if t1.value103.CharacterConnection then
        pcall(function()
            t1.value103.CharacterConnection:Disconnect()
        end)
        t1.value103.CharacterConnection = nil
    end
end
function t1.value104(p22)
    if not p22 then
        return false
    end

    local GetChildren = p22.GetChildren

    for _, v in ipairs(GetChildren(p22)) do
        if t1.value100(v) then
            return true
        end
    end

    return false
end
function t1.value105(p23, p24)
    if not p23 or (not t1.value28 or p24 ~= t1.value103.Token) then
        return
    end

    local Humanoid = p23:FindFirstChildOfClass("Humanoid")
    local v142 = Humanoid and Humanoid:FindFirstChildOfClass("Animator") or Humanoid:WaitForChild("Animator", 2)

    if not v142 then
        return
    end

    t1.value103.AnimatorConnection = v142.AnimationPlayed:Connect(function()
        if not t1.value28 or (p24 ~= t1.value103.Token or not t1.value104(p23)) then
            return
        end

        task.defer(function()
            if t1.value28 and t1.value104(p23) then
                local v926 = p23

                t1.value101(v926)
            end
        end)
    end)
end
function t1.value106(p25)
    t1.value28 = p25 == true

    local value103 = t1.value103

    value103.Token = value103.Token + 1

    local Token = t1.value103.Token

    v6()

    if not t1.value28 then
        return
    end

    t1.value105(t1.value10.Character, Token)
    t1.value103.CharacterConnection = t1.value10.CharacterAdded:Connect(function(character)
        if not t1.value28 or Token ~= t1.value103.Token then
            return
        end

        task.wait(0.2)

        if not t1.value28 or Token ~= t1.value103.Token then
            return
        end

        if t1.value103.AnimatorConnection then
            pcall(function()
                t1.value103.AnimatorConnection:Disconnect()
            end)
            t1.value103.AnimatorConnection = nil
        end

        t1.value105(character, Token)
    end)
end
function t1.value107(p26)
    if t1.value62.Busy then
        return
    end

    if tick() - t1.value62.LastUse < 0.5 then
        return
    end

    local Character = t1.value10.Character
    local Backpack = t1.value10:FindFirstChildOfClass("Backpack")

    if not Character or (not Backpack or not p26) then
        return
    end

    t1.value62.Busy = true
    t1.value62.LastUse = tick()

    local Tool = Character:FindFirstChildOfClass("Tool")

    pcall(function()
        p26.Parent = Character
    end)
    task.wait(0.05)
    pcall(function()
        p26:Activate()
    end)

    if t1.value28 and t1.value100(p26) then
        task.spawn(function()
            t1.value102(p26, Character)
        end)
    end

    task.wait(0.05)
    task.wait(0.2)
    pcall(function()
        if p26 and p26.Parent == Character then
            p26.Parent = Backpack
        end
    end)

    if Tool and Character == Tool.Parent then
        Tool.Parent = Backpack
    end

    t1.value62.Busy = false
end
function t1.value108()
    if t1.value62.Loop then
        pcall(function()
            task.cancel(t1.value62.Loop)
        end)
        t1.value62.Loop = nil
    end

    t1.value62.Busy = false
end
function t1.value109(p27)
    local v152 = string.lower((tostring(p27)))
    local v153 = string.find(v152, "recoil", 1, true)

    if not v153 then
        v153 = string.find(v152, "kick", 1, true)

        if not v153 then
            v153 = string.find(v152, "camera_shake", 1, true) or (string.find(v152, "camerashake", 1, true) or string.find(v152, "spread", 1, true))
        end
    end

    return v153
end
function t1.value110()

    for v127, v128 in pairs(t1.value63) do

        local v129 = v127
        local v130 = v128
        local v131 = v129

        if v131 then
            v131 = v129.Parent
        end

        if v131 then
            pcall(function()
                v129.Value = v130
            end)
        end

        t1.value63[v129] = nil
    end
    for k, v in pairs(t1.value64) do
        local v134 = k
        local v135 = v134

        if v135 then
            v135 = v134.Parent
        end

        if v135 then
            for k2, v11 in pairs(v) do
                local v138 = v11

                pcall(function()
                    v134:SetAttribute(k2, v138)
                end)
            end
        end

        t1.value64[v134] = nil
    end
end
t1.value111 = nil
function t1.value111(p28)
    if not p28 then
        return
    end

    for k, v in pairs(p28:GetAttributes()) do
        local v157 = k
        local v158 = v
        local v159 = t1.value109(v157)

        if v159 then
            v159 = type(v158) == "number" or (typeof(v158) == "Vector3" or typeof(v158) == "CFrame")
        end

        if v159 then
            t1.value64[p28] = t1.value64[p28] or {}

            if t1.value64[p28][v157] == nil then
                t1.value64[p28][v157] = v158
            end

            pcall(function()
                local v641 = if typeof(v158) ~= "Vector3" then typeof(v158) ~= "CFrame" and 0 or CFrame.identity else Vector3.zero

                if v641 ~= p28:GetAttribute(v157) then
                    p28:SetAttribute(v157, v641)
                end
            end)
        end
    end
end
function t1.value112(p29)
    if not p29 then
        return
    end

    t1.value111(p29)

    for _, descendant in ipairs(p29:GetDescendants()) do
        local v163 = descendant
        local v164 = t1.value109(v163.Name)

        if v164 then
            v164 = v163:IsA("NumberValue")

            if not v164 then
                v164 = v163:IsA("IntValue")

                if not v164 then
                    v164 = v163:IsA("Vector3Value") or (v163:IsA("CFrameValue") or v163:IsA("BoolValue"))
                end
            end
        end

        if v164 then
            if t1.value63[v163] == nil then
                t1.value63[v163] = v163.Value
            end

            pcall(function()
                local v642 = v163:IsA("Vector3Value") and Vector3.zero or (v163:IsA("CFrameValue") and CFrame.identity or (not v163:IsA("BoolValue") and 0 or 0))

                if v642 ~= v163.Value then
                    v163.Value = v642
                end
            end)
        end

        t1.value111(v163)
    end
end
local function v7(p30)
    t1.value34 = p30
    t1.value65.LastCharacter = nil
    t1.value65.LastBackpack = nil

    if not p30 then
        t1.value110()

        return
    end

    local Character = t1.value10.Character
    local Backpack = t1.value10:FindFirstChildOfClass("Backpack")

    t1.value112(Character)
    t1.value112(Backpack)
end
t1.value113 = {
	LastCharacter = nil,
	LastBackpack = nil
}
function t1.value114()
    local Items = t1.value4:FindFirstChild("Items")

    return Items and Items:FindFirstChild("gun")
end
local function v8(p31)
    if not p31 or not p31:IsA("Tool") then
        return false
    end

    local v170 = t1.value114()

    if v170 then
        v170 = v170:FindFirstChild(p31.Name) ~= nil
    end

    return v170 or (p31.Name:match("Gun") ~= nil or p31:FindFirstChild("Handle") ~= nil)
end
function t1.value115(p32)
    if not v8(p32) then
        return
    end

    pcall(function()
        p32:SetAttribute("fire_rate", t1.value37)
        p32:SetAttribute("accuracy", t1.value38)
    end)
end
function t1.value116(p33)
    if not p33 then
        return
    end

    for _, child in ipairs(p33:GetChildren()) do
        if child:IsA("Tool") then
            t1.value115(child)
        end
    end
end
function t1.value117()
    t1.value116(t1.value10.Character)
    t1.value116(t1.value10:FindFirstChildOfClass("Backpack"))
end
local t3 = {
	Token = 0
}
t1.value118 = nil
t1.value118 = t3
function t1.value119(p34)
    t1.value27 = p34 == true
    t1.value118.Token = t1.value118.Token + 1

    local Token = t1.value118.Token

    if not t1.value27 then
        pcall(function()
            if t1.value14 and (t1.value14.skipping and t1.value14.skipping.set) then
                t1.value14.skipping.set(false)
            end
        end)

        return
    end

    task.spawn(function()
        while t1.value27 and Token == t1.value118.Token do
            task.wait()

            if t1.value14 and (t1.value14.class and t1.value14.class.objects) then
                for _, v in pairs(t1.value14.class.objects) do
                    local v645 = v

                    pcall(function()
                        if v645.states and (v645.states.open and v645.states.open.set) then
                            v645.states.open.set(true)
                        end

                        if t1.value14.skipping and t1.value14.skipping.set then
                            t1.value14.skipping.set(true)
                        end
                    end)
                end
            end

            local value14 = t1.value14

            if value14 then
                value14 = t1.value14.spinning and (t1.value14.skip_spin and not t1.value14.spinning.get())
            end

            if value14 then
                pcall(function()
                    t1.value14.skip_spin()
                end)
            end
        end
    end)
end
t1.value120 = 0.2
t1.value121 = 0.12
t1.value122 = {
	Objects = {},
	PlayerConnections = {},
	PlayerAddedConnection = nil,
	PlayerRemovingConnection = nil,
	RenderConnection = nil
}
function t1.value123()
    if t1.value122.PlayerAddedConnection then
        t1.value122.PlayerAddedConnection:Disconnect()
        t1.value122.PlayerAddedConnection = nil
    end
    if t1.value122.PlayerRemovingConnection then
        t1.value122.PlayerRemovingConnection:Disconnect()
        t1.value122.PlayerRemovingConnection = nil
    end
    if t1.value122.RenderConnection then
        t1.value122.RenderConnection:Disconnect()
        t1.value122.RenderConnection = nil
    end
    for v179, v180 in pairs(t1.value122.PlayerConnections) do
        for v183, v184 in pairs(v180) do

            local v185 = v184

            pcall(function()
                v185:Disconnect()
            end)
        end
        t1.value122.PlayerConnections[v179] = nil
    end
    for k, v in pairs(t1.value122.Objects) do
        local v188 = v

        if v188.Board then
            pcall(function()
                v188.Board:Destroy()
            end)
        end

        t1.value122.Objects[k] = nil
    end
end
t1.value124 = {
	GlobalShadows = true,
	EnvDiffuse = 1,
	EnvSpecular = 1,
	Lights = {},
	Effects = {},
	Visuals = {},
	Terrain = nil,
	QualityLevel = nil,
	Busy = false,
	Pending = nil
}
t1.value125 = nil
function t1.value125(p35)
    if t1.value124.Busy then
        t1.value124.Pending = p35

        return
    end

    t1.value124.Busy = true
    t1.value124.Pending = nil
    t1.value33 = p35
    task.spawn(function()
        local Terrain = workspace:FindFirstChildOfClass("Terrain")

        if p35 then
            t1.value124.GlobalShadows = t1.value6.GlobalShadows
            t1.value124.EnvDiffuse = t1.value6.EnvironmentDiffuseScale
            t1.value124.EnvSpecular = t1.value6.EnvironmentSpecularScale
            t1.value124.QualityLevel = nil
            pcall(function()
                t1.value124.QualityLevel = settings().Rendering.QualityLevel
            end)
            t1.value124.Lights = {}
            t1.value124.Effects = {}
            t1.value124.Visuals = {}
            t1.value124.Terrain = nil
            t1.value6.GlobalShadows = false
            t1.value6.EnvironmentDiffuseScale = 0
            t1.value6.EnvironmentSpecularScale = 0
            local function v648()
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            end
            pcall(v648)
            for _, child in ipairs(t1.value6:GetChildren()) do
                local v651 = child

                pcall(function()
                    local v927 = v651:IsA("BlurEffect")

                    if not v927 then
                        v927 = v651:IsA("SunRaysEffect")

                        if not v927 then
                            v927 = v651:IsA("ColorCorrectionEffect")

                            if not v927 then
                                v927 = v651:IsA("BloomEffect") or (v651:IsA("DepthOfFieldEffect") or v651:IsA("Atmosphere"))
                            end
                        end
                    end

                    if v927 then
                        t1.value124.Effects[v651] = v651.Enabled
                        v651.Enabled = false
                    end
                end)
            end
            for v654, v655 in ipairs(workspace:GetDescendants()) do

                local v656 = v655

                pcall(function()
                    local v928 = v656:IsA("ParticleEmitter")

                    if not v928 then
                        v928 = v656:IsA("Trail")

                        if not v928 then
                            v928 = v656:IsA("Smoke") or (v656:IsA("Fire") or v656:IsA("Sparkles"))
                        end
                    end

                    if v928 then
                        t1.value124.Effects[v656] = v656.Enabled
                        v656.Enabled = false

                        return
                    end

                    if v656:IsA("PointLight") or (v656:IsA("SpotLight") or v656:IsA("SurfaceLight")) then
                        t1.value124.Lights[v656] = v656.Enabled
                        v656.Enabled = false

                        return
                    end

                    if v656:IsA("BasePart") then
                        local Visuals = t1.value124.Visuals
                        local v930 = v656
                        local CastShadow = v656.CastShadow
                        local Reflectance = v656.Reflectance
                        local Material = v656.Material

                        Visuals[v930] = {
							kind = "BasePart",
							CastShadow = CastShadow,
							Reflectance = Reflectance,
							Material = Material
						}
                        v656.CastShadow = false
                        v656.Reflectance = 0
                        v656.Material = Enum.Material.SmoothPlastic

                        return
                    end

                    if (v656:IsA("Decal") or v656:IsA("Texture")) and v656.Transparency < 1 then
                        local Visuals = t1.value124.Visuals
                        local v935 = v656
                        local Transparency = v656.Transparency

                        Visuals[v935] = {
							kind = "Texture",
							Transparency = Transparency
						}
                        v656.Transparency = 1
                    end
                end)
                v648 += 1

                if v648 >= 350 then
                    task.wait()
                end
            end
            if Terrain then
                local value124 = t1.value124
                local WaterWaveSize = Terrain.WaterWaveSize
                local WaterWaveSpeed = Terrain.WaterWaveSpeed
                local WaterReflectance = Terrain.WaterReflectance
                local WaterTransparency = Terrain.WaterTransparency

                value124.Terrain = {
					WaterWaveSize = WaterWaveSize,
					WaterWaveSpeed = WaterWaveSpeed,
					WaterReflectance = WaterReflectance,
					WaterTransparency = WaterTransparency
				}
                Terrain.WaterWaveSize = 0
                Terrain.WaterWaveSpeed = 0
                Terrain.WaterReflectance = 0
                Terrain.WaterTransparency = 1
            end
        else
            t1.value6.GlobalShadows = t1.value124.GlobalShadows
            t1.value6.EnvironmentDiffuseScale = t1.value124.EnvDiffuse
            t1.value6.EnvironmentSpecularScale = t1.value124.EnvSpecular
            for v664, v665 in pairs(t1.value124.Effects) do

                local v666 = v664
                local v667 = v665

                if v666 and v666.Parent then
                    pcall(function()
                        v666.Enabled = v667
                    end)
                end
            end
            for k, v in pairs(t1.value124.Lights) do
                local v670 = k
                local v671 = v

                if v670 and v670.Parent then
                    pcall(function()
                        v670.Enabled = v671
                    end)
                end
            end
            for v674, v675 in pairs(t1.value124.Visuals) do

                local v676 = v674
                local v677 = v675

                if v676 and v676.Parent then
                    pcall(function()
                        if v677.kind == "BasePart" then
                            v676.CastShadow = v677.CastShadow
                            v676.Reflectance = v677.Reflectance
                            v676.Material = v677.Material

                            return
                        end

                        if v677.kind == "Texture" then
                            v676.Transparency = v677.Transparency
                        end
                    end)
                end
            end
            if t1.value124.QualityLevel then
                pcall(function()
                    settings().Rendering.QualityLevel = t1.value124.QualityLevel
                end)
            end
            if Terrain and t1.value124.Terrain then
                pcall(function()
                    Terrain.WaterWaveSize = t1.value124.Terrain.WaterWaveSize
                    Terrain.WaterWaveSpeed = t1.value124.Terrain.WaterWaveSpeed
                    Terrain.WaterReflectance = t1.value124.Terrain.WaterReflectance
                    Terrain.WaterTransparency = t1.value124.Terrain.WaterTransparency
                end)
            end
        end

        t1.value124.Busy = false

        if t1.value124.Pending ~= nil and t1.value124.Pending ~= p35 then
            local Pending = t1.value124.Pending

            t1.value124.Pending = nil
            t1.value125(Pending)
        end
    end)
end
t1.value126 = false
t1.value127 = 20
t1.value128 = {}
t1.value129 = t1.value4:FindFirstChild("Remotes")
t1.value130 = nil
t1.value131 = nil
t1.value132 = nil
t1.value133 = 0
t1.value131 = 2
function t1.value134(p36)
    t1.value126 = p36
    t1.value26 = p36

    if not p36 then
        t1.value128 = {}
    end
end
function t1.value132()
    for _, v in ipairs(getgc and getgc(true) or {}) do
        if typeof(v) == "table" and (rawget(v, "event") and rawget(v, "func")) then
            return v
        end
    end

    return nil
end
t1.value130 = t1.value132()
function t1.value61(p37)
    t1.value129 = t1.value129 or t1.value4:FindFirstChild("Remotes")

    local v203 = t1.value129 and t1.value129:FindFirstChild("Send")

    if not t1.value130 and t1.value132 then
        t1.value130 = t1.value132()
    end

    if not v203 or not t1.value130 then
        return false
    end

    t1.value130.event = (tonumber(t1.value130.event) or 0) + 1

    return (pcall(function()
        v203:FireServer(t1.value130.event, "set_sprinting_1", p37 == true)
    end))
end
function t1.value135(...)
    t1.value129 = t1.value129 or t1.value4:FindFirstChild("Remotes")

    local elapsed = os.clock()

    if not t1.value130 and (t1.value132 and elapsed >= t1.value133) then
        t1.value130 = t1.value132()

        local _ = elapsed + t1.value131
    end

    if not t1.value130 or not t1.value129 then
        return
    end

    local t4 = { ... }

    for i, v in ipairs(t4) do
        if not (typeof(v) == "Instance" and (v:IsA("Model") and #v:GetChildren() == 0)) then
            continue
        end

        local DroppedItems = t1.value9:FindFirstChild("DroppedItems")

        if not DroppedItems then
            return
        end

        local Model = DroppedItems:FindFirstChildWhichIsA("Model")

        if not Model then
            return
        end

        t4[i] = Model
    end

    t1.value130.func = (t1.value130.func or 0) + 1

    local _, result = pcall(function()
        local Get = t1.value129:WaitForChild("Get")
        local func = t1.value130.func
        local t5 = { unpack(t4) }

        return Get:InvokeServer(func, v2(t5))
    end)

    return result
end
function t1.value136()
    if not t1.value126 then
        return
    end

    local Character = t1.value10.Character

    if not Character then
        return
    end

    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        return
    end

    local DroppedItems = t1.value9:FindFirstChild("DroppedItems")

    if not DroppedItems then
        return
    end

    local v207 = t1.value127 * t1.value127
    local HumanoidRootPartPosition = HumanoidRootPart.Position
    local GetChildren = DroppedItems.GetChildren

    for _, v in ipairs(GetChildren(DroppedItems)) do
        local v212 = v

        if v212:IsA("Model") then
            local BasePart = v212:FindFirstChildWhichIsA("BasePart")

            if BasePart then
                local v214 = HumanoidRootPartPosition - BasePart.Position

                if v207 >= v214:Dot(v214) and not t1.value128[v212] then
                    t1.value128[v212] = true
                    task.spawn(function()
                        t1.value135("pickup_dropped_item", v212)
                    end)
                end
            end
        end
    end
end
task.spawn(function()
    while task.wait(0.2) do
        if t1.value126 then
            t1.value136()
        end
    end
end)
t1.value137 = nil
t1.value137 = false
function t1.value138()
    local Character = t1.value10.Character

    if not Character then
        return
    end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    if Humanoid then
        Humanoid.NameDisplayDistance = not t1.value25 and 100 or 0
        Humanoid.HealthDisplayDistance = not t1.value25 and 100 or 0
    end

    for _, v in pairs({
		"Head",
		"HumanoidRootPart"
	}) do
        local v12 = Character:FindFirstChild(v)

        if v12 then
            local GetChildren = v12.GetChildren

            for _, v13 in pairs(GetChildren(v12)) do
                if v13:IsA("BillboardGui") and v13.Name ~= "ItemESP" then
                    v13.Enabled = not t1.value25
                end
            end
        end
    end

    t1.value137 = t1.value25
end
task.spawn(function()
    while true do
        if t1.value25 ~= t1.value137 then
            t1.value138()
        elseif t1.value25 then
            local Character = t1.value10.Character
            local v224 = Character and Character:FindFirstChildOfClass("Humanoid")

            if v224 and v224.NameDisplayDistance ~= 0 then
                v224.NameDisplayDistance = 0
                v224.HealthDisplayDistance = 0
            end
        end

        task.wait(0.5)
    end
end)
t1.value139 = nil
t1.value140 = false
t1.value141 = false
t1.value139 = {}
t1.value142 = {}
function t1.value143()
    for k, v in pairs(t1.value139) do
        local v227 = v

        if v227.circle then
            pcall(function()
                v227.circle:Remove()
            end)
        end

        if v227.innerCircle then
            pcall(function()
                v227.innerCircle:Remove()
            end)
        end

        if v227.name then
            pcall(function()
                v227.name:Remove()
            end)
        end

        if v227.amount then
            pcall(function()
                v227.amount:Remove()
            end)
        end

        if v227.highlight then
            pcall(function()
                v227.highlight:Destroy()
            end)
        end

        t1.value139[k] = nil
    end
end
local color3 = Color3.fromRGB(255, 255, 255)
local color3_2 = Color3.fromRGB(99, 255, 52)
local color3_3 = Color3.fromRGB(51, 170, 255)
local color3_4 = Color3.fromRGB(237, 44, 255)
local color3_5 = Color3.fromRGB(255, 150, 0)
local color3_6 = Color3.fromRGB(255, 20, 51)

t1.value144 = {
	Common = color3,
	Uncommon = color3_2,
	Rare = color3_3,
	Epic = color3_4,
	Legendary = color3_5,
	Omega = color3_6
}
function t1.value145(p38)
    local Handle = p38:FindFirstChild("Handle")
    local v231 = p38:GetAttribute("DisplayName") or p38.Name
    local v232 = p38:GetAttribute("ItemId") or (p38:GetAttribute("Id") or p38.Name)
    local v233 = p38:GetAttribute("RarityName") or "Common"

    if Handle then
        local SpecialMesh = Handle:FindFirstChildOfClass("SpecialMesh")

        if SpecialMesh and SpecialMesh.MeshId ~= "" then
            return SpecialMesh.MeshId .. (SpecialMesh.TextureId or "" .. "_RARITY_" .. v233)
        end

        if Handle:IsA("MeshPart") and Handle.MeshId ~= "" then
            return Handle.MeshId .. (Handle.TextureID or "" .. "_RARITY_" .. v233)
        end
    end

    if v232 ~= "" and v232 ~= p38.Name then
        return "ITEMID_" .. v232 .. "_RARITY_" .. v233
    end

    return "NAME_" .. v231 .. "_" .. p38.Name .. "_RARITY_" .. v233
end
t1.value146 = {}
task.defer(function()
    local Items = t1.value4:FindFirstChild("Items")

    if not Items then
        return
    end

    for _, v in ipairs({
		"gun",
		"melee",
		"throwable",
		"consumable",
		"farming",
		"misc",
		"rod",
		"fish"
	}) do
        local v14 = Items:FindFirstChild(v)

        if v14 then
            local GetChildren = v14.GetChildren

            for _, v15 in ipairs(GetChildren(v14)) do
                if v15:IsA("Tool") then
                    local v242 = v15:GetAttribute("DisplayName") or v15.Name
                    local v243 = v15:GetAttribute("RarityName") or "Common"
                    local v244 = v15:GetAttribute("ImageId") or "rbxassetid://7072725737"

                    t1.value146[t1.value145(v15)] = {
						Name = v242,
						Rarity = v243,
						ImageId = v244
					}
                end
            end
        end
    end
end)

function t1.value147(p39)
    if p39.Name == "Money" then
        return Color3.fromRGB(0, 255, 0)
    end

    local v250 = p39:GetAttribute("RarityName") or p39:GetAttribute("Rarity")
    local v251 = p39.Name .. "|" .. tostring(v250 or "")

    if t1.value142[v251] then
        return t1.value142[v251]
    end

    if v250 and t1.value144[v250] then
        local v252 = t1.value144[v250]

        t1.value142[v251] = v252

        return t1.value144[v250]
    end

    local Items = t1.value4:FindFirstChild("Items")

    if Items then
        local GetChildren = Items.GetChildren

        for _, v in ipairs(GetChildren(Items)) do
            if not v:IsA("Folder") then
                continue
            end

            local p39Name = v:FindFirstChild(p39.Name)

            if p39Name and p39Name:GetAttribute("RarityName") then
                local v258 = t1.value144[p39Name:GetAttribute("RarityName")] or Color3.fromRGB(255, 255, 255)

                t1.value142[v251] = v258

                return v258
            end
        end
    end

    local color3_7 = Color3.fromRGB(255, 255, 255)

    t1.value142[v251] = color3_7

    return color3_7
end
function t1.value148()
    for k, v in pairs(t1.value139) do
        local v247 = k
        local v248 = v

        if not v247.Parent then
            if v248.circle then
                pcall(function()
                    v248.circle:Remove()
                end)
            end

            if v248.innerCircle then
                pcall(function()
                    v248.innerCircle:Remove()
                end)
            end

            if v248.name then
                pcall(function()
                    v248.name:Remove()
                end)
            end

            if v248.amount then
                pcall(function()
                    v248.amount:Remove()
                end)
            end

            if v248.highlight then
                pcall(function()
                    v248.highlight:Destroy()
                end)
            end

            t1.value139[v247] = nil
        end
    end
end
t1.value149 = t1.value120
t1.value2.RenderStepped:Connect(function(dt)
    if not t1.value141 then
        return
    end

    local v262 = t1

    v262.value149 = v262.value149 + dt

    if t1.value149 < t1.value120 then
        return
    end

    t1.value148()

    local DroppedItems = t1.value9:FindFirstChild("DroppedItems")

    if not DroppedItems then
        return
    end

    local v264 = t1.value10.Character and t1.value10.Character:FindFirstChild("HumanoidRootPart")

    if not v264 then
        return
    end

    for _, v in pairs(t1.value139) do
        if v.circle then
            v.circle.Visible = false
        end

        if v.innerCircle then
            v.innerCircle.Visible = false
        end

        if v.name then
            v.name.Visible = false
        end

        if v.amount then
            v.amount.Visible = false
        end

        if v.highlight then
            v.highlight.Enabled = false
        end
    end

    local t6 = {}
    local GetChildren = DroppedItems.GetChildren

    for _, v in ipairs(GetChildren(DroppedItems)) do
        local v271 = v:FindFirstChild("PickUpZone", true) or v:FindFirstChildWhichIsA("BasePart", true)

        if v271 and not v:GetAttribute("Locked") then
            local v272 = #t6 + 1
            local Position = v271.Position
            local Magnitude = (v271.Position - v264.Position).Magnitude

            t6[v272] = {
				item = v,
				pos = Position,
				dist = Magnitude
			}
        end
    end

    local v275 = workspace.CurrentCamera or t1.value11

    for i = 1, #t6 do
        local v277 = t6[i]
        local item = v277.item
        local v279 = t1.value139[item]
        if not v279 then
            local drawing = Drawing.new("Circle")
            local drawing2 = Drawing.new("Circle")
            local drawing3 = Drawing.new("Text")
            local drawing4 = Drawing.new("Text")

            v279 = {
				circle = drawing,
				innerCircle = drawing2,
				name = drawing3,
				amount = drawing4
			}
            v279.circle.Thickness = 2
            v279.circle.Transparency = 0.7
            v279.circle.Filled = false
            v279.innerCircle.Thickness = 2
            v279.innerCircle.Filled = true
            v279.name.Outline = true
            v279.name.Center = true
            v279.name.Size = 16
            v279.amount.Outline = true
            v279.amount.Center = true
            v279.amount.Size = 13
            t1.value139[item] = v279
        end
        if not v279.highlight or not v279.highlight.Parent then
            local Highlight = Instance.new("Highlight")

            Highlight.Name = "JUIX_ESP_Highlight"
            Highlight.FillTransparency = 0.5
            Highlight.OutlineTransparency = 0.1
            Highlight.Adornee = item:IsA("Model") and item or pz
            Highlight.Parent = item
            v279.highlight = Highlight
        end
        local v286, t7Result = v275:WorldToViewportPoint(v277.pos)
        if t7Result then
            local v287 = t1.value147(item)

            v279.highlight.FillColor = v287
            v279.highlight.OutlineColor = v287
            v279.highlight.Enabled = true
            v279.circle.Position = Vector2.new(v286.X, v286.Y)
            v279.circle.Radius = 10
            v279.circle.Color = v287
            v279.circle.Visible = true
            v279.innerCircle.Position = Vector2.new(v286.X, v286.Y)
            v279.innerCircle.Radius = 5
            v279.innerCircle.Color = v287
            v279.innerCircle.Visible = true
            v279.name.Color = v287
            v279.name.Position = Vector2.new(v286.X, v286.Y - 5 - 20)
            v279.name.Text = item.Name
            v279.name.Visible = true

            local v288 = item:GetAttribute("Amount") or 1

            v279.amount.Position = Vector2.new(v286.X, v286.Y + 5 + 15)
            v279.amount.Text = v288 > 1 and "[" .. tostring(v288) .. "]" or ""
            v279.amount.Visible = v288 > 1
        end
    end
end)
t1.value150 = {}
t1.value151 = 0
t1.value152 = nil
t1.value152 = {
	"safe",
	"spawn",
	"lobby",
	"hub",
	"refuge",
	"zone"
}
function t1.value153(p40)
    local v290 = p40:lower()

    for _, v in ipairs(t1.value152) do
        if v290:find(v, 1, true) then
            return true
        end
    end

    return false
end
function t1.value154()
    t1.value150 = {}

    for _, child in pairs(workspace:GetChildren()) do
        if child:IsA("BasePart") and t1.value153(child.Name) then
            t1.value150[#t1.value150 + 1] = child
        elseif (child:IsA("Model") or child:IsA("Folder")) and t1.value153(child.Name) then
            local GetDescendants = child.GetDescendants

            for _, v in pairs(GetDescendants(child)) do
                if v:IsA("BasePart") then
                    t1.value150[#t1.value150 + 1] = v
                end
            end
        end
    end
end
local function v16(p41)
    if tick() - t1.value151 > 6 then
        t1.value154()
    end

    if #t1.value150 == 0 then
        return false
    end

    local p41Position = p41.Position

    for _, v in ipairs(t1.value150) do
        if not (v and v.Parent) then
            continue
        end

        local v302 = v.Size / 2
        local v303 = v.CFrame:PointToObjectSpace(p41Position)

        if math.abs(v303.X) <= v302.X and (math.abs(v303.Y) <= v302.Y and math.abs(v303.Z) <= v302.Z) then
            return true
        end
    end

    return false
end
t1.value155 = {
	Folder = "FreddysHubConfig",
	IndexFile = "FreddysHubConfig/_index.json",
	MaxConfigs = 3,
	LastConfig = nil
}
local v17 = type(writefile) == "function"
if v17 then
    v17 = type(readfile) == "function" and (type(isfile) == "function" and type(delfile) == "function")
end
t1.value156 = nil
t1.value156 = v17
function t1.value157()
    if not t1.value156 then
        return false
    end

    if type(isfolder) == "function" and not isfolder(t1.value155.Folder) then
        pcall(function()
            makefolder(t1.value155.Folder)
        end)
    end

    return type(isfolder) ~= "function" or isfolder(t1.value155.Folder)
end
function t1.value158(p42)
    local _tostring = tostring

    if not p42 then
        p42 = ""
    end

    local v306 = _tostring(p42):gsub("^%s+", ""):gsub("%s+$", ""):gsub("[^%w_%- ]", "")

    if v306 == "" then
        v306 = "Default"
    end

    return v306
end
function t1.value159(p43)
    return t1.value155.Folder .. "/" .. t1.value158(p43) .. ".json"
end
function t1.value160()
    if not t1.value157() or not isfile(t1.value155.IndexFile) then
        return {}, nil
    end

    local ok, result = pcall(function()
        local value7 = t1.value7
        local t8 = { readfile(t1.value155.IndexFile) }

        return value7:JSONDecode(v2(t8))
    end)
    local v315 = not ok

    if not v315 then
        v315 = type(result) ~= "table"
    end

    if v315 then
        return {}, nil
    end

    return type(result.Names) == "table" and result.Names or {}, result.LastConfig
end
function t1.value161()
    return {
		SilentAimEnabled = t1.value17,
		SilentAimFOV = t1.value18,
		FOVEnabled = t1.value19,
		NoRecoil = t1.value34,
		HideName = t1.value25,
		PickupEnabled = t1.value26,
		ESPName = t1.value29,
		ESPHealthBar = t1.value30,
		ESPDistance = t1.value31,
		FPSBoost = t1.value33,
		EnabledSkip = t1.value27,
		SkipHealingAnimation = t1.value28,
		MultipleShoot = t1.value35,
		AutomaticGun = t1.value36,
		FireRateValue = t1.value37,
		AccuracyValue = t1.value38,
		SpeedEnabled = t1.value39,
		SpeedAmount = t1.value40,
		SpinEnabled = t1.value42,
		AntiKillEnabled = t1.value44,
		JumpPowerEnabled = t1.value46,
		InfStamina = t1.value49,
		AutoHeal = t1.value50,
		HealThreshold = t1.value51,
		SnapUnder = t1.value52,
		SnapUnderAmount = t1.value53,
		SnapTabEnabled = t1.value54,
		ESPInventory = t1.value140
	}
end
function t1.value162(p44)
    if type(p44) ~= "table" then
        return false
    end

    t1.value17 = p44.SilentAimEnabled == nil and t1.value17 or p44.SilentAimEnabled == true
    t1.value18 = math.clamp(tonumber(p44.SilentAimFOV) or t1.value18, 20, not t1.value15 and 800 or 1000)
    t1.value19 = p44.FOVEnabled == nil and t1.value19 or p44.FOVEnabled == true
    t1.value34 = p44.NoRecoil == nil and t1.value34 or p44.NoRecoil == true
    t1.value25 = p44.HideName == nil and t1.value25 or p44.HideName == true
    t1.value26 = p44.PickupEnabled == nil and t1.value26 or p44.PickupEnabled == true
    t1.value29 = p44.ESPName == nil and t1.value29 or p44.ESPName == true
    t1.value30 = p44.ESPHealthBar == nil and t1.value30 or p44.ESPHealthBar == true
    t1.value31 = p44.ESPDistance == nil and t1.value31 or p44.ESPDistance == true
    t1.value33 = p44.FPSBoost == nil and t1.value33 or p44.FPSBoost == true
    t1.value27 = p44.EnabledSkip == nil and t1.value27 or p44.EnabledSkip == true
    t1.value28 = p44.SkipHealingAnimation == nil and t1.value28 or p44.SkipHealingAnimation == true

    if p44.MultipleShoot ~= nil or not t1.value35 then
        if p44.MultipleShoot ~= true then
        end
    end

    t1.value36 = p44.AutomaticGun == nil and t1.value36 or p44.AutomaticGun == true
    t1.value37 = math.clamp(tonumber(p44.FireRateValue) or t1.value37, 1, 2000)
    t1.value38 = math.clamp(tonumber(p44.AccuracyValue) or t1.value38, 0, 1)
    t1.value39 = p44.SpeedEnabled == nil and t1.value39 or p44.SpeedEnabled == true
    t1.value40 = math.clamp(tonumber(p44.SpeedAmount) or t1.value40, 1, 5)
    t1.value42 = p44.SpinEnabled == nil and t1.value42 or p44.SpinEnabled == true
    t1.value44 = p44.AntiKillEnabled == nil and t1.value44 or p44.AntiKillEnabled == true
    t1.value46 = p44.JumpPowerEnabled == nil and t1.value46 or p44.JumpPowerEnabled == true
    t1.value49 = p44.InfStamina == nil and t1.value49 or p44.InfStamina == true
    t1.value50 = p44.AutoHeal == nil and t1.value50 or p44.AutoHeal == true
    t1.value51 = math.clamp(tonumber(p44.HealThreshold) or t1.value51, 1, 100)
    t1.value52 = p44.SnapUnder == nil and t1.value52 or p44.SnapUnder == true
    t1.value53 = math.clamp(tonumber(p44.SnapUnderAmount) or t1.value53, 1, 150)
    t1.value54 = p44.SnapTabEnabled == nil and t1.value54 or p44.SnapTabEnabled == true

    if p44.ESPInventory ~= nil then
        local v319 = p44.ESPInventory == true

        t1.value140 = v319
        t1.value141 = v319

        if not v319 then
            t1.value143()
        end
    end

    t1.value134(t1.value26)
    t1.value138()
    t1.value125(t1.value33)
    t1.value119(t1.value27)
    t1.value106(t1.value28)
    v7(t1.value34)

    if t1.value36 then
        t1.value117()
    end

    t1.value79(t1.value39)
    t1.value81(t1.value42)
    t1.value89(t1.value44)
    t1.value77(t1.value46)
    v4(t1.value49)
    t1.value50 = t1.value50 == true
    t1.value108()

    if t1.value50 then
        t1.value62.Loop = task.spawn(function()
            while t1.value50 do
                local Character = t1.value10.Character
                local v689 = Character and Character:FindFirstChildOfClass("Humanoid")

                if v689 and (v689.MaxHealth > 0 and v689.Health > 0) and v689.Health / v689.MaxHealth * 100 <= t1.value51 then
                    local v690 = v5(t1.value10:FindFirstChildOfClass("Backpack")) or v5(t1.value10.Character)

                    if v690 then
                        t1.value107(v690)
                    end
                end

                task.wait(0.3)
            end

            t1.value62.Loop = nil
        end)
    end

    t1.value92(t1.value52)

    return true
end
function t1.value155.List(p45)
    local v321, v322 = t1.value160()

    if #v321 > p45.MaxConfigs then
        for i = p45.MaxConfigs + 1, #v321 do
            local v324 = v321[i]
            local v325 = t1.value159(v324)

            if isfile(v325) then
                pcall(function()
                    delfile(v325)
                end)
            end
        end

        local t9 = {}

        for i = 1, p45.MaxConfigs do
            t9[i] = v321[i]
        end

        local v328 = false

        v321 = t9

        for _, v in ipairs(v321) do
            if v == v322 then
                v328 = true

                break
            end
        end

        if not v328 then
            v322 = v321[1]
        end

        local v331 = v321
        local v332 = v322

        if t1.value157() then
            pcall(function()
                writefile(t1.value155.IndexFile, t1.value7:JSONEncode({
					Names = v331,
					LastConfig = v332
				}))
            end)
        end
    end

    return v321, v322
end
function t1.value155.Save(p46, p47)
    if not t1.value156 or not t1.value157() then
        return false, "ARCHIVOS NO DISPONIBLES"
    end
    local v344 = t1.value158(p47)
    local ok, result = pcall(function()
        local value7 = t1.value7
        local t10 = { t1.value161() }

        return value7:JSONEncode(v2(t10))
    end)
    local v347 = result
    if not ok then
        return false, "ERROR AL PREPARAR CONFIGURACION"
    end
    local v348 = p46:List()
    local v349 = false
    local v350, v351, v352 = ipairs(v348)
    local g354
    repeat
        local v353

        v352, v353 = v350(v351, v352)

        if not v352 then
            g354 = true
        end

        if g354 then
            break
        end
    until v353 == v344
    if not g354 then
        v349 = true
    end
    g354 = false
    if not v349 and #v348 >= p46.MaxConfigs then
        return false, "LIMITE ALCANZADO: MAXIMO 3 CONFIGURACIONES"
    end
    if not pcall(function()
        writefile(t1.value159(v344), v347)
    end) then
        return false, "ERROR AL GUARDAR"
    end
    if not v349 then
        v348[#v348 + 1] = v344
    end
    p46.LastConfig = v344
    local v355 = v348
    local LastConfig = p46.LastConfig
    if t1.value157() then
        pcall(function()
            writefile(t1.value155.IndexFile, t1.value7:JSONEncode({
				Names = v355,
				LastConfig = LastConfig
			}))
        end)
    end

    return true, v344
end
function t1.value155.Load(p48, p49)
    if not t1.value156 then
        return false, "ARCHIVOS NO DISPONIBLES"
    end

    local v359 = t1.value158(p49 or p48.LastConfig)

    if not isfile(t1.value159(v359)) then
        return false, "CONFIGURACION NO ENCONTRADA"
    end

    local ok, result = pcall(function()
        local value7 = t1.value7
        local t11 = { readfile(t1.value159(v359)) }

        return value7:JSONDecode(v2(t11))
    end)
    local v362 = not ok

    if not v362 then
        v362 = not t1.value162(result)
    end

    if v362 then
        return false, "ERROR AL CARGAR"
    end

    local v363 = p48:List()

    p48.LastConfig = v359

    local v364 = v363
    local LastConfig = p48.LastConfig

    if t1.value157() then
        pcall(function()
            writefile(t1.value155.IndexFile, t1.value7:JSONEncode({
				Names = v364,
				LastConfig = LastConfig
			}))
        end)
    end

    return true, v359
end
function t1.value163()
    local v366, v367 = t1.value155:List()

    if v367 then
        return t1.value155:Load(v367)
    end

    if #v366 > 0 then
        return t1.value155:Load(v366[1])
    end

    return false, "SIN CONFIGURACION"
end
t1.value164 = {
	Player = nil,
	PreviousCameraType = nil,
	PreviousCameraSubject = nil
}
t1.value165 = nil
local function v18()
    local t12 = {}

    for _, player in ipairs(t1.value1:GetPlayers()) do
        if player ~= t1.value10 then
            t12[#t12 + 1] = player.Name
        end
    end

    table.sort(t12, function(p50, p51)
        return string.lower(p50) < string.lower(p51)
    end)

    return t12
end
function t1.value165()
    return workspace.CurrentCamera or t1.value11
end
function t1.value166()
    local v390 = t1.value165()

    if v390 then
        local PreviousCameraSubject = t1.value164.PreviousCameraSubject

        if PreviousCameraSubject and PreviousCameraSubject.Parent then
            v390.CameraSubject = PreviousCameraSubject
        else
            local Character = t1.value10.Character
            local v393 = Character and Character:FindFirstChildOfClass("Humanoid")

            if v393 then
                v390.CameraSubject = v393
            end
        end

        if t1.value164.PreviousCameraType then
            v390.CameraType = t1.value164.PreviousCameraType
        end
    end

    t1.value164.Player = nil
    t1.value164.PreviousCameraType = nil
    t1.value164.PreviousCameraSubject = nil
end
function t1.value167(p52)
    if not p52 or (p52 == t1.value10 or p52.Parent ~= t1.value1) then
        t1.value166()

        return false
    end

    local Character = p52.Character
    local v400 = Character and Character:FindFirstChildOfClass("Humanoid")
    local v401 = t1.value165()

    if not v400 or not v401 then
        return false
    end

    if t1.value164.Player == nil then
        t1.value164.PreviousCameraType = v401.CameraType
        t1.value164.PreviousCameraSubject = v401.CameraSubject
    end

    t1.value164.Player = p52
    v401.CameraType = Enum.CameraType.Custom
    v401.CameraSubject = v400

    return true
end
function t1.value168()
    local t13 = {}

    for _, player in ipairs(t1.value1:GetPlayers()) do
        if player ~= t1.value10 then
            t13[#t13 + 1] = player.Name
        end
    end

    table.sort(t13, function(p53, p54)
        return string.lower(p53) < string.lower(p54)
    end)

    return t13
end
function t1.value169(p55)
    if not p55 or p55 == t1.value10 then
        return true
    end

    local v395 = string.lower(p55.Name)

    for k in pairs(t1.value20) do
        local v397 = k

        if v397 ~= "" and string.find(v395, v397, 1, true) then
            return true
        end
    end

    return false
end
function t1.value170()
    local n2 = 0.1

    pcall(function()
        n2 = t1.value10:GetNetworkPing() or n2
    end)

    return (math.clamp(n2, 0.03, 0.35))
end
function t1.value171(p56)
    if not p56 or (p56.Parent ~= t1.value1 or (t1.value169(p56) or not p56.Character)) then
        return false
    end

    local Character = p56.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local v405 = p56.Team and (t1.value10.Team and p56.Team == t1.value10.Team)
    local v406 = Character:FindFirstChild("Head") ~= nil

    if v406 then
        v406 = false

        if Character:FindFirstChild("HumanoidRootPart") ~= nil then
            v406 = false

            if Humanoid ~= nil then
                v406 = false

                if Humanoid.Health > 0 then
                    v406 = not v405
                end
            end
        end
    end

    return v406
end
function t1.value172(p57, p58, p59, p60)
    if not t1.value171(p57) then
        return false
    end

    local Character = p57.Character
    local Head = Character:FindFirstChild("Head")

    Character:FindFirstChild("HumanoidRootPart")

    local v413, v414 = p58:WorldToViewportPoint(Head.Position)

    if not v414 or v413.Z <= 0 then
        return false
    end

    local Magnitude = (Vector2.new(v413.X, v413.Y) - p59).Magnitude

    return Magnitude <= p60 or t1.value18, v413, Magnitude
end
function t1.value173()
    local v416 = workspace.CurrentCamera or t1.value11
    if not v416 then
        return nil
    end
    local vector2 = Vector2.new(v416.ViewportSize.X / 2, v416.ViewportSize.Y / 2)
    local v418
    local huge = math.huge
    local n3 = 1e999
    local v421 = t1.value10.Character and t1.value10.Character:FindFirstChild("HumanoidRootPart")
    if not v421 then
        return nil
    end
    for _, player in ipairs(t1.value1:GetPlayers()) do
        local v424, _, v426 = t1.value172(player, v416, vector2)

        if v424 then
            local v427 = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            local v428 = v427 and (v427.Position - v421.Position).Magnitude

            if v428 and v428 < huge or v428 == huge and v426 < n3 then
                n3 = v426
                huge = v428
                v418 = player
            end
        end
    end

    return v418
end
function t1.value174(p61, p62)
    local v335 = t1.value58[p61]

    if not v335 or #v335 < 2 then
        return p62.AssemblyLinearVelocity or Vector3.zero
    end

    local zero = Vector3.zero
    local n4 = 0

    for i = 2, #v335 do
        local v339 = v335[i - 1]
        local v340 = v335[i]
        local v341 = v340.time - v339.time

        if v341 > 0 then
            zero += (v340.position - v339.position) / v341
            n4 += 1
        end
    end

    return n4 > 0 and zero / n4 or (p62.AssemblyLinearVelocity or Vector3.zero)
end
function t1.value175()
    local Character = t1.value10.Character

    if not Character then
        return false
    end

    local GetChildren = Character.GetChildren

    for _, v in ipairs(GetChildren(Character)) do
        if not v:IsA("Tool") then
            continue
        end

        local AmmoType = v:GetAttribute("AmmoType")

        if typeof(AmmoType) == "string" and string.find(string.lower(AmmoType), "shotgun", 1, true) or string.find(string.lower(AmmoType), "shootgun", 1, true) then
            return true
        end
    end

    return false
end
function t1.value176(p63, p64)
    if not p63 then
        return nil
    end

    if p64 == 1 then
        local Head = p63:FindFirstChild("Head")

        if not Head then
            Head = p63:FindFirstChild("UpperTorso") or (p63:FindFirstChild("Torso") or p63:FindFirstChild("HumanoidRootPart"))
        end

        return Head
    end

    local UpperTorso = p63:FindFirstChild("UpperTorso")

    if not UpperTorso then
        UpperTorso = p63:FindFirstChild("Torso") or (p63:FindFirstChild("HumanoidRootPart") or p63:FindFirstChild("Head"))
    end

    return UpperTorso
end
t1.value177 = nil
function t1.value177(p65, p66)
    if not p65 or not p66 then
        return
    end
    local Magnitude = (p66 - p65).Magnitude
    if Magnitude <= 0.01 then
        return
    end
    local Part
    local u310
    if not pcall(function()
        local cFrame = CFrame.new(p65, p66)
        local cFrame2 = CFrame.new(0, 0, -Magnitude / 2)
        local _Instance = Instance
        local v685 = cFrame * cFrame2

        u310 = _Instance.new("Part")
        u310.Name = "FreddyShotTracerGlow"
        u310.Anchored = true
        u310.CanCollide = false
        u310.CanTouch = false
        u310.CanQuery = false
        u310.Size = Vector3.new(0.04, 0.04, Magnitude)
        u310.CFrame = v685
        u310.Material = Enum.Material.Neon
        u310.Transparency = 0.78
        u310.Color = Color3.fromRGB(255, 25, 40)
        u310.CastShadow = false
        u310.Parent = workspace
        Part = Instance.new("Part")
        Part.Name = "FreddyShotTracer"
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanTouch = false
        Part.CanQuery = false
        Part.Size = Vector3.new(0.04, 0.04, Magnitude)
        Part.CFrame = v685
        Part.Material = Enum.Material.Neon
        Part.Transparency = 0.05
        Part.Color = Color3.fromRGB(255, 70, 80)
        Part.CastShadow = false
        Part.Parent = workspace
        t1.value5:AddItem(Part, 4)
        t1.value5:AddItem(u310, 4)
    end) or not Part then
        if u310 then
            pcall(function()
                u310:Destroy()
            end)
        end

        return
    end
end
function t1.value178(p67)
    if type(p67) ~= "table" or p67[2] ~= "shoot_gun" then
        return
    end

    local Character = t1.value10.Character
    local v435 = Character and Character:FindFirstChild("Head")

    if not v435 then
        return
    end

    local Position = v435.Position
    local value24 = t1.value24

    if not value24 then
        local v438 = typeof(p67[4]) == "CFrame" and p67[4]

        if not v438 then
            return
        end

        value24 = Position + v438.LookVector * 500
    end

    t1.value177(Position, value24)
end
function t1.value179(p68)
    local v440 = not t1.value17

    if not v440 then
        v440 = type(p68) ~= "table" or p68[2] ~= "shoot_gun"
    end

    if v440 then
        return
    end

    local v441 = t1.value173()

    if not v441 or not v441.Character then
        return
    end

    local v442 = t1.value176(v441.Character, t1.value22)
    local HumanoidRootPart = v441.Character:FindFirstChild("HumanoidRootPart")
    local v444 = t1.value10.Character and t1.value10.Character:FindFirstChild("Head")
    local v445

    if not v442 or not HumanoidRootPart then
        v445 = nil
    else
        local v446 = t1.value174(v441, HumanoidRootPart)

        v445 = v442.Position + v446 * t1.value170() * 1.2
    end

    if not v442 or (not HumanoidRootPart or (not v444 or not v445)) then
        return
    end

    if (v445 - v444.Position).Magnitude <= 0.01 then
        return
    end

    t1.value23 = v442
    t1.value22 = t1.value22 ~= 1 and 1 or 2
    p68[4] = CFrame.new(v444.Position, v445)

    if t1.value175() then
        local t14 = {}

        for i = 1, 6 do
            local vector3 = Vector3.new(math.random(-2, 2) * 0.03, math.random(-2, 2) * 0.03, math.random(-2, 2) * 0.03)
            local vector3_2 = Vector3.new(0, 1, 0)
            local v451 = v445 + vector3

            t14[i] = {
				[1] = {
					Instance = v442,
					Normal = vector3_2,
					Position = v451
				}
			}
        end

        p68[5] = t14
    else
        local vector3 = Vector3.new(0, 1, 0)

        p68[5] = {
			[1] = {
				[1] = {
					Instance = v442,
					Normal = vector3,
					Position = v445
				}
			}
		}
    end

    return true
end
function t1.value180(p69)
    t1.value20 = {}

    if type(p69) ~= "table" then
        p69 = p69 and { p69 } or {}
    end

    for _, v in ipairs(p69) do
        local v377 = typeof(v) == "table" and v.Title or tostring(v)

        t1.value20[string.lower(v377)] = true
    end
end
t1.value2.Heartbeat:Connect(function()
    for _, player in ipairs(t1.value1:GetPlayers()) do
        if player ~= t1.value10 and player.Character then
            local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            local Humanoid = player.Character:FindFirstChildOfClass("Humanoid")

            if HumanoidRootPart and (Humanoid and Humanoid.Health > 0) then
                local v460 = t1.value58[player]

                if not v460 then
                    v460 = {}
                    t1.value58[player] = v460
                end

                local v461 = #v460 + 1
                local elapsed = os.clock()
                local HumanoidRootPartPosition = HumanoidRootPart.Position

                v460[v461] = {
					time = elapsed,
					position = HumanoidRootPartPosition
				}

                if #v460 > 6 then
                    table.remove(v460, 1)
                end
            else
                t1.value58[player] = nil
            end
        end
    end
end)
t1.value1.PlayerRemoving:Connect(function(player)
    t1.value58[player] = nil
end);
(function()
    if t1.value57 then
        return
    end

    local v453 = t1.value4:FindFirstChild("Remotes") or t1.value4:WaitForChild("Remotes", 5)
    local v454 = v453 and v453:WaitForChild("Send", 5)

    if not v454 then
        return
    end

    if type(hookfunction) == "function" and v454:IsA("RemoteEvent") then
        local u455
        if pcall(function()
            u455 = hookfunction(v454.FireServer, function(p70, ...)
                local t15 = { ... }

                if p70 == v454 then
                    t1.value179(t15)
                    t1.value178(t15)
                end

                return u455(p70, unpack(t15))
            end)
        end) and type(u455) == "function" then
            return
        end
    end

    if type(hookmetamethod) == "function" and type(getnamecallmethod) == "function" then
        if hookmetamethod(game, "__namecall", function(p71, ...)
            local v700 = getnamecallmethod()

            if p71 == v454 and v700 == "FireServer" or v700 == "InvokeServer" then
                local t16 = { ... }

                t1.value179(t16)
                t1.value178(t16)

                return (nil)(p71, unpack(t16))
            end

            return (nil)(p71, ...)
        end) == nil then
        end
    end
end)()
function t1.value181(p72, p73)
    local ViewportSize = p72.ViewportSize
    local vector2 = Vector2.new(ViewportSize.X / 2, ViewportSize.Y / 2)
    local v469, v470 = p72:WorldToViewportPoint(p73)

    if v470 then
        v470 = v469.Z > 0
    end

    if v470 then
        return Vector2.new(v469.X, v469.Y), true
    end

    local v471 = p72.CFrame:PointToObjectSpace(p73)
    local vector2_2 = Vector2.new(v471.X, -v471.Y)

    if v471.Z > 0 then
        vector2_2 = -vector2_2
    end

    if vector2_2.Magnitude < 0.001 then
        return vector2, false
    end

    local v473 = math.max(ViewportSize.X / 2 - 8, 1)
    local v474 = math.max(ViewportSize.Y / 2 - 8, 1)

    return vector2 + vector2_2 * math.min(v473 / math.max(math.abs(vector2_2.X), 0.001), v474 / math.max(math.abs(vector2_2.Y), 0.001)), false
end
function t1.value182()
    local t17 = {}
    local t18 = {}

    t1.value166()
    t1.value123()

    if t1.value59 then
        function t17.value1()
            t1.value59:Disconnect()
        end

        pcall(t17.value1)
        t1.value59 = nil
    end

    t17.value1 = t1.value12:FindFirstChild("FreddysHubRuntime")

    if t17.value1 then
        t17.value1:Destroy()
    end

    t18.value1 = Instance.new("ScreenGui")
    t18.value1.Name = "FreddysHubRuntime"
    t18.value1.ResetOnSpawn = false
    t18.value1.IgnoreGuiInset = true
    t18.value1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    t18.value1.DisplayOrder = 999
    t18.value1.Parent = t1.value12
    t18.value2 = Instance.new("Frame")
    t18.value2.Name = "SilentAimFOV"
    t18.value2.AnchorPoint = Vector2.new(0.5, 0.5)
    t18.value2.Position = UDim2.fromScale(0.5, 0.5)
    t18.value2.Size = UDim2.fromOffset(t1.value18 * 2, t1.value18 * 2)
    t18.value2.BackgroundTransparency = 1
    t18.value2.BorderSizePixel = 0
    t18.value2.Visible = t1.value19
    t18.value2.ZIndex = 10
    t18.value2.Parent = t18.value1

    local UICorner = Instance.new("UICorner")

    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = t18.value2

    local UIStroke = Instance.new("UIStroke")

    UIStroke.Color = Color3.fromRGB(255, 35, 50)
    UIStroke.Thickness = 1.5
    UIStroke.Transparency = 0
    UIStroke.Parent = t18.value2

    function t18.value3()
        local value2 = t18.value2
        local fromOffset = UDim2.fromOffset
        local v704 = t1.value18 * 2

        value2.Size = fromOffset(t1.value18 * 2, v704)
        t18.value2.Visible = t1.value19
    end

    t18.value4 = Instance.new("Frame")
    t18.value4.Name = "SilentAimTargetDot"
    t18.value4.AnchorPoint = Vector2.new(0.5, 0.5)
    t18.value4.BackgroundTransparency = 1
    t18.value4.BorderSizePixel = 0
    t18.value4.Size = UDim2.fromOffset(7, 7)
    t18.value4.Visible = false
    t18.value4.ZIndex = 100
    t18.value4.Parent = t18.value1
    Instance.new("UICorner", t18.value4).CornerRadius = UDim.new(1, 0)

    local UIStroke2 = Instance.new("UIStroke")

    UIStroke2.Color = t1.value21
    UIStroke2.Thickness = 1.5
    UIStroke2.Transparency = 0
    UIStroke2.Parent = t18.value4

    local FreddysHubJuixTracer = workspace:FindFirstChild("FreddysHubJuixTracer")

    if FreddysHubJuixTracer then
        FreddysHubJuixTracer:Destroy()
    end

    local FreddysHubJuixTracerHighlight = workspace:FindFirstChild("FreddysHubJuixTracerHighlight")

    if FreddysHubJuixTracerHighlight then
        FreddysHubJuixTracerHighlight:Destroy()
    end

    for _, v in ipairs({
		"FreddysHubJuixTracerOrigin",
		"FreddysHubJuixTracerTarget",
		"FreddysHubJuixTracerBeam"
	}) do
        t17.value2 = workspace:FindFirstChild(v)

        if t17.value2 then
            t17.value2:Destroy()
        end
    end

    t18.value5 = Instance.new("Part")
    t18.value5.Name = "FreddysHubJuixTracer"
    t18.value5.Anchored = true
    t18.value5.CanCollide = false
    t18.value5.CanTouch = false
    t18.value5.CanQuery = false
    t18.value5.CastShadow = false
    t18.value5.Material = Enum.Material.SmoothPlastic
    t18.value5.Color = Color3.fromRGB(255, 35, 50)
    t18.value5.Transparency = 1
    t18.value5.Size = Vector3.new(0.0012, 0.0012, 0)
    t18.value5.Parent = workspace
    t18.value6 = Instance.new("Highlight")
    t18.value6.Name = "FreddysHubJuixTracerHighlight"
    t18.value6.Adornee = t18.value5
    t18.value6.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    t18.value6.FillColor = Color3.fromRGB(255, 35, 50)
    t18.value6.FillTransparency = 0
    t18.value6.OutlineTransparency = 1
    t18.value6.Enabled = false
    t18.value6.Parent = workspace

    local function v484(p74)
        local Part = Instance.new("Part")

        Part.Name = p74
        Part.Anchored = true
        Part.CanCollide = false
        Part.CanTouch = false
        Part.CanQuery = false
        Part.Transparency = 1
        Part.Size = Vector3.new(0.1, 0.1, 0.1)
        Part.Parent = workspace

        return Part
    end

    t18.value7 = v484("FreddysHubJuixTracerOrigin")
    t18.value8 = v484("FreddysHubJuixTracerTarget")
    t17.value2 = Instance
    t17.value2 = t17.value2.new("Attachment", t18.value7)

    local Attachment = Instance.new("Attachment", t18.value8)

    t18.value9 = Instance.new("Beam")
    t18.value9.Name = "FreddysHubJuixTracerBeam"
    t18.value9.Attachment0 = t17.value2
    t18.value9.Attachment1 = Attachment
    t18.value9.FaceCamera = true
    t18.value9.Width0 = 0.0012
    t18.value9.Width1 = 0.0012
    t18.value9.Color = ColorSequence.new(Color3.fromRGB(255, 35, 50))
    t18.value9.Transparency = NumberSequence.new(0)
    t18.value9.LightEmission = 0
    t18.value9.Brightness = 1
    t18.value9.ZOffset = 2
    t18.value9.Enabled = false
    t18.value9.Parent = workspace
    t18.value10 = nil
    t18.value11 = nil

    function t18.value12()
        t18.value4.Visible = false
        t18.value5.Transparency = 1
        t18.value6.Enabled = false
        t18.value9.Enabled = false
    end

    t1.value59 = t1.value2.RenderStepped:Connect(function(dt)
        local v709 = workspace.CurrentCamera or t1.value11

        if not v709 or not t1.value17 then
            t1.value23 = nil
            t1.value22 = 1
            t18.value10 = nil
            t18.value11 = nil
            t18.value12()

            return
        end

        local value10 = t18.value10
        local v711 = t1.value173()

        if v711 and not t1.value171(v711) then
            v711 = nil
        end

        local v712 = v711

        if v711 then
            local value23 = t1.value23

            if value23 then
                value23 = t1.value23:IsDescendantOf(v711.Character) and t1.value23
            end

            v712 = value23 or t1.value176(v711.Character, t1.value22)
        end

        if not v709 or (not v711 or not v712) then
            t18.value11 = nil
            t18.value12()

            return
        end

        if value10 ~= v711 or not t18.value11 then
            t18.value11 = v712.Position
        else
            local v714 = math.clamp(1 - math.exp(-18 * (tonumber(dt) or 0.016666666666667)), 0, 1)

            t18.value11 = t18.value11:Lerp(v712.Position, v714)
        end

        local v715 = v709.CFrame.Position + v709.CFrame.LookVector * 0.15
        local value11 = t18.value11

        if (value11 - v715).Magnitude <= 0.01 then
            t18.value12()

            return
        end

        local v717 = value11 + (value11 - v715).Unit * 1.25
        local Magnitude = (v717 - v715).Magnitude

        t18.value5.Size = Vector3.new(0.0012, 0.0012, Magnitude)
        t18.value5.CFrame = CFrame.new(v715, v717) * CFrame.new(0, 0, -Magnitude / 2)
        t18.value5.Transparency = 0
        t18.value6.Enabled = true
        t18.value7.CFrame = CFrame.new(v715)
        t18.value8.CFrame = CFrame.new(v717)
        t18.value9.Enabled = true

        local v719, v720 = t1.value181(v709, value11)

        t18.value4.Visible = v720

        if v720 then
            t18.value4.Position = UDim2.fromOffset(v719.X, v719.Y)
        end
    end)
    t1.value10.CharacterAdded:Connect(function()
        task.wait(0.5)
        t1.value138()

        if t1.value46 then
            t1.value77(true)
        end

        if t1.value39 then
            t1.value79(true)
        end

        if t1.value52 then
            t1.value92(true)
        end
    end)
    t18.value13 = t1.value122.Objects
    t18.value14 = t1.value121
    t18.value15 = {}

    local function v486(p75)
        if not p75 then
            return nil
        end

        local Head = p75:FindFirstChild("Head")

        if not Head then
            Head = p75:FindFirstChild("UpperTorso")

            if not Head then
                Head = p75:FindFirstChild("Torso")

                if not Head then
                    Head = p75:FindFirstChild("HumanoidRootPart") or (p75.PrimaryPart or p75:FindFirstChildWhichIsA("BasePart", true))
                end
            end
        end

        return Head
    end
    local function v487(p76, p77, p78)
        local TextLabel = Instance.new("TextLabel")

        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.new(1, 0, 0, 18)
        TextLabel.Text = ""

        if not p78 then
            p78 = Color3.fromRGB(255, 255, 255)
        end

        TextLabel.TextColor3 = p78
        TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.TextStrokeTransparency = 0.15
        TextLabel.Font = Enum.Font.Arcade
        TextLabel.TextSize = p77
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.Parent = p76

        return TextLabel
    end

    function t18.value16(p79)
        if p79 == t1.value10 or t18.value13[p79] then
            return
        end

        local Character = p79.Character
        local v729 = v486(Character)

        if not Character or not v729 then
            return
        end

        local BillboardGui = Instance.new("BillboardGui")

        BillboardGui.Name = "PlayerMarker"
        BillboardGui.Adornee = v729
        BillboardGui.Size = UDim2.fromOffset(120, 54)
        BillboardGui.StudsOffsetWorldSpace = Vector3.new(0, 2.35, 0)
        BillboardGui.AlwaysOnTop = true
        BillboardGui.LightInfluence = 0
        BillboardGui.MaxDistance = math.max(t1.value16, 1000000000)
        BillboardGui.Enabled = false
        BillboardGui.Parent = t1.value12

        local Frame = Instance.new("Frame")

        Frame.Size = UDim2.new(1, 0, 1, 0)
        Frame.BackgroundColor3 = Color3.fromRGB(8, 10, 16)
        Frame.BackgroundTransparency = 1
        Frame.BorderSizePixel = 0
        Frame.Parent = BillboardGui
        Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 5)

        local UIStroke3 = Instance.new("UIStroke", Frame)

        UIStroke3.Color = Color3.fromRGB(255, 35, 50)
        UIStroke3.Thickness = 1
        UIStroke3.Transparency = 1

        local ImageLabel = Instance.new("ImageLabel")

        ImageLabel.Name = "ProfileImage"
        ImageLabel.Position = UDim2.fromOffset(3, 3)
        ImageLabel.Size = UDim2.fromOffset(14, 14)
        ImageLabel.BackgroundColor3 = Color3.fromRGB(25, 28, 38)
        ImageLabel.BackgroundTransparency = 0.05
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Image = ""
        ImageLabel.ScaleType = Enum.ScaleType.Crop
        ImageLabel.Visible = false
        ImageLabel.Parent = Frame
        Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(1, 0)

        local UIStroke4 = Instance.new("UIStroke", ImageLabel)

        UIStroke4.Color = Color3.fromRGB(255, 35, 50)
        UIStroke4.Thickness = 1

        local v735 = v487(Frame, 8, Color3.fromRGB(255, 255, 255))

        v735.Position = UDim2.fromOffset(20, 2)
        v735.Size = UDim2.new(1, -23, 0, 13)
        v735.TextXAlignment = Enum.TextXAlignment.Left
        v735.Font = Enum.Font.GothamBold

        local v736 = v487(Frame, 7, Color3.fromRGB(215, 220, 235))

        v736.Position = UDim2.fromOffset(20, 16)
        v736.Size = UDim2.new(1, -23, 0, 11)
        v736.TextXAlignment = Enum.TextXAlignment.Left

        local Frame2 = Instance.new("Frame")

        Frame2.Name = "WeaponIcons"
        Frame2.BackgroundTransparency = 1
        Frame2.Position = UDim2.fromOffset(27, 34)
        Frame2.Size = UDim2.fromOffset(78, 17)
        Frame2.ClipsDescendants = true
        Frame2.Visible = false
        Frame2.Parent = Frame

        local UIListLayout = Instance.new("UIListLayout")

        UIListLayout.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 2)
        UIListLayout.Parent = Frame2

        local v739 = v487(Frame, 7, Color3.fromRGB(80, 255, 130))

        v739.Position = UDim2.fromOffset(20, 28)
        v739.Size = UDim2.new(1, -23, 0, 9)
        v739.TextXAlignment = Enum.TextXAlignment.Left
        v739.Text = "SAFE"
        v739.Visible = false

        local Frame3 = Instance.new("Frame")

        Frame3.AnchorPoint = Vector2.new(0, 0)
        Frame3.Position = UDim2.fromOffset(20, 28)
        Frame3.Size = UDim2.fromOffset(48, 4)
        Frame3.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
        Frame3.BackgroundTransparency = 0.15
        Frame3.BorderSizePixel = 0
        Frame3.Visible = false
        Frame3.Parent = Frame
        Instance.new("UICorner", Frame3).CornerRadius = UDim.new(0, 0)

        local Frame4 = Instance.new("Frame")

        Frame4.AnchorPoint = Vector2.new(0, 0)
        Frame4.Position = UDim2.new(0, 0, 0, 0)
        Frame4.Size = UDim2.new(1, 0, 1, 0)
        Frame4.BackgroundColor3 = Color3.fromRGB(70, 150, 255)
        Frame4.BorderSizePixel = 0
        Frame4.Parent = Frame3
        Instance.new("UICorner", Frame4).CornerRadius = UDim.new(0, 0)
        t18.value13[p79] = {
			Board = BillboardGui,
			Panel = Frame,
			Character = Character,
			Avatar = ImageLabel,
			NameText = v735,
			RangeText = v736,
			WeaponIcons = Frame2,
			WeaponSignature = "",
			ZoneText = v739,
			HealthBack = Frame3,
			HealthFill = Frame4,
			PanelStroke = UIStroke3
		}
        task.spawn(function()
            local ok, result = pcall(function()
                return t1.value1:GetUserThumbnailAsync(p79.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
            end)
            local v941 = t18.value13[p79]

            if ok then
                ok = v941 and (v941.Avatar == ImageLabel and ImageLabel.Parent)
            end

            if ok then
                ImageLabel.Image = result
            end
        end)
    end

    local function v488(p80)
        local Character = p80.Character
        local Backpack = p80:FindFirstChildOfClass("Backpack")
        local t19 = {}
        local t20 = {}

        local function v747(p81)
            if not p81 then
                return
            end

            for _, child in ipairs(p81:GetChildren()) do
                if child:IsA("Tool") and (child.Name ~= "Fists" and not t20[child]) then
                    t20[child] = true
                    t19[#t19 + 1] = child
                end
            end
        end

        v747(Character)
        v747(Backpack)

        return t19
    end

    function t18.value17(p82, p83)
        if not p82.WeaponIcons then
            return
        end
        if not t1.value140 then
            p82.WeaponIcons.Visible = false
            p82.WeaponSignature = ""

            return
        end
        local v754 = v488(p83)
        local t21 = {}
        for v758, v759 in ipairs(v754) do

            local u760 = v759
            local ok, result = pcall(function()
                local v946 = u760

                if not v946 or not v946:IsA("Tool") then
                    return nil
                end

                return t1.value146[t1.value145(v946)]
            end)
            local v763 = ok and result or nil
            local v764 = v763 and v763.Rarity or (v759:GetAttribute("RarityName") or (v759:GetAttribute("Rarity") or "Common"))
            local v765 = tostring(v764):lower()
            if v765 ~= "common" and v765 ~= "white" then
                t21[#t21 + 1] = {
					Tool = v759,
					Info = v763,
					Rarity = v764
				}
            end
        end
        if #t21 == 0 then
            p82.WeaponSignature = ""
            p82.WeaponIcons.Visible = false

            for _, child in ipairs(p82.WeaponIcons:GetChildren()) do
                if not child:IsA("UIListLayout") then
                    child:Destroy()
                end
            end

            return
        end
        local t22 = {}
        for v771, v772 in ipairs(t21) do

            local Tool = v772.Tool
            local Info = v772.Info
            local v775 = Info and Info.ImageId or (Tool:GetAttribute("ImageId") or "rbxassetid://7072725737")

            t22[#t22 + 1] = Tool:GetFullName() .. "|" .. tostring(v775) .. "|" .. tostring(v772.Rarity)
        end
        local v776 = table.concat(t22, ";")
        if v776 == p82.WeaponSignature then
            p82.WeaponIcons.Visible = true

            return
        end
        p82.WeaponSignature = v776
        for _, child in ipairs(p82.WeaponIcons:GetChildren()) do
            if not child:IsA("UIListLayout") then
                child:Destroy()
            end
        end
        local n5 = 0
        for _, v in ipairs(t21) do
            local Tool = v.Tool
            local Info = v.Info
            local v784 = Info and Info.ImageId or (Tool:GetAttribute("ImageId") or "rbxassetid://7072725737")

            if v784 and tostring(v784) ~= "" then
                if n5 >= 3 then
                    break
                end

                local _Instance = Instance

                n5 += 1

                local v786 = _Instance.new("ImageLabel")

                v786.Name = "WeaponIcon"
                v786.LayoutOrder = n5
                v786.Size = UDim2.fromOffset(14, 14)

                local v787 = t1.value144[v.Rarity] or Color3.fromRGB(120, 120, 130)

                v786.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
                v786.BackgroundTransparency = 0
                v786.BorderSizePixel = 0
                v786.Image = tostring(v784)
                v786.Parent = p82.WeaponIcons
                Instance.new("UICorner", v786).CornerRadius = UDim.new(0, 0)

                local UIStroke5 = Instance.new("UIStroke")

                UIStroke5.Color = v787
                UIStroke5.Thickness = 1
                UIStroke5.Parent = v786
            end
        end
        p82.WeaponIcons.Visible = n5 > 0
    end

    local function v489(p84, p85)
        if p85 then
            return Color3.fromRGB(60, 255, 120)
        end

        if p84 > 0.6 then
            return Color3.fromRGB(60, 255, 120)
        end

        if p84 > 0.3 then
            return Color3.fromRGB(255, 210, 50)
        end

        return Color3.fromRGB(255, 70, 70)
    end

    function t18.value18()
        local v794 = t1.value29 or (t1.value30 or (t1.value31 or t1.value140))

        if not v794 then
            for _, v in pairs(t18.value13) do
                if v.Board then
                    v.Board.Enabled = false
                end

                if v.Avatar then
                    v.Avatar.Visible = false
                end

                if v.HealthBack then
                    v.HealthBack.Visible = false
                end

                if v.WeaponIcons then
                    v.WeaponIcons.Visible = false
                end

                if v.ZoneText then
                    v.ZoneText.Visible = false
                end
            end

            return
        end

        local v797 = t1.value17 and t1.value173() or nil

        for _, player in ipairs(t1.value1:GetPlayers()) do
            local v800 = player

            if v800 ~= t1.value10 then
                pcall(function()
                    local Character = v800.Character
                    local v948 = t18.value13[v800]
                    local v949 = v948

                    if v948 then
                        v949 = Character ~= v948.Character or (not v948.Board or not v948.Board.Parent)
                    end

                    if v949 then
                        local v950 = v800
                        local v951 = t18.value13[v950]

                        if v951 then
                            if v951.Board then
                                v951.Board:Destroy()
                            end

                            t18.value13[v950] = nil
                        end

                        v948 = nil
                    end

                    if Character and not v948 then
                        t18.value16(v800)
                    end
                end)
            end
        end

        local v801 = t1.value10.Character and t1.value10.Character:FindFirstChild("HumanoidRootPart")

        for k, v in pairs(t18.value13) do
            local v804 = v

            pcall(function()
                local Character = k.Character
                local v953 = v486(Character)
                local v954 = Character and Character:FindFirstChildOfClass("Humanoid")
                local v955 = Character and Character:FindFirstChild("HumanoidRootPart") or Character.PrimaryPart

                if k.Parent ~= t1.value1 or (not Character or not v953) then
                    local v956 = v804

                    if v956.Board then
                        v956.Board.Enabled = false
                    end

                    if v956.Avatar then
                        v956.Avatar.Visible = false
                    end

                    if v956.HealthBack then
                        v956.HealthBack.Visible = false
                    end

                    if v956.WeaponIcons then
                        v956.WeaponIcons.Visible = false
                    end

                    if v956.ZoneText then
                        v956.ZoneText.Visible = false
                    end

                    return
                end

                if v954 and v954.Health <= 0 then
                    local v957 = v804

                    if v957.Board then
                        v957.Board.Enabled = false
                    end

                    if v957.Avatar then
                        v957.Avatar.Visible = false
                    end

                    if v957.HealthBack then
                        v957.HealthBack.Visible = false
                    end

                    if v957.WeaponIcons then
                        v957.WeaponIcons.Visible = false
                    end

                    if v957.ZoneText then
                        v957.ZoneText.Visible = false
                    end

                    return
                end

                local v958 = v954 and math.clamp(v954.Health / math.max(v954.MaxHealth, 1), 0, 1) or 1
                local u959 = false

                if v955 then
                    pcall(function()
                        u959 = v16(v955)
                    end)
                end

                local v960 = v489(v958, u959)
                local v961 = t1.value17 and k == v797
                local v962 = v961 and t1.value21 or (u959 and Color3.fromRGB(60, 255, 120) or Color3.fromRGB(255, 255, 255))

                v804.Board.Adornee = v953
                v804.Board.Enabled = v794
                v804.Avatar.Visible = t1.value29
                v804.NameText.Visible = t1.value29
                v804.NameText.Text = k.Name
                v804.NameText.TextColor3 = v962
                v804.RangeText.Visible = t1.value31 and (v801 ~= nil and v955 ~= nil)
                v804.RangeText.TextColor3 = v961 and t1.value21 or Color3.fromRGB(215, 220, 235)

                if v801 and v955 then
                    v804.RangeText.Text = tostring((math.floor((v801.Position - v955.Position).Magnitude))) .. " m"
                end

                pcall(function()
                    t18.value17(v804, k)
                end)
                v804.ZoneText.Visible = t1.value29 and u959
                v804.HealthBack.Visible = t1.value30 and v954 ~= nil
                v804.HealthFill.Size = UDim2.new(v958, 0, 1, 0)
                v804.HealthFill.BackgroundColor3 = v960

                if v804.PanelStroke then
                    v804.PanelStroke.Color = v961 and t1.value21 or Color3.fromRGB(90, 150, 255)
                end
            end)
        end
    end
    function t18.value19(p86)
        if p86 == t1.value10 or p86.Parent ~= t1.value1 then
            return
        end

        if t1.value122.PlayerConnections[p86] then
            return
        end

        local t23 = {}

        local function v807(p87)
            if p86.Parent ~= t1.value1 or p87 ~= p86.Character then
                return
            end

            local v964 = p86

            t18.value16(v964)
        end
        local function v808(p88)
            if not p88 then
                return
            end

            local v966 = t18.value13[p86]

            if v966 and p88 ~= v966.Character then
                local v967 = p86
                local v968 = t18.value13[v967]

                if v968 then
                    if v968.Board then
                        v968.Board:Destroy()
                    end

                    t18.value13[v967] = nil
                end
            end

            t18.value16(p86)

            if t23.CharacterDescendant then
                t23.CharacterDescendant:Disconnect()
                t23.CharacterDescendant = nil
            end

            if t23.HumanoidDied then
                t23.HumanoidDied:Disconnect()
                t23.HumanoidDied = nil
            end

            t23.CharacterDescendant = p88.DescendantAdded:Connect(function(descendant)
                if descendant:IsA("BasePart") or descendant:IsA("Humanoid") then
                    task.defer(function()
                        v807(p88)
                    end)
                end
            end)
            task.spawn(function()
                local Humanoid = p88:WaitForChild("Humanoid", 5)

                if not Humanoid or (p86.Parent ~= t1.value1 or p86.Character ~= p88) then
                    return
                end

                t23.HumanoidDied = Humanoid.Died:Connect(function()
                    if p86.Character == p88 then
                        local v996 = p86
                        local v997 = t18.value13[v996]

                        if not v997 then
                            return
                        end

                        if v997.Board then
                            v997.Board:Destroy()
                        end

                        t18.value13[v996] = nil
                    end
                end)

                if Humanoid.Health <= 0 and p86.Character == p88 then
                    local v993 = p86
                    local v994 = t18.value13[v993]

                    if not v994 then
                        return
                    end

                    if v994.Board then
                        v994.Board:Destroy()
                    end

                    t18.value13[v993] = nil
                end
            end)
            task.defer(function()
                v807(p88)
            end)
            task.delay(0.1, function()
                v807(p88)
            end)
            task.spawn(function()
                for _ = 1, 60 do
                    if p86.Parent ~= t1.value1 or p86.Character ~= p88 then
                        return
                    end

                    if t18.value13[p86] then
                        return
                    end

                    v807(p88)
                    task.wait(0.1)
                end
            end)
        end

        t23.CharacterAdded = p86.CharacterAdded:Connect(v808)
        t23.CharacterAppearanceLoaded = p86.CharacterAppearanceLoaded:Connect(function(character)
            if character == p86.Character then
                task.defer(function()
                    if p86.Parent == t1.value1 and not t18.value13[p86] then
                        pcall(function()
                            t18.value16(p86)
                        end)
                    end
                end)
            end
        end)
        t23.CharacterRemoving = p86.CharacterRemoving:Connect(function()
            local v970 = p86
            local v971 = t18.value13[v970]

            if v971 then
                if v971.Board then
                    v971.Board:Destroy()
                end

                t18.value13[v970] = nil
            end

            if t23.CharacterDescendant then
                t23.CharacterDescendant:Disconnect()
                t23.CharacterDescendant = nil
            end

            if t23.HumanoidDied then
                t23.HumanoidDied:Disconnect()
                t23.HumanoidDied = nil
            end
        end)

        local Character = p86.Character

        if Character then
            v808(Character)
        end

        t1.value122.PlayerConnections[p86] = t23
    end

    local function v490(p89)
        if p89 == t1.value10 or p89.Parent ~= t1.value1 then
            return
        end

        local v811 = (t18.value15[p89] or 0) + 1

        t18.value15[p89] = v811
        task.spawn(function()
            for _ = 1, 50 do

                if t18.value15[p89] ~= v811 or (p89.Parent ~= t1.value1 or t18.value13[p89]) then
                    return
                end
                if p89.Character then
                    pcall(function()
                        t18.value16(p89)
                    end)
                end
                if t18.value13[p89] then
                    return
                end
                task.wait(0.1)
            end
        end)
    end
    local function v491()

        for v814, v815 in ipairs(t1.value1:GetPlayers()) do

            local v816 = v815

            if v816 ~= t1.value10 then
                pcall(function()
                    t18.value19(v816)

                    local Character = v816.Character
                    local v975 = t18.value13[v816]
                    local v976 = v975

                    if v975 then
                        v976 = Character ~= v975.Character or (not v975.Board or not v975.Board.Parent)
                    end

                    if v976 then
                        local v977 = v816
                        local v978 = t18.value13[v977]

                        if v978 then
                            if v978.Board then
                                v978.Board:Destroy()
                            end

                            t18.value13[v977] = nil
                        end

                        v975 = nil
                    end

                    if Character and not v975 then
                        t18.value16(v816)
                    end

                    if Character and not t18.value13[v816] then
                        v490(v816)
                    end
                end)
            end
        end
        for k in pairs(t18.value13) do
            local v818 = k

            if v818.Parent ~= t1.value1 then
                local v819 = t18.value13[v818]

                if v819 then
                    if v819.Board then
                        v819.Board:Destroy()
                    end

                    t18.value13[v818] = nil
                end
            end
        end
    end

    task.defer(v491)
    t1.value122.PlayerAddedConnection = t1.value1.PlayerAdded:Connect(function(player)
        pcall(function()
            t18.value19(player)
        end)
        task.defer(v491)
    end)
    t1.value122.PlayerRemovingConnection = t1.value1.PlayerRemoving:Connect(function(player)
        if player == t1.value164.Player then
            t1.value166()
        end

        if player == t1.value56 then
            t1.value56 = nil
        end

        t18.value15[player] = nil

        local v822 = t18.value13[player]

        if v822 then
            if v822.Board then
                v822.Board:Destroy()
            end

            t18.value13[player] = nil
        end

        local v823 = t1.value122.PlayerConnections[player]

        if v823 then
            for _, v in pairs(v823) do
                local v826 = v

                pcall(function()
                    v826:Disconnect()
                end)
            end

            t1.value122.PlayerConnections[player] = nil
        end
    end)
    t18.value20 = 0
    t18.value21 = 0
    t18.value22 = 0
    t1.value122.RenderConnection = t1.value2.RenderStepped:Connect(function(dt)
        t18.value20 = t18.value20 + dt

        if t1.value34 then
            t18.value21 = t18.value21 + dt

            local Character = t1.value10.Character
            local Backpack = t1.value10:FindFirstChildOfClass("Backpack")

            if t18.value21 >= 0.2 or (Character ~= t1.value65.LastCharacter or Backpack ~= t1.value65.LastBackpack) then
                t1.value65.LastCharacter = Character
                t1.value65.LastBackpack = Backpack
                pcall(function()
                    t1.value112(Character)
                    t1.value112(Backpack)
                end)
            end
        end

        if t1.value36 then
            t18.value22 = t18.value22 + dt

            local Character = t1.value10.Character
            local Backpack = t1.value10:FindFirstChildOfClass("Backpack")

            if t18.value22 >= 0.2 or (Character ~= t1.value113.LastCharacter or Backpack ~= t1.value113.LastBackpack) then
                t1.value113.LastCharacter = Character
                t1.value113.LastBackpack = Backpack
                pcall(function()
                    t1.value116(Character)
                    t1.value116(Backpack)
                end)
            end
        end

        if t1.value32 then
            pcall(v491)
        end

        if t18.value20 >= 5 then
            pcall(v491)
        end

        t18.value14 = t18.value14 + dt

        if t18.value14 >= t1.value121 then
            pcall(t18.value18)
        end

        local Player = t1.value164.Player

        if Player then
            if Player.Parent ~= t1.value1 then
                t1.value166()

                return
            end

            local Character = Player.Character
            local v834 = Character and Character:FindFirstChildOfClass("Humanoid")
            local v835 = t1.value165()

            if v834 and (v835 and v834 ~= v835.CameraSubject) then
                v835.CameraType = Enum.CameraType.Custom
                v835.CameraSubject = v834
            end
        end
    end)
    t18.value23 = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/1.6.65/main.lua"))()

    local value23 = t18.value23
    local color3_8 = Color3.fromRGB(255, 45, 95)
    local color3_9 = Color3.fromRGB(98, 5, 24)
    local color3_10 = Color3.fromRGB(255, 245, 247)
    local color3_11 = Color3.fromRGB(255, 145, 175)
    local color3_12 = Color3.fromRGB(27, 1, 6)
    local color3_13 = Color3.fromRGB(225, 25, 65)
    local color3_14 = Color3.fromRGB(255, 75, 120)
    local color3_15 = Color3.fromRGB(100, 7, 30)

    value23:AddTheme({
		Name = "VividCrimson",
		Accent = color3_8,
		Dialog = color3_9,
		Text = color3_10,
		Placeholder = color3_11,
		Background = color3_12,
		Button = color3_13,
		Icon = color3_14,
		ElementBackground = color3_15,
		ElementBackgroundTransparency = 0.12
	})
    t18.value24 = {
		["Automatic Mode"] = true,
		["No Recoil"] = true,
		["Walk Speed"] = true,
		["FPS Boost"] = true,
		["Jump Power"] = true,
		["Infinite Stamina"] = true,
		Spin = true,
		["Anti Kill"] = true,
		["Auto Heal"] = true,
		["Snap Under"] = true
	}

    function t18.value25(p90, p91)
        if p91 ~= nil and not p91 or not t18.value24[p90] then
            return
        end

        local v838 = p91 ~= nil and "activado" or "ejecutado"

        pcall(function()
            local value23_2 = t18.value23
            local v980 = v838
            local Notify = value23_2.Notify
            local v982 = "[OK] " .. v980 .. " correctamente  [ " .. tostring(p90) .. " ]"

            Notify(value23_2, {
				Title = "FREDDY'S HUB",
				Content = v982,
				Duration = 2
			})
        end)
    end

    t18.value26 = nil
    t18.value27 = nil
    t18.value28 = nil

    function t18.value29()
        if t18.value27 then
            t18.value27:Disconnect()
        end

        if t18.value28 then
            t18.value28:Disconnect()
        end

        if t18.value26 then
            t18.value26:Destroy()
        end
    end
    function t18.value30()
        t18.value29()
        local TextButton = Instance.new("TextButton")
        TextButton.Name = "SnapButton"
        TextButton.Position = UDim2.fromOffset(24, 180)
        TextButton.Size = UDim2.fromOffset(100, 28)
        TextButton.BackgroundColor3 = Color3.fromRGB(183, 22, 40)
        TextButton.BorderSizePixel = 0
        TextButton.Text = "Snap"
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextSize = 14
        TextButton.Font = Enum.Font.GothamBold
        TextButton.AutoButtonColor = true
        TextButton.Active = true
        TextButton.ZIndex = 200
        TextButton.Parent = t18.value1
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 8)
        local UIStroke6 = Instance.new("UIStroke", TextButton)
        UIStroke6.Color = Color3.fromRGB(255, 55, 75)
        UIStroke6.Thickness = 1
        TextButton.MouseButton1Click:Connect(function()
            t1.value91()
        end)
        local u841 = false
        local u842
        local inputPosition
        local TextButtonPosition
        TextButton.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                u841 = true
                u842 = input
                inputPosition = input.Position
                TextButtonPosition = TextButton.Position
            end
        end)
        TextButton.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                u842 = input
            end
        end)
        t1.value3.InputChanged:Connect(function(input)
            if not u841 or (input ~= u842 or not TextButtonPosition) then
                return
            end

            local v986 = input.Position - inputPosition

            TextButton.Position = UDim2.new(TextButtonPosition.X.Scale, TextButtonPosition.X.Offset + v986.X, TextButtonPosition.Y.Scale, TextButtonPosition.Y.Offset + v986.Y)
        end)
        t1.value3.InputEnded:Connect(function(input)
            if input ~= u842 then
            end
        end)
    end

    if t1.value54 then
        t18.value30()
    end

    local value23_3 = t18.value23
    local uDim = UDim.new(0, 12)
    local CreateWindow = value23_3.CreateWindow
    local colorSequence = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 20, 35)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 20, 35))
	})
    local t24 = {
		Title = "",
		Icon = "rbxassetid://92990315348047",
		CornerRadius = uDim,
		StrokeThickness = 2,
		Scale = 1,
		Color = colorSequence,
		OnlyMobile = false,
		Enabled = true,
		OnlyIcon = true,
		Draggable = false
	}
    local v506 = CreateWindow(value23_3, {
		Title = "FREDDY'S HUB",
		Icon = "door-open",
		Author = "By Cristo Dev",
		Transparent = true,
		TransparencyValue = 0.2,
		Theme = "VividCrimson",
		OpenButton = t24
	})
    local OpenButtonMain = v506.OpenButtonMain
    local v508 = OpenButtonMain and OpenButtonMain.Button

    t18.value31 = v508 and v508.Parent

    local v509 = v508 and v508:FindFirstChild("TextButton")

    if v509 and t18.value31 then
        v508.BackgroundTransparency = 1
        v509.BackgroundTransparency = 1
        local Drag = v508:FindFirstChild("Drag")
        local Divider = v508:FindFirstChild("Divider")
        if Drag then
            Drag.Visible = false
        end
        if Divider then
            Divider.Visible = false
        end
        v508.UICorner.CornerRadius = UDim.new(0, 12)
        v509.UICorner.CornerRadius = UDim.new(0, 8)
        v508.UIStroke.Transparency = 1
        local UIPadding = v508:FindFirstChildOfClass("UIPadding")
        if UIPadding then
            UIPadding.PaddingLeft = UDim.new(0, 3)
            UIPadding.PaddingRight = UDim.new(0, 3)
        end
        local UIPadding2 = v509:FindFirstChildOfClass("UIPadding")
        if UIPadding2 then
            UIPadding2.PaddingLeft = UDim.new(0, 2)
            UIPadding2.PaddingRight = UDim.new(0, 2)
        end
        local Frame = v509:FindFirstChildOfClass("Frame")
        if Frame then
            Frame.Size = UDim2.fromOffset(34, 34)
            Frame.BackgroundTransparency = 1
            Frame.ClipsDescendants = true

            local FreddyIconCorner = Frame:FindFirstChild("FreddyIconCorner")

            if not FreddyIconCorner then
                FreddyIconCorner = Instance.new("UICorner")
                FreddyIconCorner.Name = "FreddyIconCorner"
                FreddyIconCorner.Parent = Frame
            end

            FreddyIconCorner.CornerRadius = UDim.new(0, 8)

            local FreddyIconStroke = Frame:FindFirstChild("FreddyIconStroke")

            if not FreddyIconStroke then
                FreddyIconStroke = Instance.new("UIStroke")
                FreddyIconStroke.Name = "FreddyIconStroke"
                FreddyIconStroke.Parent = Frame
            end

            FreddyIconStroke.Color = Color3.fromRGB(220, 20, 35)
            FreddyIconStroke.Thickness = 2
            FreddyIconStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local ImageLabel = Frame:FindFirstChild("ImageLabel")

            if ImageLabel then
                local UICorner2 = ImageLabel:FindFirstChildOfClass("UICorner")

                if UICorner2 then
                    UICorner2.CornerRadius = UDim.new(0, 8)
                end
            end
        end
        local u519 = false
        local inputPosition
        local value31Position
        v509.InputBegan:Connect(function(input)
            if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
                return
            end

            u519 = true
            inputPosition = input.Position
            value31Position = t18.value31.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    u519 = false
                end
            end)
        end)
        t1.value3.InputChanged:Connect(function(input)
            if not u519 or input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
                return
            end

            local v847 = input.Position - inputPosition

            t18.value31.Position = UDim2.new(value31Position.X.Scale, value31Position.X.Offset + v847.X, value31Position.Y.Scale, value31Position.Y.Offset + v847.Y)
        end)
    end

    local color3_16 = Color3.fromRGB(145, 18, 28)

    v506:Tag({
		Title = "V 0.5",
		Color = color3_16,
		Radius = 8,
		Border = true
	})

    local _Color3 = Color3
    local Tag = v506.Tag
    local v525 = _Color3.fromRGB(35, 170, 90)

    t18.value32 = Tag(v506, {
		Title = "FPS: --",
		Color = v525,
		Radius = 8,
		Border = true
	})

    local fromRGB = Color3.fromRGB
    local Tag2 = v506.Tag
    local v528 = fromRGB(35, 170, 90)

    t18.value33 = Tag2(v506, {
		Title = "PING: --",
		Color = v528,
		Radius = 8,
		Border = true
	})
    t18.value34 = 0
    t18.value35 = 0
    t18.value36 = 60
    t1.value2.RenderStepped:Connect(function(dt)
        local v849 = t18

        v849.value34 = v849.value34 + 1

        local v850 = t18

        v850.value35 = v850.value35 + dt

        if t18.value35 >= 1 then
            local floor = math.floor
            local value35 = t18.value35

            t18.value36 = floor(t18.value34 / value35 + 0.5)
        end
    end)
    task.spawn(function()
        local value36
        local v854
        while true do
            task.wait(0.5)

            local v855 = t18.value36 >= 50 and Color3.fromRGB(35, 190, 100) or (t18.value36 >= 30 and Color3.fromRGB(220, 170, 45) or Color3.fromRGB(210, 60, 65))
            local v856 = math.floor((t1.value10:GetNetworkPing() or 0) * 1000 + 0.5)
            local v857 = v856 <= 80 and Color3.fromRGB(35, 190, 100) or (v856 <= 150 and Color3.fromRGB(220, 170, 45) or Color3.fromRGB(210, 60, 65))

            if value36 ~= t18.value36 then
                value36 = t18.value36
                t18.value32:SetTitle("FPS: " .. tostring(t18.value36)):SetColor(v855)
            end

            if v854 ~= v856 then
                v854 = v856
                t18.value33:SetTitle("PING: " .. tostring(v856) .. " ms"):SetColor(v857)
            end
        end
    end)

    local v529 = v506:Tab({
		Title = "MAIN",
		Icon = "house",
		Locked = false
	})

    v529:Section({
		Title = "General"
	})

    local Toggle = v529.Toggle
    local value25 = t1.value25

    Toggle(v529, {
		Title = "Hide Name",
		Desc = "Oculta tu nombre",
		Value = value25,
		Callback = function(p92)
        t1.value25 = p92
        t1.value138()
        t18.value25("Hide Name", p92)
    end
	})

    local Toggle2 = v529.Toggle
    local value126 = t1.value126

    Toggle2(v529, {
		Title = "Pickup items",
		Desc = "Recoge objetos cercanos",
		Value = value126,
		Callback = function(p93)
        t1.value134(p93)
        t18.value25("Pickup items", p93)
    end
	})

    local value27 = t1.value27

    v529:Toggle({
		Title = "Skip animation",
		Desc = "Abre las cajas más rápido",
		Value = value27,
		Callback = function(p94)
        t1.value119(p94)
        t18.value25("Skip animation", p94)
    end
	})
    v529:Section({
		Title = "Rendimiento"
	})

    local value33 = t1.value33

    v529:Toggle({
		Title = "FPS Boost",
		Desc = "Mejora el rendimiento",
		Value = value33,
		Callback = function(p95)
        t1.value125(p95)
        t18.value25("FPS Boost", p95)
    end
	})

    local v536 = v506:Tab({
		Title = "AIM",
		Icon = "crosshair",
		Locked = false
	})

    v536:Section({
		Title = "Aim"
	})

    local value17 = t1.value17

    v536:Toggle({
		Title = "Silent Aim",
		Desc = "Apunta al objetivo cercano",
		Value = value17,
		Callback = function(p96)
        t1.value17 = p96 == true

        if t1.value17 then
        end
    end
	})

    local Toggle3 = v536.Toggle
    local value19 = t1.value19

    Toggle3(v536, {
		Title = "Mostrar FOV",
		Desc = "Muestra el área del aim",
		Value = value19,
		Callback = function(p97)
        t1.value19 = p97 == true
        t18.value3()
    end
	})

    local v540 = not t1.value15 and 800 or 1000
    local Slider = v536.Slider
    local t25 = {
		Min = 40,
		Max = v540,
		Default = t1.value18
	}

    Slider(v536, {
		Title = "Ajustar FOV",
		Desc = "Cambia el tamaño del FOV",
		Step = 10,
		Value = t25,
		Callback = function(p98)
        math.clamp(tonumber(p98) or 120, 20, not t1.value15 and 800 or 1000)
        t18.value3()
    end
	})
    v536:Section({
		Title = "Friends"
	})

    local v543 = v18()

    t18.value37 = v536:Dropdown({
		Title = "Friend List",
		Desc = "Ignora jugadores seleccionados",
		Values = v543,
		Multi = true,
		AllowNone = true,
		Value = {},
		Callback = function(p99)
        t1.value180(p99)
    end
	})
    v536:Button({
		Title = "Refresh",
		Desc = "Actualiza la lista",
		Callback = function()
        if t18.value37 and t18.value37.Refresh then
            local value37 = t18.value37
            local t26 = { v18() }

            value37:Refresh(v2(t26))
        end
    end
	})

    local v544 = v506:Tab({
		Title = "ESP",
		Icon = "eye",
		Locked = false
	})

    v544:Section({
		Title = "Jugadores"
	})

    local Toggle4 = v544.Toggle
    local value29 = t1.value29

    Toggle4(v544, {
		Title = "Nombre",
		Desc = "Muestra nombres",
		Value = value29,
		Callback = function(p100)
        t1.value29 = p100
        t18.value25("Nombre", p100)
    end
	})

    local Toggle5 = v544.Toggle
    local value30 = t1.value30

    Toggle5(v544, {
		Title = "Barra de vida",
		Desc = "Muestra la vida",
		Value = value30,
		Callback = function(p101)
        t1.value30 = p101
        t18.value25("Barra de vida", p101)
    end
	})

    local value31 = t1.value31

    v544:Toggle({
		Title = "Distancia",
		Desc = "Muestra la distancia",
		Value = value31,
		Callback = function(p102)
        t1.value31 = p102
        t18.value25("Distancia", p102)
    end
	})
    v544:Section({
		Title = "Objetos"
	})

    local value140 = t1.value140

    v544:Toggle({
		Title = "Articulos",
		Desc = "Muestra artículos",
		Value = value140,
		Callback = function(p103)
        t1.value140 = p103
        t1.value141 = p103

        if not p103 then
            t1.value143()
        end

        t18.value25("Articulos", p103)
    end
	})

    local v551 = v506:Tab({
		Title = "Move",
		Icon = "move",
		Locked = false
	})

    v551:Section({
		Title = "Movement"
	})

    local value49 = t1.value49

    v551:Toggle({
		Title = "Infinite Stamina",
		Desc = "Barra llena y sprint activo",
		Value = value49,
		Callback = function(p104)
        v4(p104)
        t18.value25("Infinite Stamina", p104)
    end
	})

    local Toggle6 = v551.Toggle
    local value39 = t1.value39

    Toggle6(v551, {
		Title = "Walk Speed",
		Desc = "Aumenta tu velocidad",
		Value = value39,
		Callback = function(p105)
        t1.value79(p105)
        t18.value25("Walk Speed", p105)
    end
	})

    local Slider2 = v551.Slider
    local t27 = {
		Min = 1,
		Max = 5,
		Default = t1.value40
	}

    Slider2(v551, {
		Title = "Speed Adjustment",
		Desc = "Ajusta la velocidad",
		Step = 0.5,
		Value = t27,
		Callback = function(p106)
        math.clamp(tonumber(p106) or 2, 1, 5)
    end
	})

    local Toggle7 = v551.Toggle
    local value46 = t1.value46

    Toggle7(v551, {
		Title = "Jump Power",
		Desc = "Activa el salto doble",
		Value = value46,
		Callback = function(p107)
        t1.value77(p107)
        t18.value25("Jump Power", p107)
    end
	})
    v551:Section({
		Title = "Anti Mods"
	})

    local Toggle8 = v551.Toggle
    local value42 = t1.value42

    Toggle8(v551, {
		Title = "Spin",
		Desc = "Hace girar rápidamente a tu personaje",
		Value = value42,
		Callback = function(p108)
        t1.value81(p108)
        t18.value25("Spin", p108)
    end
	})

    local value44 = t1.value44

    v551:Toggle({
		Title = "Anti Kill",
		Desc = "Crea una plataforma y hace flicker al quedar derribado",
		Value = value44,
		Callback = function(p109)
        t1.value89(p109)
        t18.value25("Anti Kill", p109)
    end
	})
    v551:Section({
		Title = "Auto Healt"
	})

    local Toggle9 = v551.Toggle
    local value28 = t1.value28

    Toggle9(v551, {
		Title = "Skip heal animation",
		Desc = "Omite la animación de Blood Bag y Med Kit",
		Value = value28,
		Callback = function(p110)
        t1.value106(p110)
        t18.value25("Skip heal animation", p110)
    end
	})

    local value50 = t1.value50

    v551:Toggle({
		Title = "Auto Heal",
		Desc = "Usa objetos de curación",
		Value = value50,
		Callback = function(p111)
        t1.value50 = p111 == true
        t1.value108()

        if t1.value50 then
            t1.value62.Loop = task.spawn(function()
                while t1.value50 do
                    local Character = t1.value10.Character
                    local v989 = Character and Character:FindFirstChildOfClass("Humanoid")

                    if v989 and (v989.MaxHealth > 0 and v989.Health > 0) and v989.Health / v989.MaxHealth * 100 <= t1.value51 then
                        local v990 = v5(t1.value10:FindFirstChildOfClass("Backpack")) or v5(t1.value10.Character)

                        if v990 then
                            t1.value107(v990)
                        end
                    end

                    task.wait(0.3)
                end

                t1.value62.Loop = nil
            end)
        end

        t18.value25("Auto Heal", p111)
    end
	})

    local Slider3 = v551.Slider
    local t28 = {
		Min = 1,
		Max = 100,
		Default = t1.value51
	}

    Slider3(v551, {
		Title = "Health Percent to Heal",
		Desc = "Porcentaje para curarte",
		Step = 1,
		Value = t28,
		Callback = function(p112)
        math.clamp(tonumber(p112) or 50, 1, 100)
    end
	})
    v551:Section({
		Title = "Snap Under"
	})

    local value54 = t1.value54

    v551:Toggle({
		Title = "Snap Tab",
		Desc = "Muestra una mini UI arrastrable",
		Value = value54,
		Callback = function(p113)
        t1.value54 = p113 == true

        if t1.value54 then
            t18.value30()

            return
        end

        t18.value29()
    end
	})

    local value52 = t1.value52

    v551:Toggle({
		Title = "Snap Under",
		Desc = "Mantiene tu personaje abajo",
		Value = value52,
		Callback = function(p114)
        t1.value92(p114)
        t18.value25("Snap Under", p114)
    end
	})

    local Slider4 = v551.Slider
    local t29 = {
		Min = 1,
		Max = 150,
		Default = t1.value53
	}

    Slider4(v551, {
		Title = "Snap Height",
		Desc = "Ajusta la altura",
		Value = t29,
		Callback = function(p115)
        math.clamp(tonumber(p115) or 10, 1, 150)
    end
	})

    local v571 = v506:Tab({
		Title = "Vehicle",
		Icon = "car",
		Locked = false
	})

    v571:Section({
		Title = "Vehicle"
	})
    v571:Button({
		Title = "Atraer carro",
		Desc = "Trae tu carro hacia ti",
		Callback = function()
        t1.value93()
    end
	})

    local v572 = v506:Tab({
		Title = "GunMod",
		Icon = "zap",
		Locked = false
	})

    v572:Section({
		Title = "Gun Modificaciones"
	})

    local Slider5 = v572.Slider
    local t30 = {
		Min = 1,
		Max = 2000,
		Default = t1.value37
	}

    Slider5(v572, {
		Title = "Fire Rate",
		Desc = "Ajusta la velocidad de disparo",
		Step = 1,
		Value = t30,
		Callback = function(p116)
        math.clamp(tonumber(p116) or 1000, 1, 2000)

        if t1.value36 then
            t1.value117()
        end
    end
	})

    local Slider6 = v572.Slider
    local t31 = {
		Min = 0,
		Max = 1,
		Default = t1.value38
	}

    Slider6(v572, {
		Title = "Accuracy",
		Desc = "Ajusta la precisión del arma",
		Step = 0.01,
		Value = t31,
		Callback = function(p117)
        math.clamp(tonumber(p117) or 1, 0, 1)

        if t1.value36 then
            t1.value117()
        end
    end
	})

    local value36 = t1.value36

    v572:Toggle({
		Title = "Automatic Mode",
		Desc = "Disparo automático",
		Value = value36,
		Callback = function(p118)
        t1.value36 = p118
        t1.value113.LastCharacter = nil
        t1.value113.LastBackpack = nil

        if t1.value36 then
            t1.value117()
        end

        t18.value25("Automatic Mode", p118)
    end
	})

    local value34 = t1.value34

    v572:Toggle({
		Title = "No Recoil",
		Desc = "Elimina el retroceso",
		Value = value34,
		Callback = function(p119)
        v7(p119)
        t18.value25("No Recoil", p119)
    end
	})

    local v579 = v506:Tab({
		Title = "MISC",
		Icon = "settings",
		Locked = false
	})

    v579:Section({
		Title = "Espectador"
	})

    local Toggle10 = v579.Toggle
    local value55 = t1.value55

    Toggle10(v579, {
		Title = "Espectear jugadores",
		Desc = "Mira desde otro jugador",
		Value = value55,
		Callback = function(p120)
        t1.value55 = p120

        if p120 then
            if t1.value56 then
                t1.value167(t1.value56)

                return
            end
        else
            t1.value166()
        end
    end
	})

    local v582 = t1.value168()
    local v583 = t1.value56 and t1.value56.Name or nil

    t18.value38 = v579:Dropdown({
		Title = "Spectate player",
		Desc = "Elige un jugador",
		Values = v582,
		Value = v583,
		Callback = function(p121)
        local _tostring = tostring

        if not p121 then
            p121 = ""
        end

        local v891 = _tostring(p121)
        local v892 = t1.value1:FindFirstChild(v891)

        if t1.value55 then
            if v892 and v892 ~= t1.value10 then
                t1.value167(v892)

                return
            end

            t1.value166()
        end
    end
	})
    v579:Button({
		Title = "Refresh",
		Desc = "Actualiza las listas",
		Callback = function()
        local v893 = t1.value168()

        if t18.value38 and t18.value38.Refresh then
            t18.value38:Refresh(v893)
        end

        if t18.value37 and t18.value37.Refresh then
            local value37 = t18.value37
            local t32 = { v18() }

            value37:Refresh(v2(t32))
        end

        if t1.value164.Player and t1.value164.Player.Parent ~= t1.value1 then
            t1.value166()
        end

        t18.value25("Refresh")
    end
	})
    v579:Section({
		Title = "Configuracion"
	})
    v579:Button({
		Title = "Guardar",
		Desc = "Guarda la configuración",
		Callback = function()
        t1.value155:Save("Default")
        t18.value25("Guardar")
    end
	})
    v579:Button({
		Title = "Rejoin Server",
		Desc = "Vuelve al servidor",
		Callback = function()
        local ok, result = pcall(function()
            t1.value8:TeleportToPlaceInstance(game.PlaceId, game.JobId, t1.value10)
        end)

        if not (ok) then
            local _ = "ERROR AL REUNIRSE: " .. tostring(result)
        end

        t18.value25("Rejoin Server")
    end
	})

    local v584 = v506:Tab({
		Title = "INFO",
		Icon = "info",
		Locked = false
	})

    t18.value39 = nil
    pcall(function()
        t18.value39 = t1.value1:GetUserIdFromNameAsync("Elpatron666788")
    end)

    local v585 = t18.value39 and "https://www.roblox.com/avatar-thumbnail/image?userId=" .. tostring(t18.value39) .. "&width=420&height=420&format=png" or "rbxasset://textures/ui/GuiImagePlaceholder.png"

    v584:Section({
		Title = "CREADOR"
	})
    v584:Image({
		Image = v585,
		AspectRatio = "1:1",
		Radius = 9
	})
    v584:Paragraph({
		Title = "Elpatron666788",
		Desc = "FREDDY'S HUB [🟢]\nVersion: V 0.5"
	})

    function t18.value40()

        local s1 = "discord://-/invite/9AESK2pPvG"
        local u900 = false
        pcall(function()
            if type(open_url) == "function" then
                open_url(s1)
                u900 = true
            end
        end)
        if not u900 then
            pcall(function()
                game:GetService("GuiService"):OpenBrowserWindow("https://discord.gg/9AESK2pPvG")
            end)
        end
        pcall(function()
            setclipboard("https://discord.gg/9AESK2pPvG")
        end)
        task.wait(0.25)
        t1.value10:Kick("Abriendo Discord: FREDDY'S HUB")
    end

    v584:Button({
		Title = "Copiar Discord",
		Desc = "Abre la invitación de FREDDY'S HUB",
		Callback = function()
        t18.value40()
    end
	})
    v584:Button({
		Title = "Copiar TikTok",
		Desc = "Copia el usuario",
		Callback = function()
        setclipboard("@freddys.hub")
        t18.value25("Copiar TikTok")
    end
	})
    v529:Select()
end
t1.value183 = "MI SERVICIO SIN CLAVES"
t1.value184 = "1071481"
t1.value185 = "FREDDY’S"
t1.value186 = 2
local v19 = t1.value155.Folder .. "/FreddysHub_key.txt"
t1.value187 = nil
t1.value187 = v19
function t1.value188()
    if not t1.value156 or (not t1.value157() or not isfile(t1.value187)) then
        return nil
    end

    local ok, result = pcall(function()
        return readfile(t1.value187)
    end)
    local v588 = not ok

    if not v588 then
        v588 = type(result) ~= "string"
    end

    if v588 then
        return nil
    end

    local v589 = result:gsub("^%s+", ""):gsub("%s+$", "")

    return v589 ~= "" and v589 or nil
end
function t1.value189(p122)
    if not t1.value156 or not t1.value157() then
        return false
    end

    return pcall(function()
        writefile(t1.value187, p122)
    end)
end;
(function(p123)
    local FreddysHubKeySystem = t1.value12:FindFirstChild("FreddysHubKeySystem")
    if FreddysHubKeySystem then
        FreddysHubKeySystem:Destroy()
    end
    local FreddysHubKeyBlur = t1.value6:FindFirstChild("FreddysHubKeyBlur")
    if FreddysHubKeyBlur then
        FreddysHubKeyBlur:Destroy()
    end
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FreddysHubKeySystem"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 1000
    ScreenGui.Parent = t1.value12
    local BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Name = "FreddysHubKeyBlur"
    BlurEffect.Size = 16
    BlurEffect.Parent = t1.value6
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.fromScale(1, 1)
    Frame.BackgroundColor3 = Color3.fromRGB(4, 0, 4)
    Frame.BackgroundTransparency = 0.3
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.ZIndex = 1
    Frame.Parent = ScreenGui
    local v597 = not t1.value15 and 320 or 300
    local Frame5 = Instance.new("Frame")
    Frame5.Size = UDim2.fromOffset(not t1.value15 and 330 or 430, v597)
    Frame5.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame5.Position = UDim2.fromScale(0.5, 0.5)
    Frame5.BackgroundColor3 = Color3.fromRGB(24, 3, 10)
    Frame5.BackgroundTransparency = 0.04
    Frame5.BorderSizePixel = 0
    Frame5.ClipsDescendants = true
    Frame5.ZIndex = 2
    Frame5.Parent = Frame
    Instance.new("UICorner", Frame5).CornerRadius = UDim.new(0, 18)
    local UIStroke = Instance.new("UIStroke", Frame5)
    UIStroke.Color = Color3.fromRGB(220, 20, 35)
    UIStroke.Thickness = 2
    local UIGradient = Instance.new("UIGradient", Frame5)
    UIGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 8, 25)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(32, 4, 14)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 1, 6))
	})
    UIGradient.Rotation = 125
    local function v601(p124, p125, p126, p127, p128)
        local TextLabel = Instance.new("TextLabel")

        TextLabel.Size = UDim2.new(1, -36, 0, p125 + 8)
        TextLabel.Position = p126
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = p124
        TextLabel.TextColor3 = p127

        if not p128 then
            p128 = Enum.Font.Gotham
        end

        TextLabel.Font = p128
        TextLabel.TextSize = p125
        TextLabel.TextXAlignment = Enum.TextXAlignment.Center
        TextLabel.TextYAlignment = Enum.TextYAlignment.Center
        TextLabel.ZIndex = 4
        TextLabel.Parent = Frame5

        return TextLabel
    end
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Size = UDim2.fromOffset(48, 48)
    ImageLabel.AnchorPoint = Vector2.new(0.5, 0)
    ImageLabel.Position = UDim2.new(0.5, 0, 0, 18)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Image = "rbxassetid://116255434488074"
    ImageLabel.ZIndex = 4
    ImageLabel.Parent = Frame5
    Instance.new("UICorner", ImageLabel).CornerRadius = UDim.new(0, 12)
    v601("FREDDY'S HUB", 20, UDim2.new(0, 18, 0, 66), Color3.fromRGB(255, 245, 247), Enum.Font.GothamBold)
    v601("Introduce tu key", 10, UDim2.new(0, 18, 0, 94), Color3.fromRGB(255, 125, 140), Enum.Font.GothamBold)
    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(1, -36, 0, 40)
    TextBox.Position = UDim2.new(0, 18, 0, 124)
    TextBox.BackgroundColor3 = Color3.fromRGB(7, 1, 5)
    TextBox.BackgroundTransparency = 0.08
    TextBox.BorderSizePixel = 0
    TextBox.ClearTextOnFocus = false
    TextBox.PlaceholderText = "Introduce tu key"
    TextBox.PlaceholderColor3 = Color3.fromRGB(180, 115, 130)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Font = Enum.Font.Gotham
    TextBox.TextSize = 12
    TextBox.TextXAlignment = Enum.TextXAlignment.Center
    TextBox.ZIndex = 4
    TextBox.Parent = Frame5
    Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 9)
    local UIStroke7 = Instance.new("UIStroke", TextBox)
    UIStroke7.Color = Color3.fromRGB(150, 18, 34)
    UIStroke7.Thickness = 1
    local v605 = v601("LISTO PARA VALIDAR", 9, UDim2.new(0, 18, 0, 168), Color3.fromRGB(190, 145, 155), Enum.Font.GothamBold)
    local function v606(p129, p130, p131)
        local TextButton = Instance.new("TextButton")

        TextButton.Size = UDim2.new(1, -36, 0, 36)
        TextButton.Position = UDim2.new(0, 18, 0, p130)
        TextButton.BackgroundColor3 = p131
        TextButton.BorderSizePixel = 0
        TextButton.Text = p129
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.Font = Enum.Font.GothamBold
        TextButton.TextSize = 11
        TextButton.AutoButtonColor = true
        TextButton.ZIndex = 4
        TextButton.Parent = Frame5
        Instance.new("UICorner", TextButton).CornerRadius = UDim.new(0, 9)

        local UIStroke8 = Instance.new("UIStroke", TextButton)

        UIStroke8.Color = Color3.fromRGB(245, 55, 75)
        UIStroke8.Thickness = 1

        return TextButton
    end
    local v607 = v606("VERIFICAR KEY", 198, Color3.fromRGB(215, 18, 40))
    local t33 = { Color3.fromRGB(92, 6, 20) }
    local v609 = v606("OBTENER KEY / SOPORTE", 240, v2(t33))
    local n6 = 0
    local u611
    local v612 = t1.value188()
    local function v613(p132, p133)
        v605.Text = p132
        v605.TextColor3 = p133
    end
    local function v614()
        if u611 then
            return u611
        end

        local ok, result = pcall(function()
            return loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
        end)
        local v916 = not ok

        if not v916 then
            v916 = not result
        end

        if v916 then
            return nil, "NO SE PUDO CARGAR JNKIE.COM"
        end

        result.service = t1.value183
        result.identifier = t1.value184
        result.provider = t1.value185
        u611 = result

        return u611
    end
    local function v615(p134)
        local u918 = tostring(p134 or ""):gsub("^%s+", ""):gsub("%s+$", "")
        if u918 == "" then
            v613("ESCRIBE UNA KEY PRIMERO", Color3.fromRGB(255, 200, 80))

            return
        end
        if n6 >= t1.value186 then
            t1.value10:Kick("Demasiados intentos de key")

            return
        end
        n6 += 1
        v613("VERIFICANDO CON JUNKIE.COM  •  " .. n6 .. "/" .. t1.value186, Color3.fromRGB(220, 220, 230))
        local v919, v920 = v614()
        local result
        local v922 = v919
        local ok
        local g925
        local error
        if v922 then
            ok, result = pcall(function()
                return v922.check_key(u918)
            end)
        end
        if ok and (type(result) == "table" and result.valid == true) then
            t1.value189(u918)
            v613("KEY VALIDADA  •  CARGANDO HUB", Color3.fromRGB(100, 255, 140))
            task.wait(0.2)
            ScreenGui:Destroy()
            BlurEffect:Destroy()
            p123()

            return
        end
        if result then
            error = result.error

            if error then
                g925 = true
            end
        end
        if not g925 then
            error = result.message

            if not error then
                error = v920

                if not error then
                    error = "KEY INVALIDA"
                end
            end
        end
        g925 = false
        v613(string.upper((tostring(error))), Color3.fromRGB(255, 90, 105))
        if t1.value156 and isfile(t1.value187) then
            pcall(function()
                delfile(t1.value187)
            end)
        end
        if n6 >= t1.value186 then
            task.wait(0.4)
            t1.value10:Kick("Key invalida")
        end
    end
    v607.MouseButton1Click:Connect(function()
        v615(TextBox.Text)
    end)
    v609.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/9AESK2pPvG")
        v613("ENLACE DE SOPORTE COPIADO", Color3.fromRGB(100, 255, 140))
    end)
    if v612 then
        TextBox.Text = v612
        task.delay(0.25, function()
            if ScreenGui.Parent then
                v615(v612)
            end
        end)
    end
end)(function()
    t1.value163()
    t1.value182()
end)
