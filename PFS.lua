local library = loadstring(game:HttpGet'https://raw.githubusercontent.com/KuppaHX/PolarHUBDenosaurGUI/main/PolarHUBGUI.lua')()
local venyx = library.new("PolarHUB | Pet Fighters Simulator")
--Credits page
local page = venyx:addPage("Home", 170940873)
local Credits1 = page:addSection("Credits Dev & GUI Made By Denosaur")

Credits1:addButton("Zaaa 愛#1688 -- Founder", function(dsclink)
    if dsclink then
        venyx:Notify("Discord ID Owner Has Coppied", "You can paste it")
    end
    setclipboard('Zaaa 愛#1688')
end)
-------------------
--Main Page------
local page = venyx:addPage("Main", 2038908845)
local section1 = page:addSection("Auto Farm")
-------------------------
----egg
local page = venyx:addPage("Pets", 4814044817)
local pets1 = page:addSection("Auto Buy Eggs")
------Misc Page
local Teleport = venyx:addPage("Teleport", 6863521323)
local TP = Teleport:addSection("Teleport | TP")

local page = venyx:addPage("Misc", 3340612851)
local misc1 = page:addSection("Misc")
----------------------
----------------
local page = venyx:addPage("Settings", 3340612992)
local Settings1 = page:addSection("Settings")
local Settings2 = page:addSection("Theme")
Settings1:addKeybind("Hide Gui", Enum.KeyCode.RightShift, function(menu)
venyx:toggle()
end, function(menu)
end)

------------
------------

Settings1:addButton("Destroy Menu", function()
    game:GetService("CoreGui")["PolarHUB | Pet Fighters Simulator"]:Destroy()
end)

misc1:addToggle("Anti AFK", true, function(vu)
    local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
           vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
           wait(1)
           vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
end)

misc1:addToggle("Noclip", false, function(v)
    
               if state then
   
               noclip = false
               game:GetService('RunService').Stepped:connect(function()
               if noclip then
               game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
               end
               end)
   
           else
   
               noclip = not noclip
   game:GetService('RunService').Stepped:connect(function()
   if noclip then
   game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
   end
  end)
  end
end)

spawn(function()
    game:GetService("ReplicatedStorage").Communication.Events.EquipBest:FireServer()
end)
    
section1:addButton("Remove Coin Pop", function(t)
    equip = t
while equip do wait(.4)
    game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.PopUps.Coins:Destroy()
end
end)

section1:addToggle("Auto Equip Best Pets", false, function(t)
    equip = t
    while equip do wait(.4)
    game:GetService("ReplicatedStorage").Communication.Events.EquipBest:FireServer()
    end
       end)
    

section1:addToggle("Fast Attack", false, function(t)
    fast = t
    while fast do wait()
    for i = 1,10 do
        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
    end
    end   
end)

selectmob = "Aqua Slime"
   mob = {}
   for i,v in pairs(game:GetService("Workspace").GameAssets.Mobs.Spawns:GetChildren()) do
if not table.find(mob, v.Name) then
table.insert(mob, v.Name)
end
   end

   section1:addDropdown("Select Mob", mob, function(a)
       selectmob = a
   end)

   section1:addToggle("Auto Farm Mobs", false, function(t)
    attack = t
    while attack do task.wait()
    local args = {
        [1] = workspace.GameAssets.Mobs:FindFirstChild(selectmob),
        [2] = false
    }
    
    game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
    end
   end)

   selectegg = 'Grassy Capsule'
   selegg = {}
   for i,v in pairs(game:GetService("Workspace").GameAssets.Capsules:GetChildren()) do
   if not table.find(selegg, v.Name) then
   table.insert(selegg, v.Name)
   end
   end 
