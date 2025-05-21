repeat wait() until game:IsLoaded() 

local player = game:GetService("Players")
local localplayer = player.LocalPlayer

repeat wait() until localplayer

empty_function = function(...) return ... end

if not LPH_OBFUSCATED then
    LPH_JIT_MAX = empty_function
    LPH_NO_VIRTUALIZE = empty_function
    LPH_NO_UPVALUES = empty_function
end

local placeId = game.PlaceId
if placeId == 2753915549 then
	FirstSea = true
elseif placeId == 4442272183 then
	SecondSea = true
elseif placeId == 7449423635 then
	ThirdSea = true
end

SeaIndex = ThirdSea and 3 or SecondSea and 2 or FirstSea and 1 or localplayer:Kick("Didn't update this Sea")

print("Select Team")

repeat wait() until localplayer

if not localplayer.Team then
    repeat wait()
        local succ,err = pcall(function()
            repeat wait() until localplayer.PlayerGui:FindFirstChild("Main (minimal)") or localplayer.PlayerGui["Main (minimal)"]:FindFirstChild("ChooseTeam")
            repeat wait()
                if localplayer.PlayerGui["Main (minimal)"].ChooseTeam.Visible then
                    for i, v in pairs(getconnections(localplayer.PlayerGui["Main (minimal)"].ChooseTeam.Container.Pirates.Frame.TextButton.Activated)) do                                                                                                
                        v.Function()
                    end
                end
            until localplayer.Team
        end)
        -- if not succ then warn("Select Team",err) end
    until localplayer.Team
end

wait(2)

repeat wait() until localplayer.Character

local runservice = game:GetService("RunService")
local collectionservice = game:GetService("CollectionService")
local tweenservice = game:GetService("TweenService")
local replicatedstorage = game:GetService("ReplicatedStorage")
local virtualUser = game:GetService("VirtualUser")
local userinputservice = game:GetService("UserInputService")
local httpservice = game:GetService("HttpService")
local WorldOrigin = workspace["_WorldOrigin"]
local RegisterAttack = replicatedstorage.Modules.Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = replicatedstorage.Modules.Net:WaitForChild("RE/RegisterHit")
local Player_Data = localplayer.Data

recentlySpawn = 0

CanTeleport = {
    {
        ["Sky3"] = Vector3.new(-7894, 5547, -380),
        ["Sky3Exit"] = Vector3.new(-4607, 874, -1667),
        ["UnderWater"] = Vector3.new(61163, 11, 1819),
        ["UnderwaterExit"] = Vector3.new(3864, 6, -1926),
    },
    {
        ["Swan Mansion"] = Vector3.new(-390, 332, 673),
        ["Swan Room"] = Vector3.new(2285, 15, 905),
        ["Cursed Ship"] = Vector3.new(923, 126, 32852),
    },
    {
        ["Floating Turtle"] = Vector3.new(-12462, 375, -7552),
        ["Hydra Island"] = Vector3.new(5745, 610, -267),
        ["Mansion"] = Vector3.new(-12462, 375, -7552),
        ["Castle"] = Vector3.new(-5036, 315, -3179),
    }
}

getgenv().KaitunConfig = getgenv().KaitunConfig or {
    ["Start Farm"] = true,

    ["Melee"] = {
        ["Superhuman"] = true,
        ["Death Step"] = true,
        ["Sharkman Karate"] = true,
        ["Electric Claw"] = true,
        ["Dragon Talon"] = true,
        ["God Human"] = true,
    },

    ["Sword"] = {
        ["World 1"] = {
            ["Saber"] = true,
            ["Pole"] = true,
        },
        ["World 2"] = {
            ["Rengoku"] = true,
            ["Midnight Blade"] = true,
            ["Soul Cane"] = true,
            ["Gravity Cane"] = true,
            ["Legendary Sword"] = true,
            ["True Triple Katana"] = true,
        },
        ["World 3"] = {
            ["Twin Hooks"] = true,
            ["Canvander"] = true,
            ["Buddy Sword"] = true,
            ["Hallow Scythe"] = true,
            ["Yama"] = true,
            ["Tushita"] = true,
            ["Cursed Dual Katana"] = true,

            ["Shark Anchor"] = {
                ["Enabled"] = true,
                ["Money"] = 30000000,
            },
        },
    },

    ["Gun"] = {
        ["World 2"] = {
            ["Acidum Rifle"] = true,
            ["Kabucha"] = true,
        },
        ["World 3"] = {
            ["Serpent Bow"] = true,
            ["Soul Guitar"] = true,
        },
    },

    ["Fruit"] = {
        ["Main Fruits"] = {},
        ["Sec Fruits"] = {},
    
        ["Setting"] = {
            ["Bring Fruit"] = true,
            ["Store Fruit"] = true,
            ["Eats Fruit"] = true,
        },
    },

    ["Race"] = {
        ["Select Race"] = {},
        ["Race V2"] = true,
        ["Race V3"] = true,
        ["Reroll Race"] = true,
    },

    ["Mastery"] = {
        ["Melee"] = true,
        ["Sword"] = true,
        ["Fruit"] = true,

        ["Manual"] = {
            ["Select Sword"] = {},
            ["Enabled"] = false
        },
    },

    ["Quest"] = {
        ["World 2"] = {
            ["Factory"] = true,
            ["Bartilo"] = true,
            ["Dark Fragment"] = true,
        },
        ["World 3"] = {
            ["Rainbow Haki"] = true,
            ["Musketeer Hat"] = true,
            ["Dough Awaken"] = true,
            ["Dough Mirror"] = true,
            ["Pull Lever"] = true,
        },
    },

    ["Setting"] = {
        ["Hop Server"] = true,
        
        ["Auto Stats"] = true,
        ["Stats Mode"] = "Fruit",

        ["Notify Remove"] = true,
        ["Disabled Ui"] = true,
        ["Redeem Code"] = true,

        ["Item Finder Fully"] = true,

        ["White Screen"] = true,
        ["Booster FPS"] = true,
        ["Locking FPS"] = 240,
        ["Farm When Lvl Max"] = "Bone",--Cake Prine,Bone
    },
}

function IsLava(v)
    if v:IsA("Script") and v.Name == "LavaDamage" then
        wait()
        v.Parent:Destroy()
    end
end

for i,v in pairs(workspace:GetDescendants()) do
    IsLava(v)
end

game.Lighting.FogEnd = 9e9

if game:GetService("Lighting"):FindFirstChild("BaseAtmosphere") then
    game:GetService("Lighting"):FindFirstChild("BaseAtmosphere"):Destroy()
end

if game:GetService("Lighting"):FindFirstChild("LightingLayers") then
    game:GetService("Lighting"):FindFirstChild("LightingLayers"):Destroy()
end

repeat wait() until replicatedstorage:FindFirstChild("GuideModule") and replicatedstorage:FindFirstChild("Quests")

repeat wait() until Player_Data.Level

local Farm = {}
local QuestHandler = {}

wait(2)

-- Checkquest Globals Variables

QuestHandler.Guide = require(replicatedstorage.GuideModule)
QuestHandler.AllQuests = require(replicatedstorage.Quests)
QuestHandler.QuestAssignments = {}
QuestHandler.BagNumber = {} 
QuestHandler.QuestData = {
    [1] = nil,
    [2] = nil,
}
QuestHandler.CountCheck = 0 

-- Checkquest Functions

QuestHandler.GetAllQuests = LPH_JIT_MAX(function()
    local QuestData  = {}

    for questIndex, questDetails in pairs(QuestHandler.AllQuests) do
        QuestData[questIndex] = {
            ID = questIndex,
            Info = questDetails
        }
    end
    return QuestData 
end)

QuestHandler.DetermineLevelRequirements = LPH_JIT_MAX(function()
    local LevelRequirements = {}

    for _, quest in pairs(QuestHandler.GetAllQuests()) do
        for _, details in pairs(quest.Info) do
            table.insert(LevelRequirements, details.LevelReq)
        end
    end

    local PlayerLevel
    if not QuestHandler.CustomLevel then
        PlayerLevel = Player_Data.Level.Value
    else
        PlayerLevel = QuestHandler.CustomLevel
    end

    -- Adjust PlayerLevel for specific ranges
    -- if PlayerLevel >= 10 and PlayerLevel < 30 then
        -- PlayerLevel = 10
    if PlayerLevel >= 325 and PlayerLevel < 375 then
        PlayerLevel = 325
    elseif FirstSea and PlayerLevel > 675 then
        PlayerLevel = 650
    elseif SecondSea then
        if PlayerLevel > 850 and PlayerLevel < 875 then
            PlayerLevel = 800
        elseif PlayerLevel > 1450 then
            PlayerLevel = 1450
        end
    elseif PlayerLevel >= 1550 and PlayerLevel < 1575 then
        PlayerLevel = 1525
    elseif PlayerLevel >= 2575 then
        PlayerLevel = 2575
    elseif PlayerLevel >= 210 and PlayerLevel < 250 then
        PlayerLevel = 210
    elseif PlayerLevel >= 100 and PlayerLevel < 120 then
        PlayerLevel = 100
    elseif PlayerLevel >= 250 and PlayerLevel < 300 then
        PlayerLevel = 250
    end

    -- Sort LevelRequirements
    table.sort(LevelRequirements)

    local PrimaryQuest, SecondaryQuest, TertiaryQuest

    for i, levelRequirement in pairs(LevelRequirements) do
        if PlayerLevel == levelRequirement then
            PrimaryQuest = LevelRequirements[i]
            if Double_Quest then
                SecondaryQuest = LevelRequirements[i - 1]
                TertiaryQuest = LevelRequirements[i - 2]
            end
            break
        elseif PlayerLevel < levelRequirement then
            PrimaryQuest = LevelRequirements[i - 1]
            if Double_Quest then
                SecondaryQuest = LevelRequirements[i - 2]
                TertiaryQuest = LevelRequirements[i - 3]
            end
            break
        end
    end

    QuestHandler.QuestAssignments = {
        [1] = PrimaryQuest,
        [2] = SecondaryQuest or nil,
    }

    if (PlayerLevel >= 400 and PlayerLevel < 625) or (PlayerLevel > 700 and PlayerLevel <= 1450) then
        QuestHandler.QuestAssignments = {
            [1] = PrimaryQuest,
            [2] = SecondaryQuest or nil,
            [3] = TertiaryQuest,
        }
    end

    -- Specific conditions for quest assignment
    if 
        (PlayerLevel > 90 and PlayerLevel < 100) or
       (PlayerLevel > 190 and PlayerLevel < 210) or
       (PlayerLevel > 300 and PlayerLevel < 325) or
       (PlayerLevel >= 950 and PlayerLevel < 975) or
       (PlayerLevel > 1000 and PlayerLevel < 1050) or
       (PlayerLevel > 1100 and PlayerLevel < 1125) or
       (PlayerLevel > 1250 and PlayerLevel < 1275) or
       (PlayerLevel > 1350 and PlayerLevel < 1375) or
       (PlayerLevel > 1425 and PlayerLevel < 1450) or
       (PlayerLevel > 1575 and PlayerLevel < 1600) or
       (PlayerLevel > 1625 and PlayerLevel < 1650) or
       (PlayerLevel > 1700 and PlayerLevel < 1725) or
       (PlayerLevel > 1775 and PlayerLevel < 1800) or
       (PlayerLevel > 1825 and PlayerLevel < 1850) or
       (PlayerLevel > 1900 and PlayerLevel < 1925) or
       (PlayerLevel > 1975 and PlayerLevel < 2000) or
       (PlayerLevel > 2025 and PlayerLevel < 2050) or
       (PlayerLevel > 2075 and PlayerLevel < 2100) or
       (PlayerLevel > 2125 and PlayerLevel < 2150) or
       (PlayerLevel > 2200 and PlayerLevel < 2225) or
       (PlayerLevel > 2250 and PlayerLevel < 2275) or
       (PlayerLevel > 2300 and PlayerLevel < 2325) or
       (PlayerLevel > 2350 and PlayerLevel < 2400) or
       (PlayerLevel > 2450 and PlayerLevel < 2475) then
        QuestHandler.QuestAssignments = {
            [1] = PrimaryQuest,
            [2] = nil,
            [3] = nil,
        }
    end

    return PrimaryQuest
end)

QuestHandler.DetermineLevelRequirements()

QuestHandler.CheckBossLevel = LPH_JIT_MAX(function(bossData)
    local indexList = {}
    local dataIndex = {}

    -- Collect and sort indices
    for key, _ in pairs(bossData) do
        table.insert(indexList, key)
    end
    table.sort(indexList)

    -- Create a value table based on indices
    for key, value in pairs(bossData) do
        dataIndex[key] = value
    end

    local result

    for _, sortedIndex in pairs(indexList) do
        for _, quest in pairs(QuestHandler.QuestAssignments) do
            if sortedIndex ~= quest then
                continue
            end

            -- Check task validity
            if QuestHandler:FindValue(dataIndex[sortedIndex].Value.Task) == 1 then
                result = dataIndex[indexList[_ - 1]]
            else
                result = dataIndex[indexList[_]]
            end
        end
    end

    return result
end)

QuestHandler.MyData = LPH_JIT_MAX(function()
    QuestHandler.BagNumber = {}

    for _, v in pairs(QuestHandler.QuestData) do
        if not v.Used then
            continue
        end
        QuestHandler.CountCheck += 1
    end

    -- Reset condition
    if QuestHandler.CountCheck >= 2 then
        QuestHandler.CountCheck = 0
        QuestHandler.QuestData = {
            [1] = nil,
            [2] = nil,
        }
    end

    if not Double_Quest then
        QuestHandler.QuestData = {}
    end

    local questPool = {}

    for i, v in pairs(QuestHandler.GetAllQuests()) do
        for _, quest in pairs(v.Info) do
            if (i:sub(1, 11) == "MarineQuest" and #i == 11) or i == "BartiloQuest" or i == "CitizenQuest" then
                continue
            end
            questPool[quest.LevelReq] = {
                Index = i,
                Value = quest,
            }
        end
    end

    local selectedData = QuestHandler.CheckBossLevel(questPool)

    if Double_Quest then
        for i, quest in pairs(questPool) do
            for _, questReq in pairs(QuestHandler.QuestAssignments) do
                if questPool[i].Value.LevelReq == questReq then
                    if QuestHandler:FindValue(quest.Value.Task) == 1 and Double_Quest then
                        continue
                    end
                    table.insert(QuestHandler.BagNumber, questReq)
                    if not QuestHandler.QuestData[questReq] then
                        QuestHandler.QuestData[questReq] = {
                            Index = quest.Index,
                            Value = quest.Value,
                            Used = false,
                        }
                    end
                end
            end
        end
    else
        for _, quest in pairs(questPool) do
            if quest.Value.LevelReq == selectedData.Value.LevelReq then
                table.insert(QuestHandler.BagNumber, selectedData.Value.LevelReq)
                if not QuestHandler.QuestData[selectedData.Value.LevelReq] then
                    QuestHandler.QuestData[selectedData.Value.LevelReq] = {
                        Index = quest.Index,
                        Value = quest.Value,
                        Used = false,
                    }
                end
            end
        end
    end

    return QuestHandler.QuestData
end)

function QuestHandler:FindValue(p1)
    if not p1 then 
        warn("havenil") 
        return 
    end
    for _, v in pairs(p1) do
        return v
    end
end

function QuestHandler:FindIndex(p1)
    if not p1 then 
        warn("havenil") 
        return 
    end
    for i, _ in pairs(p1) do
        return i
    end
end

function QuestHandler:FindData(questName, levelReq)
    for i, v in pairs(QuestHandler.AllQuests[questName]) do
        if v.LevelReq == levelReq then
            return {
                Value = v,
                Index = i,
            }
        end
    end
end

function QuestHandler:Npcs(levelReq, npcData)
    local positionMon
    for _, spawn in pairs(WorldOrigin.EnemySpawns:GetChildren()) do
        if spawn.Name == self:FindIndex(npcData) or spawn.Name:match(self:FindIndex(npcData)) then
            positionMon = spawn
        end
    end

    for i, npc in pairs(self.Guide.Data.NPCList) do
        for _, level in pairs(npc.Levels) do
            if level == levelReq then
                return {
                    Index = i,
                    Value = npc,
                    MonPosition = positionMon or nil,
                }
            end
        end
    end
end

function QuestHandler:GetQuest()
    QuestHandler.DetermineLevelRequirements()
    local Data = {}

    local M_Data = self.MyData()

    local p1, p2

    if Double_Quest then
        p1 = math.max(unpack(QuestHandler.BagNumber))
    else
        p1 = QuestHandler.DetermineLevelRequirements()
    end

    table.sort(QuestHandler.BagNumber)

    for _, v in pairs(QuestHandler.BagNumber) do
        if v == p1 then continue end
        p2 = v
    end

    if not p2 then p2 = p1 end

    if Double_Quest then
        if not QuestHandler.QuestData[M_Data[p1].Value.LevelReq].Used then
            Data[M_Data[p1].Value.LevelReq] = {
                Mon = self:FindIndex(M_Data[p1].Value.Task),
                NameQuest = M_Data[p1].Index,
                NumberQuest = self:FindData(M_Data[p1].Index, M_Data[p1].Value.LevelReq).Index,
                CFrameQuest = self:Npcs(M_Data[p1].Value.LevelReq, M_Data[p1].Value.Task).Index.CFrame,
                CFrameMon = self:Npcs(M_Data[p1].Value.LevelReq, M_Data[p1].Value.Task).MonPosition,
            }
        else
            Data[M_Data[p2].Value.LevelReq] = {
                Mon = self:FindIndex(M_Data[p2].Value.Task),
                NameQuest = M_Data[p2].Index,
                NumberQuest = self:FindData(M_Data[p2].Index, M_Data[p2].Value.LevelReq).Index,
                CFrameQuest = self:Npcs(M_Data[p2].Value.LevelReq, M_Data[p2].Value.Task).Index.CFrame,
                CFrameMon = self:Npcs(M_Data[p2].Value.LevelReq, M_Data[p2].Value.Task).MonPosition,
            }
        end
    else
        local C = p2
        Data[M_Data[C].Value.LevelReq] = {
            Mon = self:FindIndex(M_Data[C].Value.Task),
            NameQuest = M_Data[C].Index,
            NumberQuest = self:FindData(M_Data[C].Index, M_Data[C].Value.LevelReq).Index,
            CFrameQuest = self:Npcs(M_Data[C].Value.LevelReq, M_Data[C].Value.Task).Index.CFrame,
            CFrameMon = self:Npcs(M_Data[C].Value.LevelReq, M_Data[C].Value.Task).MonPosition,
        }
    end

    return self:FindIndex(Data), Data
end

Double_Quest = true

local Level, Data = QuestHandler:GetQuest()

-- print(Data[Level].Mon)

getgenv().network = network or {
    cache = {
        connections = {
            insert = function(self,value)
                self[#self + 1] = value
            end,
            clear = function(self)
                for i=1,#self do local v = self[i]
                    if type(v) ~= "function" then
                    v:Disconnect()
                    table.remove(self,table.find(self,v))
                    end
                end
            end,
        },
        remotes = {
            insert = function(self,value)
                self[#self + 1] = value
            end,
        },
    },
    Retrieve = function(self,name,func)
        local Remote = self.cache.remotes[name] or (typeof(name) == "Instance" and name) or game:FindFirstChild(name,true)
        if Remote then
            if Remote:IsA("RemoteEvent") then
                self.cache.connections:insert(Remote.OnClientEvent:Connect(func))
                self.cache.remotes[name] = Remote
            elseif Remote:IsA("RemoteFunction") then
                Remote.OnClientInvoke = func
                self.cache.connections:insert(Remote.OnClientInvoke)
                self.cache.remotes[name] = Remote
            else
                warn("Unable to Connect Network")
            end
        else
            warn("Unable to Indentify Remote Network")
        end
    end,
    Send = function(self, name, ...)
        local success, result = pcall(function(...)
            local Remote = self.cache.remotes[name] or (typeof(name) == "Instance" and name) or game:FindFirstChild(name, true)
            if Remote then
                if Remote:IsA("RemoteEvent") then
                    self.cache.remotes[name] = Remote
                    Remote:FireServer(...)
                elseif Remote:IsA("RemoteFunction") then
                    self.cache.remotes[name] = Remote
                    return Remote:InvokeServer(...)
                else
                    error("Unable to Connect Network")
                end
            else
                error("Unable to Identify Remote Network")
            end
        end, ...)
        if not success then
            warn("Error in Send function:", result)
        end
        return result
    end,
}

Check_Inventory = LPH_JIT_MAX(function(...)
    local toolsToCheck = {...}
    for _, toolName in pairs(toolsToCheck) do
        if localplayer.Backpack:FindFirstChild(toolName) or localplayer.Character:FindFirstChild(toolName) then
            return true
        end
    end
    return false
end)

Equip_Tool = LPH_JIT_MAX(function(Tool_Name)
    local Tool = localplayer.Backpack:FindFirstChild(Tool_Name)
    if Tool and localplayer.Character:FindFirstChild("Humanoid") then
        localplayer.Character.Humanoid:EquipTool(Tool)
    end
end)

Check_Tool_Mastery = LPH_JIT_MAX(function(Tool,Mastery)
    local Character_Tool = localplayer.Character:FindFirstChild(Tool)
    if Character_Tool and Character_Tool:IsA('Tool') and Character_Tool:FindFirstChild("Level") and Character_Tool.Level.Value >= Mastery then
        return true
    end
    local Backpack_Tool = localplayer.Backpack:FindFirstChild(Tool)
    if Backpack_Tool and Backpack_Tool:IsA('Tool') and Backpack_Tool:FindFirstChild("Level") and Backpack_Tool.Level.Value >= Mastery then
        return true
    end
    return false
end)

Check_Monster = LPH_JIT_MAX(function(Monster)
    local Table_Monster = Monster
    if type(Monster) == "string" then Table_Monster = {Monster} end
    local nearestEnemy = nil
    local shortestDistance = math.huge

    for _, v in pairs(workspace.Enemies:GetChildren()) do
        if table.find(Table_Monster, v.Name) and Check_Alive_Monster(v) and Distance(v.HumanoidRootPart.Position) <= 2000 then
            local distance = Distance(v.HumanoidRootPart.Position)
            if distance < shortestDistance then
                nearestEnemy = v
                shortestDistance = distance
            end
        end
    end

    if not nearestEnemy then
        for _, v in pairs(replicatedstorage:GetChildren()) do
            if table.find(Table_Monster, v.Name) then
                local distance = Distance(v.HumanoidRootPart.Position)
                if distance < shortestDistance then
                    nearestEnemy = v
                    shortestDistance = distance
                end
            end
        end
    end

    return nearestEnemy
end)

Check_Alive_Monster = LPH_JIT_MAX(function(Mon)
    return Mon and Mon.Parent and Mon:FindFirstChild("Humanoid") and Mon:FindFirstChild("HumanoidRootPart") and Mon:FindFirstChild("Humanoid").Health > 0
end)

function Convert_To_CFrame(value)
    if typeof(value) == "Vector3" then
        return CFrame.new(value)
    elseif typeof(value) == "CFrame" then
        return value
    else
        return nil
    end
end

Distance = LPH_JIT_MAX(function(a, b, noHeight)
    local vector_a = Vector3.new(a.X, not noHeight and a.Y or 0, a.Z)

    local success, result = pcall(function()
        if not b then
            while true do
                local Root = localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart")
                if Root and Root.Position then
                    b = Root.Position
                    break
                end
                wait(.5) 
            end
        end

        local vector_b = Vector3.new(b.X, not noHeight and b.Y or 0, b.Z)
        return (vector_a - vector_b).magnitude
    end)

    if success then
        return result
    else
        warn("Distance Calculation Failed", result)
        return nil
    end
end)

FindNearestLocation = LPH_JIT_MAX(function(Pos, Location)
    local nearest, scale = nil, 0
    if Location then
        if Distance(Pos, Location.Position, true) <= (Location.Mesh.Scale.X / 2) + 500 then
            return Location
        end
    end
    for i, v in pairs(WorldOrigin.Locations:GetChildren()) do
        if Distance(Pos, v.Position, true) <= (v.Mesh.Scale.X / 2) + 500 then
            if scale < v.Mesh.Scale.X then
                scale = v.Mesh.Scale.X
                nearest = v
            end
        end
    end
    return nearest
end)

Is_player_ready = LPH_JIT_MAX(function()
    return localplayer.Character and localplayer.Character:FindFirstChild("Humanoid") and localplayer.Character:FindFirstChild("HumanoidRootPart") and localplayer.Character:FindFirstChild("Humanoid").Health > 0
end)

Is_raiding = LPH_JIT_MAX(function()
    return localplayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible or StartingRaid
end)

Check_raid_chip = LPH_JIT_MAX(function()
    local function Has_chip(container)
        for _, item in ipairs(container:GetChildren()) do
            if item:IsA("Tool") and item.Name:lower():find("microchip") then
                return true
            end
        end
        return false
    end

    return Has_chip(localplayer.Backpack) or Has_chip(localplayer.Character)
end)

Check_Fruit = LPH_JIT_MAX(function() 
    for i,v in pairs(workspace:GetChildren()) do
        if string.find(v.Name, "Fruit") or v.Name:find("Fruit") then
            return true
        end
    end
    return false
end)

Check_fruit_inventory = LPH_JIT_MAX(function()
    local function hasFruit(container)
        for _, item in ipairs(container:GetChildren()) do
            if item:IsA("Tool") and item.Name:lower():find("fruit") then
                return true
            end
        end
        return false
    end

    return hasFruit(localplayer.Backpack) or hasFruit(localplayer.Character)
end)

Is_Safe_Zone = LPH_JIT_MAX(function(p)
    for i,v in pairs(WorldOrigin.SafeZones:GetChildren()) do
        if v:IsA("Part") then
            if Distance(v.Position, p.HumanoidRootPart.Position, true) <= 1000 then
                return true
            end
        end
    end
    return false
end)
 
CommF_ = LPH_JIT_MAX(function(...)
    local ARGS = {...}
    local Data = network:Send("CommF_",...)
    local r,s = pcall(function()
        if ARGS[1] == "requestEntrance" then
            collectionservice:AddTag(localplayer,"Teleporting")
            task.delay(3,function()
                collectionservice:RemoveTag(localplayer,"Teleporting")
            end)
            wait(.25)
        end
    end)
    if not r then warn("Remote : "..s) end
    return Data
end)

function StopTween()
    if activeTween and activeTween.PlaybackState == Enum.PlaybackState.Playing then
        activeTween:Cancel() -- หยุด Tween ปัจจุบัน
        activeTween = nil -- รีเซ็ตตัวแปร activeTween
    end
end

totarget = LPH_JIT_MAX(function(CFgo)
    local rootPart = localplayer.Character:FindFirstChild("HumanoidRootPart")

    if not rootPart and not Is_player_ready() then
        warn("HumanoidRootPart not found")
        return
    end 

    local Distance = Distance(rootPart.Position, CFgo.Position, true)
    local speed

    if Distance < 170 then
        speed = 350
    elseif Distance < 1000 then
        speed = 330
    else
        speed = 300
    end

    local distance = (rootPart.Position - CFgo.Position).Magnitude
    local duration = distance / speed

    rootPart.CFrame = CFrame.new(rootPart.Position.X, CFgo.Position.Y, rootPart.Position.Z)

    -- หยุด Tween ก่อนหน้า (ถ้ามี)
    StopTween()

    local info = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local success, err = pcall(function()
        activeTween = tweenservice:Create(rootPart, info, {CFrame = CFgo}) -- สร้าง Tween ใหม่
        activeTween:Play() -- เริ่ม Tween
        -- รอจนกว่าจะจบหรือถูกหยุด
        activeTween.Completed:Wait()
    end)

    if not success then
        warn("Tween error:", err)
    end
end)

TP = LPH_JIT_MAX(function(...)
    local target = Convert_To_CFrame(...)
    local succ,err = pcall(function()
        local Dista, distm, middle = Distance(target, nil, true), 1/0
        task.spawn(function()
            if Is_player_ready() and FindNearestLocation(localplayer.Character.HumanoidRootPart.Position) ~= FindNearestLocation(target.p) and Dista >= 2000 and tick() - recentlySpawn > 10 then
                task.wait(0.5)
                if FindNearestLocation(localplayer.Character.HumanoidRootPart.Position) ~= FindNearestLocation(target.p) then
                    for _, v in pairs(CanTeleport[SeaIndex]) do
                        local distance = Distance(v, target, true)
                        if distance < Distance(target, nil, true) and distance < distm then
                            distm, middle = distance, v
                        end
                    end

                    if middle and FindNearestLocation(localplayer.Character.HumanoidRootPart.Position) ~= FindNearestLocation(middle) and not Is_raiding() then
                        StopTween()
                        CommF_("requestEntrance", middle)
                    end

                    if not Is_raiding() and not Check_raid_chip() and not Check_fruit_inventory() and not Check_Inventory("God's Chalice", "Red Key", "Apple", "Banana", "Pineapple", "Flower 1", "Flower 2", "Flower 3") then
                        local SpawnPoint = WorldOrigin.PlayerSpawns[localplayer.Team.Name]:GetChildren()
                        local dista, distm, charDist, nearest = 2000, 9000

                        for _, v in pairs(SpawnPoint) do
                            local Position = v:GetPivot().p
                            local distance = Distance(target.p, Position, true)
                            if distance <= dista then
                                charDist = Distance(Position, nil, true)
                                dista, nearest = distance, v
                            end
                        end
                        
                        if nearest and (charDist <= 4000) and FindNearestLocation(localplayer.Character.HumanoidRootPart.Position) ~= FindNearestLocation(target.p) then
                            if not Is_player_ready() then return end
                            if localplayer.Character.HumanoidRootPart:FindFirstChild("Died") then
                                localplayer.Character.HumanoidRootPart.Died:Destroy()
                            end

                            repeat task.wait()
                                task.spawn(CommF_, "SetLastSpawnPoint", nearest.Name)
                            until Player_Data.LastSpawnPoint.Value == nearest.Name

                            -- localplayer.Character.Humanoid:ChangeState(15)

                            localplayer.Character.Humanoid.Health = 0

                            repeat task.wait()
                                -- print("Bypassing")
                                localplayer.Character.HumanoidRootPart.CFrame = target
                            until Is_player_ready()

                            -- print(Is_player_ready())

                            -- localplayer.Character.Humanoid.Health > 0
                        end
                    end
                end
            end
        end)

        if tweenActive and lastTweenTarget and (Distance(target, lastTweenTarget) < 10 or Distance(lastTweenTarget) >= 10) then
            return
        end

        tweenid = (tweenid or 0) + 1
        lastTweenTarget = target
        thisId = tweenid

        local Util = require(game:GetService("ReplicatedStorage").Util)
        if Util.FPSTracker.FPS > 60 then
            setfpscap(60)
        end

        -- totarget(target)

        task.spawn(function()
            lastPos = {tick(), target}
            local currentDistance = Distance(localplayer.Character.HumanoidRootPart.Position, target, true)
            local oldDistance = currentDistance
            localplayer.Character.Humanoid:SetStateEnabled(13, false)

            while localplayer.Character:FindFirstChild("HumanoidRootPart") and localplayer.Character.Humanoid.Health > 0 and currentDistance > 75 and thisId == tweenid do
                local Percent = 58 / math.clamp(Util.FPSTracker.FPS, 0, 60)
                local Speed = 6 * Percent
                local Current = localplayer.Character.HumanoidRootPart.Position
                local Dift = Vector3.new(target.X, 0, target.Z) - Vector3.new(Current.X, 0, Current.Z)
                local Sx = (Dift.X < 0 and -1 or 1) * Speed
                local Sz = (Dift.Z < 0 and -1 or 1) * Speed
                local SpeedX = math.abs(Dift.X) < Sx and Dift.X or Sx
                local SpeedZ = math.abs(Dift.Z) < Sz and Dift.Z or Sz

                task.spawn(function()
                    currentDistance = Distance(localplayer.Character.HumanoidRootPart.Position, target, true)
                    if currentDistance > oldDistance + 10 then
                        tweenid = -1
                    end
                    oldDistance = currentDistance
                end)

                localplayer.Character.HumanoidRootPart.CFrame = localplayer.Character.HumanoidRootPart.CFrame + Vector3.new(math.abs(SpeedZ) < (5 * Percent) and SpeedX or SpeedX / 1.5, 0, math.abs(SpeedX) < (5 * Percent) and SpeedZ or SpeedZ / 1.5)
                localplayer.Character.HumanoidRootPart.CFrame = CFrame.new(localplayer.Character.HumanoidRootPart.CFrame.X, target.Y + 300, localplayer.Character.HumanoidRootPart.CFrame.Z)
                tweenActive = true
                task.wait(0.001)
            end

            localplayer.Character.Humanoid:SetStateEnabled(13, true)
            tweenActive = false
            if currentDistance <= 200 and thisId == tweenid then
                localplayer.Character.HumanoidRootPart.CFrame = target
            end
        end)
        -- local Distance_TP = Distance(localplayer.Character.HumanoidRootPart.Position, target.Position, true)
        -- if Distance_TP < 300 then
        --     localplayer.Character.HumanoidRootPart.CFrame = target
        -- end
        -- totarget(target)        
    end)

    if not succ then
        warn("TP Fucntion "..err)
    end
end)

Get_Inventory_Fruits = LPH_JIT_MAX(function(minValue, maxValue)
    local Fruits = CommF_("getInventory")
    local FruitTable = {}
    local FruitCount = 0 -- ตัวแปรนับจำนวนผลไม้ที่อยู่ในช่วง

    for _, v in pairs(Fruits) do
        if v.Type == "Blox Fruit" and v.Value and v.Value > minValue and v.Value < maxValue then
            table.insert(FruitTable, {Name = v.Name, Value = v.Value})
            FruitCount = FruitCount + 1 -- เพิ่มจำนวนเมื่อพบผลไม้ที่เข้าเงื่อนไข
        end
    end

    return FruitTable, FruitCount -- คืนค่าทั้งรายการและจำนวนผลไม้
end)

function RemoveSpaces(str)
    return str:gsub(" Fruit", "")
end

StoreFruit = LPH_JIT_MAX(function(fruitName, fruit)
    local Remote_Inventory_Fruit = Get_Inventory_Fruits(0,math.huge)
    local HaveFruitInStore = false

    for _, v1 in pairs(Remote_Inventory_Fruit) do
        if v1.Name == fruitName then
            HaveFruitInStore = true
            break
        end
    end

    if not HaveFruitInStore then
        if fruit then
            CommF_("StoreFruit", fruitName, fruit)
        end
    end
end)

ProcessFruits = LPH_JIT_MAX(function(container)
    for _, v in pairs(container:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            local FruitName = RemoveSpaces(v.Name)
            local NameFruit
            if v.Name == "Bird: Falcon Fruit" then
                NameFruit = "Bird-Bird: Falcon"
            elseif v.Name == "Bird: Phoenix Fruit" then
                NameFruit = "Bird-Bird: Phoenix"
            elseif v.Name == "Human: Buddha Fruit" then
                NameFruit = "Human-Human: Buddha"
            else
                NameFruit = FruitName .. "-" .. FruitName
            end
            StoreFruit(NameFruit, v)
        end
    end
end)

BringMob = function(Mon)
    Has_Near_Mob = false
    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
        local humanoidRootPart = enemy:FindFirstChild("HumanoidRootPart")
        local humanoid = enemy:FindFirstChildOfClass("Humanoid")
        
        if Check_Alive_Monster(enemy) and Distance(humanoidRootPart.Position, Mon.HumanoidRootPart.Position) <= 5000 then
            local isValidMob = not Mon or (enemy ~= Mon and enemy.Name == Mon.Name)
            
            if isValidMob then

                if not enemy:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity") then
                    local G = Instance.new("BodyVelocity")
                    G.Parent = enemy:FindFirstChild("HumanoidRootPart")
                    G.Name = "BodyVelocity"
                    G.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    G.Velocity = Vector3.new(0, 0, 0)
                end

                if enemy:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity") then
                    enemy:FindFirstChild("HumanoidRootPart").BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    enemy:FindFirstChild("HumanoidRootPart").BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                end

                for _, v in pairs(Mon:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end

                -- local animator = humanoid:FindFirstChild("Animator")
                -- if animator then
                --     animator:Destroy()
                -- end

                local monPos = Mon.HumanoidRootPart.CFrame.Position
                local distanceToMon = Distance(humanoidRootPart.Position, monPos)
                
                if distanceToMon <= 10 then
                    Has_Near_Mob = true
                end
                -- sethiddenproperty(humanoidRootPart, "NetworkOwnershipRule", Enum.NetworkOwnership.Manual)
                if not Has_Near_Mob and (isnetworkowner(humanoidRootPart) or Distance(humanoidRootPart.Position, Mon.HumanoidRootPart.CFrame.Position) < 300) then
                    -- humanoid:ChangeState(14)
                    -- humanoidRootPart.CanCollide = false
                    -- v.Head.CanCollide = false
                    -- if humanoid:FindFirstChild("Animator") then
                    --     humanoid.Animator:Destroy()
                    -- end
                    -- humanoid.JumpPower = 0
                    -- humanoid.WalkSpeed = 0
                    -- -- humanoid:ChangeState(14)
                    -- -- humanoid.Sit = true
                    -- -- humanoid.PlatformStand = true
                    -- humanoidRootPart.CanCollide = false
                    humanoidRootPart.CFrame = CFrame.new(Mon.HumanoidRootPart.CFrame.Position) * CFrame.Angles(0, math.rad(0), 0)
                    
                end
            end
        end
        -- task.wait(0.1)
    end

end

Attack = LPH_JIT_MAX(function(Mon,Statement)
    local Statement = Statement or function() return true end
    local Humanoid = Mon:FindFirstChild("Humanoid")
    local HumanoidRootPart = Mon:FindFirstChild("HumanoidRootPart")
    -- if not Humanoid or HumanoidRootPart then
    --     return 
    -- end
    if Humanoid and HumanoidRootPart then
        local succ,err = pcall(function()
            Checking_Bug = true
            repeat task.wait(0.1)        
                if not localplayer.Character:FindFirstChild("HasBuso") then
                    CommF_("Buso")
                end     
                Magnet_monster = Mon.Name
                Pos_mon = HumanoidRootPart.CFrame
                Humanoid.JumpPower = 0
                Humanoid.WalkSpeed = 0
                HumanoidRootPart.CanCollide = false
                Equip_Tool(Current_Weapon)
                -- TP(HumanoidRootPart.CFrame * CFrame.new(math.random(-10,10),25,math.random(-10,10)))
                TP(HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                -- BringMob(Mon)
                -- task.delay(60,function()
                --     if Checking_Bug and not Is_raiding() then
                --         localplayer.Character.Humanoid.Health = 0
                --     end
                -- end)
            until Statement()
            Checking_Bug = false
        end)
        if not succ then warn("Attack Function "..err) end
    end

end)

function Server_Hop(Value)
	pcall(function()
        local Massage = Instance.new("Message",workspace)
        Massage.Text = "Server Hop | "..Value
		for count = math.random(1, math.random(40, 75)), 100 do
			remote = replicatedstorage.__ServerBrowser:InvokeServer(count)
			for _i ,v in pairs(remote) do
				if tonumber(v['Count']) < 12 then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, _i)
				end
			end    
		end
	end)
end

Remote_Check_Tool = LPH_JIT_MAX(function(action, name, value)
    local Remote_Inventory = CommF_("getInventory")
    for _, item in pairs(Remote_Inventory) do
        if action == "Tool" and item.Name == name then
            return true
        elseif action == "Mastery" and item.Name == name and item.Mastery >= value then
            return true
        elseif action == "Material" and item.Type == "Material" and item.Name == name then
            return item.Count
        end
    end
    return action == "Material" and 0 or false
end)

Find_Monster_Spawner = LPH_JIT_MAX(function(Name_Mon)
    local Mon = type(Name_Mon) == "string" and {Name_Mon} or Name_Mon
    local matchingSpawns = {}

    for _, Mob in pairs(Mon) do
        for _, spawn in pairs(WorldOrigin.EnemySpawns:GetChildren()) do
            if spawn.Name:match("^" .. Mob) then
                table.insert(matchingSpawns, spawn)
            end
        end
    end

    return #matchingSpawns > 0 and matchingSpawns or nil
end)

Go_To_Spawner = LPH_JIT_MAX(function(Name_Mon,Expression)
    local Expression = Expression or function() return true end
    local Enemy_Spawn = Find_Monster_Spawner(Name_Mon)
    if not Enemy_Spawn then return end
    for _, spawn in pairs(Enemy_Spawn) do
        if not Check_Monster(Name_Mon) or not Expression() then
            repeat task.wait(0.5)
                TP(spawn.CFrame * CFrame.new(0, 30, 0))
            until Check_Monster(Name_Mon) or Expression()
        end
        if Check_Monster(Name_Mon) or Expression() then
            break
        end
    end
end)

Go_To_Position = LPH_JIT_MAX(function(Part,Expression) 
    local Expression = Expression or function() return true end
    local succ,err = pcall(function()
        if not Expression() then
            repeat task.wait(0.5) 
                TP(Part.Position) 
            until Expression()
        end
    end)
    -- if typeof(Part) == "CFrame" or typeof(Part) == "Vector3" or (typeof(Part) == "Instance" and Part:IsA("BasePart")) then
    if not succ then warn("Go_To_Positon "..err) end
    -- end
end)

Check_Match_Race = LPH_JIT_MAX(function()
    local Player_Race = Player_Data.Race
    for i,v in pairs(getgenv().KaitunConfig["Race"]["Select Race"]) do
        if Player_Race == v then
            return true
        end
    end
    return false
end)

Check_Fruit_Match = LPH_JIT_MAX(function()
    local current_fruit = localplayer:WaitForChild("Data").DevilFruit.Value
    local selected_Main_Fruits = getgenv().KaitunConfig["Fruit"]["Main Fruits"] or {}
    local selected_Sec_Fruits = getgenv().KaitunConfig["Fruit"]["Sec Fruits"] or {}
    local fruits = CommF_("getInventory")

    -- ✅ ถ้ามี Main แล้ว ไม่ต้องทำอะไร
    if table.find(selected_Main_Fruits, current_fruit) then
        return false
    end

    -- 🧠 เช็ค Main ก่อน
    for _, fruit_name in ipairs(selected_Main_Fruits) do
        if Check_Inventory(fruit_name) then
            return fruit_name
        end
    end

    -- ➕ ถ้าไม่มี Main ลองหา Secondary
    for _, fruit_name in ipairs(selected_Sec_Fruits) do
        if Check_Inventory(fruit_name) then
            return fruit_name
        end
    end

    -- ✅ ใช้ข้อมูลดิบจาก inventory JSON เผื่อมีเพิ่มเติม
    if fruits then
        -- Main ก่อน
        for _, fruit_data in ipairs(fruits) do
            if table.find(selected_Main_Fruits, fruit_data.Name) then
                print("🧃 เจอ Main Fruit ใน inventory:", fruit_data.Name)
                return fruit_data.Name
            end
        end
        -- Sec ต่อ
        for _, fruit_data in ipairs(fruits) do
            if table.find(selected_Sec_Fruits, fruit_data.Name) then
                print("🍍 เจอ Secondary Fruit ใน inventory:", fruit_data.Name)
                return fruit_data.Name
            end
        end
    end

    return false
end)

function GetEquippedFruitName(fruit)
    local base_name = fruit:match("^(%w+)-%w+$")
    if base_name then
        return base_name .. " Fruit"
    end
    return fruit
end

function FindFruitByName(container, fruit)
    for _, item in pairs(container:GetChildren()) do
        if item.Name == fruit then
            return item
        end
    end
    return nil
end

function Eat_Select_Fruit(fruit)
    if not fruit then return end

    Stop_Store_Fruit = true

    local equipped_fruit_name = GetEquippedFruitName(fruit)

    -- 🧃 ถ้ายังไม่มีผลในตัว → Load มันก่อนจากคลัง
    if not FindFruitByName(localplayer.Backpack, equipped_fruit_name) and not FindFruitByName(localplayer.Character, equipped_fruit_name) then
        local fruits = CommF_("getInventory")
        if fruits then
            CommF_("LoadFruit", fruit)
        end
    end

    -- 🛠️ รอจนอยู่ใน Backpack
    repeat wait(0.5) until FindFruitByName(localplayer.Backpack, equipped_fruit_name)

    -- 🎒 Equip จาก Backpack
    if FindFruitByName(localplayer.Backpack, equipped_fruit_name) then
        repeat
            Equip_Tool(equipped_fruit_name)
            wait()
        until not FindFruitByName(localplayer.Backpack, equipped_fruit_name)
    end

    -- 🍴 กินผลไม้จาก Character
    repeat wait(0.5) until FindFruitByName(localplayer.Character, equipped_fruit_name)

    if FindFruitByName(localplayer.Character, equipped_fruit_name) then
        localplayer.Character:WaitForChild(equipped_fruit_name).EatRemote:InvokeServer("Eat")
        print("🍽️ กินผลไม้เรียบร้อย:", equipped_fruit_name)
    end

    Stop_Store_Fruit = false
end


function Buy_Fruit()
    local function buyFruit(fruit)
        CommF_("PurchaseRawFruit", fruit)
        print("✅ ซื้อผลไม้:", fruit)
    end

    local current_fruit = localplayer:WaitForChild("Data").DevilFruit.Value
    local Beli = localplayer:WaitForChild("Data").Beli.Value
    local Remote_GetFruits = CommF_("GetFruits")

    local MainFruits = getgenv().KaitunConfig["Fruit"]["Main Fruits"] or {}
    local SecFruits = getgenv().KaitunConfig["Fruit"]["Sec Fruits"] or {}

    if table.find(MainFruits, current_fruit) then
        return
    end

    local mainOnSale = {}
    local secOnSale = {}

    for _, fruit in next, Remote_GetFruits do
        if fruit.OnSale then
            if table.find(MainFruits, fruit.Name) then
                table.insert(mainOnSale, fruit)
            elseif table.find(SecFruits, fruit.Name) then
                table.insert(secOnSale, fruit)
            end
        end
    end

    if #mainOnSale > 0 then
        table.sort(mainOnSale, function(a, b)
            return a.Price > b.Price
        end)

        local bestMain = mainOnSale[1]
        if Beli >= bestMain.Price then
            buyFruit(bestMain.Name)
            return
        end
    end

    if #secOnSale > 0 then
        table.sort(secOnSale, function(a, b)
            return a.Price > b.Price
        end)

        local bestSec = secOnSale[1]
        if Beli >= bestSec.Price then
            buyFruit(bestSec.Name)
        end
    end

end

LPH_JIT_MAX(function()
    function Auto_Farm_Level()
        local Quest_gui = localplayer.PlayerGui.Main.Quest
    
        if Quest_gui.Visible then
            warn("[Auto_Farm_Level] Quest GUI is visible.")
            local Mon = Data[Level].Mon
            warn("[Auto_Farm_Level] Target Monster:", Mon)
            
            local Enemy = Check_Monster(Mon)
            if Enemy then
                warn("[Auto_Farm_Level] Found Enemy:", Enemy.Name)
                Attack(Enemy, function()
                    local condition = not getgenv().KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy) or not Quest_gui.Visible
                    if condition then
                        warn("[Auto_Farm_Level] Stopping Attack due to condition.")
                    end
                    return condition
                end)
            else
                warn("[Auto_Farm_Level] No Enemy found. Going to Spawner...")
                Go_To_Spawner(Mon, function()
                    local condition = not getgenv().KaitunConfig["Start Farm"] or not Quest_gui.Visible
                    if condition then
                        warn("[Auto_Farm_Level] Stopping Go_To_Spawner due to condition.")
                    end
                    return condition
                end)
            end
        else
            warn("[Auto_Farm_Level] Quest GUI is not visible. Fetching quest...")
            Level, Data = QuestHandler:GetQuest()
            warn("[Auto_Farm_Level] Current Level:", Level, "Quest Data:", Data)
    
            if not QuestHandler.QuestData[Level].Used then
                warn("[Auto_Farm_Level] Marking quest as used.")
                QuestHandler.QuestData[Level].Used = true
            end
    
            if Player_Data.Level.Value > 10 then
                warn("[Auto_Farm_Level] Player Level:", Player_Data.Level.Value, "Going to Quest Position.")
                Go_To_Position(Data[Level].CFrameQuest, function()
                    local condition = not getgenv().KaitunConfig["Start Farm"] or Distance(Data[Level].CFrameQuest.Position) <= 5
                    if condition then
                        warn("[Auto_Farm_Level] Stopping Go_To_Position due to condition.")
                    end
                    return condition
                end)
            end
    
            task.wait(0.1)
            warn("[Auto_Farm_Level] Starting Quest:", Data[Level].NameQuest, "Number:", Data[Level].NumberQuest)
            CommF_("StartQuest", Data[Level].NameQuest, Data[Level].NumberQuest)
            task.wait(0.1)
        end
    end
    
    function Get_Saber()
        local Remote_Saber = CommF_("ProQuestProgress")
        if Player_Data.Level.Value >= 200 and not Remote_Saber.KilledShanks then
            for i = 1,#Remote_Saber.Plates do
                if not Remote_Saber.Plates[i] then
                    CommF_("ProQuestProgress","Plate",i)
                end
            end

            if not Remote_Saber.UsedTorch then
                repeat wait() CommF_("ProQuestProgress","GetTorch") until Check_Inventory("Torch") 
                repeat wait() CommF_("ProQuestProgress","DestroyTorch") until not Check_Inventory("Torch") 
            elseif not Remote_Saber.UsedCup then
                repeat wait() CommF_("ProQuestProgress","GetCup") until Check_Inventory("Cup") 
                repeat wait() CommF_("ProQuestProgress","FillCup",localplayer.Backpack.Cup or localplayer.Character.Cup) CommF_("ProQuestProgress","SickMan") until not Check_Inventory("Cup") 
            elseif not Remote_Saber.TalkedSon then
                CommF_("ProQuestProgress","RichSon")
            elseif not Remote_Saber.KilledMob then
                local Mon = "Mob Leader"
                local Enemy = Check_Monster(Mon)

                if Enemy then
                    Attack(Enemy,function()
                        return not getgenv().KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
                    end)
                end
            elseif not Remote_Saber.UsedRelic then
                repeat wait() CommF_("ProQuestProgress","RichSon") until Check_Inventory("Relic")
                repeat wait() CommF_("ProQuestProgress","PlaceRelic") until not Check_Inventory("Relic")
            elseif not Remote_Saber.KilledShanks then
                local Mon = "Saber Expert"
                local Enemy = Check_Monster(Mon)

                if Enemy then
                    Attack(Enemy,function()
                        return not getgenv().KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
                    end)
                elseif getgenv().KaitunConfig["Setting"]["Hop Server"] then
                    Server_Hop("Finding "..Mon)
                end
            end
        end
    end

    function Get_Pole()
        local Mon = "Thunder God"
        local Enemy = Check_Monster(Mon)

        if Enemy then
            Attack(Enemy,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
            end)
        end
    end

    function Travel_To_Second_Sea()
        local Dressrosa_Remote = CommF_("DressrosaQuestProgress")

        if not Dressrosa_Remote.UsedKey then
            repeat wait()
                CommF_("DressrosaQuestProgress","Detective")
            until Check_Inventory("Key")
            repeat wait()
                CommF_("DressrosaQuestProgress","UseKey")
            until not Check_Inventory("Key")
        elseif not Dressrosa_Remote.KilledIceBoss then
            local Mon = "Ice Admiral"
            local Enemy = Check_Monster(Mon)

            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
                end)
                CommF_("TravelDressrosa")
            else
                Go_To_Spawner(Mon,function()
                    return not getgenv().KaitunConfig["Start Farm"]
                end)
            end
        end
    end

    function Factory()
        local Mon ="Core"
        local Enemy = Check_Monster(Mon)

        if Enemy then
            Attack(Enemy,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
            end)
        end
    end 

    function Attack_Dark_beard()
        local Mon ="Darkbeard"
        local Enemy = Check_Monster(Mon)

        if Enemy then
            Attack(Enemy,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy)
            end)
        end
    end

    function Bartilo_Quest()
        local Bartilo_Remote = CommF_("BartiloQuestProgress")

        if not Bartilo_Remote.KilledBandits then
            local Quest_gui = localplayer.PlayerGui.Main.Quest

            if Quest_gui.Visible then
                local Mon = "Swan Pirate"
                local Enemy = Check_Monster(Mon)

                if Enemy then
                    Attack(Enemy,function()
                        return not getgenv().KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy) 
                    end)
                else
                    Go_To_Spawner(Enemy,function()
                        return not getgenv().KaitunConfig["Start Farm"]
                    end)
                end
            else
                local Pos_Quest = CFrame.new(-456.28952, 73.0200958, 299.895966)
                Go_To_Position(Pos_Quest,function()
                    return not getgenv().KaitunConfig["Start Farm"] or Distance(Pos_Quest) <= 5
                end)
                task.wait(0.5)
                CommF_("StartQuest","BartiloQuest",1)
                task.wait(0.5)
            end
        elseif not Bartilo_Remote.KilledSpring then
            local Mon = "Jeremy"
            local Enemy = Check_Monster(Mon)

            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or not Check_Monster(Mon) or not Check_Alive_Monster(Enemy) 
                end)
            end
        elseif not Bartilo_Remote.DidPlates then
            CommF_("BartiloQuestProgress","DidPlates")
        end
    end

    function Evo_Race_V2()
        if not Player_Data.Race:FindFirstChild("Evolved") then
            local Remote_Check_Race_V2 = CommF_("Alchemist","1")
            if Remote_Check_Race_V2 == 0 then  CommF_("Alchemist","2") end
            if not (game.Lighting.ClockTime < 18 and game.Lighting.ClockTime > 5) then
                local Flower = {
                    workspace:FindFirstChild("Flower1"),
                    workspace:FindFirstChild("Flower2"),
                }

                if not Check_Inventory("Flower 1") and Flower[1] and Flower[1].Transparency ~= 0 then
                    Go_To_Position(Flower[1].CFrame,function()
                        if Distance(Flower[1].CFrame.Position) <= 5 then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "Space", false, game)
                            wait(0.5)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "Space", false, game)
                        end
                        return not getgenv().KaitunConfig["Start Farm"] or Check_Inventory("Flower 1") or Distance(Flower[1].CFrame.Position) < 5
                    end)
                    repeat task.wait(0.5)
                        firetouchinterest(localplayer.Character.HumanoidRootPart,Flower[1],0)
                    until Check_Inventory("Flower 1") or getgenv().KaitunConfig["Start Farm"]
                elseif not Check_Inventory("Flower 2") and Flower[2] and Flower[2].Transparency ~= 0 then
                    Go_To_Position(Flower[2].CFrame,function()
                        return not getgenv().KaitunConfig["Start Farm"] or Check_Inventory("Flower 2") or Distance(Flower[2].CFrame.Position) < 5
                    end)
                    repeat task.wait(0.5)
                        firetouchinterest(localplayer.Character.HumanoidRootPart,Flower[2],0)
                    until Check_Inventory("Flower 2") or getgenv().KaitunConfig["Start Farm"]
                elseif not Check_Inventory("Flower 3") then
                    local Mon = "Zombie"
                    local Enemy = Check_Monster(Mon)

                    if Enemy then
                        Attack(Enemy,function()
                            return not getgenv().KaitunConfig["Start Farm"] or Check_Inventory("Flower 3") or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon) 
                        end)
                    else
                        Go_To_Spawner(Mon,function()
                            return not getgenv().KaitunConfig["Start Farm"] 
                        end)
                    end
                elseif Check_Inventory("Flower 1") and Check_Inventory("Flower 2") and Check_Inventory("Flower 3") then
                    CommF_("Alchemist","3")
                end 
            end
        end
    end

    function Change_Race()
        local Fragment = Player_Data.Fragments.Value
        if not Check_Match_Race() then
            if Fragment >= 3000 then
                DoRaid = false
                CommF_("BlackbeardReward","Reroll","1")
                CommF_("BlackbeardReward","Reroll","2")
            else
                DoRaid = true
            end
        end
    end

    function Evo_Race_V3()
        local Player_Race = Player_Data.Race.Value
        if Player_Data.Race:FindFirstChild("Evolved") then
            local Remote_Check_Race_V3 = CommF_("Wenlocktoad", "1")

            if Remote_Check_Race_V3 ~= 1 or Remote_Check_Race_V3 ~= 2 then
                CommF_("Wenlocktoad", "2")
            elseif Remote_Check_Race_V3 == 1 then
                if Player_Race == "Human" then
                    CommF_("Wenlocktoad","3")
                    if Check_Monster("Jeremy") then
                        local Mon = "Jeremy"
                        local Enemy = Check_Monster(Mon)

                        if Enemy then
                            Attack(Enemy,function()
                                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or Check_Monster(Mon)
                            end)
                        end
                    elseif Check_Monster("Diamond") then
                        local Mon = "Diamond"
                        local Enemy = Check_Monster(Mon)

                        if Enemy then
                            Attack(Enemy,function()
                                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or Check_Monster(Mon)
                            end)
                        end
                    elseif Check_Monster("Fajita") then
                        local Mon = "Fajita"
                        local Enemy = Check_Monster(Mon)

                        if Enemy then
                            Attack(Enemy,function()
                                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or Check_Monster(Mon)
                            end)
                        end
                    end
                elseif Player_Race == "Mink" then
                    local function Get_Chest()
                        local humanoidRootPart = localplayer.Character:FindFirstChild("HumanoidRootPart")
                    
                        if not humanoidRootPart then return nil end
                    
                        local closestChest = nil
                        local minDistance = math.huge
                    
                        for _, v in pairs(workspace.Map:GetDescendants()) do
                            if v:IsA("BasePart") and v.Name:find("Chest") then
                                local distance = Distance(v.Position,humanoidRootPart.Position)
                    
                                if distance < minDistance then
                                    minDistance = distance
                                    closestChest = v
                                    break
                                end
                            end
                        end
                    
                        return closestChest  -- คืนค่ากล่องที่ใกล้ที่สุด
                    end
                
                    local Chest = Get_Chest()
                    Go_To_Position(Chest.Position, function()
                        return not getgenv().KaitunConfig["Start Farm"] or not Chest.Parent
                    end)
                end
            end
        end
    end

    function Get_Gravity_Cane()
        local Mon = "Fajita"
        local Enemy = Check_Monster(Mon)

        if Enemy then
            Attack(Enemy,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
            end)
        end
    end

    function Get_Midnight_Blade()
        if Remote_Check_Tool("Material","Ectoplasm") >= 100 then
            CommF_("Ectoplasm","Buy",3)
        else
            local Mon = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}
            local Enemy = Check_Monster(Mon)

            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or Remote_Check_Tool("Material","Ectoplasm") >= 100 or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                end)
            else
                Go_To_Spawner(Mon,function()
                    return not getgenv().KaitunConfig["Start Farm"]
                end)
            end
        end
    end

    function Get_Rengoku()
        local Remote_Rengoku = CommF_("OpenRengoku")

        if not Remote_Rengoku then
            if Check_Inventory("Hidden Key") then
                repeat wait(0.5) CommF_("OpenRengoku") until not Check_Inventory("Hidden Key")
            else
                local Boss = "Awakened Ice Admiral"
                local Enemy_Boss = Check_Monster(Boss)
                if Enemy_Boss then
                    Attack(Enemy_Boss,function()
                        return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
                    end)
                else
                    local Mon = {"Snow Lurker","Arctic Warrior"}
                    local Enemy = Check_Monster(Mon)
        
                    if Enemy then
                        Attack(Enemy,function()
                            return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                        end)
                    else
                        Go_To_Spawner(Mon,function()
                            return not getgenv().KaitunConfig["Start Farm"]
                        end)
                    end
                end
            end
        end
    end

    function Open_Library()
        if Check_Inventory("Library Key") then
            CommF_("OpenLibrary")
        else
            local Boss = "Awakened Ice Admiral"
            local Enemy = Check_Near_Mon(Boss)
            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Boss)
                end)
            else
                Server_Hop("Finding "..Boss)
            end
        end
    end

    function Find_Water_Key()
        if Check_Inventory("Water Key") then
            CommF_("BuySharkmanKarate", true)
        else
            local Boss = "Tide Keeper"
            local Enemy = Check_Near_Mon(Boss)
            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Boss)
                end)
            else
                Server_Hop("Finding "..Boss)
            end
        end
    end

    function Get_Kabucha()
        if localplayer.Data.Fragments.Value >= 1500 then
            DoRaid = false
            CommF_("BlackbeardReward", "Slingshot", "1")
            CommF_("BlackbeardReward", "Slingshot", "2")
        else
            DoRaid = true
            return
        end
    end

    function Get_TTK()
        local Beli = Player_Data.Beli.Value
        if Remote_Check_Tool("Tool", "Shizu") and Remote_Check_Tool("Tool", "Oroshi") and Remote_Check_Tool("Tool", "Saishi") then
            local Mastery_Shizu = Remote_Check_Tool("Mastery", "Shizu", 300)
            local Mastery_Oroshi = Remote_Check_Tool("Mastery", "Oroshi", 300)
            local Mastery_Saishi = Remote_Check_Tool("Mastery", "Saishi", 300)

            if not Mastery_Shizu then
                Weapon = "Sword"
                CommF_("LoadItem","Shizu")
            elseif not Mastery_Oroshi then
                Weapon = "Sword"
                CommF_("LoadItem","Oroshi")
            elseif not Mastery_Saishi then
                Weapon = "Sword"
                CommF_("LoadItem","Saishi")
            elseif Beli >= 2000000 and Mastery_Shizu and Mastery_Oroshi and Mastery_Saishi then
                Weapon = "Melee"
                CommF_("MysteriousMan","1")
                CommF_("MysteriousMan","2")
            end
        end
    end

    function Travel_To_Third_Sea()
        if CommF_("ZQuestProgress").KilledIndraBoss then
            CommF_("TravelZou")
        end

        if not CommF_("GetUnlockables").FlamingoAccess then
            local Fruits = Get_Inventory_Fruits(1000000,math.huge)
            local Cheapest = nil
            for _, v in pairs(Fruits or {}) do
                if not Cheapest or v.Value < Cheapest.Value then
                    Cheapest = v
                end
            end  
            if Cheapest.Name then
                Stop_Store_Fruit = true
                task.wait(0.1)
                CommF_("LoadFruit",Cheapest.Name)
                task.wait(0.1)
                CommF_("TalkTrevor","1")
                CommF_("TalkTrevor","2")
                CommF_("TalkTrevor","3")
                task.wait(0.1)
                Stop_Store_Fruit = false
            end
        elseif not CommF_("ZQuestProgress","Check") then
            local Mon = "Don Swan"
            local Enemy = Check_Monster(Mon)

            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                end)
            else
                Server_Hop("Finding "..Mon)
            end
        elseif not CommF_("ZQuestProgress").KilledIndraBoss then
            local Mon = "Don Swan"
            local Enemy = Check_Monster(Mon)

            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or CommF_("ZQuestProgress").KilledIndraBoss or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                end)
            end
        end

        if CommF_("ZQuestProgress").KilledIndraBoss then
            CommF_("TravelZou")
        elseif not CommF_("ZQuestProgress").KilledIndraBoss then
            Server_Hop("Finding Fruit")
        end
    end

    function Get_Twin_Hooks()
        local Mon = "Captain Elephant"
        local Enemy = Check_Monster(Mon)
        if Enemy then
            Attack(Enemy,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
            end)
        end
    end

    function Get_Canvander()
        local Mon = "Beautiful Pirate"
        local Enemy = Check_Monster(Mon)

        if Enemy then
            Attack(Enemy,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
            end)
        end
    end

    function Get_Buddy_Sword()
        local Mon = "Cake Queen"
        local Enemy = Check_Monster(Mon)

        if Enemy then
            Attack(Enemy,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
            end)
        end
    end

    function Get_Serpent_Bow()
        local Mon = "Island Empress"
        local Enemy = Check_Monster(Mon)
        if Enemy then
            Attack(Enemy,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
            end)
        end
    end

    function Get_Hallow_Scythe()
        local Boss = "Soul Reaper"
        local Enemy_Boss = Check_Monster(Boss)
        if Enemy_Boss then
            Attack(Enemy_Boss,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
            end)
        elseif Check_Inventory("Hallow Essence") then
            firetouchinterest(localplayer.Character.Head, workspace.Map["Haunted Castle"].Summoner.Detection, 0)
            firetouchinterest(localplayer.Character.Head, workspace.Map["Haunted Castle"].Summoner.Detection, 1)
        elseif not Check_Inventory("Hallow Essence") and Remote_Check_Tool("Material","Bones") >= 500 then
            CommF_("Bones", "Buy", 1, 1)
        else
            local Mon = {"Posessed Mummy","Living Zombie","Reborn Skeleton","Demonic Soul"}
            local Enemy = Check_Monster(Mon)

            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                end)
            else
                Go_To_Spawner(Mon,function()
                    return not getgenv().KaitunConfig["Start Farm"]
                end)
            end 
        end
    end

    function Do_Dough_Awaken()
        local Boss = "Dough King"
        local Enemy_Boss = Check_Monster(Boss)
        if Check_Inventory("Red Key") then
            Equip_Tool("Red Key")
            local Pos = CFrame.new(-2681.51099, 64.3663483, -12852.7773)
            if Distance(Pos.Position) < 10 then
                CommF_("CakeScientist","Check")
            else
                Go_To_Position(Pos,function()
                    return not getgenv().KaitunConfig["Start Farm"]
                end)
            end
        elseif Enemy_Boss then
            Attack(Enemy_Boss,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
            end)
        elseif Check_Inventory("Sweet Chalice") then
            Max_Level_Farm("Cake Prince")
        elseif not Check_Inventory("Sweet Chalice") and Check_Inventory("God's Chalice") then
            if Remote_Check_Tool("Material","Conjured Cocoa") >= 10 then
                CommF_("SweetChaliceNpc")
            else
                local Mon = {"Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel"}
                local Enemy = Check_Monster(Mon)
                if Enemy then
                    Attack(Enemy,function()
                        return not getgenv().KaitunConfig["Start Farm"] or Remote_Check_Tool("Material","Conjured Cocoa") >= 10 or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                    end)
                else
                    Go_To_Spawner(Mon,function()
                        return not getgenv().KaitunConfig["Start Farm"]
                    end)
                end
            end
        elseif not Check_Inventory("God's Chalice") then
            if Check_Monster("Diablo") or Check_Monster("Deandre") or Check_Monster("Urban") then
                Elite_Hunter()
            else
                Server_Hop("Finding Elite Hunter")
            end
        end
    end

    function Attack_Dough_King()
        local Mon = "Dough King"
        local Enemy = Check_Monster(Mon)

        if Enemy then
            Attack(Enemy,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
            end)
        end
    end

    function Attack_Rip_Indra()
        local Mon = "rip_indra True Form"
        local Enemy = Check_Monster(Mon)

        if Enemy then
            Attack(Enemy,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
            end)
        end
    end

    function Elite_Hunter()
        local Mon = {"Diablo", "Deandre", "Urban"}
        local Enemy = Check_Monster(Mon)

        if Enemy then
            Attack(Enemy,function()
                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
            end)
        else
            Go_To_Spawner(Mon,function()
                return not getgenv().KaitunConfig["Start Farm"]
            end)
        end
    end

    function Get_Tushita()
        if Tushita_Quest.OpenedDoor and not Tushita_Quest.KilledLongma then
            local Mon = "Longma"
            local Enemy = Check_Monster(Mon)

            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                end)
            else
                Server_Hop("Finding "..Mon)
            end
        elseif not Tushita_Quest.OpenedDoor then
            if Check_Monster("rip_indra True Form") then
                Go_To_Position(workspace.Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame,function()
                    return Check_Inventory("Holy Torch") or getgenv().KaitunConfig["Start Farm"] or Distance(workspace.Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.Position) < 3 
                end)
                Equip_Tool("Holy Torch")
                for i = 1,5 do
                    CommF_("TushitaProgress","Torch",i)
                end
            else
                local function Color_Path_Check()
                    local OpenAll = 0
                    for i,v in pairs(game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren()) do
                        if v:IsA("Part") then
                            if v:FindFirstChild("Part") and v:FindFirstChild("Part").BrickColor == BrickColor.new("Lime green") then
                                OpenAll = OpenAll + 1
                            end
                        end
                    end
                    return OpenAll == 3
                end
                local Is_Color_All_Path = Color_Path_Check()
                if Is_Color_All_Path then
                    if Check_Inventory("God's Chalice") then
                        Equip_Tool("God's Chalice")
                        Go_To_Position(workspace.Map["Boat Castle"].Summoner.Detection.CFrame,function()
                            return not Check_Inventory("God's Chalice") or not getgenv().KaitunConfig["Start Farm"] or Distance(workspace.Map["Boat Castle"].Summoner.Detection.Position) < 3 
                        end)
                        firetouchinterest(localplayer.Character.HumanoidRootPart, workspace.Map["Boat Castle"].Summoner.Detection, 0)
                        firetouchinterest(localplayer.Character.HumanoidRootPart, workspace.Map["Boat Castle"].Summoner.Detection, 1)
                    else
                        repeat wait(0.5)
                            return Elite_Hunter()
                        until not getgenv().KaitunConfig["Start Farm"] or not Is_Color_All_Path or Check_Inventory("God's Chalice") or Check_Monster("rip_indra True Form")
                    end
                else
                    repeat wait()
                        Server_Hop("Finding Toggle Color Path Server")
                    until Is_Color_All_Path or not getgenv().KaitunConfig["Start Farm"]
                end
            end
        end
    end
    
    function Get_Musketeer_Hat()
        local Level = Player_Data.Level.Value
        local CitizenQuestProgress = CommF_("CitizenQuestProgress")
        if CitizenQuestProgress.KilledBandits == false then
            if string.find(localplayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(localplayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") then
                local Mon = "Forest Pirate"
                local Enemy = Check_Monster(Mon)

                if Enemy then
                    Attack(Enemy,function()
                        return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                    end)
                else
                    Go_To_Spawner(Mon,function()
                        return not getgenv().KaitunConfig["Start Farm"]
                    end)
                end
            else
                CommF_("StartQuest","CitizenQuest",1)
            end
        elseif CitizenQuestProgress.KilledBoss == false then
            if string.find(localplayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and localplayer.PlayerGui.Main.Quest.Visible == true then
                local Mon = "Captain Elephant"
                local Enemy = Check_Monster(Mon)

                if Enemy then
                    Attack(Enemy,function()
                        return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                    end)
                else
                    Go_To_Spawner(Mon,function()
                        return not getgenv().KaitunConfig["Start Farm"]
                    end)
                end
            else
                CommF_("StartQuest","CitizenQuest",2)
            end
        elseif CommF_("CitizenQuestProgress","Citizen") == 2 then
            Go_To_Position(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125),function()
                return not getgenv().KaitunConfig["Start Farm"] or Check_Inventory("Musketeer Hat")
            end)
        end
    end

    function Max_Level_Farm(Value)
        if Value == "Bone" then
            local Mon = {"Posessed Mummy","Living Zombie","Reborn Skeleton","Demonic Soul"}
            local Enemy = Check_Monster(Mon)

            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                end)
            else
                Go_To_Spawner(Mon,function()
                    return not getgenv().KaitunConfig["Start Farm"]
                end)
            end
        elseif Value == "Cake Prince" then
            local Remote_Cake_Prince = CommF_("CakePrinceSpawner")
            if string.find(Remote_Cake_Prince, "Do you want to open") then
                CommF_("CakePrinceSpawner")
            end
            local Boss = "Cake Prince"
            local Enemy_Boss = Check_Monster(Boss)
            if Enemy_Boss then
                Attack(Enemy_Boss,function()
                    return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
                end)
            else
                local Mon = {"Baking Staff", "Head Baker", "Cake Guard", "Cookie Crafter"}
                local Enemy = Check_Monster(Mon)
                if Enemy then
                    Attack(Enemy,function()
                        return not getgenv().KaitunConfig["Start Farm"] or Check_Monster(Boss) or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                    end)
                else
                    Go_To_Spawner(Mon,function()
                        return not getgenv().KaitunConfig["Start Farm"]
                    end)
                end
            end
        end
    end

    function Get_Cursed_Dual_Katana()
        local function Check_Mastery_Yama_Tushita()
            local Mastery_Yama = Remote_Check_Tool("Mastery", "Yama", 300)
            local Mastery_Tushita = Remote_Check_Tool("Mastery", "Tushita", 300)
            if not Mastery_Yama then
                return Max_Level_Farm("Bone")
            elseif not Mastery_Tushita then
                return Max_Level_Farm("Cake Prince")
            end
            return Mastery_Yama and Mastery_Tushita
        end
        local Is_Ready_To_Get_Cursed_Dual_Katana = Check_Mastery_Yama_Tushita()
        if Is_Ready_To_Get_Cursed_Dual_Katana then
            local Is_Door_Open = CommF_("CDKQuest","OpenDoor") == 'opened'
            if not Is_Door_Open then
                CommF_("CDKQuest","OpenDoor",true)
            end

            if Is_Door_Open then
                if CDK_Quest['Evil'] == 0 or CDK_Quest['Evil'] == -3 then
                    if CDK_Quest['Evil'] == 0 then
                        CommF_("CDKQuest","Progress","Evil")
                        CommF_("CDKQuest","StartTrial","Evil")
                    elseif CDK_Quest['Evil'] == -3 then
                        local Mon = "Mythological Pirate"
                        local Enemy = Check_Monster(Mon)
                        if Enemy then
                            Go_To_Position(Enemy.HumanoidRootPart.CFrame * CFrame.new(0,0,-2),function()
                                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or CDK_Quest['Evil'] ~= -3
                            end)
                        else
                            Go_To_Spawner(Mon,function()
                                return not getgenv().KaitunConfig["Start Farm"]
                            end)
                        end
                    end
                elseif CDK_Quest['Evil'] == 1 or CDK_Quest['Evil'] == -4 then
                    if CDK_Quest['Evil'] == 1 then
                        CommF_("CDKQuest","Progress","Evil")
                        CommF_("CDKQuest","StartTrial","Evil")
                    elseif CDK_Quest['Evil'] == -4 then
                        local function Quest_Haze_Mon()
                            for i,v in pairs(localplayer.QuestHaze:GetChildren()) do 
                                if v.Value > 0 then
                                    return v.Name
                                end
                            end
                            return false
                        end

                        local Mon = Quest_Haze_Mon()
                        local Enemy = Check_Monster(Mon)
                        if Enemy then
                            Attack(Enemy,function()
                                return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                            end)
                        else
                            Go_To_Spawner(Mon,function()
                                return not getgenv().KaitunConfig["Start Farm"]
                            end)
                        end
                    end
                elseif CDK_Quest['Evil'] == 2 or CDK_Quest['Evil'] == -5 then
                    if CDK_Quest['Evil'] == 2 then
                        CommF_("CDKQuest","Progress","Evil")
                        CommF_("CDKQuest","StartTrial","Evil")
                    elseif CDK_Quest['Evil'] == -5 then
                        local HellDimension = workspace.Map:FindFirstChild('HellDimension')
                        if HellDimension then
                            if Distance(HellDimension.WorldPivot.Position) <= 1200 then
                                local Mon = {"Cursed Skeleton","Hell's Messenger"}       
                                local Enemy = Check_Monster(Mon)
                                local function HellDimension_Torch()
                                    local Torch = {
                                        HellDimension:FindFirstChild("Torch1"),
                                        HellDimension:FindFirstChild("Torch2"),
                                        HellDimension:FindFirstChild("Torch3")
                                    }
                    
                                    for _, torch in pairs(Torch) do
                                        repeat
                                            task.wait(.5)
                                            TP(torch.CFrame)
                                        until not getgenv().KaitunConfig["Start Farm"] or Check_Monster(Mon) or Distance(torch.CFrame.Position) < 3 or not workspace.Map:FindFirstChild('HellDimension') or CDK_Quest['Evil'] ~= -5
                                        wait(.5)
                                        fireproximityprompt(torch.ProximityPrompt, math.huge)
                                        wait(.5)
                                    end
                                    Go_To_Position(HellDimension.Exit.CFrame, function()
                                        return not getgenv().KaitunConfig["Start Farm"] or not workspace.Map:FindFirstChild('HellDimension') or Distance(HellDimension.Exit.CFrame.Position) < 3 or CDK_Quest['Evil'] ~= -5
                                    end)
                                end

                                if Enemy and Distance(Enemy.HumanoidRootPart.CFrame) < 1500 then
                                    Attack(Enemy,function()
                                        return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                                    end)
                                else
                                    HellDimension_Torch()
                                end
                            end
                        else
                            local Boss = "Soul Reaper"
                            local Enemy_Boss = Check_Monster(Boss)
                            if Enemy_Boss then
                                Go_To_Position(Enemy_Boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2),function()
                                    return not getgenv().KaitunConfig["Start Farm"] or workspace.Map:FindFirstChild('HellDimension') or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
                                end)
                            else
                                if Check_Monster("Hallow Essence") then
                                    firetouchinterest(localplayer.Character.Head, workspace.Map["Haunted Castle"].Summoner.Detection, 0)
                                    firetouchinterest(localplayer.Character.Head, workspace.Map["Haunted Castle"].Summoner.Detection, 1)
                                elseif Bone_Check > 0 and Check_Total_Material('Bones') > 500 then
                                    CommF_("Bones", "Buy", 1, 1) 
                                else 
                                    Max_Level_Farm("Bone")
                                end
                            end
                        end
                    end 
                elseif CDK_Quest['Good'] == 0 or CDK_Quest['Good'] == -3 then
                    if CDK_Quest['Good'] == 0 then
                        CommF_("CDKQuest","Progress","Good")
                        CommF_("CDKQuest","StartTrial","Good")
                    elseif CDK_Quest['Good'] == -3 then 
                        local P1_Position = CFrame.new(-4600.37, 15.1245, -2881.18)
                        local P2_Position = CFrame.new(-2068.63, 3.37222, -9887.08)
                        local P3_Position = CFrame.new(-9531.19, 5.91675, -8377.75)
                        if not P1_Clear then
                            Go_To_Position(P1_Position,function()
                                return not getgenv().KaitunConfig["Start Farm"] or CDK_Quest['Good'] ~= -3 or Distance(P1_Position.Position) < 3
                            end)
                            if Distance(P1_Position.Position) < 10 then
                                wait(1)
                                if workspace.NPCs:FindFirstChild("Luxury Boat Dealer") and localplayer.Character.Humanoid.Health > 0 then
                                    CommF_("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer")) 
                                    P1_Clear = true
                                end
                            end
                        elseif not P2_Clear then
                            Go_To_Position(P2_Position,function()
                                return not getgenv().KaitunConfig["Start Farm"] or CDK_Quest['Good'] ~= -3 or Distance(P2_Position.Position) < 3
                            end)
                            if Distance(P2_Position.Position) < 10 then
                                wait(1)
                                if workspace.NPCs:FindFirstChild("Luxury Boat Dealer") and localplayer.Character.Humanoid.Health > 0 then
                                    CommF_("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer")) 
                                    P2_Clear = true
                                end
                            end
                        elseif not P3_Clear then
                            Go_To_Position(P3_Position,function()
                                return not getgenv().KaitunConfig["Start Farm"] or CDK_Quest['Good'] ~= -3 or Distance(P3_Position.Position) < 3
                            end)
                            if Distance(P3_Position.Position) < 10 then
                                wait(1)
                                if workspace.NPCs:FindFirstChild("Luxury Boat Dealer") and localplayer.Character.Humanoid.Health > 0 then
                                    CommF_("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer")) 
                                    P3_Clear = true
                                end
                            end
                        end
                    end
                elseif CDK_Quest['Good'] == 1 or CDK_Quest['Good'] == -4 then
                    if CDK_Quest['Good'] == 1 then
                        CommF_("CDKQuest", "Progress", "Good")
                        CommF_("CDKQuest", "StartTrial", "Good")
                    elseif CDK_Quest['Good'] == -4 then
                        local Sea_Castle_CFrame = CFrame.new(-5036, 315, -3179)
                        if Distance(Sea_Castle_CFrame.Position) < 1500 then
                            for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                                if Check_Alive_Monster(enemy) then
                                    if Distance(enemy.HumanoidRootPart.Position) <= 1500 then
                                        Attack(enemy, function()
                                            return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(enemy) or CDK_Quest['Good'] ~= -4
                                        end)
                                    end
                                end
                            end
                        else
                            Go_To_Position(Sea_Castle_CFrame,function()
                                return not getgenv().KaitunConfig["Start Farm"] or CDK_Quest['Good'] ~= -4 or Distance(Sea_Castle_CFrame.Position) < 1500
                            end)
                        end
                    end
                elseif CDK_Quest['Good'] == 2 or CDK_Quest['Good'] == -5 then
                    if CDK_Quest['Good'] == 2 then
                        CommF_("CDKQuest", "Progress", "Good")
                        CommF_("CDKQuest", "StartTrial", "Good")
                    elseif CDK_Quest['Good'] == -5 then
                        local HeavenlyDimension = workspace.Map:FindFirstChild('HeavenlyDimension')
                        if HeavenlyDimension then
                            if Distance(HeavenlyDimension.WorldPivot.Position) <= 1200 then
                                local Mon = {"Cursed Skeleton","Heaven's Guardian"}
                                local Enemy = Check_Monster(Mon)
                                local function HeavenlyDimension_Torch()
                                    local Torch = {
                                        HeavenlyDimension:FindFirstChild("Torch1"),
                                        HeavenlyDimension:FindFirstChild("Torch2"),
                                        HeavenlyDimension:FindFirstChild("Torch3")
                                    }
                    
                                    for _, torch in pairs(Torch) do
                                        repeat
                                            task.wait(.5)
                                            TP(torch.CFrame)
                                        until not getgenv().KaitunConfig["Start Farm"] or Check_Monster(Mon) or Distance(torch.CFrame.Position) < 3 or not workspace.Map:FindFirstChild('HeavenlyDimension') or CDK_Quest['Good'] ~= -5
                                        wait(.5)
                                        fireproximityprompt(torch.ProximityPrompt, math.huge)
                                        wait(.5)
                                    end
                                    Go_To_Position(HeavenlyDimension.Exit.CFrame, function()
                                        return not getgenv().KaitunConfig["Start Farm"] or not workspace.Map:FindFirstChild('HeavenlyDimension') or Distance(HeavenlyDimension.Exit.CFrame.Position) < 3 or CDK_Quest['Good'] ~= -5
                                    end)
                                end
                                if Enemy and Distance(Enemy.HumanoidRootPart.CFrame) < 1500 then
                                    Attack(Enemy,function()
                                        return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                                    end)
                                else
                                    HeavenlyDimension_Torch()
                                end
                            end
                        else
                            local Boss = "Cake Queen"
                            local Enemy_Boss = Check_Monster(Boss)
                            if Enemy_Boss then
                                Attack(Enemy_Boss,function()
                                    return not getgenv().KaitunConfig["Start Farm"] or workspace.Map:FindFirstChild('HeavenlyDimension') or not Check_Alive_Monster(Enemy_Boss) or not Check_Monster(Boss)
                                end)
                            else
                                Server_Hop("Finding "..Boss)
                            end
                        end
                    end
                elseif CDK_Quest['Good'] == 3 then
                    print("Exotic Good")
                    CommF_("CDKQuest", "Progress", "Good")
                    CommF_("CDKQuest", "StartTrial", "Good")
                    Server_Hop("reseting CDKQuest Good")
                elseif CDK_Quest['Evil'] == 3 then
                    print("Exotic Evil")
                    CommF_("CDKQuest", "Progress", "Evil")
                    CommF_("CDKQuest", "StartTrial", "Evil")
                    Server_Hop("reseting CDKQuest Evil")
                elseif CDK_Quest['Good'] == 4 and CDK_Quest['Evil'] == 4 then
                    local Mon = {"Cursed Skeleton Boss","Cursed Skeleton"}
                    local Enemy = Check_Monster(Mon)

                    if Enemy then
                        Attack(Enemy,function()
                            return not getgenv().KaitunConfig["Start Farm"] or Remote_Check_Tool("Tool","Cursed Dual Katana") or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                        end)
                    elseif workspace.Map.Turtle.Cursed.BossDoor.Position.Y <= 584 then
                        local Boss_CFrame = CFrame.new(-12253.5419921875, 598.8999633789062, -6546.8388671875)
                        repeat task.wait(.1)
                            totarget(Boss_CFrame)
                        until not getgenv().KaitunConfig["Start Farm"] or Distance(Boss_CFrame.Position) < 5 or Check_Monster(Mon)
                    elseif workspace.Map.Turtle.Cursed.BossDoor.Position.Y > 584 then
                        local targetCFrame = CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875)
                        Go_To_Position(targetCFrame, function()
                            return not getgenv().KaitunConfig["Start Farm"] or Distance(targetCFrame.Position) < 5
                        end)
                        wait(.5)
                        if Distance(targetCFrame.Position) < 5 then
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                            wait(.5)
                            game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                            wait(.5)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "E", false, game)
                            wait(.5)
                        end
                    end
                end
            end
        end
    end

    function Get_Rainbow_Haki()
        ListBossRainBow = {
            [1] = "Stone",
            [2] = "Island Empress",
            [3] = "Kilo Admiral",
            [4] = "Captain Elephant",
            [5] = "Beautiful Pirate"
        }
        
        for i,v in pairs(ListBossRainBow) do
            if string.find(Local_Player.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,v) then
                Name_Mon = v
            end
        end

        if Name_Mon then
            local Enemy = Check_Monster(Name_Mon)
            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Name_Mon)
                end)
            else
                Server_Hop("Finding "..Name_Mon)
            end
        end
    end

    function Get_Godhuman()
        local function check_and_buy(tool_name, mastery_var, mastery_level)
            if not mastery_var then
                if Check_Inventory(tool_name) then
                    if Check_Tool_Inventory(tool_name, mastery_level) then
                        return true
                    else
                        return Max_Level_Farm(getgenv().KaitunConfig["Setting"]["Farm When Lvl Max"])
                    end
                else
                    CommF_("Buy" .. tool_name:gsub(" ", ""))
                    return
                end
            end
            return mastery_var
        end

        Superhuman_Mastery = check_and_buy("Superhuman", Superhuman_Mastery, 400)
        if not Superhuman_Mastery then return end

        Death_Step_Mastery = check_and_buy("Death Step", Death_Step_Mastery, 400)
        if not Death_Step_Mastery then return end

        Sharkman_Karate_Mastery = check_and_buy("Sharkman Karate", Sharkman_Karate_Mastery, 400)
        if not Sharkman_Karate_Mastery then return end

        ElecticClaw_Mastery = check_and_buy("Electric Claw", ElecticClaw_Mastery, 400)
        if not ElecticClaw_Mastery then return end

        Dragon_Talon_Mastery = check_and_buy("Dragon Talon", Dragon_Talon_Mastery, 400)
        if not Dragon_Talon_Mastery then return end

        local God_Human_Remote = CommF_("BuyGodhuman", true)
        local Player_Fragment = Player_Data.Fragments.Value
        local Player_Beli = Player_Data.Beli.Value
        if God_Human_Remote == 0 then
            if Player_Fragment >= 5000 then
                DoRaid = false
                if Player_Beli >= 5000000 then
                    CommF_("BuyGodhuman")
                    HasGodhuman = true
                end
            else
                DoRaid = true
                return true
            end
        else
            local materials = {
                ["Fish Tail"] = {required = 20, flag = "GetFishTail"},
                ["Magma Ore"] = {required = 20, flag = "GetMagmaOre"},
                ["Mystic Droplet"] = {required = 10, flag = "GetMysticDroplet"},
                ["Dragon Scale"] = {required = 10, flag = "GetDragonScale"}
            }

            local GetFishTail, GetMagmaOre, GetMysticDroplet, GetDragonScale = false, false, false, false
            for material, data in pairs(materials) do
                if Remote_check_function("Material",material) >= data.required then
                    if data.flag == "GetFishTail" then 
                        GetFishTail = true
                    elseif data.flag == "GetMagmaOre" then 
                        GetMagmaOre = true
                    elseif data.flag == "GetMysticDroplet" then 
                        GetMysticDroplet = true
                    elseif data.flag == "GetDragonScale" then 
                        GetDragonScale = true
                    end
                end
            end

            local Mon
            if not GetFishTail then
                if not ThirdSea then CommF_("TravelZou") end
                Mon = {"Fishman Raider", "Fishman Captain"}
            elseif GetFishTail and not GetMagmaOre then
                if not SecondSea then CommF_("TravelDressrosa") end
                Mon = {"Magma Ninja", "Lava Pirate"}
            elseif GetFishTail and GetMagmaOre and not GetMysticDroplet then
                if not SecondSea then CommF_("TravelDressrosa") end
                Mon = {"Water Fighter", "Sea Soldier"}
            elseif GetFishTail and GetMagmaOre and GetMysticDroplet and not GetDragonScale then
                if not ThirdSea then CommF_("TravelZou") end
                Mon = {"Dragon Crew Archer", "Dragon Crew Warrior"}
            end

            local Enemy = Check_Monster(Mon)
            if Enemy then
                Attack(Enemy,function()
                    return not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(Enemy) or not Check_Monster(Mon)
                end)
            else
                Go_To_Spawner(Mon,function()
                    return not getgenv().KaitunConfig["Start Farm"]
                end)
            end
        end
    end 
    