pets1:addDropdown("Select Egg", selegg, function(a)
    selectegg = a
end)
pets1:addToggle("Spam Buy Select Egg", false, function(t)
    open = t
    while open do task.wait(.5)
    
    local args = {
        [1] = "b",
        [2] = game:GetService("Players").LocalPlayer,
        [3] = selectegg
    }
    game:GetService("ReplicatedStorage").Communication.Functions.OpenCapsules:FireServer(unpack(args))
    end
        
end)

TP:addButton("All Models", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3.87851, 2.998, -48.4474)
   end)

   TP:addButton("Grass Plains", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-194.705, 379.693, -528.925)
       end)

       TP:addButton("Atlantis Palace", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3169.06, 393.88, 5.707)
           end)

           TP:addButton("Electrifying Alley", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-665.41, 397.021, 3970.15)
               end)

               local Quest = {
                'Jimmy (lost Glasses)', 
                'Ivan (lost Shoes)',
                'Roxxy (Slay 5 Slimes)',
                'Walter (Defeat 1 Dark Slime)',
                'Susan (Defeat 1 King Slug)',
                'Edward (lost index)',
                'Deanna (Defeat 1 Seismic Robot)',
            }
            
            section1:addDropdown("Select Quest [Beta]", Quest, function(a)
                _G.selectquest = a
               end)
            
               section1:addButton("Start Auto Quest [Beta]", function(t)
            if _G.selectquest == 'Jimmy (lost Glasses)' then
                    for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.JIMMY:GetDescendants()) do
                        if v:FindFirstChild("ProximityPrompt") then
                            fireproximityprompt(v.ProximityPrompt)
                        end
                    end
                    for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                        if v:IsA("TextButton") then
                            for i,v in next, getconnections(v.MouseButton1Click) do
                            v:Fire()
                        end
                        end
                    end
                    for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                        if v:IsA("TextButton") then
                            for i,v in next, getconnections(v.MouseButton1Click) do
                            v:Fire()
                        end
                        end
                    end
                    for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                        if v:IsA("TextButton") then
                            for i,v in next, getconnections(v.MouseButton1Click) do
                            v:Fire()
                        end
                        end
                    end
                    for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.Sunglasses:GetDescendants()) do
                        if v:FindFirstChild("ProximityPrompt") then
                            fireproximityprompt(v.ProximityPrompt)
                        end
                    end
                    for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.Sunglasses:GetDescendants()) do
                        if v:FindFirstChild("ProximityPrompt") then
                            fireproximityprompt(v.ProximityPrompt)
                        end
                    end
            
            
                elseif _G.selectquest == 'Ivan (lost Shoes)' then
                    for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.IVAN:GetDescendants()) do
                        if v:FindFirstChild("ProximityPrompt") then
                            fireproximityprompt(v.ProximityPrompt)
                        end
                    end
                    for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                        if v:IsA("TextButton") then
                            for i,v in next, getconnections(v.MouseButton1Click) do
                            v:Fire()
                        end
                        end
                    end
                    for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                        if v:IsA("TextButton") then
                            for i,v in next, getconnections(v.MouseButton1Click) do
                            v:Fire()
                        end
                        end
                    end
                    for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                        if v:IsA("TextButton") then
                            for i,v in next, getconnections(v.MouseButton1Click) do
                            v:Fire()
                        end
                        end
                    end
                    for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.Shoes:GetDescendants()) do
                        if v:FindFirstChild("ProximityPrompt") then
                            fireproximityprompt(v.ProximityPrompt)
                        end
                    end
                    for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.Shoes:GetDescendants()) do
                        if v:FindFirstChild("ProximityPrompt") then
                            fireproximityprompt(v.ProximityPrompt)
                        end
                    end


                elseif _G.selectquest == 'Ivan (lost Shoes)' then
                    for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.IVAN:GetDescendants()) do
                        if v:FindFirstChild("ProximityPrompt") then
                            fireproximityprompt(v.ProximityPrompt)
                        end
                    end
                    for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                        if v:IsA("TextButton") then
                            for i,v in next, getconnections(v.MouseButton1Click) do
                            v:Fire()
                        end
                        end
                    end
                    for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                        if v:IsA("TextButton") then
                            for i,v in next, getconnections(v.MouseButton1Click) do
                            v:Fire()
                        end
                        end
                    end
                    for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                        if v:IsA("TextButton") then
                            for i,v in next, getconnections(v.MouseButton1Click) do
                            v:Fire()
                        end
                        end
                    end
                    for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.Shoes:GetDescendants()) do
                        if v:FindFirstChild("ProximityPrompt") then
                            fireproximityprompt(v.ProximityPrompt)
                        end
                    end
                    for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.Shoes:GetDescendants()) do
                        if v:FindFirstChild("ProximityPrompt") then
                            fireproximityprompt(v.ProximityPrompt)
                        end
                    end
            
            
            
                    elseif _G.selectquest == 'Roxxy (Slay 5 slimes)' then
                        for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.ROXXY:GetDescendants()) do
                            if v:FindFirstChild("ProximityPrompt") then
                                fireproximityprompt(v.ProximityPrompt)
                            end
                        end
                        for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                            if v:IsA("TextButton") then
                                for i,v in next, getconnections(v.MouseButton1Click) do
                                v:Fire()
                            end
                            end
                        end
                        for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                            if v:IsA("TextButton") then
                                for i,v in next, getconnections(v.MouseButton1Click) do
                                v:Fire()
                            end
                            end
                        end
                        for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                            if v:IsA("TextButton") then
                                for i,v in next, getconnections(v.MouseButton1Click) do
                                v:Fire()
                            end
                            end
                        end
                        wait(7)
                        for i = 1,50 do
                            local args = {
                                [1] = workspace.GameAssets.Mobs:FindFirstChild("Aqua Slime"),
                                [2] = false
                            }
                            
                            game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                            
                            game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                            end
                            wait(3)
                            for i = 1,50 do
                                local args = {
                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Aqua Slime"),
                                    [2] = false
                                }
                                
                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                end
                                wait(3)
                                for i = 1,50 do
                                    local args = {
                                        [1] = workspace.GameAssets.Mobs:FindFirstChild("Aqua Slime"),
                                        [2] = false
                                    }
                                    
                                    game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                    
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    end
                                    wait(3)
                                    for i = 1,50 do
                                        local args = {
                                            [1] = workspace.GameAssets.Mobs:FindFirstChild("Aqua Slime"),
                                            [2] = false
                                        }
                                        
                                        game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                        
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        end
                                        wait(3)
                                        for i = 1,50 do
                                            local args = {
                                                [1] = workspace.GameAssets.Mobs:FindFirstChild("Aqua Slime"),
                                                [2] = false
                                            }
                                            
                                            game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                            
                                            game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                            end
                                            wait(3)
                                            for i = 1,50 do
                                                local args = {
                                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Aqua Slime"),
                                                    [2] = false
                                                }
                                                
                                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                                
                                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                                end
                                                wait(3)
                                                for i = 1,50 do
                                                    local args = {
                                                        [1] = workspace.GameAssets.Mobs:FindFirstChild("Aqua Slime"),
                                                        [2] = false
                                                    }
                                                    
                                                    game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                                    
                                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                                    end
                                                    wait(3)
                                                    for i = 1,50 do
                                                        local args = {
                                                            [1] = workspace.GameAssets.Mobs:FindFirstChild("Aqua Slime"),
                                                            [2] = false
                                                        }
                                                        
                                                        game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                                        
                                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                                        end
                                                        wait(3)
                                                        for i = 1,50 do
                                                            local args = {
                                                                [1] = workspace.GameAssets.Mobs:FindFirstChild("Aqua Slime"),
                                                                [2] = false
                                                            }
                                                            
                                                            game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                                            
                                                            game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                                            end
                                            wait(3)
            for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.ROXXY:GetDescendants()) do
                if v:FindFirstChild("ProximityPrompt") then
                    fireproximityprompt(v.ProximityPrompt)
                end
            end
            
            
            
            
            elseif _G.selectquest == 'Walter (Defeat 1 Dark Slime)' then
                for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.WALTER:GetDescendants()) do
                    if v:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(v.ProximityPrompt)
                    end
                end
                wait(3)
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
                wait(1)
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
                wait(2)
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
                wait(1)
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
            
                for i = 1,200 do
            
                    local args = {
                        [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                        [2] = false
                    }
                    game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                    end
                    wait(2)
                    for i = 1,200 do
            
                        local args = {
                            [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                            [2] = false
                        }
                        game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                        end
                        wait(2)
                        for i = 1,200 do
            
                            local args = {
                                [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                [2] = false
                            }
                            game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                            game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                            game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                            game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                            game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                            end
                            wait(2)
                            for i = 1,200 do
            
                                local args = {
                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                    [2] = false
                                }
                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                end
                                wait(2)
                                for i = 1,200 do
                
                                    local args = {
                                        [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                        [2] = false
                                    }
                                    game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    end
                                    wait(2)
                                    for i = 1,200 do
                    
                                        local args = {
                                            [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                            [2] = false
                                        }
                                        game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        end
                                        wait(2)
                            for i = 1,200 do
            
                                local args = {
                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                    [2] = false
                                }
                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                end
                                wait(2)
                                for i = 1,200 do
                
                                    local args = {
                                        [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                        [2] = false
                                    }
                                    game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    end
                                    wait(2)
                                    for i = 1,200 do
                    
                                        local args = {
                                            [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                            [2] = false
                                        }
                                        game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        end
                                        wait(2)
                            for i = 1,200 do
            
                                local args = {
                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                    [2] = false
                                }
                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                end
                                wait(2)
                                for i = 1,200 do
                
                                    local args = {
                                        [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                        [2] = false
                                    }
                                    game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    end
                                    wait(2)
                                    for i = 1,200 do
                    
                                        local args = {
                                            [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                            [2] = false
                                        }
                                        game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        end
                                        wait(2)
                            for i = 1,200 do
            
                                local args = {
                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                    [2] = false
                                }
                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                local args = {
                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                    [2] = false
                                }
                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                local args = {
                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                    [2] = false
                                }
                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                local args = {
                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                    [2] = false
                                }
                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))

                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                end
                                wait(2)
                                for i = 1,200 do
                
                                    local args = {
                                        [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                        [2] = false
                                    }
                                    game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                    local args = {
                                        [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                        [2] = false
                                    }
                                    game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                    local args = {
                                        [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                        [2] = false
                                    }
                                    game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                    local args = {
                                        [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                        [2] = false
                                    }
                                    game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))

                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                    end
                                    wait(2)
                                    for i = 1,200 do
                    
                                        local args = {
                                            [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                            [2] = false
                                        }
                                        game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                        local args = {
                                            [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                            [2] = false
                                        }
                                        game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                        local args = {
                                            [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                            [2] = false
                                        }
                                        game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                        local args = {
                                            [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                            [2] = false
                                        }
                                        game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))

                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                        end
                                        wait(2)
                                        for i = 1,200 do
                        
                                            local args = {
                                                [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                                [2] = false
                                            }
                                            game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                            local args = {
                                                [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                                [2] = false
                                            }
                                            game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                            local args = {
                                                [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                                [2] = false
                                            }
                                            game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                            local args = {
                                                [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                                [2] = false
                                            }
                                            game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))

                                            game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                            game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                            game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                            game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                            end
                                            wait(2)
                                            for i = 1,200 do
                            
                                                local args = {
                                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                                    [2] = false
                                                }
                                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                                local args = {
                                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                                    [2] = false
                                                }
                                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                                local args = {
                                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                                    [2] = false
                                                }
                                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))
                                                local args = {
                                                    [1] = workspace.GameAssets.Mobs:FindFirstChild("Dark Slime"),
                                                    [2] = false
                                                }
                                                game:GetService("ReplicatedStorage").Communication.Events.Attack:FireServer(unpack(args))

                                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                                game:GetService("ReplicatedStorage").Communication.Events.ClickAttack:FireServer()
                                                end
                                                                        

            for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.WALTER:GetDescendants()) do
                if v:FindFirstChild("ProximityPrompt") then
                    fireproximityprompt(v.ProximityPrompt)
                end
            end
            






            
            elseif _G.selectquest == 'Susan (Defeat 1 King Slug)' then
                for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.SUSAN:GetDescendants()) do
                    if v:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(v.ProximityPrompt)
                    end
                end
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
wait(20)
                for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.SUSAN:GetDescendants()) do
                    if v:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(v.ProximityPrompt)
                    end
                end
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end




            elseif _G.selectquest == 'Edward (lost index)' then
                for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.EDWARD:GetDescendants()) do
                    if v:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(v.ProximityPrompt)
                    end
                end
                wait(2)
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
wait(4)
                for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.Index:GetDescendants()) do
                    if v:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(v.ProximityPrompt)
                    end
                end
wait(1)
for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.EDWARD:GetDescendants()) do
    if v:FindFirstChild("ProximityPrompt") then
        fireproximityprompt(v.ProximityPrompt)
    end
end




            elseif _G.selectquest == 'Deanna (Defeat 1 Seismic Robot)' then
for i, v in pairs(game:GetService("Workspace").GameAssets.Interactables.DEANNA:GetDescendants()) do
                    if v:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(v.ProximityPrompt)
                    end
                end
                wait(4)
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
                wait(4)
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
                wait(2)
                for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.QuestDialog.Holder.Confirm:GetChildren()) do
                    if v:IsA("TextButton") then
                        for i,v in next, getconnections(v.MouseButton1Click) do
                        v:Fire()
                    end
                    end
                end
for i = 1,5 do
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
                
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/izuyepewuz"))()
    
end

                end
               end)
            
               section1:addToggle("Auto Collect Coins", false, function(t)
            collect = t
            while collect do task.wait()
                for i,v in pairs(game:GetService("Workspace").GameAssets.Coins:GetChildren()) do
                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
               end)

               section1:addToggle("Auto Collect Milestones", false, function(t)
            mile = t
            while mile do task.wait(.5)
local args = {
    [1] = "Time Played"
}
game:GetService("ReplicatedStorage").Communication.Events.UpgradeMilestone:FireServer(unpack(args))
local args = {
    [1] = "Damage Done"
}
game:GetService("ReplicatedStorage").Communication.Events.UpgradeMilestone:FireServer(unpack(args))
local args = {
    [1] = "Capsules Opened"
}
game:GetService("ReplicatedStorage").Communication.Events.UpgradeMilestone:FireServer(unpack(args))
local args = {
    [1] = "Pets Discovered"
}
game:GetService("ReplicatedStorage").Communication.Events.UpgradeMilestone:FireServer(unpack(args))

            end
               end)
            
               section1:addToggle("Auto Buy Worlds", false, function(t)
            buyworld = t
            while buyworld do task.wait(.2)
            local args = {
                [1] = game:GetService("Players").LocalPlayer,
                [2] = "Atlantis Palace"
            }
            game:GetService("ReplicatedStorage").Communication.Events.PurchaseZone:FireServer(unpack(args))
            
            task.wait(.2)
            
            local args = {
                [1] = game:GetService("Players").LocalPlayer,
                [2] = "Electrifying Alley"
            }
            game:GetService("ReplicatedStorage").Communication.Events.PurchaseZone:FireServer(unpack(args))
            
            end
               end)
            
            

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
    Settings2:addColorPicker(theme, color, function(color3)
    venyx:setTheme(theme, color3)
    end)
    end
    -------------------------------------------------------------------------------------------------
    
    
    -- load
    venyx:SelectPage(venyx.pages[1], true)
--2121