end)()

localplayer.Idled:connect(function()
    virtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    virtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local ayaya_module = loadstring(game:HttpGet("https://api.realaya.xyz/v1/files/l/o7qg477s4kboyky2c8233i6fj4rxndmv.lua"))()

-- task.spawn(function()
--     while task.wait(0.02) do
--         if Start_Attack then
--             ayaya_module.attack()
--         end
--     end
-- end)

function GetBladeHits()
    local bladeHits = {}
    local MAX_DISTANCE = 65 -- ระยะทางสูงสุดที่ตรวจสอบ

    -- ดึงข้อมูลศัตรูใน workspace
    for _, entity in ipairs(workspace.Enemies:GetChildren()) do
        local humanoid = entity:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health > 0 and humanoid.RootPart and Distance(humanoid.RootPart.Position) < MAX_DISTANCE then
            table.insert(bladeHits, humanoid.RootPart)
        end
    end

    -- ดึงผู้เล่นที่มี PvP เปิด
    for _, player in ipairs(game.Players:GetPlayers()) do
        local character = player.Character
        if character and not player:GetAttribute("PvpDisabled") and character ~= localplayer.Character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 and humanoid.RootPart and Distance(humanoid.RootPart.Position) < MAX_DISTANCE then
                local IsAlly = collectionservice:HasTag(player, "Ally"..localplayer.Name)

                if not IsAlly then
                    table.insert(bladeHits, humanoid.RootPart)
                end
            end
        end
    end

    return bladeHits
end

task.spawn(function()
    while task.wait() do
        local BladeHits = GetBladeHits()
        if Start_Attack and #BladeHits > 0 then
            local Current_Blade = {}
            for _, hit in pairs(BladeHits) do
                table.insert(Current_Blade, {hit.Parent, hit})
            end

            if #Current_Blade > 0 then
                for _, Target in pairs(Current_Blade) do
                    getgenv().ayaya_module.pure_attack(Target[2], Current_Blade)
                end
            end
        end
    end
end)

task.spawn(function()
    runservice.Stepped:Connect(function()
        if setscriptable then
            setscriptable(localplayer, "SimulationRadius", true)
            localplayer.SimulationRadius = math.huge
        end
        if sethiddenproperty then
            sethiddenproperty(localplayer, "SimulationRadius", math.huge)
        end 
    end)
end)

task.spawn(function()
    runservice.Stepped:Connect(function()
        if getgenv().KaitunConfig["Start Farm"] then
            if Is_player_ready() then
                for _, v in pairs(localplayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end
    end)
end)

task.spawn(function()
    while task.wait(0.5) do
        if getgenv().KaitunConfig["Start Farm"] then
            if Is_player_ready() then
                local humanoidRootPart = localplayer.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    if not humanoidRootPart:FindFirstChild("BodyClip") then
                        local Noclip = Instance.new("BodyVelocity")
                        Noclip.Name = "BodyClip"
                        Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                        Noclip.Velocity = Vector3.new(0, 0, 0)
                        Noclip.Parent = humanoidRootPart
                    end
                end
            end
        else
            local humanoidRootPart = localplayer.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local bodyClip = humanoidRootPart:FindFirstChild("BodyClip")
                if bodyClip then
                    bodyClip:Destroy()
                end
            end
        end
    end
end)

task.spawn(LPH_NO_VIRTUALIZE(function()
    if FirstSea then return end
    while task.wait(0.1) do
        if DoRaid then 
            Stop_Store_Fruit = true
        else
            Stop_Store_Fruit = false
        end
        if DoRaid and not Is_raiding() then
            if not Chip then
                Chip = "Dark"
            end
            wait(3)
            if DoRaid and not Is_raiding() then
                Stop_Store_Fruit = true
                if not Check_raid_chip() and not Is_raiding() then
                    if CommF_("RaidsNpc","Select",Chip) ~= 1 then
                        if not Check_fruit_inventory() then
                            local Fruits = Get_Inventory_Fruits(0,1000000)
                            local Cheapest = nil
                            for _, v in pairs(Fruits or {}) do
                                if not Cheapest or v.Value < Cheapest.Value then
                                    Cheapest = v
                                end
                            end  
                            if Cheapest.Name then
                                CommF_("LoadFruit",Cheapest.Name)
                            elseif not Cheapest.Name and not Check_fruit_inventory() and not Check_Fruit() and not Is_raiding() then
                                Server_Hop("Finding Fruit")
                            end
                        end
                        if Check_fruit_inventory() then
                            CommF_("RaidsNpc","Select",Chip)
                        end
                    end
                elseif Check_raid_chip() and not Is_raiding() then
                    pcall(function()
                        if ThirdSea then
                            if not workspace.Map["Boat Castle"].RaidSummon2.Button:FindFirstChild("Main") or not workspace.Map["Boat Castle"].RaidSummon2.Button.Main:FindFirstChild("ClickDetector") then
                                repeat task.wait(0.5)
                                    TP(CFrame.new(-5036, 315, -3179))
                                until not DoRaid or Is_raiding() or workspace.Map["Boat Castle"].RaidSummon2.Button:FindFirstChild("Main") or workspace.Map["Boat Castle"].RaidSummon2.Button.Main:FindFirstChild("ClickDetector")
                                fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                            else
                                fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                            end
                        elseif SecondSea then
                            fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector) 
                        end
                        local ID = game:GetService("HttpService"):GenerateGUID()
                        RaidID = ID
                        StartingRaid = true 
                        task.delay(60,function()
                            if RaidID == ID then
                                StartingRaid = false
                            end
                        end)
                    end)
                    -- if SecondSea then
                    --     return workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector
                    -- elseif ThirdSea then
                    --     return workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector
                    -- else
                    --     warn("No valid raid location found!")
                    --     return nil
                    -- end
                end
            end
        elseif DoRaid and Is_raiding() then
            if localplayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                local function FindRaidIsland(islandName, maxDistance)
                    for _, island in pairs(WorldOrigin.Locations:GetChildren()) do
                        if island:IsA('BasePart') and island.Name == islandName and Distance(island.Position) <= maxDistance then
                            return island
                        end
                    end
                    return nil
                end    
                if #workspace.Enemies:GetChildren() > 0 then
                    for i,v in pairs(workspace.Enemies:GetChildren()) do
                        if Check_Alive_Monster(v) then
                            Attack(v,function()
                                return not DoRaid or not getgenv().KaitunConfig["Start Farm"] or not Check_Alive_Monster(v) 
                            end)
                        else
                            if FindRaidIsland('Island 5',2500) then
                                TP(FindRaidIsland('Island 5',2500).CFrame*CFrame.new(0,50,100))
                            elseif FindRaidIsland('Island 4',2500) then
                                TP(FindRaidIsland('Island 4',2500).CFrame*CFrame.new(0,50,100))
                            elseif FindRaidIsland('Island 3',2500) then
                                TP(FindRaidIsland('Island 3',2500).CFrame*CFrame.new(0,50,100))
                            elseif FindRaidIsland('Island 2',2500) then
                                TP(FindRaidIsland('Island 2',2500).CFrame*CFrame.new(0,50,100))
                            elseif FindRaidIsland('Island 1',2500) then
                                TP(FindRaidIsland('Island 1',2500).CFrame*CFrame.new(0,50,100))
                            end
                        end 
                    end
                else
                    if FindRaidIsland('Island 5',2500) then
                        TP(FindRaidIsland('Island 5',2500).CFrame*CFrame.new(0,70,100))
                    elseif FindRaidIsland('Island 4',2500) then
                        TP(FindRaidIsland('Island 4',2500).CFrame*CFrame.new(0,70,100))
                    elseif FindRaidIsland('Island 3',2500) then
                        TP(FindRaidIsland('Island 3',2500).CFrame*CFrame.new(0,70,100))
                    elseif FindRaidIsland('Island 2',2500) then
                        TP(FindRaidIsland('Island 2',2500).CFrame*CFrame.new(0,70,100))
                    elseif FindRaidIsland('Island 1',2500) then
                        TP(FindRaidIsland('Island 1',2500).CFrame*CFrame.new(0,70,100))
                    end
                end
                Need_Noclip = false
                Stop_Store_Fruit = false
            end
        end
    end
end))

function Check_Item_Condition(itemType, world, itemName, hasItem)
    local config = getgenv().KaitunConfig

    if not config["Setting"]["Item Finder Fully"] then
        return true
    end

    local isRequired = config[itemType] and config[itemType][world] and config[itemType][world][itemName]

    if not isRequired then
        return true
    end

    return hasItem == true
end

First_Sea_Function = LPH_JIT_MAX(function()
    local Level = Player_Data.Level.Value 
    local Has_Saber = Remote_Check_Tool("Tool", "Saber")
    local Has_Pole = Remote_Check_Tool("Tool", "Pole (1st Form)")

    if getgenv().KaitunConfig["Sword"]["World 1"]["Saber"] and Level >= 200 and not Has_Saber then
        Get_Saber()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 1"]["Pole"] and Level >= 300 and not Has_Pole and Check_Monster("Thunder God") then
        Get_Pole()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 1"]["Pole"] and Level >= 700 and not Has_Pole and not Check_Monster("Thunder God") then
        Server_Hop("Finding Thunder God")
        return true
    -- elseif Level >= 700 and ((getgenv().KaitunConfig["Sword"]["World 1"]["Saber"] and Has_Saber) or (getgenv().KaitunConfig["Sword"]["World 1"]["Pole"] and Has_Pole)) then
    --     Travel_To_Second_Sea()
    --     return true
    elseif Level >= 700 and Check_Item_Condition("Sword", "World 1", "Saber", Has_Saber) and Check_Item_Condition("Sword", "World 1", "Pole", Has_Pole) then
        Travel_To_Second_Sea()
        return true
    end
    
    return false
end)

Second_Sea_Function = LPH_JIT_MAX(function()
    local Is_Match_Race = Check_Match_Race()
    local Level = Player_Data.Level.Value
    local Player_Race = Player_Data.Race.Value
    local Player_Beli = Player_Data.Beli.Value
    local Is_Evo_V2 = Player_Data.Race:FindFirstChild("Evolved")
    local Has_Warrior_Helmet = Remote_Check_Tool("Tool", "Warrior Helmet")
    local Has_Rengoku = Remote_Check_Tool("Tool", "Rengoku")
    local Has_TTK = Remote_Check_Tool("Tool", "True Triple Katana")
    local Has_Kabucha = Remote_Check_Tool("Tool", "Kabucha")
    local Has_Soul_Cane = Remote_Check_Tool("Tool", "Soul Cane")
    local Has_Midnight_Blade = Remote_Check_Tool("Tool", "Midnight Blade")
    local Has_Gravity_Cane = Remote_Check_Tool("Tool", "Gravity Cane")

    if getgenv().KaitunConfig["Quest"]["World 2"]["Factory"] and Check_Monster("Core") then
        Factory()
        return true
    elseif getgenv().KaitunConfig["Quest"]["World 2"]["Dark Fragment"] and Check_Monster("Darkbeard") then
        Attack_Dark_beard()
        return true
    elseif getgenv().KaitunConfig["Quest"]["World 2"]["Bartilo"] and Level >= 850 and not Has_Warrior_Helmet then
        if not Remote_Check_Bartilo.DidPlates and Remote_Check_Bartilo.KilledSpring or (not Remote_Check_Bartilo.KilledSpring and Remote_Check_Bartilo.KilledBandits and Check_Monster("Jeremy")) or not Remote_Check_Bartilo.KilledBandits then
            Bartilo_Quest()
            return true
        -- elseif not Remote_Check_Bartilo.KilledSpring and Remote_Check_Bartilo.KilledBandits then
        --     if Check_Monster("Jeremy") then
        --         Bartilo_Quest()
        --         return true
        --     end
        -- elseif not Remote_Check_Bartilo.KilledBandits then
        --     Bartilo_Quest()
        --     return true
        end
    elseif getgenv().KaitunConfig["Race"]["Evo Race V2"] and Has_Warrior_Helmet and not Is_Evo_V2 and Is_Match_Race and Level >= 850 and Player_Beli >= 500000 then
        Evo_Race_V2()
        return true
    elseif getgenv().KaitunConfig["Race"]["Reroll Race"] and not Is_Match_Race and #getgenv().KaitunConfig["Race"]["Select Race"] > 0 and Level >= 1100 then
        Change_Race()
        return true
    elseif getgenv().KaitunConfig["Race"]["Evo Race V3"] and Level >= 1500 and Is_Evo_V2 then
        Evo_Race_V3()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 2"]["Gravity Cane"] and Check_Monster("Fajita") and not Has_Gravity_Cane then
        Get_Gravity_Cane()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 2"]["Gravity Cane"] and Level >= 1500 and not Check_Monster("Fajita") and not Has_Gravity_Cane then
        Server_Hop("Finding Fajita")
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 2"]["Soul Cane"] and Player_Beli >= 750000 and not Has_Soul_Cane then
        CommF_("BuyItem","Soul Cane")
    elseif getgenv().KaitunConfig["Sword"]["World 2"]["Midnight Blade"] and Level >= 1500 and not Has_Midnight_Blade then
        Get_Midnight_Blade()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 2"]["Rengoku"] and Level >= 1500 and not Has_Rengoku then
        Get_Rengoku()
        return true
    elseif getgenv().KaitunConfig["Gun"]["World 2"]["Kabucha"] and Level >= 1500 and not Has_Kabucha then
        Get_Kabucha()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 2"]["True Triple Katana"] and Level >= 1500 and not Has_TTK then
        Get_TTK()
        return true
    elseif Level >= 1500 and Check_Item_Condition("Sword", "World 2", "Rengoku", Has_Rengoku) and Check_Item_Condition("Gun", "World 2", "Kabucha", Has_Kabucha) and Check_Item_Condition("Sword", "World 2", "True Triple Katana", Has_TTK) then
        Travel_To_Third_Sea()
        return true
    end

    return false
end)

Third_Sea_Function = LPH_JIT_MAX(function()
    local Level = Player_Data.Level.Value
    local Has_Twin_Hooks = Remote_Check_Tool("Tool", "Twin Hooks")
    local Has_Canvander = Remote_Check_Tool("Tool", "Canvander")
    local Has_Buddy_Sword = Remote_Check_Tool("Tool", "Buddy Sword")
    local Has_Hallow_Scythe = Remote_Check_Tool("Tool", "Hallow Scythe")
    local Has_Yama = Remote_Check_Tool("Tool", "Yama")
    local Has_Tushita = Remote_Check_Tool("Tool", "Tushita")
    local Has_Cursed_Dual_Katana = Remote_Check_Tool("Tool", "Cursed Dual Katana")
    local Has_Musketeer_Hat = Remote_Check_Tool("Tool", "Musketeer Hat")
    local Has_Serpent_Bow = Remote_Check_Tool("Tool", "Serpent Bow")
    -- ["Shark Anchor"] = {
    --     ["Enabled"] = true,
    --     ["Money"] = 30000000,
    -- },
    if Check_Monster("rip_indra") and Has_Tushita then
        Attack_Rip_Indra()
        return true
    elseif Remote_Elite_Hunter_Progress < 30 and (Check_Monster("Diablo") or Check_Monster("Deandre") or Check_Monster("Urban")) then
        Elite_Hunter()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 3"]["Twin Hooks"] and Check_Monster("Captain Elephant") and not Has_Twin_Hooks then
        Get_Twin_Hooks()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 3"]["Canvander"] and Check_Monster("Beautiful Pirate") and not Has_Canvander then
        Get_Canvander()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 3"]["Buddy Sword"] and Check_Monster("Cake Queen") and not Has_Buddy_Sword then
        Get_Buddy_Sword()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 3"]["Yama"] and Remote_Elite_Hunter_Progress >= 30 and not Has_Yama then
        repeat wait(0.1)
            fireclickdetector(workspace:FindFirstChild("SealedKatana", true).Handle.ClickDetector)
        until Remote_Check_Tool("Tool", "Yama")
        return true
    elseif getgenv().KaitunConfig["Gun"]["World 3"]["Serpent Bow"] and Check_Monster("Island Empress") and not Has_Serpent_Bow then
        Get_Serpent_Bow()
        return true
    elseif Level >= 1800 and getgenv().KaitunConfig["Quest"]["World 3"]["Musketeer Hat"] and not Has_Musketeer_Hat then
        Get_Musketeer_Hat()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 3"]["Tushita"] and not Has_Tushita and ((Level >= 2000 and Check_Monster("rip_indra True Form")) or (Level >= 2650 and not Check_Monster("rip_indra True Form")) or (Tushita_Quest.OpenedDoor and not Tushita_Quest.KilledLongma)) then
        Get_Tushita()
        return true
    elseif getgenv().KaitunConfig["Sword"]["World 3"]["Cursed Dual Katana"] and Has_Tushita and Has_Yama and not Has_Cursed_Dual_Katana then
        Get_Cursed_Dual_Katana()
        return true
    elseif Level >= 2650 and getgenv().KaitunConfig["Quest"]["World 3"]["Rainbow Haki"] and not Is_Rainbow_Quest then
        Get_Rainbow_Haki()
        return true
    elseif Level >= 2650 and getgenv().KaitunConfig["Sword"]["World 3"]["Hallow Scythe"] and not Has_Hallow_Scythe and Bone_Check > 0 then
        Get_Hallow_Scythe()
        return true
    elseif Level >= 2650 and getgenv().KaitunConfig["Quest"]["World 3"]["Dough Awaken"] and Dough_Raid ~= true then
        Do_Dough_Awaken()
        return true
    elseif getgenv().KaitunConfig["Quest"]["World 3"]["Dough Mirror"] and Check_Monster("Dough King") then
        Attack_Dough_King()
        return true
    end
end)

Handle_Sea_Function = LPH_JIT_MAX(function()
    if FirstSea then
        return First_Sea_Function()
    elseif SecondSea then
        return Second_Sea_Function()
    elseif ThirdSea then
        return Third_Sea_Function()
    end
    return false
end)

Handle_Melee_Function = LPH_JIT_MAX(function()
    local Level = Player_Data.Level.Value
    local Player_Fragment = Player_Data.Fragments.Value
    local Player_Beli = Player_Data.Beli.Value

    if not Hassuperhuman and getgenv().KaitunConfig["Melee"]["Superhuman"] then
        if not HasBlackleg and Player_Beli >= 150000 then
            CommF_("BuyBlackLeg")
        elseif Check_Tool_Mastery("Black Leg", 300) then
            CommF_("BuyElectro")
        elseif Check_Tool_Mastery("Electro", 300) then
            CommF_("BuyFishmanKarate")
        elseif Check_Tool_Mastery("Fishman Karate", 300) and Level > 1100 then
            if Player_Fragment >= 1500 then
                DoRaid = false
                CommF_("BlackbeardReward", "DragonClaw", "1")
                CommF_("BlackbeardReward", "DragonClaw", "2")
            else
                DoRaid = true
                return true
            end
        elseif Check_Tool_Mastery("Dragon Claw", 300) and Player_Beli >= 3000000 then
            CommF_("BuySuperhuman")
            Hassuperhuman = true
        end
    elseif getgenv().KaitunConfig["Melee"]["Death Step"] and not HasDeathStep and SecondSea and MyLevel >= 1500 and not Is_Open and Hassuperhuman then
        Open_Library()
        return true
    elseif getgenv().KaitunConfig["Melee"]["Sharkman Karate"] and not HasSharkmanKarate and SecondSea and MyLevel >= 1500 and not Is_Use_key and Hassuperhuman then
        Find_Water_Key()
        return true
    elseif getgenv().KaitunConfig["Melee"]["Death Step"] and Is_Open and ThirdSea and (Hassuperhuman and not HasDeathStep) then
        if Check_Inventory("Black Leg") then
            if Check_Tool_Mastery("Black Leg",400) then
                if Player_Fragment >= 5000 then
                    DoRaid = false
                    if Player_Beli >= 2500000 then
                        CommF_("BuyDeathStep")
                        HasDeathStep = true
                    end
                else
                    DoRaid = true
                    return true
                end
            end
        else
            CommF_("BuyBlackLeg")
        end
    elseif getgenv().KaitunConfig["Melee"]["Sharkman Karate"] and Is_Use_key and ThirdSea and (Hassuperhuman and HasDeathStep and not HasSharkmanKarate) then
        if Check_Inventory("Fishman Karate") then
            if Check_Tool_Mastery("Fishman Karate",400) then
                if Player_Fragment >= 5000 then
                    DoRaid = false
                    if Player_Beli >= 2500000 then
                        CommF_("BuyDeathStep")
                        HasDeathStep = true
                    end
                else
                    DoRaid = true
                    return true
                end
            end
        else
            CommF_("BuyFishmanKarate")
        end
    elseif getgenv().KaitunConfig["Melee"]["Electric Claw"] and ThirdSea and (Hassuperhuman and HasDeathStep and HasSharkman and not HasElectricClaw) then
        if Check_Inventory("Electro") then
            if Check_Tool_Mastery("Electro", 400) then
                if Electric_Quest then
                    CommF_("BuyElectricClaw", "Start")
                    wait(1)
                    CommF_("requestEntrance", Vector3.new(-12462, 375, -7552))
                elseif Player_Fragment >= 5000 then
                    DoRaid = false
                    if Player_Beli >= 3000000 then
                        CommF_("BuyElectricClaw")
                        HasElectricClaw = true
                    end
                else
                    DoRaid = true
                    return true
                end
            end
        else
            CommF_("BuyElectro")
        end
    elseif getgenv().KaitunConfig["Melee"]["Dragon Talon"] and ThirdSea and (Hassuperhuman and HasDeathStep and HasSharkman and HasElectricClaw and not HasDragonTalon) then
        local Total_Bones = Remote_Check_Tool("Material","Bones")
        if Used_Fire_Essence then
            if Check_Inventory("Dragon Claw") then
                if Check_Tool_Mastery("Dragon Claw", 400) then
                    if Player_Fragment >= 5000 then
                        DoRaid = false
                        if Player_Beli >= 3000000 then
                            CommF_("BuyDragonTalon")
                            HasDragonTalon = true
                        end
                    else
                        DoRaid = true
                        return true
                    end
                end
            else
                CommF_("BlackbeardReward", "DragonClaw", "1")
                CommF_("BlackbeardReward", "DragonClaw", "2")
            end
        elseif Bone_Check > 0 and Total_Bones >= 500 then
            CommF_("Bones","Buy",1,1)
        elseif Bone_Check > 0 and Total_Bones < 500 then
            Max_Level_Farm("Bone")
            return true
        end
    elseif getgenv().KaitunConfig["Melee"]["Godhuman"] and MyLevel >= 2650 and (Hassuperhuman and HasDeathStep and HasSharkman and HasElectricClaw and HasDragonTalon and not HasGodhuman) then
        Get_Godhuman()
        return true
    end
    return false
end)

localplayer.CharacterAdded:Connect(function(Character)
    local humanoid = localplayer.Character:WaitForChild("Humanoid")
    Character:WaitForChild("Busy").Changed:Connect(function()
        if Character.Busy.Value then
            Character.Busy.Value = false
        end
    end)
    Character:WaitForChild("Stun").Changed:Connect(function()
        if Character.Stun.Value > 0 then
            Character.Stun.Value = 0
        end
    end)
    humanoid.StateChanged:Connect(function(oldState, newState)
        if newState == Enum.HumanoidStateType.Seated then
            print("💺 Player ถูกบังคับให้นั่ง!")
    
            -- รอให้มันนั่งจริงก่อน แล้วบังคับลุก
            task.wait(0.1)
    
            if humanoid.Sit then
                print("⚡ ลุกขึ้นโดยอัตโนมัติ!")
                humanoid.Sit = false
            end
        end
    end)
end)

task.spawn(function()
    local weaponToolTipMap = {
        ["Melee"] = "Melee",
        ["Sword"] = "Sword",
        ["Devil Fruit"] = "Blox Fruit"
    }
    
    while task.wait(0.5) do
        for _, tool in pairs(localplayer.Backpack:GetChildren()) do
            local weaponToolTip = weaponToolTipMap[Weapon or "Melee"]
            if weaponToolTip and tool.ToolTip == weaponToolTip and Check_Inventory(tool.Name) then
                Current_Weapon = tool.Name
                break
            end
        end
    end
end)

task.spawn(LPH_NO_VIRTUALIZE(function()
    while task.wait(0.1) do
        if Start_Magnet then
            local enemiesFolder = workspace:FindFirstChild("Enemies")
            if not enemiesFolder then
                -- warn("Enemies folder not found in workspace")
                continue
            end
            local enemies = enemiesFolder:GetChildren()
            for _, v in pairs(enemies) do
                if v.Name ~= Magnet_monster then
                    continue
                end
                local Human = v:FindFirstChild("Humanoid")
                if not Human then
                    continue
                end
                local HumanRootPart = v:FindFirstChild("RootPart") or v:FindFirstChild("HumanoidRootPart")
                if not HumanRootPart then
                    continue
                end
                -- local Animator = Human:FindFirstChild("Animator")
                -- if Animator then
                --     Animator:Destroy()
                -- end
                
                local BodyVelocity = HumanRootPart:FindFirstChild("BodyVelocity")
                if not BodyVelocity then
                    BodyVelocity = Instance.new("BodyVelocity")
                    BodyVelocity.Parent = HumanRootPart
                    BodyVelocity.Name = "BodyVelocity"
                    BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
                if isnetworkowner(HumanRootPart) or Distance(HumanRootPart.Position, Pos_mon.Position) <= 300 then
                    task.spawn(function()
                        for _, val in pairs(v:GetDescendants()) do
                            if val:IsA("BasePart") then
                                val.CanCollide = false
                            end
                        end
                    end)
                    -- HumanRootPart.CanCollide = false
                    -- Human:ChangeState(14)
                    HumanRootPart.CFrame = Pos_mon
                    -- Human.WalkSpeed = 0
                    -- Human.JumpPower = 0
                    -- Human.AutoRotate = false
                end
            end
        end
    end
end))

task.spawn(function()
    while task.wait(0.5) do
        if getgenv().KaitunConfig["Setting"]["Auto Stats"] then
            if localplayer.Data.Stats.Melee.Level.Value < 2600 then
                CommF_("AddPoint","Melee",math.huge)
            elseif localplayer.Data.Stats.Defense.Level.Value < 2600 then
                CommF_("AddPoint","Defense",math.huge)
            else
                if getgenv().KaitunConfig["Setting"]["Stats Mode"] == "Sword" then
                    CommF_("AddPoint","Sword",math.huge)
                elseif getgenv().KaitunConfig["Setting"]["Stats Mode"] == "Gun" then
                    CommF_("AddPoint","Gun",math.huge)
                elseif getgenv().KaitunConfig["Setting"]["Stats Mode"] == "Fruit" then
                    CommF_("AddPoint","Demon Fruit",math.huge)
                end
            -- elseif localplayer.Data.Stats.Sword.Level.Value < 2600 then
            --     CommF_("AddPoint","Sword",math.huge)
            end
            -- for _, statInfo in ipairs(_G.Config["Stats"]["Select Stats"]) do
            --     local statName = statInfo.Stat
            --     local targetPoint = statInfo.Point
            --     local statData = Player_Data.Stats[statName]
                
            --     if statData and statData.Level.Value < targetPoint then
            --         CommF_("AddPoint", statName, math.huge)
            --         break -- หยุดลูปเมื่ออัปเดตคะแนนให้สถานะนี้แล้ว
            --     end
            -- end

        end
    end
end)

task.spawn(LPH_NO_VIRTUALIZE(function()
    while task.wait(0.1) do
        local succ,err = pcall(function()
            Is_Open = CommF_("OpenLibrary")

            local useKeyResult = CommF_("BuySharkmanKarate", true)
            Is_Use_key = useKeyResult == 0 or useKeyResult == 3
    
            Electric_Quest = CommF_("BuyElectricClaw", true) == 4
            
            local result = CommF_("BuyDragonTalon", true)
            Used_Fire_Essence = result == 0 or result == 3
            
            if ThirdSea then
                Bone_Check = CommF_("Bones", "Check")
                CDK_Quest = CommF_("CDKQuest", "Progress")
                Remote_Elite_Hunter_Progress = CommF_("EliteHunter", "Progress")
                Tushita_Quest = CommF_("TushitaProgress")
                task.spawn(function() 
                    local Remote_Haki = CommF_("getColors")
                    for i,v in pairs(Remote_Haki) do
                        if v.HiddenName == "Rainbow Saviour" and v.Unlocked == true then
                            Is_Rainbow_Quest = true
                        end
                    end
                end)
            elseif SecondSea then
                if getgenv().KaitunConfig["Sword"]["World 2"]["Legendary Sword"] then
                    CommF_("LegendarySwordDealer","2")
                end
                Remote_Check_Bartilo = CommF_("BartiloQuestProgress")
            end
            
            if ThirdSea and localplayer.PlayerGui.Notifications:FindFirstChild("NotificationTemplate") then
                local function checkNotify(msg)
                    msg = string.lower(msg)
                    for _, k in ipairs(localplayer.PlayerGui.Notifications:GetDescendants()) do
                        if k:IsA("TextLabel") and k.Text then
                            if string.find(string.lower(k.Text), msg, 1, true) then
                                return true
                            end
                        end
                    end
                    return false
                end                        

                if checkNotify("good job") or checkNotify("the pirates have stopped") then
                    Pirate_Raid = false
                elseif checkNotify("pirates have been spotted") or checkNotify("the pirates are raiding") then
                    Pirate_Raid = true
                end
            end

            if CommF_("BuyElectro",true) == 1 then
                HasElectro = true
            end
            if CommF_("BuyBlackLeg",true) == 1 then
                HasBlackleg = true
            end
            if CommF_("BuyFishmanKarate",true) == 1 then
                HasFishman = true
            end
            if CommF_("BlackbeardReward","DragonClaw","1") == 1 then
                HasDragonClaw = true
            end
            if CommF_("BuySuperhuman",true) == 1 then
                Hassuperhuman = true
            end
            if CommF_("BuyDeathStep",true) == 1 then
                HasDeathStep = true
            end
            if CommF_("BuySharkmanKarate",true) == 1 then
                HasSharkman = true
            end
            if CommF_("BuyElectricClaw",true) == 1 then
                HasElectricClaw = true
            end
            if CommF_("BuyDragonTalon",true) == 1 then
                HasDragonTalon = true
            end
            if CommF_("BuyGodhuman",true) == 1 then
                HasGodhuman = true
            end            

            if CommF_("Cousin","Buy") == 1 then
                CommF_("Cousin","Buy")
            end

            if not Ready_To_Farm then
                Ready_To_Farm = true
            end
        end)
        if not succ then warn("Alt Function "..err) end
    end
end))

task.spawn(LPH_NO_VIRTUALIZE(function()
    while task.wait(0.1) do
        if getgenv().KaitunConfig["Start Farm"] and Ready_To_Farm then
            local succ,err = pcall(function()
                local Level = Player_Data.Level.Value
                local matchedFruit = Check_Fruit_Match()
                if matchedFruit then
                    return Eat_Select_Fruit(matchedFruit)
                end
                if getgenv().KaitunConfig["Fruit"]["Setting"]["Store Fruit"] and not Stop_Store_Fruit then
                    ProcessFruits(localplayer.Backpack)
                    ProcessFruits(localplayer.Character)
                end
                local Alt_Function = Handle_Melee_Function() or Handle_Sea_Function()
                if not Alt_Function then
                    if Level < 2565 then
                        Auto_Farm_Level()
                    else
                        Max_Level_Farm(getgenv().KaitunConfig["Setting"]["Farm When Lvl Max"])
                    end
                end
                setfpscap(getgenv().KaitunConfig["Setting"]["Locking FPS"])
                Buy_Fruit()
            end)  
            if not succ then warn("Main Function "..err) end
        end
    end
end))

if getgenv().KaitunConfig["Setting"]['White Screen'] then
    runservice:Set3dRenderingEnabled(false)
    togle_up = false
end

userinputservice.InputBegan:Connect(function(input, isTyping)
    if not isTyping then
        if input.KeyCode == Enum.KeyCode.Y then
            if togle_up then
                runservice:Set3dRenderingEnabled(false)
                togle_up = false
            else
                runservice:Set3dRenderingEnabled(true)
                togle_up = true
            end
        end
    end
end)

function SetMonsterTransparency(monster, transparencyValue)
    if monster:IsA("Model") then
        for _, part in pairs(monster:GetDescendants()) do
            if part:IsA("BasePart") then -- ตรวจสอบเฉพาะ BasePart
                part.Transparency = transparencyValue
            end
        end
    end
end

workspace.Enemies.ChildAdded:Connect(function(monster)
    task.wait(0.1)
    if monster:IsA("Model") then
        SetMonsterTransparency(monster, 0.9)

        monster.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("BasePart") then
                -- print("Part added to monster:", descendant.Name)
                descendant.Transparency = 0.9
            end
        end)
    end
end)

for _, monster in pairs(workspace.Enemies:GetChildren()) do
    if monster:IsA("Model") then
        SetMonsterTransparency(monster, 0.9)
        monster.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("BasePart") then
                -- print("Part added to existing monster:", descendant.Name)
                descendant.Transparency = 0.9
            end
        end)
    end
end

local Code = {
	"EXP_5B",
	"CONTROL",
	"UPDATE11",
	"XMASEXP",
	"1BILLION",
	"ShutDownFix2",
	"UPD14",
	"STRAWHATMAINE",
	"TantaiGaming",
	"Colosseum",
	"Axiore",
	"Sub2Daigrock",
	"Sky Island 3",
	"Sub2OfficialNoobie",
	"SUB2NOOBMASTER123",
	"THEGREATACE",
	"Fountain City",
	"BIGNEWS",
	"FUDD10",
	"SUB2GAMERROBOT_EXP1",
	"UPD15",
	"2BILLION",
	"UPD16",
	"3BVISITS",
	"fudd10_v2",
	"Starcodeheo",
    "KITT_RESET",
    "Sub2UncleKizaru",
    "SUB2GAMERROBOT_RESET1",
	"Magicbus",
	"JCWK",
	"Bluxxy",
	"Sub2Fer999",
	"Enyu_is_Pro",
	"GAMER_ROBOT_1M",
	"ADMINGIVEAWAY",
	"GAMERROBOT_YT",
	"kittgaming",
    "ADMIN_TROLL",
    "staffbattle",
    "youtuber_shipbattle",
    "Sub2CaptainMaui",
    "DEVSCOOKING",
}

if getgenv().KaitunConfig["Setting"]["Redeem Code"] then
    for i,v in pairs(Code) do
        replicatedstorage.Remotes.Redeem:InvokeServer(v)
    end
end

Start_Attack = true
Start_Magnet = true