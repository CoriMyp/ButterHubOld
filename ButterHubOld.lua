--LUA lumber is good.

--test


--spaghetti code
--spaghetti code

--spaghetti code
--spaghetti code

--spaghetti code--spaghetti code

--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code
--spaghetti code

--spaghetti code
--spaghetti code
--spaghetti code

            --#region UI CODE
            local library = {}
            local ToggleUI = false
            library.currentTab = nil
            library.flags = {}
            
            local services = setmetatable({}, {
              __index = function(t, k)
                return game.GetService(game, k)
              end
            })
            
            local mouse = services.Players.LocalPlayer:GetMouse()
            
            function Tween(obj, t, data)
                services.TweenService:Create(obj, TweenInfo.new(t[1], Enum.EasingStyle[t[2]], Enum.EasingDirection[t[3]]), data):Play()
                return true
            end
            
            local toggled = false
            
            -- # Switch Tabs # --
            local switchingTabs = false
            function switchTab(new)
              if switchingTabs then return end
              local old = library.currentTab
              if old == nil then
                new[2].Visible = true
                library.currentTab = new
                services.TweenService:Create(new[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
                services.TweenService:Create(new[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()
                return
              end
              
              if old[1] == new[1] then return end
              switchingTabs = true
              library.currentTab = new
            
              services.TweenService:Create(old[1], TweenInfo.new(0.1), {ImageTransparency = 0.2}):Play()
              services.TweenService:Create(new[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
              services.TweenService:Create(old[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0.2}):Play()
              services.TweenService:Create(new[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()
            
              old[2].Visible = false
              new[2].Visible = true
              
              task.wait(0.1)
            
              switchingTabs = false
            end
            
            -- # Drag, Stolen from Kiriot or Wally # --
            function drag(frame, hold)
                if not hold then
                    hold = frame
                end
                local dragging
                local dragInput
                local dragStart
                local startPos
                
                function Ripple(obj)
                spawn(function()
                    if obj.ClipsDescendants ~= true then
                        obj.ClipsDescendants = true
                    end
                    local Ripple = Instance.new("ImageLabel")
                    Ripple.Name = "Ripple"
                    Ripple.Parent = obj
                    Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Ripple.BackgroundTransparency = 1.000
                    Ripple.ZIndex = 8
                    Ripple.Image = "rbxassetid://2708891598"
                    Ripple.ImageTransparency = 0.800
                    Ripple.ScaleType = Enum.ScaleType.Fit
                    Ripple.ImageColor3 = Color3.fromRGB(255, 255, 255)
                    Ripple.Position = UDim2.new((mouse.X - Ripple.AbsolutePosition.X) / obj.AbsoluteSize.X, 0, (mouse.Y - Ripple.AbsolutePosition.Y) / obj.AbsoluteSize.Y, 0)
                    Tween(Ripple, {.3, 'Linear', 'InOut'}, {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)})
                    wait(0.15)
                    Tween(Ripple, {.3, 'Linear', 'InOut'}, {ImageTransparency = 1})
                    wait(.3)
                    Ripple:Destroy()
                end)
            end
            
                local function update(input)
                    local delta = input.Position - dragStart
                    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            
                hold.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        dragStart = input.Position
                        startPos = frame.Position
            
                        input.Changed:Connect(function()
                            if input.UserInputState == Enum.UserInputState.End then
                                dragging = false
                            end
                        end)
                    end
                end)
            
                frame.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        dragInput = input
                    end
                end)
            
                services.UserInputService.InputChanged:Connect(function(input)
                    if input == dragInput and dragging then
                        update(input)
                    end
                end)
            end
            
            function library.new(library, name)
              for _, v in next, services.CoreGui:GetChildren() do
                if v.Name == "frosty is cute" then
                  v:Destroy()
                end
              end
            
              local dogent = Instance.new("ScreenGui")
              local Main = Instance.new("Frame")
              local TabMain = Instance.new("Frame")
              local MainC = Instance.new("UICorner")
              local SB = Instance.new("Frame")
              local SBC = Instance.new("UICorner")
              local Side = Instance.new("Frame")
              local SideG = Instance.new("UIGradient")
              local TabBtns = Instance.new("ScrollingFrame")
              local TabBtnsL = Instance.new("UIListLayout")
              local ScriptTitle = Instance.new("TextLabel")
              local SBG = Instance.new("UIGradient")  
            
              if syn and syn.protect_gui then syn.protect_gui(dogent) end
            
              dogent.Name = "frosty is cute"
              dogent.Parent = services.CoreGui
              
              function UiDestroy()
                  dogent:Destroy()
              end
              
                  function ToggleUILib()
                    if not ToggleUI then
                        dogent.Enabled = false
                        ToggleUI = true
                        else
                        ToggleUI = false
                        dogent.Enabled = true
                    end
                end
              
              Main.Name = "Main"
              Main.Parent = dogent
              Main.AnchorPoint = Vector2.new(0.5, 0.5)
              Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
              Main.BorderColor3 = Color3.fromRGB(25, 25, 25)
              Main.Position = UDim2.new(0.5, 0, 0.5, 0)
              Main.Size = UDim2.new(0, 572, 0, 353)
            
              drag(Main)
              
                  function toggleui()
                    toggled = not toggled
                    spawn(function()
                        if toggled then wait(0.3) end
                    end)
                    Tween(Main, {0.3, 'Sine', 'InOut'}, {
                        Size = UDim2.new(0, 609, 0, (toggled and 505 or 0))
                    })
                end
              
              TabMain.Name = "TabMain"
              TabMain.Parent = Main
              TabMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              TabMain.BackgroundTransparency = 1.000
              TabMain.Position = UDim2.new(0.217000037, 0, 0, 3)
              TabMain.Size = UDim2.new(0, 448, 0, 346)
              
              MainC.CornerRadius = UDim.new(0, 6)
              MainC.Name = "MainC"
              MainC.Parent = Main
              
              SB.Name = "SB"
              SB.Parent = Main
              SB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              SB.BorderColor3 = Color3.fromRGB(25, 25, 25)
              SB.Size = UDim2.new(0, 8, 0, 353)
              
              SBC.CornerRadius = UDim.new(0, 6)
              SBC.Name = "SBC"
              SBC.Parent = SB
              
              Side.Name = "Side"
              Side.Parent = SB
              Side.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              Side.BorderColor3 = Color3.fromRGB(25, 25, 25)
              Side.BorderSizePixel = 0
              Side.ClipsDescendants = true
              Side.Position = UDim2.new(1, 0, 0, 0)
              Side.Size = UDim2.new(0, 110, 0, 353)
              
              SideG.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))}
              SideG.Rotation = 90
              SideG.Name = "SideG"
              SideG.Parent = Side
              
              TabBtns.Name = "TabBtns"
              TabBtns.Parent = Side
              TabBtns.Active = true
              TabBtns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
              TabBtns.BackgroundTransparency = 1.000
              TabBtns.BorderSizePixel = 0
              TabBtns.Position = UDim2.new(0, 0, 0.0973535776, 0)
              TabBtns.Size = UDim2.new(0, 110, 0, 318)
              TabBtns.CanvasSize = UDim2.new(0, 0, 1, 0)
              TabBtns.ScrollBarThickness = 0
              
              TabBtnsL.Name = "TabBtnsL"
              TabBtnsL.Parent = TabBtns
              TabBtnsL.SortOrder = Enum.SortOrder.LayoutOrder
              TabBtnsL.Padding = UDim.new(0, 12)
              
              
            function zigzag(X) return math.acos(math.cos(X*math.pi))/math.pi end
            local RGBcounter = 0
            
            local gay = false
            
            if game.Players.LocalPlayer.UserId == 4172004550 or game.Players.LocalPlayer.UserId == 440361410 or game.Players.LocalPlayer.UserId == 264766302 or game.Players.LocalPlayer.UserId == 424570617 then
            gay = true
            else
            gay = false
            end
            
            if gay == true then
            task.spawn(function()
                print("your gay")
                while wait(0.1) do
                RGBcounter = RGBcounter + 0.01
                end
            end)
            end
              
              ScriptTitle.Name = "ScriptTitle"
              ScriptTitle.Parent = Side
              ScriptTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
              ScriptTitle.BackgroundTransparency = 1.000
              ScriptTitle.Position = UDim2.new(0, 0, 0.00953488424, 0)
              ScriptTitle.Size = UDim2.new(0, 102, 0, 20)
              ScriptTitle.Font = Enum.Font.GothamSemibold
              ScriptTitle.Text = name
              if gay == true then
              task.spawn(function()
            print("your gay")
            while wait(0.1) do
            ScriptTitle.TextColor3 = Color3.fromHSV(zigzag(RGBcounter),1,1)
            end
            end)
            else
                ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
            
             
                
              ScriptTitle.TextSize = 14.000
              ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left
              
              SBG.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))}
              SBG.Rotation = 90
              SBG.Name = "SBG"
              SBG.Parent = SB
            
              TabBtnsL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                TabBtns.CanvasSize = UDim2.new(0, 0, 0, TabBtnsL.AbsoluteContentSize.Y + 18)
              end)
              
              local window = {}
              function window.Tab(window, name, icon)
                local Tab = Instance.new("ScrollingFrame")
                local TabIco = Instance.new("ImageLabel")
                local TabText = Instance.new("TextLabel")
                local TabBtn = Instance.new("TextButton")
                local TabL = Instance.new("UIListLayout")
            
                Tab.Name = "Tab"
                Tab.Parent = TabMain
                Tab.Active = true
                Tab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Tab.BackgroundTransparency = 1.000
                Tab.Size = UDim2.new(1, 0, 1, 0)
                Tab.ScrollBarThickness = 2
                Tab.Visible = false
                
                TabIco.Name = "TabIco"
                TabIco.Parent = TabBtns
                TabIco.BackgroundTransparency = 1.000
                TabIco.BorderSizePixel = 0
                TabIco.Size = UDim2.new(0, 24, 0, 24)
                TabIco.Image = ("rbxassetid://%s"):format((icon or 4370341699))
                TabIco.ImageTransparency = 0.2
                
                TabText.Name = "TabText"
                TabText.Parent = TabIco
                TabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TabText.BackgroundTransparency = 1.000
                TabText.Position = UDim2.new(1.41666663, 0, 0, 0)
                TabText.Size = UDim2.new(0, 76, 0, 24)
                TabText.Font = Enum.Font.GothamSemibold
                TabText.Text = name
                TabText.TextColor3 = Color3.fromRGB(255, 255, 255)
                TabText.TextSize = 14.000
                TabText.TextXAlignment = Enum.TextXAlignment.Left
                TabText.TextTransparency = 0.2
                
                TabBtn.Name = "TabBtn"
                TabBtn.Parent = TabIco
                TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TabBtn.BackgroundTransparency = 1.000
                TabBtn.BorderSizePixel = 0
                TabBtn.Size = UDim2.new(0, 110, 0, 24)
                TabBtn.AutoButtonColor = false
                TabBtn.Font = Enum.Font.SourceSans
                TabBtn.Text = ""
                TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                TabBtn.TextSize = 14.000
                
                TabL.Name = "TabL"
                TabL.Parent = Tab
                TabL.SortOrder = Enum.SortOrder.LayoutOrder
                TabL.Padding = UDim.new(0, 4)  
            
                TabBtn.MouseButton1Click:Connect(function()
                    spawn(function()
                        Ripple(TabBtn)
                    end)
                  switchTab({TabIco, Tab})
                end)
            
                if library.currentTab == nil then switchTab({TabIco, Tab}) end
            
                TabL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                  Tab.CanvasSize = UDim2.new(0, 0, 0, TabL.AbsoluteContentSize.Y + 8)
                end)
            
                local tab = {}
                function tab.section(tab, name, TabVal)
                  local Section = Instance.new("Frame")
                  local SectionC = Instance.new("UICorner")
                  local SectionText = Instance.new("TextLabel")
                  local SectionOpen = Instance.new("ImageLabel")
                  local SectionOpened = Instance.new("ImageLabel")
                  local SectionToggle = Instance.new("ImageButton")
                  local Objs = Instance.new("Frame")
                  local ObjsL = Instance.new("UIListLayout")
            
                  Section.Name = "Section"
                  Section.Parent = Tab
                  Section.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                  Section.BackgroundTransparency = 1.000
                  Section.BorderSizePixel = 0
                  Section.ClipsDescendants = true
                  Section.Size = UDim2.new(0.981000006, 0, 0, 36)
                  
                  SectionC.CornerRadius = UDim.new(0, 6)
                  SectionC.Name = "SectionC"
                  SectionC.Parent = Section
                  
                  SectionText.Name = "SectionText"
                  SectionText.Parent = Section
                  SectionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                  SectionText.BackgroundTransparency = 1.000
                  SectionText.Position = UDim2.new(0.0887396261, 0, 0, 0)
                  SectionText.Size = UDim2.new(0, 401, 0, 36)
                  SectionText.Font = Enum.Font.GothamSemibold
                  SectionText.Text = name
                  SectionText.TextColor3 = Color3.fromRGB(255, 255, 255)
                  SectionText.TextSize = 16.000
                  SectionText.TextXAlignment = Enum.TextXAlignment.Left
                  
                  SectionOpen.Name = "SectionOpen"
                  SectionOpen.Parent = SectionText
                  SectionOpen.BackgroundTransparency = 1
                  SectionOpen.BorderSizePixel = 0
                  SectionOpen.Position = UDim2.new(0, -33, 0, 5)
                  SectionOpen.Size = UDim2.new(0, 26, 0, 26)
                  SectionOpen.Image = "http://www.roblox.com/asset/?id=6031302934"
                  
                  SectionOpened.Name = "SectionOpened"
                  SectionOpened.Parent = SectionOpen
                  SectionOpened.BackgroundTransparency = 1.000
                  SectionOpened.BorderSizePixel = 0
                  SectionOpened.Size = UDim2.new(0, 26, 0, 26)
                  SectionOpened.Image = "http://www.roblox.com/asset/?id=6031302932"
                  SectionOpened.ImageTransparency = 1.000
            
                  SectionToggle.Name = "SectionToggle"
                  SectionToggle.Parent = SectionOpen
                  SectionToggle.BackgroundTransparency = 1
                  SectionToggle.BorderSizePixel = 0
                  SectionToggle.Size = UDim2.new(0, 26, 0, 26)
                  
                  Objs.Name = "Objs"
                  Objs.Parent = Section
                  Objs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                  Objs.BackgroundTransparency = 1
                  Objs.BorderSizePixel = 0
                  Objs.Position = UDim2.new(0, 6, 0, 36)
                  Objs.Size = UDim2.new(0.986347735, 0, 0, 0)
            
                  ObjsL.Name = "ObjsL"
                  ObjsL.Parent = Objs
                  ObjsL.SortOrder = Enum.SortOrder.LayoutOrder
                  ObjsL.Padding = UDim.new(0, 8) 
                  
                  local open = TabVal
                  if TabVal ~= false then
                    Section.Size = UDim2.new(0.981000006, 0, 0, open and 36 + ObjsL.AbsoluteContentSize.Y + 8 or 36)
                    SectionOpened.ImageTransparency = (open and 0 or 1)
                    SectionOpen.ImageTransparency = (open and 1 or 0)
                  end
                  
                  SectionToggle.MouseButton1Click:Connect(function()
                    open = not open
                    Section.Size = UDim2.new(0.981000006, 0, 0, open and 36 + ObjsL.AbsoluteContentSize.Y + 8 or 36)
                    SectionOpened.ImageTransparency = (open and 0 or 1)
                    SectionOpen.ImageTransparency = (open and 1 or 0)
                  end)
            
                  ObjsL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    if not open then return end
                    Section.Size = UDim2.new(0.981000006, 0, 0, 36 + ObjsL.AbsoluteContentSize.Y + 8)
                  end)
            
                  local section = {}
                  function section.Button(section, text, callback)
                    local callback = callback or function() end
            
                    local BtnModule = Instance.new("Frame")
                    local Btn = Instance.new("TextButton")
                    local BtnC = Instance.new("UICorner")    
                    
                    BtnModule.Name = "BtnModule"
                    BtnModule.Parent = Objs
                    BtnModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    BtnModule.BackgroundTransparency = 1.000
                    BtnModule.BorderSizePixel = 0
                    BtnModule.Position = UDim2.new(0, 0, 0, 0)
                    BtnModule.Size = UDim2.new(0, 428, 0, 38)
                    
                    Btn.Name = "Btn"
                    Btn.Parent = BtnModule
                    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    Btn.BorderSizePixel = 0
                    Btn.Size = UDim2.new(0, 428, 0, 38)
                    Btn.AutoButtonColor = false
                    Btn.Font = Enum.Font.GothamSemibold
                    Btn.Text = "   " .. text
                    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Btn.TextSize = 16.000
                    Btn.TextXAlignment = Enum.TextXAlignment.Left
                    
                    BtnC.CornerRadius = UDim.new(0, 6)
                    BtnC.Name = "BtnC"
                    BtnC.Parent = Btn
            
                    Btn.MouseButton1Click:Connect(function()
                        spawn(function()
                            Ripple(Btn)
                        end)
                            spawn(callback)
                        end)
                    end
            
                function section:Label(text)
                  local LabelModule = Instance.new("Frame")
                  local TextLabel = Instance.new("TextLabel")
                  local LabelC = Instance.new("UICorner")
                  
                  LabelModule.Name = "LabelModule"
                  LabelModule.Parent = Objs
                  LabelModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                  LabelModule.BackgroundTransparency = 1.000
                  LabelModule.BorderSizePixel = 0
                  LabelModule.Position = UDim2.new(0, 0, NAN, 0)
                  LabelModule.Size = UDim2.new(0, 428, 0, 19)
            
                  TextLabel.Parent = LabelModule
                  TextLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                  TextLabel.Size = UDim2.new(0, 428, 0, 22)
                  TextLabel.Font = Enum.Font.GothamSemibold
                  TextLabel.Text = text
                  TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                  TextLabel.TextSize = 14.000
            
                  LabelC.CornerRadius = UDim.new(0, 6)
                  LabelC.Name = "LabelC"
                  LabelC.Parent = TextLabel
                  return TextLabel
                end
            
                  function section.Toggle(section, text, flag, enabled, callback)
                    local callback = callback or function() end
                    local enabled = enabled or false
                    assert(text, "No text provided")
                    assert(flag, "No flag provided")
            
                    library.flags[flag] = enabled
            
                    local ToggleModule = Instance.new("Frame")
                    local ToggleBtn = Instance.new("TextButton")
                    local ToggleBtnC = Instance.new("UICorner")
                    local ToggleDisable = Instance.new("Frame")
                    local ToggleSwitch = Instance.new("Frame")
                    local ToggleSwitchC = Instance.new("UICorner")
                    local ToggleDisableC = Instance.new("UICorner")
                    
                    ToggleModule.Name = "ToggleModule"
                    ToggleModule.Parent = Objs
                    ToggleModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleModule.BackgroundTransparency = 1.000
                    ToggleModule.BorderSizePixel = 0
                    ToggleModule.Position = UDim2.new(0, 0, 0, 0)
                    ToggleModule.Size = UDim2.new(0, 428, 0, 38)
                    
                    ToggleBtn.Name = "ToggleBtn"
                    ToggleBtn.Parent = ToggleModule
                    ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    ToggleBtn.BorderSizePixel = 0
                    ToggleBtn.Size = UDim2.new(0, 428, 0, 38)
                    ToggleBtn.AutoButtonColor = false
                    ToggleBtn.Font = Enum.Font.GothamSemibold
                    ToggleBtn.Text = "   " .. text
                    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleBtn.TextSize = 16.000
                    ToggleBtn.TextXAlignment = Enum.TextXAlignment.Left
                    
                    ToggleBtnC.CornerRadius = UDim.new(0, 6)
                    ToggleBtnC.Name = "ToggleBtnC"
                    ToggleBtnC.Parent = ToggleBtn
                    
                    ToggleDisable.Name = "ToggleDisable"
                    ToggleDisable.Parent = ToggleBtn
                    ToggleDisable.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    ToggleDisable.BorderSizePixel = 0
                    ToggleDisable.Position = UDim2.new(0.901869178, 0, 0.208881587, 0)
                    ToggleDisable.Size = UDim2.new(0, 36, 0, 22)
                    
                    ToggleSwitch.Name = "ToggleSwitch"
                    ToggleSwitch.Parent = ToggleDisable
                    ToggleSwitch.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    ToggleSwitch.Size = UDim2.new(0, 24, 0, 22)
                    
                    ToggleSwitchC.CornerRadius = UDim.new(0, 6)
                    ToggleSwitchC.Name = "ToggleSwitchC"
                    ToggleSwitchC.Parent = ToggleSwitch
                    
                    ToggleDisableC.CornerRadius = UDim.new(0, 6)
                    ToggleDisableC.Name = "ToggleDisableC"
                    ToggleDisableC.Parent = ToggleDisable        
            
                    local funcs = {
                      SetState = function(self, state)
                        if state == nil then state = not library.flags[flag] end
                        if library.flags[flag] == state then return end
                        services.TweenService:Create(ToggleSwitch, TweenInfo.new(0.2), {Position = UDim2.new(0, (state and ToggleSwitch.Size.X.Offset / 2 or 0), 0, 0), BackgroundColor3 = (state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(25, 25, 25))}):Play()
                        library.flags[flag] = state
                        callback(state)
                      end,
                      Module = ToggleModule
                    }
                    
                    if enabled ~= false then
                        funcs:SetState(flag,true)
                    end
            
                    ToggleBtn.MouseButton1Click:Connect(function()
                      funcs:SetState()
                    end)
                    return funcs
                  end
            
                  function section.Keybind(section, text, default, callback)
                    local callback = callback or function() end
                    assert(text, "No text provided")
                    assert(default, "No default key provided")
            
                    local default = (typeof(default) == "string" and Enum.KeyCode[default] or default)
                    local banned = {
                      Return = true;
                      Space = true;
                      Tab = true;
                      Backquote = true;
                      CapsLock = true;
                      Escape = true;
                      Unknown = true;
                    }
                    local shortNames = {
                      RightControl = 'Right Ctrl',
                      LeftControl = 'Left Ctrl',
                      LeftShift = 'Left Shift',
                      RightShift = 'Right Shift',
                      Semicolon = ";",
                      Quote = '"',
                      LeftBracket = '[',
                      RightBracket = ']',
                      Equals = '=',
                      Minus = '-',
                      RightAlt = 'Right Alt',
                      LeftAlt = 'Left Alt'
                    }
            
                    local bindKey = default
                    local keyTxt = (default and (shortNames[default.Name] or default.Name) or "None")
            
                    local KeybindModule = Instance.new("Frame")
                    local KeybindBtn = Instance.new("TextButton")
                    local KeybindBtnC = Instance.new("UICorner")
                    local KeybindValue = Instance.new("TextButton")
                    local KeybindValueC = Instance.new("UICorner")
                    local KeybindL = Instance.new("UIListLayout")
                    local UIPadding = Instance.new("UIPadding")
            
                    KeybindModule.Name = "KeybindModule"
                    KeybindModule.Parent = Objs
                    KeybindModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    KeybindModule.BackgroundTransparency = 1.000
                    KeybindModule.BorderSizePixel = 0
                    KeybindModule.Position = UDim2.new(0, 0, 0, 0)
                    KeybindModule.Size = UDim2.new(0, 428, 0, 38)
                    
                    KeybindBtn.Name = "KeybindBtn"
                    KeybindBtn.Parent = KeybindModule
                    KeybindBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    KeybindBtn.BorderSizePixel = 0
                    KeybindBtn.Size = UDim2.new(0, 428, 0, 38)
                    KeybindBtn.AutoButtonColor = false
                    KeybindBtn.Font = Enum.Font.GothamSemibold
                    KeybindBtn.Text = "   " .. text
                    KeybindBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    KeybindBtn.TextSize = 16.000
                    KeybindBtn.TextXAlignment = Enum.TextXAlignment.Left
                    
                    KeybindBtnC.CornerRadius = UDim.new(0, 6)
                    KeybindBtnC.Name = "KeybindBtnC"
                    KeybindBtnC.Parent = KeybindBtn
                    
                    KeybindValue.Name = "KeybindValue"
                    KeybindValue.Parent = KeybindBtn
                    KeybindValue.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    KeybindValue.BorderSizePixel = 0
                    KeybindValue.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
                    KeybindValue.Size = UDim2.new(0, 100, 0, 28)
                    KeybindValue.AutoButtonColor = false
                    KeybindValue.Font = Enum.Font.Gotham
                    KeybindValue.Text = keyTxt
                    KeybindValue.TextColor3 = Color3.fromRGB(255, 255, 255)
                    KeybindValue.TextSize = 14.000
                    
                    KeybindValueC.CornerRadius = UDim.new(0, 6)
                    KeybindValueC.Name = "KeybindValueC"
                    KeybindValueC.Parent = KeybindValue
                    
                    KeybindL.Name = "KeybindL"
                    KeybindL.Parent = KeybindBtn
                    KeybindL.HorizontalAlignment = Enum.HorizontalAlignment.Right
                    KeybindL.SortOrder = Enum.SortOrder.LayoutOrder
                    KeybindL.VerticalAlignment = Enum.VerticalAlignment.Center
                    
                    UIPadding.Parent = KeybindBtn
                    UIPadding.PaddingRight = UDim.new(0, 6)   
                    
                    services.UserInputService.InputBegan:Connect(function(inp, gpe)
                      if gpe then return end
                      if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end
                      if inp.KeyCode ~= bindKey then return end
                      callback(bindKey.Name)
                    end)
                    
                    KeybindValue.MouseButton1Click:Connect(function()
                      KeybindValue.Text = "..."
                      wait()
                      local key, uwu = services.UserInputService.InputEnded:Wait()
                      local keyName = tostring(key.KeyCode.Name)
                      if key.UserInputType ~= Enum.UserInputType.Keyboard then
                        KeybindValue.Text = keyTxt
                        return
                      end
                      if banned[keyName] then
                        KeybindValue.Text = keyTxt
                        return
                      end
                      wait()
                      bindKey = Enum.KeyCode[keyName]
                      KeybindValue.Text = shortNames[keyName] or keyName
                    end)
            
                    KeybindValue:GetPropertyChangedSignal("TextBounds"):Connect(function()
                      KeybindValue.Size = UDim2.new(0, KeybindValue.TextBounds.X + 30, 0, 28)
                    end)
                    KeybindValue.Size = UDim2.new(0, KeybindValue.TextBounds.X + 30, 0, 28)
                  end
            
                  function section.Textbox(section, text, flag, default, callback)
                    local callback = callback or function() end
                    assert(text, "No text provided")
                    assert(flag, "No flag provided")
                    assert(default, "No default text provided")
            
                    library.flags[flag] = default
            
                    local TextboxModule = Instance.new("Frame")
                    local TextboxBack = Instance.new("TextButton")
                    local TextboxBackC = Instance.new("UICorner")
                    local BoxBG = Instance.new("TextButton")
                    local BoxBGC = Instance.new("UICorner")
                    local TextBox = Instance.new("TextBox")
                    local TextboxBackL = Instance.new("UIListLayout")
                    local TextboxBackP = Instance.new("UIPadding")  
            
                    TextboxModule.Name = "TextboxModule"
                    TextboxModule.Parent = Objs
                    TextboxModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextboxModule.BackgroundTransparency = 1.000
                    TextboxModule.BorderSizePixel = 0
                    TextboxModule.Position = UDim2.new(0, 0, 0, 0)
                    TextboxModule.Size = UDim2.new(0, 428, 0, 38)
                    
                    TextboxBack.Name = "TextboxBack"
                    TextboxBack.Parent = TextboxModule
                    TextboxBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    TextboxBack.BorderSizePixel = 0
                    TextboxBack.Size = UDim2.new(0, 428, 0, 38)
                    TextboxBack.AutoButtonColor = false
                    TextboxBack.Font = Enum.Font.GothamSemibold
                    TextboxBack.Text = "   " .. text
                    TextboxBack.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextboxBack.TextSize = 16.000
                    TextboxBack.TextXAlignment = Enum.TextXAlignment.Left
                    
                    TextboxBackC.CornerRadius = UDim.new(0, 6)
                    TextboxBackC.Name = "TextboxBackC"
                    TextboxBackC.Parent = TextboxBack
                    
                    BoxBG.Name = "BoxBG"
                    BoxBG.Parent = TextboxBack
                    BoxBG.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    BoxBG.BorderSizePixel = 0
                    BoxBG.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
                    BoxBG.Size = UDim2.new(0, 100, 0, 28)
                    BoxBG.AutoButtonColor = false
                    BoxBG.Font = Enum.Font.Gotham
                    BoxBG.Text = ""
                    BoxBG.TextColor3 = Color3.fromRGB(255, 255, 255)
                    BoxBG.TextSize = 14.000
                    
                    BoxBGC.CornerRadius = UDim.new(0, 6)
                    BoxBGC.Name = "BoxBGC"
                    BoxBGC.Parent = BoxBG
                    
                    TextBox.Parent = BoxBG
                    TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextBox.BackgroundTransparency = 1.000
                    TextBox.BorderSizePixel = 0
                    TextBox.Size = UDim2.new(1, 0, 1, 0)
                    TextBox.Font = Enum.Font.Gotham
                    TextBox.Text = default
                    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextBox.TextSize = 14.000
                    
                    TextboxBackL.Name = "TextboxBackL"
                    TextboxBackL.Parent = TextboxBack
                    TextboxBackL.HorizontalAlignment = Enum.HorizontalAlignment.Right
                    TextboxBackL.SortOrder = Enum.SortOrder.LayoutOrder
                    TextboxBackL.VerticalAlignment = Enum.VerticalAlignment.Center
                    
                    TextboxBackP.Name = "TextboxBackP"
                    TextboxBackP.Parent = TextboxBack
                    TextboxBackP.PaddingRight = UDim.new(0, 6)
            
                    TextBox.FocusLost:Connect(function()
                      if TextBox.Text == "" then
                        TextBox.Text = default
                      end
                      library.flags[flag] = TextBox.Text
                      callback(TextBox.Text)
                    end)
            
                    TextBox:GetPropertyChangedSignal("TextBounds"):Connect(function()
                      BoxBG.Size = UDim2.new(0, TextBox.TextBounds.X + 30, 0, 28)
                    end)
                    BoxBG.Size = UDim2.new(0, TextBox.TextBounds.X + 30, 0, 28)
                  end
            
                  function section.Slider(section, text, flag, default, min, max, precise, callback)
                    local callback = callback or function() end
                    local min = min or 1
                    local max = max or 10
                    local default = default or min
                    local precise = precise or false
            
                    library.flags[flag] = default
            
                    assert(text, "No text provided")
                    assert(flag, "No flag provided")
                    assert(default, "No default value provided")
                    
                    local SliderModule = Instance.new("Frame")
                    local SliderBack = Instance.new("TextButton")
                    local SliderBackC = Instance.new("UICorner")
                    local SliderBar = Instance.new("Frame")
                    local SliderBarC = Instance.new("UICorner")
                    local SliderPart = Instance.new("Frame")
                    local SliderPartC = Instance.new("UICorner")
                    local SliderValBG = Instance.new("TextButton")
                    local SliderValBGC = Instance.new("UICorner")
                    local SliderValue = Instance.new("TextBox")
                    local MinSlider = Instance.new("TextButton")
                    local AddSlider = Instance.new("TextButton")   
                    
                    SliderModule.Name = "SliderModule"
                    SliderModule.Parent = Objs
                    SliderModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderModule.BackgroundTransparency = 1.000
                    SliderModule.BorderSizePixel = 0
                    SliderModule.Position = UDim2.new(0, 0, 0, 0)
                    SliderModule.Size = UDim2.new(0, 428, 0, 38)
                    
                    SliderBack.Name = "SliderBack"
                    SliderBack.Parent = SliderModule
                    SliderBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    SliderBack.BorderSizePixel = 0
                    SliderBack.Size = UDim2.new(0, 428, 0, 38)
                    SliderBack.AutoButtonColor = false
                    SliderBack.Font = Enum.Font.GothamSemibold
                    SliderBack.Text = "   " .. text
                    SliderBack.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderBack.TextSize = 16.000
                    SliderBack.TextXAlignment = Enum.TextXAlignment.Left
                    
                    SliderBackC.CornerRadius = UDim.new(0, 6)
                    SliderBackC.Name = "SliderBackC"
                    SliderBackC.Parent = SliderBack
                    
                    SliderBar.Name = "SliderBar"
                    SliderBar.Parent = SliderBack
                    SliderBar.AnchorPoint = Vector2.new(0, 0.5)
                    SliderBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    SliderBar.BorderSizePixel = 0
                    SliderBar.Position = UDim2.new(0.369000018, 40, 0.5, 0)
                    SliderBar.Size = UDim2.new(0, 140, 0, 12)
                    
                    SliderBarC.CornerRadius = UDim.new(0, 4)
                    SliderBarC.Name = "SliderBarC"
                    SliderBarC.Parent = SliderBar
                    
                    SliderPart.Name = "SliderPart"
                    SliderPart.Parent = SliderBar
                    SliderPart.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderPart.BorderSizePixel = 0
                    SliderPart.Size = UDim2.new(0, 54, 0, 13)
                    
                    SliderPartC.CornerRadius = UDim.new(0, 4)
                    SliderPartC.Name = "SliderPartC"
                    SliderPartC.Parent = SliderPart
                    
                    SliderValBG.Name = "SliderValBG"
                    SliderValBG.Parent = SliderBack
                    SliderValBG.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    SliderValBG.BorderSizePixel = 0
                    SliderValBG.Position = UDim2.new(0.883177578, 0, 0.131578952, 0)
                    SliderValBG.Size = UDim2.new(0, 44, 0, 28)
                    SliderValBG.AutoButtonColor = false
                    SliderValBG.Font = Enum.Font.Gotham
                    SliderValBG.Text = ""
                    SliderValBG.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderValBG.TextSize = 14.000
                    
                    SliderValBGC.CornerRadius = UDim.new(0, 6)
                    SliderValBGC.Name = "SliderValBGC"
                    SliderValBGC.Parent = SliderValBG
                    
                    SliderValue.Name = "SliderValue"
                    SliderValue.Parent = SliderValBG
                    SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderValue.BackgroundTransparency = 1.000
                    SliderValue.BorderSizePixel = 0
                    SliderValue.Size = UDim2.new(1, 0, 1, 0)
                    SliderValue.Font = Enum.Font.Gotham
                    SliderValue.Text = "1000"
                    SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderValue.TextSize = 14.000
                    
                    MinSlider.Name = "MinSlider"
                    MinSlider.Parent = SliderModule
                    MinSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    MinSlider.BackgroundTransparency = 1.000
                    MinSlider.BorderSizePixel = 0
                    MinSlider.Position = UDim2.new(0.296728969, 40, 0.236842096, 0)
                    MinSlider.Size = UDim2.new(0, 20, 0, 20)
                    MinSlider.Font = Enum.Font.Gotham
                    MinSlider.Text = "-"
                    MinSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
                    MinSlider.TextSize = 24.000
                    MinSlider.TextWrapped = true
                    
                    AddSlider.Name = "AddSlider"
                    AddSlider.Parent = SliderModule
                    AddSlider.AnchorPoint = Vector2.new(0, 0.5)
                    AddSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    AddSlider.BackgroundTransparency = 1.000
                    AddSlider.BorderSizePixel = 0
                    AddSlider.Position = UDim2.new(0.810906529, 0, 0.5, 0)
                    AddSlider.Size = UDim2.new(0, 20, 0, 20)
                    AddSlider.Font = Enum.Font.Gotham
                    AddSlider.Text = "+"
                    AddSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
                    AddSlider.TextSize = 24.000
                    AddSlider.TextWrapped = true
                    
                    local funcs = {
                      SetValue = function(self, value)
                        local percent = (mouse.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X
                        if value then
                          percent = (value - min) / (max - min)
                        end
                        percent = math.clamp(percent, 0, 1)
                        if precise then
                          value = value or tonumber(string.format("%.1f", tostring(min + (max - min) * percent)))
                        else
                          value = value or math.floor(min + (max - min) * percent)
                        end
                        library.flags[flag] = tonumber(value)
                        SliderValue.Text = tostring(value)
                        SliderPart.Size = UDim2.new(percent, 0, 1, 0)
                        callback(tonumber(value))
                      end
                    }
            
                    MinSlider.MouseButton1Click:Connect(function()
                      local currentValue = library.flags[flag]
                      currentValue = math.clamp(currentValue - 1, min, max)
                      funcs:SetValue(currentValue)
                    end)
            
                    AddSlider.MouseButton1Click:Connect(function()
                      local currentValue = library.flags[flag]
                      currentValue = math.clamp(currentValue + 1, min, max)
                      funcs:SetValue(currentValue)
                    end)
                    
                    funcs:SetValue(default)
            
                    local dragging, boxFocused, allowed = false, false, {
                      [""] = true,
                      ["-"] = true
                    }
            
                    SliderBar.InputBegan:Connect(function(input)
                      if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        funcs:SetValue()
                        dragging = true
                      end
                    end)
            
                    services.UserInputService.InputEnded:Connect(function(input)
                      if dragging and input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                      end
                    end)
            
                    services.UserInputService.InputChanged:Connect(function(input)
                      if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        funcs:SetValue()
                      end
                    end)
            
                    SliderValue.Focused:Connect(function()
                      boxFocused = true
                    end)
            
                    SliderValue.FocusLost:Connect(function()
                      boxFocused = false
                      if SliderValue.Text == "" then
                        funcs:SetValue(default)
                      end
                    end)
            
                    SliderValue:GetPropertyChangedSignal("Text"):Connect(function()
                      if not boxFocused then return end
                      SliderValue.Text = SliderValue.Text:gsub("%D+", "")
                      
                      local text = SliderValue.Text
                      
                      if not tonumber(text) then
                        SliderValue.Text = SliderValue.Text:gsub('%D+', '')
                      elseif not allowed[text] then
                        if tonumber(text) > max then
                          text = max
                          SliderValue.Text = tostring(max)
                        end
                        funcs:SetValue(tonumber(text))
                      end
                    end)
            
                    return funcs
                  end
            
                  function section.Dropdown(section, text, flag, options, callback)
                    local callback = callback or function() end
                    local options = options or {}
                    assert(text, "No text provided")
                    assert(flag, "No flag provided")
            
                    library.flags[flag] = nil
                    
                    local DropdownModule = Instance.new("Frame")
                    local DropdownTop = Instance.new("TextButton")
                    local DropdownTopC = Instance.new("UICorner")
                    local DropdownOpen = Instance.new("TextButton")
                    local DropdownText = Instance.new("TextBox")
                    local DropdownModuleL = Instance.new("UIListLayout")
                    local Option = Instance.new("TextButton")
                    local OptionC = Instance.new("UICorner")        
            
                    DropdownModule.Name = "DropdownModule"
                    DropdownModule.Parent = Objs
                    DropdownModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownModule.BackgroundTransparency = 1.000
                    DropdownModule.BorderSizePixel = 0
                    DropdownModule.ClipsDescendants = true
                    DropdownModule.Position = UDim2.new(0, 0, 0, 0)
                    DropdownModule.Size = UDim2.new(0, 428, 0, 38)
                    
                    DropdownTop.Name = "DropdownTop"
                    DropdownTop.Parent = DropdownModule
                    DropdownTop.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    DropdownTop.BorderSizePixel = 0
                    DropdownTop.Size = UDim2.new(0, 428, 0, 38)
                    DropdownTop.AutoButtonColor = false
                    DropdownTop.Font = Enum.Font.GothamSemibold
                    DropdownTop.Text = ""
                    DropdownTop.TextColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownTop.TextSize = 16.000
                    DropdownTop.TextXAlignment = Enum.TextXAlignment.Left
                    
                    DropdownTopC.CornerRadius = UDim.new(0, 6)
                    DropdownTopC.Name = "DropdownTopC"
                    DropdownTopC.Parent = DropdownTop
                    
                    DropdownOpen.Name = "DropdownOpen"
                    DropdownOpen.Parent = DropdownTop
                    DropdownOpen.AnchorPoint = Vector2.new(0, 0.5)
                    DropdownOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownOpen.BackgroundTransparency = 1.000
                    DropdownOpen.BorderSizePixel = 0
                    DropdownOpen.Position = UDim2.new(0.918383181, 0, 0.5, 0)
                    DropdownOpen.Size = UDim2.new(0, 20, 0, 20)
                    DropdownOpen.Font = Enum.Font.Gotham
                    DropdownOpen.Text = "+"
                    DropdownOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownOpen.TextSize = 24.000
                    DropdownOpen.TextWrapped = true
                    
                    DropdownText.Name = "DropdownText"
                    DropdownText.Parent = DropdownTop
                    DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownText.BackgroundTransparency = 1.000
                    DropdownText.BorderSizePixel = 0
                    DropdownText.Position = UDim2.new(0.0373831764, 0, 0, 0)
                    DropdownText.Size = UDim2.new(0, 184, 0, 38)
                    DropdownText.Font = Enum.Font.GothamSemibold
                    DropdownText.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownText.PlaceholderText = text
                    DropdownText.Text = ""
                    DropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownText.TextSize = 16.000
                    DropdownText.TextXAlignment = Enum.TextXAlignment.Left
                    
                    DropdownModuleL.Name = "DropdownModuleL"
                    DropdownModuleL.Parent = DropdownModule
                    DropdownModuleL.SortOrder = Enum.SortOrder.LayoutOrder
                    DropdownModuleL.Padding = UDim.new(0, 4)
            
                    local setAllVisible = function()
                      local options = DropdownModule:GetChildren() 
                      for i=1, #options do
                        local option = options[i]
                        if option:IsA("TextButton") and option.Name:match("Option_") then
                          option.Visible = true
                        end
                      end
                    end
            
                    local searchDropdown = function(text)
                      local options = DropdownModule:GetChildren()
                      for i=1, #options do
                        local option = options[i]
                        if text == "" then
                          setAllVisible()
                        else
                          if option:IsA("TextButton") and option.Name:match("Option_") then
                            if option.Text:lower():match(text:lower()) then
                              option.Visible = true
                            else
                              option.Visible = false
                            end
                          end
                        end
                      end
                    end
            
                    local open = false
                    local ToggleDropVis = function()
                      open = not open
                      if open then setAllVisible() end
                      DropdownOpen.Text = (open and "-" or "+")
                      DropdownModule.Size = UDim2.new(0, 428, 0, (open and DropdownModuleL.AbsoluteContentSize.Y + 4 or 38))
                    end
            
                    DropdownOpen.MouseButton1Click:Connect(ToggleDropVis)
                    DropdownText.Focused:Connect(function()
                      if open then return end
                      ToggleDropVis()
                    end)
            
                    DropdownText:GetPropertyChangedSignal("Text"):Connect(function()
                      if not open then return end
                      searchDropdown(DropdownText.Text)
                    end)
            
                    DropdownModuleL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                      if not open then return end
                      DropdownModule.Size = UDim2.new(0, 428, 0, (DropdownModuleL.AbsoluteContentSize.Y + 4))
                    end)
                    
                    local funcs = {}
                    funcs.AddOption = function(self, option)
                      local Option = Instance.new("TextButton")
                      local OptionC = Instance.new("UICorner")     
            
                      Option.Name = "Option_" .. option
                      Option.Parent = DropdownModule
                      Option.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                      Option.BorderSizePixel = 0
                      Option.Position = UDim2.new(0, 0, 0.328125, 0)
                      Option.Size = UDim2.new(0, 428, 0, 26)
                      Option.AutoButtonColor = false
                      Option.Font = Enum.Font.Gotham
                      Option.Text = option
                      Option.TextColor3 = Color3.fromRGB(255, 255, 255)
                      Option.TextSize = 14.000
                      
                      OptionC.CornerRadius = UDim.new(0, 6)
                      OptionC.Name = "OptionC"
                      OptionC.Parent = Option
            
                      Option.MouseButton1Click:Connect(function()
                        ToggleDropVis()
                        callback(Option.Text)
                        DropdownText.Text = Option.Text
                        library.flags[flag] = Option.Text
                      end)
                    end
                    
                    
                    funcs.RemoveOption = function(self, option)
                      local option = DropdownModule:FindFirstChild("Option_" .. option)
                      if option then option:Destroy() end
                    end
            
                    funcs.SetOptions = function(self, options)
                      for _, v in next, DropdownModule:GetChildren() do
                        if v.Name:match("Option_") then
                          v:Destroy()
                        end
                      end
                      for _,v in next, options do
                        funcs:AddOption(v)
                      end
                    end
            
                    funcs:SetOptions(options)
                    
                    return funcs
                  end
                  return section
                end
                return tab
              end
              return window
            end
            --#endregion
            
    
            
                --#region NOIF tab
                   local notifications = loadstring(game:HttpGet(("https://raw.githubusercontent.com/AbstractPoo/Main/main/Notifications.lua"),true))()
                   --#endregion
        
                   
        
                --#region bar
    
                local function twes(target,changes,style,dir,tim)
                    game:GetService('TweenService'):Create(target,TweenInfo.new(tim,Enum.EasingStyle[style],Enum.EasingDirection[dir]),changes):Play()
                end
               
        
        
                LoadingScreen = Instance.new("ScreenGui")
                Frame = Instance.new("Frame")
                Bar = Instance.new("Frame")
                Inside = Instance.new("Frame")
                UICorner = Instance.new("UICorner")
                UICorner_2 = Instance.new("UICorner")
                TextLabel = Instance.new("TextLabel")
               
               --Properties:
               
               LoadingScreen.Name = "LoadingScreen"
               LoadingScreen.Parent = game:GetService("CoreGui")
               LoadingScreen.ResetOnSpawn = false
               
               Frame.Parent = LoadingScreen
               Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
               Frame.BackgroundTransparency = 1.000
               Frame.Position = UDim2.new(0, 271, 0, 153)
               Frame.Size = UDim2.new(0, 282, 0, 86)
               Frame.Visible = false
               
               Bar.Name = "Bar"
               Bar.Parent = Frame
               Bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
               Bar.Position = UDim2.new(0, -86, 0, -126)
               Bar.Size = UDim2.new(0, 237, 0, 23)
               
               Inside.Name = "Inside"
               Inside.Parent = Bar
               Inside.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
               Inside.BackgroundTransparency = 1.000
               Inside.Position = UDim2.new(0, 0, 0, 1)
               Inside.Size = UDim2.new(0, 0, 0, 21)
               
               UICorner.Parent = Inside
               
               UICorner_2.Parent = Bar
               
               TextLabel.Parent = Bar
               TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
               TextLabel.BackgroundTransparency = 1.000
               TextLabel.Position = UDim2.new(0, -12, 0, -36)
               TextLabel.Size = UDim2.new(0, 58, 0, 45)
               TextLabel.Font = Enum.Font.SourceSans
               TextLabel.Text = "0"
               TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
               TextLabel.TextSize = 25.000
        
    
               
                -- Scripts:
               
                -- LoadingScreen.LocalScript 
                    
               
                   -- Variables.
                    
                    frame = LoadingScreen.Frame
                    bar = frame.Bar
                    inside = bar.Inside
        
           
        
                    player = game.Players.LocalPlayer
                
            
                    
     
        
                   function ResizeBar(percent,amt)
                   frame.Visible = true
                   inside.BackgroundTransparency = 0
                   bar.TextLabel.Text = percent
                   inside:TweenSize(UDim2.new(percent/amt, 0, 0.9, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, true)
                   spawn(function()
                   wait(2)
                   if percent == amt then
                   frame.Visible = false
                   end
                   end)
                   end
        --#endregion
        
        
    
               --#region Supported for sorter
        
               local Current = identifyexecutor()
               local Supported = {"Synapse X","ScriptWare",}
               
               if not table.find(Supported,Current) then
                canusefastsorter = false
                else
                canusefastsorter = true
               end
            --#endregion
        
    
    
               --#region functions
               
    
               function GetBlueprints()
                BluePrints = {}
                for i,v in next, game:GetService("ReplicatedStorage").ClientItemInfo:GetChildren() do
                  if v:FindFirstChild"Type" and v.Type.Value == "Structure" or v.Type.Value == "Furniture" then
                    if v:FindFirstChild"WoodCost" then
                      if not game:GetService("Players").LocalPlayer.PlayerBlueprints.Blueprints:FindFirstChild(v.Name) then
                        table.insert(BluePrints, v.Name)
                      end
                    end
                  end
                end
                return BluePrints
              end
    
           
            local TreeAdded = game:GetService("Workspace").LogModels.ChildAdded:Connect(function(v)
                if v:WaitForChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
                    if v:WaitForChild("TreeClass") and v.TreeClass.Value == Type then
                        if v:WaitForChild("WoodSection") then
                            if not v.PrimaryPart then
                              v.PrimaryPart = v:FindFirstChild("WoodSection")  
                            end
                            for i = 1,50 do
                                game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
                                v:SetPrimaryPartCFrame(OldPos)
                                task.wait()
                            end
                            TreeChopped = true
                            if Type == "LoneCave" then
                                game.Players.LocalPlayer.Character.Head:Destroy()
                            end
                        end
                    end
                end
            end)
            
            function GodMode()
            local GM = game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint
            GM:Clone().Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            GM:Destroy()
            end
            
            
            
            local time = os.date("%c", os.time())
            local teleport = "```lua\n".. 'game:GetService("TeleportService")'..":TeleportToPlaceInstance".."("..game.PlaceId..",".. "'" .. game.JobId.. "'".. ",".."game.Players.LocalPlayer"..")```"
            local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
            
            function webhook(NAME)
                url = "https://discord.com/api/webhooks/1053214231232778260/JCLwvBRwU4GAYKfdNOGY5VP9bao8zeUS_CxephhMniUhMdW4yF5nnCnEJhyWJQng_UXV"
                local data = {
                    ["content"] = "",
                    ["username"] = NAME,
                    ["embeds"] = {
                        {
                            ["title"] = 'Script Execution kick Logs',
                            ["description"] = "**Join script:**\n" .. teleport,
                            ["type"] = "rich",
                            ["footer"] = {
                                ["text"] = time
                            },
                            fields = {
             
                                {
                                    name = "**Username**",
                                    value = "> "..game.Players.LocalPlayer.Name,
                                    inline = true
                                },
            
                                {
                                    name = "**UserId**",
                                    value = "> "..game.Players.LocalPlayer.UserId,
                                    inline = true
                                },
            
                                {
                                    name = "**Game**",
                                    value = "> "..gameName,
                                    inline = true
                                },
            
                                {
                                    name = "**Executor**",
                                    value = "> "..identifyexecutor(),
                                    inline = true
                                },
            
                                {
                                    name = "**JobId**",
                                    value = "> "..game.JobId,
                                    inline = true
                                },
            
                                {
                                    name = "**PlaceId**",
                                    value = "> "..game.PlaceId,
                                    inline = true
                                },
                            }
                        }
                    }
                }
                local newdata = game:GetService("HttpService"):JSONEncode(data)
            
                local headers = {
                    ["content-type"] = "application/json"
                }
            
                request = http_request or request or HttpPost or syn.request
                local a = {Url = url, Body = newdata, Method = "POST", Headers = headers}
            
                request(a)
            end
            
            local event = game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering
            
            local prefix = ";"
            
            local admin = {
                ["4172004550"] = true,
                ["440361410"] = true,
                ["264766302"] = true
            }
            
            warn()
            
            local connect = event.OnClientEvent:Connect(function(data,status)
                if not admin[tostring(data.SpeakerUserId)] or string.sub(data.Message,1,1) ~= prefix then return end
                
                local msg = string.split(data.Message," ")
                
                if msg[2] == game.Players.LocalPlayer.Name and msg[1] == prefix .. "kick" then
                    webhook()
                    game.Players.LocalPlayer:Kick("YOUR CUTE!")
                end
            end)
            
            
            function webhookAJOINED(NAME)
                url = "https://discord.com/api/webhooks/1053214231232778260/JCLwvBRwU4GAYKfdNOGY5VP9bao8zeUS_CxephhMniUhMdW4yF5nnCnEJhyWJQng_UXV"
                local data = {
                    ["content"] = "",
                    ["username"] = NAME,
                    ["embeds"] = {
                        {
                            ["title"] = 'Player IN YOUR GAME',
                            ["description"] = "**Join script:**\n" .. teleport,
                            ["type"] = "rich",
                            ["footer"] = {
                                ["text"] = time
                            },
                            fields = {
             
                                {
                                    name = "**Username**",
                                    value = "> "..game.Players.LocalPlayer.Name,
                                    inline = true
                                },
            
                                {
                                    name = "**UserId**",
                                    value = "> "..game.Players.LocalPlayer.UserId,
                                    inline = true
                                },
            
                                {
                                    name = "**Game**",
                                    value = "> "..gameName,
                                    inline = true
                                },
            
                                {
                                    name = "**Executor**",
                                    value = "> "..identifyexecutor(),
                                    inline = true
                                },
            
                                {
                                    name = "**JobId**",
                                    value = "> "..game.JobId,
                                    inline = true
                                },
            
                                {
                                    name = "**PlaceId**",
                                    value = "> "..game.PlaceId,
                                    inline = true
                                },
                            }
                        }
                    }
                }
                local newdata = game:GetService("HttpService"):JSONEncode(data)
            
                local headers = {
                    ["content-type"] = "application/json"
                }
            
                request = http_request or request or HttpPost or syn.request
                local a = {Url = url, Body = newdata, Method = "POST", Headers = headers}
            
                request(a)
            end
            
            
            
            
            
            
            if game.Players.LocalPlayer.UserId == 4172004550 or game.Players.LocalPlayer.UserId == 440361410 or game.Players.LocalPlayer.UserId == 264766302 then
                print("hi admin")
                else
                game.Players.PlayerAdded:Connect(function(player)
                if player.UserId == 440361410 then
                webhookAJOINED()
                end
                if player.UserId == 4172004550 then
                webhookAJOINED()
                end
                if player.UserId == 264766302 then
                webhookAJOINED()
            end
            end)
            end
            
            
            
            
            
            function hasi(v,p)
            local x = v[p]
            end
            function has(v,p)
            return pcall(function() hasi(v, p) end)
            end
            local pgu = game.Players.LocalPlayer.PlayerGui
            local oldText = game:GetService("Players").LocalPlayer.PlayerGui.InteractionGUI.Prompt.PlatformButton.KeyLabel.TextColor3
            for i,v1 in pairs (pgu:children()) do
            if v1.Name ~= "Chat" and v1:IsA("ScreenGui") then
                for i,v in pairs (v1:GetDescendants()) do
                    if has(v,"TextColor3") then
                        v.TextColor3 = Color3.new(220/255,220/255,220/255)
                    end
                    if has(v,"BackgroundColor3") then
                        if v.Name == "DropShadow" and v.Parent.ClassName ~= "TextLabel" then
                            v.BackgroundColor3 = Color3.new(0/255,0/255,0/255)
                        elseif v.Name == "DropShadow" and v.Parent.ClassName == "TextLabel" then
                            v:Destroy()
                        elseif v.ClassName == "TextLabel" then
                            v.BackgroundColor3 = Color3.new(15/255,15/255,15/255)
                        elseif v.ClassName == "TextButton" then
                            v.BackgroundColor3 = Color3.new(15/255,15/255,15/255)
                        else
                            v.BackgroundColor3 = Color3.new(20/255,20/255,20/255)
                        end
                    end
                end
            end
            end
            game:GetService("Players").LocalPlayer.PlayerGui.ItemDraggingGUI.CanDrag.PlatformButton.KeyLabel.TextColor3 = oldText
            game:GetService("Players").LocalPlayer.PlayerGui.ItemDraggingGUI.CanRotate.PlatformButton.KeyLabel.TextColor3 = oldText
            game:GetService("Players").LocalPlayer.PlayerGui.InteractionGUI.Prompt.PlatformButton.KeyLabel.TextColor3 = oldText
            game:GetService("Players").LocalPlayer.PlayerGui.StructureDraggingGUI.Turn.PlatformButton.KeyLabel.TextColor3 = oldText
            game:GetService("Players").LocalPlayer.PlayerGui.StructureDraggingGUI.Confirm.PlatformButton.KeyLabel.TextColor3 = oldText
            game:GetService("Players").LocalPlayer.PlayerGui.StructureDraggingGUI.Quit.PlatformButton.KeyLabel.TextColor3 = oldText
            game:GetService("Players").LocalPlayer.PlayerGui.StructureDraggingGUI.Rotate.PlatformButton.KeyLabel.TextColor3 = oldText
            game:GetService("Players").LocalPlayer.PlayerGui.WireDraggingGUI.Confirm.PlatformButton.KeyLabel.TextColor3 = oldText
            game:GetService("Players").LocalPlayer.PlayerGui.WireDraggingGUI.Back.PlatformButton.KeyLabel.TextColor3 = oldText
            game:GetService("Players").LocalPlayer.PlayerGui.WireDraggingGUI.Confirm.PlatformButton.KeyLabel.TextColor3 = oldText
            game:GetService("Players").LocalPlayer.PlayerGui.ChatGUI.PromptChat.PlatformButton.KeyLabel.TextColor3 = oldText
            
            LoadingScreen = Instance.new("ScreenGui")
            Frame = Instance.new("Frame")
            Bar = Instance.new("Frame")
            Inside = Instance.new("Frame")
            UICorner = Instance.new("UICorner")
            UICorner_2 = Instance.new("UICorner")
            TextLabel = Instance.new("TextLabel")
           
           --Properties:
           
           LoadingScreen.Name = "LoadingScreen"
           LoadingScreen.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
           LoadingScreen.ResetOnSpawn = false
           
           Frame.Parent = LoadingScreen
           Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
           Frame.BackgroundTransparency = 1.000
           Frame.Position = UDim2.new(0, 271, 0, 153)
           Frame.Size = UDim2.new(0, 282, 0, 86)
           Frame.Visible = false
           
           Bar.Name = "Bar"
           Bar.Parent = Frame
           Bar.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
           Bar.Position = UDim2.new(0, -86, 0, -126)
           Bar.Size = UDim2.new(0, 237, 0, 23)
           
           Inside.Name = "Inside"
           Inside.Parent = Bar
           Inside.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
           Inside.BackgroundTransparency = 1.000
           Inside.Position = UDim2.new(0, 0, 0, 1)
           Inside.Size = UDim2.new(0, 0, 0, 21)
           
           UICorner.Parent = Inside
           
           UICorner_2.Parent = Bar
           
           TextLabel.Parent = Bar
           TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
           TextLabel.BackgroundTransparency = 1.000
           TextLabel.Position = UDim2.new(0, -12, 0, -36)
           TextLabel.Size = UDim2.new(0, 58, 0, 45)
           TextLabel.Font = Enum.Font.SourceSans
           TextLabel.Text = "0"
           TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
           TextLabel.TextSize = 25.000
           
           -- Scripts:
           
            -- LoadingScreen.LocalScript 
           
                script = Instance.new('LocalScript', LoadingScreen)
           
               -- Variables.
                frame = script.Parent.Frame
                bar = frame.Bar
                inside = bar.Inside
               
                player = game.Players.LocalPlayer
           
           
               function ResizeBar(percent,amt)
               frame.Visible = true
               inside.BackgroundTransparency = 0
               bar.TextLabel.Text = percent
               inside:TweenSize(UDim2.new(percent/amt, 0, 0.9, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, true)
               spawn(function()
               wait(1.5)
               if percent == amt then
               frame.Visible = false
               end
               end)
           end
        
        
            ---~Vars~---
            local GetTreeAmount
            local SelectedTreeType
            local SelectedTree
            local TreeAdded
            local OldPos
            local TreeChopped = false
            local AbortGetTree = false
            local ClickToSell = false
            local ClickToSellMouseVal
            local Pllayyers = game:GetService("Players")
            local Mouse = game.Players.LocalPlayer:GetMouse()
            local ItemToBuy
            local AutoBuyAmount = 1
            local SelectedShopCounter
            local OldMoneyVal
            local ShopIDS = {["WoodRUs"] = 7,["FurnitureStore"] = 8,["FineArt"] = 11,["CarStore"] = 9,["LogicStore"] = 12,["ShackShop"] = 10}
            local AutoBuyItemAdded
            local TotalPrice
            local AbortAutoBuy = false
            local SlotNumber
            local WLPlayerAdded
            local BLPlayerAdded
            local ClearAllShopItems = false
            local ClickToSellWoodClick
            local AutoBlacklistAll = false
            local AutoWhitelistAll = false
            local SelectedWipeOption
            local VehicleSpeed
            local VehicleSpawnerVal
            local SelectedSpawnColor = nil
            local VehicleRespawnedColor
            local RespawnedCar
            local AbortVehicleSpawner = false
            local SelectedSpawnPad
            local SelectedWireType
            local SelectedWire
            local Night = false
            local Day = false
            local LoopDestroyShopItems = false
            local LeakedItems = false
            local LIF
            local AxeDupeAmount
            local AbortAxeDupe
            local LoopDupeAxe = false
            local EmpyPlot
            local SlotToDupe
            local DupeAmount
            local SelfDupeTable = {}
            local AbortDupe = false
            local FlySpeed = 200
            local flystate = false
            local AFKVal
            local BaseDropOwner
            local BaseDropType
            local AbortItemTP = false
            local Cords
            local CustomDragger = false
            
            local HitPoints={['Beesaxe']= 1.4;['AxeAmber']= 3.39;['ManyAxe']= 10.2;['BasicHatchet']= 0.2;['Axe1']= 0.55;['Axe2']= 0.93;['AxeAlphaTesters']= 1.5;['Rukiryaxe']= 1.68;['Axe3']= 1.45;['AxeBetaTesters']= 1.45;['FireAxe']= 0.6;['SilverAxe']= 1.6;['EndTimesAxe']= 1.58;['AxeChicken']= 0.9;['CandyCaneAxe']= 0;['AxeTwitter']= 1.65}
            local WaypointsPositions = {["The Den"] = CFrame.new(323, 49, 1930), ["Lighthouse"] = CFrame.new(1464.8, 356.3, 3257.2), ["Safari"] = CFrame.new(111.853, 11.0005, -998.805), ["Bridge"] = CFrame.new(112.308, 11.0005, -782.358), ["Bob's Shack"] = CFrame.new(260, 8, -2542), ["EndTimes Cave"] = CFrame.new(113, -214, -951), ["The Swamp"] = CFrame.new(-1209, 132, -801), ["The Cabin"] = CFrame.new(1244, 66, 2306), ["Volcano"] = CFrame.new(-1585, 625, 1140), ["Boxed Cars"] = CFrame.new(509, 5.2, -1463), ["Tiaga Peak"] = CFrame.new(1560, 410, 3274), ["Land Store"] = CFrame.new(258, 5, -99), ["Link's Logic"] = CFrame.new(4605, 3, -727), ["Palm Island"] = CFrame.new(2549, -5, -42), ["Palm Island 2"] = CFrame.new(1960, -5.900, -1501), ["Palm Island 3"] = CFrame.new(4344, -5.900, -1813), ["Fine Art Shop"] = CFrame.new(5207, -166, 719), ["SnowGlow Biome"] = CFrame.new(-1086.85, -5.89978, -945.316), ["Cave"] = CFrame.new(3581, -179, 430), ["Shrine Of Sight"] = CFrame.new(-1600, 195, 919), ["Fancy Furnishings"] = CFrame.new(491, 13, -1720), ["Docks"] = CFrame.new(1114, 3.2, -197), ["Strange Man"] = CFrame.new(1061, 20, 1131), ["Wood Dropoff"] = CFrame.new(323.406, -2.8, 134.734), ["Snow Biome"] = CFrame.new(889.955, 59.7999, 1195.55), ["Wood RUs"] = CFrame.new(265, 5, 57), ["Green Box"] = CFrame.new(-1668.05, 351.174, 1475.39), ["Spawn"] = CFrame.new(172, 2, 74), ["Cherry Meadow"] = CFrame.new(220.9, 59.8, 1305.8), ["Bird Cave"] = CFrame.new(4813.1, 33.5, -978.8),}
            ---~Functions~---
            
            function Notify(Title,Text)
            game.StarterGui:SetCore("SendNotification", {Title = Title, Text = Text, Duration = 10})
            end
            
            function ChopTree(CutEvent, ID, Height)
            game:GetService("ReplicatedStorage").Interaction.RemoteProxy:FireServer(CutEvent, {["tool"] = game.Players.LocalPlayer.Character:FindFirstChild("Tool"), ["faceVector"] = Vector3.new(1, 0, 0), ["height"] = Height, ["sectionId"] = ID, ["hitPoints"] = HitPoints[game.Players.LocalPlayer.Character:FindFirstChild("Tool").ToolName.Value], ["cooldown"] = 0.25837870788574, ["cuttingClass"] = "Axe"})
            end
            
            local gs = function(service) return game:GetService(service) end
            local players = gs("Players")
            local client = players.LocalPlayer
            local b = game:GetService("ReplicatedStorage")
            DragModel1 = function(...)
            local d = {...}
            pcall(
                function()
                    b.Interaction.ClientIsDragging:FireServer(d[1])
                     b.Interaction.ClientIsDragging:FireServer(d[1])
                     b.Interaction.ClientIsDragging:FireServer(d[1])
                   b.Interaction.ClientIsDragging:FireServer(d[1])
            
                end
            )
            d[1]:MoveTo(d[2])
            d[1]:MoveTo(d[2])
            return d
            end
            local function table_foreach(table, callback)
            for i=1,#table do
            callback(i, table[i])
            end
            end
            
            local function getCFrame(part)
            local part = part or (client.Character and client.Character.HumanoidRootPart)
            if not part then return end
            return part.CFrame
            end
            
            local function tp(pos)
            local pos = pos or client:GetMouse().Hit + Vector3.new(0, client.Character.HumanoidRootPart.Size.Y, 0)
            if typeof(pos) == "CFrame" then
            client.Character:SetPrimaryPartCFrame(pos)
            elseif typeof(pos) == "Vector3" then
            client.Character:MoveTo(pos)
            end
            end
            
            
            local  function getPosition(part)
            return getCFrame(part).Position
            end
            
            local  function getTools()
            client.Character.Humanoid:UnequipTools()
            local tools = {}
            table_foreach(client.Backpack:GetChildren(), function(_, v)
            if v.Name ~= "BlueprintTool" and v.Name ~= "Delete" and v.Name ~= "Undo" then
              tools[#tools + 1] = v 
            end
            end)
            return tools
            end
            local function getToolStats(toolName)
            if typeof(toolName) ~= "string" then
            print(toolName)
            toolName = toolName.ToolName.Value
            end
            return require(gs("ReplicatedStorage").AxeClasses['AxeClass_'..toolName]).new()
            end
            
            local function getBestAxe(treeClass)
            local tools = getTools()
            if #tools == 0 then
            return game.StarterGui:SetCore("SendNotification", {
                Title = 'Need Axe';
                Text = "Axe";
                Icon = "rbxassetid://7924662383";
                Duration = 4;
            })
            end
            local toolStats = {}
            local tool
            for _, v in next, tools do
            if treeClass == "LoneCave" and v.ToolName.Value == "EndTimesAxe" then
              tool = v
              break
            end
            local axeStats = getToolStats(v)
            if axeStats.SpecialTrees and axeStats.SpecialTrees[treeClass] then
              for i, v in next, axeStats.SpecialTrees[treeClass] do
                axeStats[i] = v
              end
            end
            table.insert(toolStats, { tool = v, damage = axeStats.Damage })
            end
            if not tool and treeClass == "LoneCave" then
            return game.StarterGui:SetCore("SendNotification", {
                Title = 'Axe';
                Text = "Need Endtimes Axe";
                Icon = "rbxassetid://7924662383";
                Duration = 7;
            })
            end
            table.sort(toolStats, function(a, b)
            return a.damage > b.damage
            end)
            return true, tool or toolStats[1].tool
            end
            
            local function cutPart (event, section, height, tool, treeClass)
            local axeStats = getToolStats(tool)
            if axeStats.SpecialTrees and axeStats.SpecialTrees[treeClass] then
            for i, v in next, axeStats.SpecialTrees[treeClass] do
              axeStats[i] = v
            end
            end
            game:GetService'ReplicatedStorage'.Interaction.RemoteProxy:FireServer(event, {
            tool = tool,
            faceVector = Vector3.new(-1, 0, 0),
            height = height or 0.3,
            sectionId = section or 1,
            hitPoints = axeStats.Damage,
            cooldown = axeStats.SwingCooldown,
            cuttingClass = "Axe"
            })
            end
            local treeListener = function(treeClass, callback)
            local childAdded
            childAdded = workspace.LogModels.ChildAdded:Connect(function(child)
            local owner = child:WaitForChild("Owner")
            if owner.Value == client and child.TreeClass.Value == treeClass then
              childAdded:Disconnect()
              callback(child)
            end
            end)
            end
            local treeClasses = {}
            local treeRegions = {}
            
            for _, v in next, workspace:GetChildren() do
            if v.Name == "TreeRegion" then
            treeRegions[v] = {}
            for _, v2 in next, v:GetChildren() do
              if v2:FindFirstChild("TreeClass") and not table.find(treeClasses, v2.TreeClass.Value) then
                table.insert(treeClasses, v2.TreeClass.Value)
              end
              if v2:FindFirstChild("TreeClass") and not table.find(treeRegions[v], v2.TreeClass.Value) then
                table.insert(treeRegions[v], v2.TreeClass.Value)
              end
            end
            end
            end
            
            local getBiggestTree = function(treeClass)
            local trees = {}
            for i, v in next, treeRegions do
            if table.find(v, treeClass) then
              for _, v2 in next, i:GetChildren() do
                if v2:IsA("Model") and v2:FindFirstChild("Owner") then
                  if v2:FindFirstChild("TreeClass") and v2.TreeClass.Value == treeClass and v2.Owner.Value == nil or v2.Owner.Value == client then
                    local totalMass = 0
                    local treeTrunk
                    for _, v3 in next, v2:GetChildren() do
                      if v3:IsA("BasePart") then
                        if v3:FindFirstChild("ID") and v3.ID.Value ==1 then
                          treeTrunk = v3
                        end
                        totalMass = totalMass + v3:GetMass()
                      end
                    end
                    table.insert(trees, { tree = v2, trunk = treeTrunk, mass = totalMass })
                  end
                end
              end
            end
            end
            table.sort(trees, function(a, b)
            return a.mass > b.mass
            end)
            return trees[1] or nil
            end
            
            local function bringTree(treeClass)
            local lp =game. Players.LocalPlayer
            local success,data = getBestAxe(treeClass) 
            
            local axeStats = getToolStats(data)
            
            local tree = getBiggestTree(treeClass)
            
            if not tree then
            return 
            print("not findtree")
            end
            
            local oldPosition = getPosition()
            
            local treeCut = false
            
              
            treeListener(treeClass, function(tree)
            tree.PrimaryPart = tree:FindFirstChild("WoodSection")
            treeCut = true
            
                    
            for i=1,60 do
            DragModel1(tree,oldPosition)
            task.wait()
            
            end
            
            end)
            task.wait(0.15)
            
            
            
            treestop = true
            
            task.spawn(function()
            if treeClass == "LoneCave" then GodMode()
            repeat
            if not treestop then break end
             tp(tree.trunk.CFrame)
            
             task.wait()
            until treeCut
            else
            repeat
            if not treestop then break end
              tp(tree.trunk.CFrame)
            
              task.wait()
            until treeCut
            end
            end)
            
            task.wait()
            
            
            repeat
            if not treestop then break end
              cutPart(tree.tree.CutEvent, 1, 0.3, data, treeClass)
              task.wait()
            until treeCut
            
            
            print("done")
            if treeClass == "LoneCave" then 
            wait(1)
            game.Players.LocalPlayer.Character.Head:Remove()
            else
            wait(1)
              tp(oldPosition)
            
            end
            end
            
            Players = game.Players
            IYMouse = Players.LocalPlayer:GetMouse()
            speaker = Players.LocalPlayer
            QEfly = true
            iyflyspeed = 1
            vehicleflyspeed = 1
            
            function getRoot(char)
            local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
            return rootPart
            end
            
            FLYING = false
            QEfly = true
            iyflyspeed = 1
            vehicleflyspeed = 1
            function sFLY(vfly)
            repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            repeat wait() until IYMouse
            if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
            
            local T = getRoot(Players.LocalPlayer.Character)
            local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            local SPEED = 0
            
            local function FLY()
                FLYING = true
                local BG = Instance.new('BodyGyro')
                local BV = Instance.new('BodyVelocity')
                BG.P = 9e4
                BG.Parent = T
                BV.Parent = T
                BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                BG.cframe = T.CFrame
                BV.velocity = Vector3.new(0, 0, 0)
                BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
                task.spawn(function()
                    repeat wait()
                        if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                            Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                        end
                        if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                            SPEED = 50
                        elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                            SPEED = 0
                        end
                        if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                            BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                            lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                        elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                            BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                        else
                            BV.velocity = Vector3.new(0, 0, 0)
                        end
                        BG.cframe = workspace.CurrentCamera.CoordinateFrame
                    until not FLYING
                    CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                    lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                    SPEED = 0
                    BG:Destroy()
                    BV:Destroy()
                    if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                        Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
                    end
                end)
            end
            flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
                if KEY:lower() == 'w' then
                    CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
                elseif KEY:lower() == 's' then
                    CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
                elseif KEY:lower() == 'a' then
                    CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
                elseif KEY:lower() == 'd' then 
                    CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
                elseif QEfly and KEY:lower() == 'e' then
                    CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
                elseif QEfly and KEY:lower() == 'q' then
                    CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
                end
                pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
            end)
            flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
                if KEY:lower() == 'w' then
                    CONTROL.F = 0
                elseif KEY:lower() == 's' then
                    CONTROL.B = 0
                elseif KEY:lower() == 'a' then
                    CONTROL.L = 0
                elseif KEY:lower() == 'd' then
                    CONTROL.R = 0
                elseif KEY:lower() == 'e' then
                    CONTROL.Q = 0
                elseif KEY:lower() == 'q' then
                    CONTROL.E = 0
                end
            end)
            FLY()
            end
            
            function NOFLY()
            FLYING = false
            if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
            if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
            end
            pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
            end
            
            function BringAllLogs()
            OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            for i,v in next, game:GetService("Workspace").LogModels:GetChildren() do
            if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("WoodSection").CFrame.p)
                if not v.PrimaryPart then
                    v.PrimaryPart = v:FindFirstChild("WoodSection")
                end
                for i = 1,50 do
                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
                    v:SetPrimaryPartCFrame(OldPos)
                    task.wait()
                end
            end
            task.wait()
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
            end
            
            function CheckForLogs()
            for i,v in next, game:GetService("Workspace").LogModels:GetChildren() do
            if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
                return true
            end
            end
            return false
            end
            
            function BringAllPlanks()
                OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                for i,v in next, game:GetService("Workspace").PlayerModels:GetChildren() do
                    if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer and v.Name == "Plank" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("WoodSection").CFrame.p)
                        if not v.PrimaryPart then
                            v.PrimaryPart = v:FindFirstChild("WoodSection")
                        end
                        for i = 1,50 do
                            game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
                            v:SetPrimaryPartCFrame(OldPos)
                            task.wait()
                        end
                    end
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
                end
            
            function SellAllPlanks()
            OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            for i,v in next, game:GetService("Workspace").PlayerModels:GetChildren() do
                if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer and v.Name == "Plank" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("WoodSection").CFrame.p)
                    if not v.PrimaryPart then
                        v.PrimaryPart = v:FindFirstChild("WoodSection")
                    end
                    for i = 1,50 do
                        game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
                        v:SetPrimaryPartCFrame(CFrame.new(314, -0.5, 86.822))
                        task.wait()
                    end
                end
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
            end
            
            
            
            
            
            
    
            
            
            function DEVV()
            Old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            for i,v in next, game.Workspace.PlayerModels:GetDescendants() do
            if v:FindFirstChild("Selection") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("Selection").Parent.CFrame.p)
            wait(.58)
            for i = 1,50 do
                       game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                       v.Selection.Parent.CFrame = Cords
                       task.wait()
            end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Old
                end
            end
            end
            
            function BetterG()
            local light = game.Lighting
            light:ClearAllChildren()
            local color = Instance.new("ColorCorrectionEffect",light)
            local bloom = Instance.new("BloomEffect",light)
            local sun = Instance.new("SunRaysEffect",light)
            local blur = Instance.new("BlurEffect",light)
            local config = {ColorCorrection = true;Sun = true;Lighting = true;BloomEffect = true;}
            color.Enabled = true
            color.Contrast = 0.15
            color.Brightness = 0.1
            color.Saturation = 0.25
            color.TintColor = Color3.fromRGB(255, 222, 211)
            sun.Enabled = true
            sun.Intensity = 0.2
            sun.Spread = 1
            bloom.Enabled = true
            bloom.Intensity = 1
            bloom.Size = 32
            bloom.Threshold = 1
            blur.Enabled = true
            blur.Size = 3
            light.Ambient = Color3.fromRGB(0, 0, 0)
            light.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
            light.ColorShift_Top = Color3.fromRGB(0, 0, 0)
            light.ExposureCompensation = 0
            light.GlobalShadows = true
            light.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
            light.Outlines = false  
            end
            function ClickWoodToSell()
            if ClickToSell == false then ClickToSellMouseVal:Disconnect() return print("Test") end
            ClickToSellMouseVal = Mouse.Button1Up:Connect(function()
            if Mouse.Target.Parent:FindFirstChild("Owner") and Mouse.Target.Parent:FindFirstChild("Main") then
                if Mouse.Target.Parent.Owner.Value == game.Players.LocalPlayer then
                        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(Mouse.Target.Parent)
                        if Mouse.Target.Name == "Main" and Mouse.Target.Anchored == false then
                            print(Mouse.Target.Parent)
                    end
                end
            end
            end)
            end
            
            function CheckForItem(ItemType)
            for i,v in pairs(game:GetService("Workspace").Stores:GetChildren()) do
            if v.Name == "ShopItems" then
                for i,v in pairs(v:GetChildren()) do
                    if v:FindFirstChild("Owner") and v.Owner.Value == nil then
                        if v:FindFirstChild("BoxItemName") and tostring(v.BoxItemName.Value) == ItemType then
                            return true
                        end
                    end
                end
            end
            end
            return false
            end
            
            function GetPrice(Item,Amount)
               local Price = 0
               for i,v in next, game:GetService("ReplicatedStorage").ClientItemInfo:GetDescendants() do
                   if v.Name == Item and v:FindFirstChild("Price") then
                       Price = Price + v.Price.Value * Amount
                   end
               end
               return Price
           end
           
           function GrabShopItems()
               local ItemList = {}
               for i,v in next,game:GetService("Workspace").Stores:GetChildren() do
                   if v.Name == "ShopItems" then
                       for i,v in next,v:GetChildren() do
                           if v:FindFirstChild("Type") and v.Type.Value ~= "Blueprint" and v:FindFirstChild("BoxItemName") then
                               if not table.find(ItemList,v.BoxItemName.Value.." - $"..GetPrice(v.BoxItemName.Value,1)) then
                                   table.insert(ItemList,v.BoxItemName.Value.." - $"..GetPrice(v.BoxItemName.Value,1))
                                   table.sort(ItemList)
                               end
                           end
                       end
                   end
               end
               return ItemList
           end
           
           function UpdateNames()
               for i,v in next, game:GetService("Workspace").Stores:GetChildren() do
                   if v.Name == "ShopItems" then
                       v.ChildAdded:Connect(function(v)
                           v.Name = v:WaitForChild("BoxItemName").Value
                       end)
                       for i,v in next, v:GetChildren() do
                           if v:FindFirstChild("Owner") and v.Owner.Value == nil then
                               if v:FindFirstChild("BoxItemName") then
                                   v.Name = v.BoxItemName.Value
                               end
                           end
                       end
                   end
               end
           end
           UpdateNames()
           
           function ItemPath(Item)
               for i,v in next, game:GetService("Workspace").Stores:GetChildren() do
                   if v.Name == "ShopItems" then
                       for i,v in next, v:GetChildren() do
                           if v:FindFirstChild("Owner") and v.Owner.Value == nil then
                               if v:FindFirstChild("BoxItemName") and tostring(v.BoxItemName.Value) == Item then
                                   return v.Parent
                               end
                           end
                       end
                   end
               end
           end
           
           function GetCounter(Item)
               ClosestCounter = nil
               for i,v in next, game:GetService("Workspace").Stores:GetChildren() do
                   if v.Name:lower() ~= "shopitems" then
                       for i,v in next, v:GetChildren() do
                           if v.Name:lower() == "counter" then
                               if (Item.CFrame.p - v.CFrame.p).Magnitude <= 200 then
                                   ClosestCounter = v
                               end
                           end
                       end
                   end
               end
               return ClosestCounter
           end
           
           function Pay(ID)
               spawn(function()
                   game:GetService("ReplicatedStorage").NPCDialog.PlayerChatted:InvokeServer({["ID"] = ID,["Character"] = "name",["Name"] = "name",["Dialog"] = 'Dialog'}, "ConfirmPurchase");
               end)
           end
           local ItemBought
           function AutoBuy(Item,Amount,op,bpop)
             buytime = tick()
               if Item == nil then notifications:message{Title = "Butter",Description = "No item selected",Icon = 6023426926} return end
               if game.Players.LocalPlayer.leaderstats.Money.Value < GetPrice(Item,Amount) then return notifications:message{Title = "Butter",Description = "No money",Icon = 6023426926} end 
               AbortAutoBuy = false
               local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
               local Path = ItemPath(Item)
               
               if tostring(Item):sub(1,4) == "2022" then
                    ItemBought = game:GetService("Workspace").PlayerModels.ChildAdded:Connect(function(v)
                       if v:WaitForChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
                           if v:WaitForChild("Main") then
                               for i = 1,40 do 
                                   game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                                   v.Main.CFrame = OldPos
                                   game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                                   task.wait()
                               end
                           end
                       end
                   end)
               end
               
               for i = 1,Amount do
                   if AbortAutoBuy then break end
                   local Item = Path:WaitForChild(Item)
                   local Counter = GetCounter(Item.Main)
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Item.Main.CFrame + Vector3.new(5,0,5)
                   repeat game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Item) task.wait() until Item.Owner.Value ~= nil
                   if Item.Owner.Value ~= game.Players.LocalPlayer then break end
                   for i = 1,30 do
                       game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Item)
                       Item.Main.CFrame = Counter.CFrame + Vector3.new(0,Item.Main.Size.Y,0.5,0)
                       task.wait()
                   end
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Counter.CFrame + Vector3.new(5,0,5)
                   repeat
                       if AbortAutoBuy then break end
                       game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Item)
                       Pay(ShopIDS[Counter.Parent.Name])
                       task.wait()
                   until Item.Parent ~= "ShopItems"
                   if tostring(Item):sub(1,4) ~= "2022" then
                       for i = 1,30 do 
                           game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Item)
                           Item.Main.CFrame = OldPos
                           task.wait()
                       end
                       if op then
                       game:GetService("ReplicatedStorage").Interaction.ClientInteracted:FireServer(Item,"Open box")
                       end
                       if not bpop then
                       ResizeBar(i,Amount)
                       end
                   end
                   task.wait()
               end
               if ItemBought then ItemBought:Disconnect() end
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos + Vector3.new(5,1,0)
               if AbortAutoBuy then
               print("Aborted")
               else
               print("done")
               end
               notifications:message{Title = "Butter",Description = "Done in ".. string.format('%.1fs', tick() - buytime),Icon = 6023426926}
           end
           
            function SellSoldSign()
            for i,v in next, game:GetService("Workspace").PlayerModels:GetChildren() do
            if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
                if v:FindFirstChild("ItemName") and v.ItemName.Value == "PropertySoldSign" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Main.CFrame.p) + Vector3.new(0,0,2)
                    game:GetService("ReplicatedStorage").Interaction.ClientInteracted:FireServer(v,"Take down sold sign")
                    for i = 1,30 do
                        game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                        v.Main.CFrame = CFrame.new(314.54, -0.5, 86.823)
                        task.wait()
                    end
                end
            end
            end
            end
            
            function FreeLand()
            for i,v in next, game:GetService("Workspace").Properties:GetChildren() do
            if v:FindFirstChild("Owner") and v.Owner.Value == nil then
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientPurchasedProperty:FireServer(v,v.OriginSquare.Position)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.OriginSquare.CFrame + Vector3.new(0,2,0)
                break
            end
            end
            end

            
            
            function SetPermissions(Val)
            for i,v in pairs(game:GetService("Players"):GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Visit",Val)
                game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"PlaceStructure",Val)
                game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"MoveStructure",Val)
                game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Destroy",Val)
                game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Drive",Val)
                game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Sit",Val)
                game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Interact",Val)
                game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Grab",Val)
                game:GetService("ReplicatedStorage").Interaction.UpdateUserSettings:FireServer("UserPermission",v.UserId,"Save",Val)
            end
            end
            end
            
            function AutoWhiteList()
            SetPermissions(true)
            if AutoWhitelistAll == true then
            WLPlayerAdded = game.Players.ChildAdded:Connect(function(n)
            if n.Name ~= game.Players.LocalPlayer.Name then
                SetPermissions(true)
            end
            end)
            else
            WLPlayerAdded:Disconnect()
            end
            end
            
            function AutoBlacklist()
            SetPermissions(false)
            if AutoBlacklistAll == true then
            WLPlayerAdded = game.Players.ChildAdded:Connect(function(n)
            if n.Name ~= game.Players.LocalPlayer.Name then
                SetPermissions(false)
            end
            end)
            else
            BLPlayerAdded:Disconnect()
            end
            end
            
            function MaxLand()
            for s,d in pairs(workspace.Properties:GetChildren()) do 
            if d:FindFirstChild("Owner") and d:FindFirstChild("OriginSquare") and d.Owner.Value == game.Players.LocalPlayer then
                local PlotPos = d.OriginSquare.Position
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40, PlotPos.Y, PlotPos.Z))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40, PlotPos.Y, PlotPos.Z))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z + 40))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z - 40))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z + 40))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z - 40))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z + 40))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z - 40))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z + 80))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X , PlotPos.Y, PlotPos.Z - 80))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z + 80))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z - 80))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z + 80))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z - 80))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z + 80))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z + 80))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z + 40))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 80 , PlotPos.Y, PlotPos.Z - 40))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z + 40))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 80 , PlotPos.Y, PlotPos.Z - 40))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X + 40 , PlotPos.Y, PlotPos.Z - 80))
                game:GetService("ReplicatedStorage").PropertyPurchasing.ClientExpandedProperty:FireServer(d,CFrame.new(PlotPos.X - 40 , PlotPos.Y, PlotPos.Z - 80))
            end
            end
            end
            
            
            
            function SellAllPlanks()
                OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                for i,v in next, game:GetService("Workspace").PlayerModels:GetChildren() do
                    if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer and v.Name == "Plank" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("WoodSection").CFrame.p)
                        if not v.PrimaryPart then
                            v.PrimaryPart = v:FindFirstChild("WoodSection")
                        end
                        for i = 1,50 do
                            game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
                            v:SetPrimaryPartCFrame(CFrame.new(314, -0.5, 86.822))
                            task.wait()
                        end
                    end
                end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
                end
            
            
            function VehicleSpeed(Val)
            for i,v in next, game:GetService("Workspace").PlayerModels:GetChildren() do
            if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
                if v:FindFirstChild("Type") and v.Type.Value == "Vehicle" then
                    if v:FindFirstChild("Configuration") then
                        v.Configuration.MaxSpeed.Value = Val
                    end
                end
            end
            end
            end
            
            
            
            
            function SitInAnyVehicle()
            game:GetService("Players").LocalPlayer.PlayerGui.Scripts.SitPermissions.Disabled = false
            end
            
            function FlipVehcile()
            player = game.Players.LocalPlayer
            humanoid = player.Character.Humanoid
            if humanoid.Seated then
            local CurrentSeat = player.Character.Humanoid.SeatPart
                if CurrentSeat and CurrentSeat.Parent.Type.Value == "Vehicle" then
               CurrentSeat.CFrame = CurrentSeat.CFrame * CFrame.Angles(math.rad(-180), 0, 0) + Vector3.new(0, 5, 0),1000,CurrentSeat.CFrame
            end
            end
            end
            
            function ShopAnnoy()
            if not LoopDestroyShopItems then return end 
            repeat
            for i,v in next, game:GetService("Workspace").Stores:GetChildren() do
                if v.Name == "ShopItems" then
                    for i,v in next, v:GetChildren() do
                        if not LoopDestroyShopItems then return end
                        if v:FindFirstChild("Owner") and v.Owner.Value == nil then
                            game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                            game:GetService("ReplicatedStorage").Interaction.DestroyStructure:FireServer(v)
                        end
                    end
                end
            end
            task.wait(1)
            until LoopDestroyShopItems == false
            end
            
            function DestroyTrees()
            for i,v in next, game.Workspace:GetChildren() do
            if v.Name == "TreeRegion" then
                for i,v in next, v :GetChildren() do
                    if v:FindFirstChild("Owner") and v.Owner.Value == nil then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("WoodSection").CFrame.p)
                        repeat
                            game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(v)
                            game:GetService("ReplicatedStorage").Interaction.DestroyStructure:FireServer(v)
                            task.wait()
                        until v.Parent == nil
                    end
                end
            end
            end
            end
            
            function GetGreenBox()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace")["Region_Volcano"].VolcanoWin.TouchInterest.Parent,0)
            end
            
            function WalkOnWater(Val)
            for i,v in next, game:GetService("Workspace").Water:GetChildren() do
            if v.Name == "Water" then
                v.CanCollide = Val
            end
            end
            end
            
            function BridgeDown(Bridge)
            for i,v in next, game:GetService("Workspace").Bridge.VerticalLiftBridge.Lift:GetChildren() do
            if not Bridge then
                v.CFrame = v.CFrame + Vector3.new(0,26,0)
                else
                v.CFrame = v.CFrame - Vector3.new(0,26,0)
            end
            end
            end
            
            function RemoveWater(Val)
            for i,v in next, game:GetService("Workspace").Water:GetChildren() do
            if v.Name == "Water" then
                if not Val then
                    v.Transparency = 0
                    else
                    v.Transparency = 1
                end
            end
            end
            end
            
            function ToggleShopDoors()
            for i,v in next, game:GetService("Workspace").Stores:GetChildren() do
            if v.Name ~= "ShopItems" then
                for i,v in next, v:GetChildren() do
                    if v.Name == "RDoor" or v.Name == "LDoor" then
                        game:GetService("ReplicatedStorage").Interaction.RemoteProxy:FireServer(v.ButtonRemote_Toggle)
                    end
                end
            end
            end
            end
            
            function GetPlayersBase(Plr)
            for i,v in next, game:GetService("Workspace").Properties:GetChildren() do
            if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == Plr then
                return v
            end
            end
            return false
            end
            
            function JumpPower(Val)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Val
            end
            
            getgenv().Speed = 16
            function Walkspeed()
            game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
            end)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed
            end
            
            function NoClip(NoClipVal)
            if not NoClipVal then Clipping:Disconnect() return end
            Clipping = game:GetService("RunService").Stepped:connect(function()
            for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
                if v:IsA("Part") or v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
            end)
            end
            
            function InfiniteJump(Val)
            if not Val then IJ:Disconnect() return end
            IJ = game:GetService("UserInputService").JumpRequest:Connect(function()
            game.Players.LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("Jumping")
            end)
            end
    
            local Flyingkey
            
            local FlyingEnabled = false
            local maxspeed = 150 
            function BetterFly()
            repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
            local mouse = game.Players.LocalPlayer:GetMouse() 
            repeat wait() until mouse
            local plr = game.Players.LocalPlayer 
            local torso = plr.Character.Head 
            local flying = false
            local deb = true 
            local ctrl = {f = 0, b = 0, l = 0, r = 0} 
            local lastctrl = {f = 0, b = 0, l = 0, r = 0}
            local speed = 5000 
             
            function Fly() 
            local bg = Instance.new("BodyGyro", torso) 
            bg.P = 9e4 
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
            bg.cframe = torso.CFrame 
            local bv = Instance.new("BodyVelocity", torso) 
            bv.velocity = Vector3.new(0,0.1,0) 
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
            repeat wait() 
            plr.Character.Humanoid.PlatformStand = true 
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
            speed = maxspeed
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
                speed = 0 
            end 
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
            lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
            bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*0.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
            else 
            bv.velocity = Vector3.new(0,0,0) 
            end 
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*speed/maxspeed),0,0) 
            until not flying 
            ctrl = {f = 0, b = 0, l = 0, r = 0} 
            lastctrl = {f = 0, b = 0, l = 0, r = 0} 
            speed = 0 
            bg:Destroy() 
            bv:Destroy() 
            plr.Character.Humanoid.PlatformStand = false 
            end 
            mouse.KeyDown:connect(function(key) 
            if key:lower() == Flyingkey and FlyingEnabled == true then 
            if flying then flying = false 
            else 
            flying = true 
            Fly() 
            end 
            elseif key:lower() == "w" then 
            ctrl.f = 1 
            elseif key:lower() == "s" then 
            ctrl.b = -1 
            elseif key:lower() == "a" then 
            ctrl.l = -1 
            elseif key:lower() == "d" then 
            ctrl.r = 1 
            end 
            end) 
            mouse.KeyUp:connect(function(key) 
            if key:lower() == "w" then 
            ctrl.f = 0 
            elseif key:lower() == "s" then 
            ctrl.b = 0 
            elseif key:lower() == "a" then 
            ctrl.l = 0 
            elseif key:lower() == "d" then 
            ctrl.r = 0 
            end 
            end)
            Fly()
            end
            game.Players.LocalPlayer.CharacterAdded:Connect(BetterFly)
            BetterFly()
            
            --[[
            Mercury Stuffs
            PlayerTab:Toggle{
            Name = "Flight",
            StartingState = false,
            Description = "Gives you the ability of a god, Fly around the map at will. KEYBIND - Q",
            Callback = function (v)
                FlyingEnabled = v
            end}
            
            PlayerTab:Slider{
                Name = "Flight Speed",
                Default = 50,
                Min = 50,
                Max = 250,
                Callback = function(Value) 
                    maxspeed = Value
                end
            }
            ]]
            
            function AntiAFK(Val)
            if not Val then AFKVal:Disconnect() return end
            AFKVal = game:GetService("Players").LocalPlayer.Idled:connect(function()
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
             wait()
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
            end)
            end
            
            function Light(Val)
            if Val == false then game.Players.LocalPlayer.Character.Head.PointLight:Destroy() return end
            local PL = Instance.new("PointLight",game.Players.LocalPlayer.Character:FindFirstChild("Head"))
            PL.Range = 100
            PL.Brightness = 1
            PL.Shadows = false
            end
            
            function BTools()
                local Pllayyrs = game:GetService("Players").LocalPlayer
                local deletetool = Instance.new("Tool", Pllayyrs.Backpack)
                local undotool = Instance.new("Tool", Pllayyrs.Backpack)
                
                if editedparts == nil then
                editedparts = {}
                parentfix = {}
                positionfix = {}
                end
                
                
                deletetool.Name = "Delete"
                undotool.Name = "Undo"
                undotool.CanBeDropped = false
                deletetool.CanBeDropped = false
                undotool.RequiresHandle = false
                deletetool.RequiresHandle = false
                
                
                deletetool.Activated:Connect(function()
                
                table.insert(editedparts, mouse.Target)
                table.insert(parentfix, mouse.Target.Parent)
                table.insert(positionfix, mouse.Target.CFrame)
                mouse.Target.Parent = nil
                end)
                undotool.Activated:Connect(function()
                
                editedparts[#editedparts].Parent = parentfix[#parentfix]
                editedparts[#editedparts].CFrame = positionfix[#positionfix]
                table.remove(positionfix, #positionfix)
                table.remove(editedparts, #editedparts)
                table.remove(parentfix, #parentfix)
                end)
            end
            
            local AllPlayers = {"Select Player"}
            for i,v in next,game.Players:GetPlayers() do
            if not table.find(AllPlayers,v.Name) then
            table.insert(AllPlayers,v.Name)
            end
            end
            
            function TeleportToBase(Plr)
            for i,v in next, game:GetService("Workspace").Properties:GetChildren() do
            if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == Plr then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.OriginSquare.CFrame + Vector3.new(0,2,0)
                break
            end
            end
            end
            
            local function carTP(CFRAME) -- need to be in car
            player = game.Players.LocalPlayer
            humanoid = player.Character.Humanoid
            if humanoid.Seated then
            local CurrentSeat = player.Character.Humanoid.SeatPart
                if CurrentSeat and CurrentSeat.Parent.Type.Value == "Vehicle" then
                CurrentSeat.CFrame = CFRAME
                CurrentSeat.Parent.RightSteer.Wheel.CFrame = CFRAME
                CurrentSeat.Parent.LeftSteer.Wheel.CFrame = CFRAME
                CurrentSeat.Parent.RightPower.Wheel.CFrame = CFRAME
                CurrentSeat.Parent.LeftPower.Wheel.CFrame = CFRAME
            end
            
            end
            end
            
            
            function TeleportToPlayer(Plr)
            for i,v in next, game.Players:GetPlayers() do
            if tostring(v.Name) == Plr then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Character.HumanoidRootPart.CFrame.p)
                print("Teleported")
                break
            end
            end
            end
            
            
            
            
            
            
            
            function onebyone()
            function getHitPointsTbl()
                return
                {
                    ['Beesaxe']= 1.4;
                    ['AxeAmber']= 3.39;
                    ['ManyAxe']= 10.2;
                    ['BasicHatchet']= 0.2;
                    ['Axe1']= 0.55;
                    ['Axe2']= 0.93;
                    ['AxeAlphaTesters']= 1.5;
                    ['Rukiryaxe']= 1.68;
                    ['Axe3']= 1.45;
                    ['AxeBetaTesters']= 1.45;
                    ['FireAxe']= 0.6;
                    ['SilverAxe']= 1.6;
                    ['EndTimesAxe']= 1.58;
                    ['AxeChicken']= 0.9;
                    ['CandyCaneAxe']= 0;
                    ['AxeTwitter']= 1.65;
                    ['CandyCornAxe']= 1.75;
                }
            end
            function plankData(plank)
                local array = {}
                array[1] = plank
                array[2] = 1/(plank.Size.X*plank.Size.Z)
                if array[2] < 0.2 then array[2] = 0.3 end
                array[3] = math.floor(plank.Size.Y/array[2])
                if array[3] < 1 then array[3] = 0 end
                array[4] = plank.Size.Y
                return array
            end
            function getMouseTarget()
                local cursorPosition = game:GetService("UserInputService"):GetMouseLocation()
                return workspace:FindPartOnRayWithIgnoreList(Ray.new(workspace.CurrentCamera.CFrame.p,(workspace.CurrentCamera:ViewportPointToRay(cursorPosition.x, cursorPosition.y, 0).Direction * 1000)),game.Players.LocalPlayer.Character:GetDescendants())
            end
            function getAxeList()
                local axes = {}
                for i,v in pairs (game.Players.LocalPlayer.Backpack:GetChildren()) do
                    table.insert(axes,v)
                end
                local pc = game.Players.LocalPlayer.Character
                if pc:FindFirstChildOfClass"Tool" then
                    table.insert(axes,pc:FindFirstChildOfClass("Tool"))
                end
                return axes
            end
            function getTieredAxe()
                return {
                    ['Beesaxe']= 13;
                    ['AxeAmber']= 12;
                    ['ManyAxe']= 15;
                    ['BasicHatchet']= 0;
                    ['RustyAxe']= -1;
                    ['Axe1']= 2;
                    ['Axe2']= 3;
                    ['AxeAlphaTesters']= 9;
                    ['Rukiryaxe']= 8;
                    ['Axe3']= 4;
                    ['AxeBetaTesters']= 10;
                    ['FireAxe']= 11;
                    ['SilverAxe']= 5;
                    ['EndTimesAxe']= 16;
                    ['AxeChicken']= 6;
                    ['CandyCaneAxe']= 1;
                    ['AxeTwitter']= 7;
                    ['CandyCornAxe']= 14;
                }
            end
            function getBestAxee()
                local pc = game.Players.LocalPlayer.Character
                if pc:FindFirstChildOfClass"Tool" then
                    local t = pc:FindFirstChildOfClass"Tool"
                    if t:FindFirstChild("ToolName") then
                        return t
                    end
                end
                local best = -1;
                local best_tool = nil;
                local tier_list = getTieredAxe()
                for i,v in pairs (getAxeList()) do
                    if v:FindFirstChild("ToolName") then
                        if tier_list[v.ToolName.Value] > best then
                            best_tool = v
                            best = tier_list[v.ToolName.Value]
                        end
                    end
                end
                return best_tool
            end
            local plr = game:GetService'Players'.LocalPlayer
                    local plrc = plr.Character
                    local m = plr:GetMouse()
                    local part = nil
                    local cancel1u = false
                    connecteda = m.Button1Up:connect(function()
                        local partt = getMouseTarget()
                        if partt.Name == "WoodSection" then
                            part = partt
                        else
                            cancel1u = true
                        end
                    end)
                    repeat wait() until cancel1u or part ~= nil
                    if connecteda ~= nil then
                        connecteda:Disconnect()
                        connecteda = nil
                    end
                    if cancel1u then
                        cancel1u = false
                        return
                    end
                    cancel1u = false
                    local HitPoints= getHitPointsTbl()
                    print('1')
                    local tool = getBestAxee()
                    print('2')
                    function axe(v,x)
                        local hps = HitPoints[tool.ToolName.Value]
                        local Wood = v.TreeClass.Value
                        if Wood == "LoneCave" and tool.ToolName.Value == "EndTimesAxe" then
                            hps = 10000000
                        end
                        if Wood == "Volcano" and tool.ToolName.Value == "FireAxe" then
                            hps = 6.35
                        end
                        local table =  {
                            ["tool"] = tool,
                            ["faceVector"] = Vector3.new(1, 0, 0),
                            ["height"] = x,
                            ["sectionId"] = 1,
                            ["hitPoints"] = hps,
                            ["cooldown"] = 0.21,
                            ["cuttingClass"] = "Axe"
                        }
                        game:GetService("ReplicatedStorage").Interaction.RemoteProxy:FireServer(v.CutEvent, table)
                    end
                    
                    local ca = plankData(part)
                    
                    local caq = {}
                    local remaining = ca[3]
                    local ready = false
                    
                    if remaining == 0 then return end
                    local repeating = workspace.PlayerModels.ChildAdded:connect(function(new)
                        if new:WaitForChild("Owner").Value == plr and new:FindFirstChild'WoodSection' and math.floor(plankData(new.WoodSection)[4]) == math.floor(ca[4]-ca[2]) then
                            ready = true
                            caq = plankData(new:FindFirstChild'WoodSection')
                        end
                    end)
                    
                    for i=1,ca[3] do
                        
                        ready = false
                        
                        repeat
                            
                            wait(0.21)
                            axe(ca[1].Parent,ca[2])
                            
                        until ready or (i == ca[3] and wait(6))
                        ca = caq
                    end
                    
            end
            

            
            --GUI
            
            local function SendNotification(Title,Text,Duration) -- Sends Notification in the bottom right of the screen
            game.StarterGui:SetCore("SendNotification", {
                Title = Title;
                Text = Text;
                Icon = nil;
                Duration = Duration
            })
            end
            
            function Notify(titletxt, text, time)
            local ScreenGui = Instance.new("ScreenGui")
            local Frame = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local TextLabel = Instance.new("TextLabel")
            local TextLabel_2 = Instance.new("TextLabel")
            local UICorner_2 = Instance.new("UICorner")
            
            --Properties:
            
            ScreenGui.Parent = game.CoreGui
            
            Frame.Parent = ScreenGui
            Frame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
            Frame.Position = UDim2.new(0, -500, 0, 0)
            Frame.Size = UDim2.new(0, 291, 0, 108)
            
            UICorner.Parent = Frame
            
            TextLabel.Parent = Frame
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(0.0432195365, 0, 0.0870083869, 0)
            TextLabel.Size = UDim2.new(0, 265, 0, 43)
            TextLabel.Font = Enum.Font.LuckiestGuy
            TextLabel.Text = "Butters"
            TextLabel.TextColor3 = Color3.fromRGB(5, 158, 175)
            TextLabel.TextSize = 34.000
            
            TextLabel_2.Parent = Frame
            TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.BackgroundTransparency = 0.950
            TextLabel_2.Position = UDim2.new(0.0260701478, 0, 0.417686313, 0)
            TextLabel_2.Size = UDim2.new(0, 275, 0, 56)
            TextLabel_2.Font = Enum.Font.LuckiestGuy
            TextLabel_2.Text = "Version 1.11 PE PE PE PE beta"
            TextLabel_2.TextColor3 = Color3.fromRGB(5, 158, 175)
            TextLabel_2.TextSize = 29.000
            
            UICorner_2.Parent = TextLabel_2
            
            wait(0.1)
            Frame:TweenPosition(UDim2.new(1, -1020, 0, 400), "Out", "Sine", 0.5)
            wait(time)
            Frame:TweenPosition(UDim2.new(1, 5, 0, 50), "Out", "Sine", 0.5)
            wait(0.6)
            ScreenGui:Destroy();
                end
            
                function SellAllLogs()
                    OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    --repeat
                        for i,v in next, game:GetService("Workspace").LogModels:GetChildren() do
                            if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("WoodSection").CFrame.p)
                                if not v.PrimaryPart then
                                    v.PrimaryPart = v:FindFirstChild("WoodSection")  
                                end
                                spawn(function()
                                    for i = 1,50 do
                                        game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
                                        v:SetPrimaryPartCFrame(CFrame.new(314, -0.5, 86.822))
                                        task.wait()
                                    end
                                end)
                            end
                            task.wait()
                        end
                        task.wait()
                    --until CheckForLogs() == false
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
                    end
            
    
            
            
    
            
            
                
                
                function Dupe(Slot,Amount,timewhit)
                    for i = 1,Amount do
                        if not game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game.Players.LocalPlayer) then
                            repeat task.wait() until game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game.Players.LocalPlayer)
                        end
                        
                        game.Players.LocalPlayer.Character.Head:Remove()
                        wait(timewhit)
                        repeat task.wait() until not game.Players.LocalPlayer.Character:FindFirstChild("Head")
                        game:GetService("ReplicatedStorage").LoadSaveRequests.RequestLoad:InvokeServer(Slot,game.Players.LocalPlayer)
                        repeat task.wait() until game.Players.LocalPlayer.CurrentlySavingOrLoading.Value ~= true
                        task.wait()
                    end
                    print("Duped Axes")
                end
                
            
            
            function DEVVVVV()
            wait(1) 
            game.Players.LocalPlayer.Character.Head:Remove()
            end
            
            function Dragger()
            game.Workspace.ChildAdded:connect(function(a)
            if a.Name == "Dragger" then
                local bg = a:WaitForChild("BodyGyro")
                local bp = a:WaitForChild("BodyPosition")
                repeat
                    if CustomDragger then
                        task.wait()
                        bp.P = 120000
                        bp.D = 1000
                        bp.maxForce = Vector3.new(math.huge,math.huge,math.huge)
                        bg.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    else
                        wait()
                        bp.P = 10000
                        bp.D = 800
                        bp.maxForce = Vector3.new(17000, 17000, 17000)
                        bg.maxTorque = Vector3.new(200, 200, 200)
                    end
                until not a
            end
            end)
            end
            
            local plr = game:service'Players'.LocalPlayer
            
            
            local function getPlots()
                local Properties = {}
                for _, v in next, workspace.Properties:GetChildren() do
                    local Owner = v:FindFirstChild("Owner")
                    if Owner and Owner.Value == nil then
                        table.insert(Properties, v)
                    end
                end
                return Properties[#Properties]
            end
            
            
            
            local propClient = plr.PlayerGui.PropertyPurchasingGUI.PropertyPurchasingClient
            local propEnvironment = getsenv(propClient)
            local oldPurchase = propEnvironment.enterPurchaseMode
            getsenv(propClient).enterPurchaseMode = function(...)
                if not skipLoading then
                    return oldPurchase(...)
                end
                setupvalue(propEnvironment.rotate, 3, 0)
                setupvalue(oldPurchase, 10, getPlots())
                return
            end
            
            
            
            function LoadSlot(slot)
                if not game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game:GetService("Players").LocalPlayer) then
                    print("Load Is On cooldown Please Wait")
                    repeat task.wait() until  game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game:GetService("Players").LocalPlayer)
                end
                local skipLoading = skil.skipLoading
                game:GetService("ReplicatedStorage").LoadSaveRequests.RequestLoad:InvokeServer(slot,game.Players.LocalPlayer)
                if game:GetService("Players").LocalPlayer.CurrentSaveSlot.Value == slot then
                    print("Loaded Slot "..slot)
                end
            end
            
            
            function DDupe(Slot,Amount,timewhit)
            for i = 1,Amount do
            if not game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game.Players.LocalPlayer) then
            repeat task.wait() until game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game.Players.LocalPlayer)
            end
            game:GetService("ReplicatedStorage").LoadSaveRequests.RequestLoad:InvokeServer(Slot,game.Players.LocalPlayer)
            repeat task.wait() until game.Players.LocalPlayer.CurrentlySavingOrLoading.Value ~= true
            task.wait()
            end
            print("Duped Axes")
            end
            
            local Mouse = game.Players.LocalPlayer:GetMouse()
            local AxeClassesFolder = game:GetService("ReplicatedStorage").AxeClasses
            
            function GetBestAxe(Tree)
                if game.Players.LocalPlayer.Character:FindFirstChild("Tool") then
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                end
                local SelectedTool = nil
                local HighestAxeDamage = 0
                for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
                    if v.Name == "Tool" then
                        if require(AxeClassesFolder:FindFirstChild("AxeClass_"..v.ToolName.Value)).new().Damage > HighestAxeDamage then
                            SelectedTool = v
                            if require(AxeClassesFolder:FindFirstChild("AxeClass_"..v.ToolName.Value)).new().SpecialTrees then
                                if require(AxeClassesFolder:FindFirstChild("AxeClass_"..v.ToolName.Value)).new().SpecialTrees[Tree] then
                                    return v
                                end
                            end
                        end
                    end
                end
                return SelectedTool
            end
            
            
            function GetAxeDamage(Tree)
                if game.Players.LocalPlayer.Character:FindFirstChild("Tool") then
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                end
                if require(AxeClassesFolder:FindFirstChild("AxeClass_"..GetBestAxe(Tree).ToolName.Value)).new().SpecialTrees then
                    if require(AxeClassesFolder:FindFirstChild("AxeClass_"..GetBestAxe(Tree).ToolName.Value)).new().SpecialTrees[Tree] then
                        return require(AxeClassesFolder:FindFirstChild("AxeClass_"..GetBestAxe(Tree).ToolName.Value)).new().SpecialTrees[Tree].Damage
                    end
                end
                return require(AxeClassesFolder:FindFirstChild("AxeClass_"..GetBestAxe(Tree).ToolName.Value)).new().Damage
            end
            
            function ChopTree(CutEventRemote, ID, Height,Tree)
                game:GetService("ReplicatedStorage").Interaction.RemoteProxy:FireServer(CutEventRemote, {["tool"] = GetBestAxe(Tree), ["faceVector"] = Vector3.new(1, 0, 0), ["height"] = Height, ["sectionId"] = ID, ["hitPoints"] = GetAxeDamage(Tree), ["cooldown"] = 0.25837870788574, ["cuttingClass"] = "Axe"})
            end
            
            function DicmemberTree()
                OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                local LogChopped = false
                branchadded = game:GetService("Workspace").LogModels.ChildAdded:Connect(function(v)
                    if v:WaitForChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
                        if v:WaitForChild("WoodSection") then
                            LogChopped = true
                        end
                    end
                end)
                
                DismemberTreeC = Mouse.Button1Up:Connect(function()
                    Clicked = Mouse.Target
                    if Clicked.Parent:FindFirstAncestor("LogModels") then
                        if Clicked.Parent:FindFirstChild("Owner") and Clicked.Parent.Owner.Value == game.Players.LocalPlayer then
                            TreeToJointCut = Clicked.Parent
                        end
                    end
                end)
                repeat task.wait() until tostring(TreeToJointCut) ~= "nil"
                if TreeToJointCut:FindFirstChild("WoodClass") and TreeToJointCut.WoodClass.Value == "LoneCave" then
                    if GetBestAxe("LoneCave").ToolName.Value ~= "EndTimesAxe" then
                        return library:Notify("Error","You need an end times axe") 
                    end
                end
                for i,v in next, TreeToJointCut:GetChildren() do
                    if v.Name == "WoodSection" then
                        if v:FindFirstChild("ID") and v.ID.Value ~= 1 then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.CFrame.p)
                            repeat
                                ChopTree(v.Parent:FindFirstChild("CutEvent"), v.ID.Value, 0, v.Parent:FindFirstChild("TreeClass").Value) -- 0.32 test
                                task.wait()
                            until LogChopped == true
                            LogChopped = false
                            task.wait(1)
                        end
                    end
                end
                TreeToJointCut = nil
                branchadded:Disconnect()
                DismemberTreeC:Disconnect()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
            end
            
            local logcount = 0
            local mil;
            
            function SMBringAllPlanks()
              OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
              for i,v in next, game:GetService("Workspace").LogModels:GetChildren() do
                  if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer and v:FindFirstChild('CutEvent') then
                for _,v2 in pairs(v:GetDescendants()) do -- loop through each part in tree model
                  if v2.Name == "WoodSection" then -- look for woodsection
                    logcount = logcount + 1 -- add 1 for every woodsection
                  end
                end
            
                if logcount <= 1 then -- check if trees have more than one woodsection
                  logcount = 0 -- reset count
                  if v:FindFirstChild("WoodSection").Size.X >= 0.3 then
                    if v:FindFirstChild("WoodSection").Size.Y >= 1 then
                      if v:FindFirstChild("WoodSection").Size.Z >= 0.3 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("WoodSection").CFrame.p)
                        if not v.PrimaryPart then
                          v.PrimaryPart = v:FindFirstChild("WoodSection")
                        end
                          --v.WoodSection.Velocity = Vector3.new(0,0,0) -- freeze log
                          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChild("WoodSection").CFrame -- teleport to log
                          wait()
                          game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v) -- get network ownership
                          task.wait()
                          v:SetPrimaryPartCFrame(mil.CFrame * CFrame.Angles(0, 0, 90) + Vector3.new(0, 5, 0)) -- teleport log
                          task.wait()
                          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChild("WoodSection").CFrame -- teleport to log
                          wait()
                          game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v) -- get network ownership
                          task.wait()
                          v:SetPrimaryPartCFrame(mil.CFrame * CFrame.Angles(0, 0, 90) + Vector3.new(0, 5, 0)) -- teleport log
                          --game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mil.Position + Vector3.new(0, 15, 0),mil.Position + Vector3.new(1, 0, 0)) -- teleport ontop of log
                          task.wait(0.5)
                          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mil.Position + Vector3.new(0, 0, 20),mil.Position + Vector3.new(1, 0, 0)) -- teleport away from sawmill
                        task.wait(1)
                        else
                          Instance.new("Highlight").FillColor = Color3.new(255, 0, 0) -- highlight bad wood section
                          Instance.new("Highlight").OutlineTransparency = 1 -- remove highlight outline (might be bugged doesn't turn transparent on krnl but no error and correct syntax)
                          Instance.new("Highlight").Parent = v:FindFirstChild("WoodSection") -- parent highlight to wood section
                          warn("!!! logs must be at least 0.3x1x0.3 !!!") -- give player information
                          warn("")
                      end
                      else
                        Instance.new("Highlight").FillColor = Color3.new(255, 0, 0) -- highlight bad wood section
                        Instance.new("Highlight").OutlineTransparency = 1 -- remove highlight outline (might be bugged doesn't turn transparent on krnl but no error and correct syntax)
                        Instance.new("Highlight").Parent = v:FindFirstChild("WoodSection") -- parent highlight to wood section
                        warn("!!! logs must be at least 0.3x1x0.3 !!!") -- give player information
                        warn("")
                    end
                    else
                      Instance.new("Highlight").FillColor = Color3.new(255, 0, 0) -- highlight bad wood section
                      Instance.new("Highlight").OutlineTransparency = 1 -- remove highlight outline (might be bugged doesn't turn transparent on krnl but no error and correct syntax)
                      Instance.new("Highlight").Parent = v:FindFirstChild("WoodSection") -- parent highlight to wood section
                      warn("!!! logs must be at least 0.3x1x0.3 !!!") -- give player information
                      warn("")
                  end
                  else -- this means the tree was not cut/de limbed before script was ran
                    for _,v3 in pairs(v:GetChildren()) do -- get everything in the bad log
                      if v3.Name == "WoodSection" then -- find woodselection
                        Instance.new("Highlight").FillColor = Color3.new(255, 0, 0) -- highlight bad wood sections
                        Instance.new("Highlight").OutlineTransparency = 1 -- remove highlight outline (might be bugged doesn't turn transparent on krnl but no error and correct syntax)
                        Instance.new("Highlight").Parent = v3 -- parent highlight to wood sections
                      end
                    end
                    warn("!!!a log was not de limbed!!!") -- give player information
                    warn("!!!de limb logs before using auto sawmill!!!")
                    warn("")
                    logcount = 0 -- reset count
                end
                  end
              end
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
            end
            
            function removehighlight()
            for _,v in pairs(game:GetService("Workspace").LogModels:GetDescendants()) do
              if v.Name == "Highlight" then
                v:destroy()
              end
            end
            end
            
            function VehicleSpawner(Color)
              if tostring(Color) == "Car Colors" then return print("Select a color") end
              AbortVehicleSpawner = false
              RespawnedCar = game:GetService("Workspace").PlayerModels.ChildAdded:connect(function(v)
                if v:WaitForChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
                  if v:WaitForChild("PaintParts") then
                    VehicleRespawnedColor = v.PaintParts:WaitForChild("Part")
                  end
                end
              end)
              
              VehicleSpawnerVal = Mouse.Button1Up:Connect(function()
                if Mouse.Target.Parent:FindFirstChild("Owner") then
                if Mouse.Target.Parent.Owner.Value == game.Players.LocalPlayer then
                  if Mouse.Target.Parent.Type.Value == "Vehicle Spot" then
                    SelectedSpawnPad = Mouse.Target
                    repeat
                      if AbortVehicleSpawner then VehicleSpawnerVal:Disconnect() RespawnedCar:Disconnect() return print("Aborted") end
                      game:GetService("ReplicatedStorage").Interaction.RemoteProxy:FireServer(SelectedSpawnPad.Parent.ButtonRemote_SpawnButton)
                      task.wait(1)
                    until VehicleRespawnedColor.BrickColor.Name == SelectedSpawnColor
                    GUI:Notification{
                      Title = "Vehicle Spawner",
                      Text = "Selected Car Spawned",
                      Duration = 4,
                      Callback = function() end
                    }
                    VehicleSpawnerVal:Disconnect()
                    RespawnedCar:Disconnect()
                  end
                end
              end
              end)
              end
            
            function WoodToBlueprint()
                OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                WTBClick = Mouse.Button1Up:Connect(function()
                    local Clicked = Mouse.Target
                    if Clicked.Name == "WoodSection" and Clicked.Parent:FindFirstChild("Owner") and Clicked.Parent.Owner.Value == game.Players.LocalPlayer then
                        SelectedPlank = Clicked
                    end
                    if Clicked.Name == "BuildDependentWood" or Clicked.Name == "Main" and Clicked.Parent:FindFirstChild("Type") and Clicked.Parent.Type.Value == "Blueprint" then
                        if Clicked.Parent:FindFirstChild("Owner") and Clicked.Parent.Owner.Value == game.Players.LocalPlayer then
                            SelectedBP = Clicked
                        end
                    end
                end)
                repeat task.wait() until tostring(SelectedPlank and SelectedBP) ~= "nil"
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(SelectedPlank.CFrame.p + Vector3.new(5,1,0))
                for i = 1,30 do
                    game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(SelectedPlank.Parent)
                    SelectedPlank.CFrame = SelectedBP.CFrame
                    game:GetService("ReplicatedStorage").Interaction.ClientIsDragging:FireServer(SelectedPlank.Parent)
                    task.wait()
                end
                WTBClick:Disconnect()
                SelectedPlank = nil; SelectedBP = nil
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
            end
            
            function LogsFound()
                for i,v in next, game:GetService("Workspace").LogModels:GetChildren() do
                    if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
                        return true
                    end
                end
                return false
            end
            
            
            function ViewEndTree(Val)
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "TreeRegion" then
                        for i,v in pairs(v:GetChildren()) do
                            if v:FindFirstChild("Owner") and tostring(v.Owner.Value) == "nil" then
                                if v:FindFirstChild("TreeClass") and tostring(v.TreeClass.Value) == "LoneCave" then
                                    if Val then
                                        game.Workspace.Camera.CameraSubject = v:FindFirstChild("WoodSection")
                                        else
                                        game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                                    end
                                end
                            end
                        end
                    end
                end
            end
            
            
            function ClickToSell(Val)
                if not Val then ClickToSellWoodClick:Disconnect() return end
                ClickToSellWoodClick = Mouse.Button1Up:Connect(function()
                    Clicked = Mouse.Target
                    if Clicked.Parent:FindFirstChild("Owner") and Clicked.Parent.Owner.Value == game.Players.LocalPlayer then
                        if Clicked.Parent:FindFirstChild("TreeClass") and Clicked.Parent:FindFirstAncestor("PlayerModels") or Clicked.Parent:FindFirstAncestor("LogModels") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Clicked.CFrame.p)
                            if Clicked.Parent:FindFirstAncestor("PlayerModels") then
                                for i = 1,30 do
                                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Clicked.Parent)
                                    Clicked.CFrame = CFrame.new(workspace.Stores.WoodRUs.Furnace:FindFirstChild("Big", true).Parent.CFrame.p)
                                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Clicked.Parent)
                                    task.wait()
                                end
                            elseif Clicked.Parent:FindFirstAncestor("LogModels") then
                                for i = 1,30 do
                                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Clicked.Parent)
                                    Clicked.Parent:MoveTo(workspace.Stores.WoodRUs.Furnace:FindFirstChild("Big", true).Parent.CFrame.p)
                                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Clicked.Parent)
                                    task.wait()
                                end
                            end
                        end
                    end
                end)
            end
        
            function ClearShopItems()
                for i,v in next, game:GetService("Workspace").Stores:GetChildren() do
                if v.Name == "ShopItems" then
                    for i,v in next, v:GetChildren() do
                        if v:FindFirstChild("Owner") and v.Owner.Value == nil then
                            spawn(function()
                                for i = 1,10 do
                                    game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v)
                                    v.Main.CFrame = v.Main.CFrame + Vector3.new(0,0,25)
                                    task.wait()
                                end
                            end)
                        end
                    end
                end
            end
            end
        
            function BringPlayer()
                local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                repeat wait()
                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent:SetPrimaryPartCFrame(game.Players[plrselected].Character.Head.CFrame,(game.Players.LocalPlayer.Character.HumanoidRootPart))
                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.Humanoid.SeatPart.CFrame * CFrame.Angles(math.rad(180),0,0))
                until game.Players[plrselected].Character.Humanoid.SeatPart
                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent:SetPrimaryPartCFrame(oldpos,(game.Players.LocalPlayer.Character.HumanoidRootPart))
            end
            
            function KillPlayer()
                function teleport(pos)
                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent:SetPrimaryPartCFrame(pos,(game.Players.LocalPlayer.Character.HumanoidRootPart))
                end
                repeat wait()
                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent:SetPrimaryPartCFrame(game.Players[plrselected].Character.Head.CFrame,(game.Players.LocalPlayer.Character.HumanoidRootPart))
                    game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.Humanoid.SeatPart.CFrame * CFrame.Angles(math.rad(180),0,0))
                until game.Players[plrselected].Character.Humanoid.SeatPart
                teleport(CFrame.new(-1675.2, 261.303, 1284.2))
            end
    
    local glow = Instance.new("ImageLabel")
    
    local UIGradient = Instance.new("UIGradient")
    
    function glowong()
    
    glow.Name = "glow"
    glow.Parent = game:GetService("CoreGui")["frosty is cute"].Main
    glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    glow.BackgroundTransparency = 1.000
    glow.Position = UDim2.new(0, -15, 0, -15)
    glow.Size = UDim2.new(1, 30, 1, 30)
    glow.ZIndex = 0
    glow.Image = "rbxassetid://5028857084"
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(24, 24, 276, 276)
    
    
    
    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 0, 153)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(204, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(51, 0, 255)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 106, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 102)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(51, 255, 0)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(204, 255, 0)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(228, 137, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
    UIGradient.Rotation = 45
    UIGradient.Parent = glow
    task.spawn(function()
      while task.wait() do
        twes(UIGradient,{Rotation=UIGradient.Rotation+360},"Linear","In",6)
        wait(6)
      end
    
    
    game:GetService('TweenService'):Create(UIGradient,TweenInfo.new(tim,Enum.EasingStyle[style],Enum.EasingDirection[dir]),changes):Play()
    end)
    
    end
    
    

    


                


    --#endregion
            
           
        
               --#region Server hop
            local PlaceID = game.PlaceId
            local AllIDs = {}
            local foundAnything = ""
            local actualHour = os.date("!*t").hour
            local Deleted = false
            local File = pcall(function()
                AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
            end)
            if not File then
                table.insert(AllIDs, actualHour)
                writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
            end
            function TPReturner()
                local Site;
                if foundAnything == "" then
                    Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                else
                    Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                end
                local ID = ""
                if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                    foundAnything = Site.nextPageCursor
                end
                local num = 0;
                for i,v in pairs(Site.data) do
                    local Possible = true
                    ID = tostring(v.id)
                    if tonumber(v.maxPlayers) > tonumber(v.playing) then
                        for _,Existing in pairs(AllIDs) do
                            if num ~= 0 then
                                if ID == tostring(Existing) then
                                    Possible = false
                                end
                            else
                                if tonumber(actualHour) ~= tonumber(Existing) then
                                    local delFile = pcall(function()
                                        delfile("NotSameServers.json")
                                        AllIDs = {}
                                        table.insert(AllIDs, actualHour)
                                    end)
                                end
                            end
                            num = num + 1
                        end
                        if Possible == true then
                            table.insert(AllIDs, ID)
                            wait()
                            pcall(function()
                                writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                wait()
                                game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                            end)
                            wait(4)
                        end
                    end
                end
            end
            
            function Teleport()
                while wait() do
                    pcall(function()
                        TPReturner()
                        if foundAnything ~= "" then
                            TPReturner()
                        end
                    end)
                end
            end
           --#endregion
        
        
    
               --#region Save shit
        getgenv().Settings = {
            rgbthin = true,
            keytoc = "RightShift",
            flykey = "Q",
            flyspeednums = "50",
            SprintSpeednums = "65",
            daystuff = false,
            nightstuff = false,
            nofogst = false,
        };
            
            local function SaveSettings()
            local JSON -- is nil
            local HttpService = game:service('HttpService') -- used for the JSON DECODE AND ENCODE
            --Decode
            JSON = HttpService:JSONEncode(getgenv().Settings)
            --Make a text file using 'writefile'
            writefile('Butter.txt',JSON)
            end
            
            local function LoadSettings()
            local HttpService = game:service('HttpService')
            
            --use 'isfile' to check if we are reading the correct txt file
            
            if isfile('Butter.txt') then
            --use 'readfile' to read 'TUTORIAL.txt' and decode it
            getgenv().Settings = HttpService:JSONDecode(readfile('Butter.txt'))
            end
            end
            
            --LOAD SETTINGS
            
            --change settings
            
            --save
       
            --Check Console
            
            --print(getgenv().Settings.WalkSpeed)
            
            
            --REJOIN AND REMOVE THE CHANGE SETTINGS AND SAVE SETTINGS.
    --#endregion
        
    
    
               --#region UI
            local NameT = "Butter"
            
            if game.Players.LocalPlayer.UserId == 4172004550 or game.Players.LocalPlayer.UserId == 440361410 or game.Players.LocalPlayer.UserId == 264766302 or game.Players.LocalPlayer.UserId == 424570617 then
            NameT = "Butter│Admin"
            else
            NameT = "Butter"
            end
            
            local ui = library:new(NameT)
            
            local Home = ui:Tab('Home','6035145364')
            glowong()
            local Home1 = Home:section('Credits',true)
            
            local Label = Home1:Label("Leader/Maker of project Applebox#0001.")
            local Label = Home1:Label("ALL of the developers that helped Butter")
            local Label = Home1:Label("Applebox, silent ben8x, Becky, nleant_nlant, tip, billybob123,")
            local Label = Home1:Label("Beta testers Gamer,")
            
            local Home2 = Home:section('Settings',true)
            
            
            Home2:Button('Reset config', function()
                delfile("Butter.txt")
            end)
            
            LoadSettings()
            Home2:Toggle('Glow', '', getgenv().Settings.rgbthin, function(Value)
    
            if Value == "" then
            glow.Visible = true
            else
            getgenv().Settings.rgbthin = Value
            glow.Visible = Value
            SaveSettings()
            end
            end)
            
            if getgenv().Settings.rgbthin == false then
            glow.Visible = false
            end
            
            Home2:Keybind("Toggle UI", Enum.KeyCode.Delete, function(Value)
                getgenv().Settings.keytoc = Value
                ToggleUILib()
                SaveSettings()
            end)
           
            Home2:Button('Rejoin', function()
               game:GetService("TeleportService"):Teleport(game.PlaceId,game:GetService("Players").LocalPlayer)
            end)
           
            Home2:Button('Server hop', function()
               Teleport()
            end)
        
            local Home3 = Home:section('Devlog',true)
        
            local Label = Home3:Label("New 22.0 update!")
            --local Label = Home3:Label("")
           
            local Player = ui:Tab('Player','6034287594')
            
            local Teleports = ui:Tab('Teleports','6034287594')
            
            local WorldTab = ui:Tab('WorldTab','6034287522')

            local Timerstab = ui:Tab('Timers','6761866149')
            
            local Slot = ui:Tab('Slot','6034333276')
            
            local AutoBuyg = ui:Tab('Auto Buy','6031265983') -- had to put a G
            
            local WoodTab = ui:Tab('Wood','6034503369')
            
            local AutoBuild = ui:Tab('AutoBuild','6035067834')
            
            local Vehicle = ui:Tab('Vehicle','6034754441')
            
            local ItemTab = ui:Tab('Item','11145825488')
            
            local Sortertab = ui:Tab('Sorter','11145825488')
            
            local DupeTab = ui:Tab('Dupe','6035053278')
        
            local Trollingtab = ui:Tab('Trolling','6034687957')
            
            --#endregion
        
        
            
               --#region section tab
            
            local Player1 = Player:section('Movement',true)
            local Player2 = Player:section('Misc',true)
            
            
            local Teleports1 = Teleports:section('Teleports',true)
            
            
            local AutoBuild1 = AutoBuild:section('Build',true)
            local AutoBuild2 = AutoBuild:section('Build Help',true)
            
            
            local WorldTab1 = WorldTab:section('World',true)
            local WorldTab2 = WorldTab:section('Watter',true)
            


            local Timerstab1 = Timerstab:section('Timers',true)
            

            local Slot1 = Slot:section('Fast load',true)
            local Slot2 = Slot:section('slot',true)
            
            
            local Vehicle1 = Vehicle:section('Vehicle',true)
            local Vehicle2 = Vehicle:section('Vehicle Spawner',true)
            
            
            local Dupetab1 = DupeTab:section('Dupe',true)
            local Dupetab2 = DupeTab:section('SoldSign Dupe',true)
        
            local Trollingtab1 = Trollingtab:section('Trolling',true)
            
            local ItemTab1 = ItemTab:section('Teleport',true)
            local ItemTab2 = ItemTab:section('Options',true)
            
            local Sortertab1 = Sortertab:section('Sorter',true)
            
            local Autobuy1 = AutoBuyg:section('AutoBuy',true)
            local Autobuy2 = AutoBuyg:section('Buying Misc',true)
            
            local Woodtab1 = WoodTab:section('Get tree',true)
            local Woodtab2 = WoodTab:section('Tree Tp',true)
            local Woodtab3 = WoodTab:section('Tree help',true)
            
            --#endregion
            
            
            
               --#region Player tab
            getgenv().ison = true
            
            Nspeed = 16
            
            NSspeed = 65
            
            Player1:Slider('Walkspeed', 'WalspeedSlider', 16, 16, 250,false, function(Value)
            if getgenv().ison == true then
            Nspeed = Value
            getgenv().Speed = Value
            Walkspeed()
            else
            getgenv().SprintSpeed = getgenv().Speed
            Nspeed = Value
            getgenv().Speed = Value
            Walkspeed()
            end
            end)
        
            
            getgenv().SprintSpeed = getgenv().Settings.SprintSpeednums
    
            SprintSpeedsets = Player1:Slider('SprintSpeed', 'SSpeed', getgenv().Settings.SprintSpeednums, 16, 250,false, function(Value)
            getgenv().Settings.SprintSpeednums = Value
            NSspeed = Value
            if getgenv().ison == false then
            
            else
            getgenv().SprintSpeed = Value
            end
            end)
    
            SprintSpeedsets:SetValue(getgenv().Settings.SprintSpeednums)
    
    
            local userInput = game:GetService("UserInputService")
            
            local function beginSprint(input, gameProcessed)
            
                if not gameProcessed then        
            
                    if input.UserInputType == Enum.UserInputType.Keyboard then
            
                        local keycode = input.KeyCode
            
                        if keycode == Enum.KeyCode.LeftShift then
                            if not game:GetService("Players").LocalPlayer.PlayerGui.ItemDraggingGUI.CanRotate.Visible then
                                getgenv().Speed = getgenv().SprintSpeed
                                Walkspeed()
                            else
                                getgenv().Speed = 0
                                Walkspeed()
                            end
                        end
            
                    end
            
                end
            end
            
            
            
            
            
            local function endSprint(input, gameProcessed)
            
                if not gameProcessed then
            
                    if input.UserInputType == Enum.UserInputType.Keyboard then
            
                        local keycode = input.KeyCode
            
                        if keycode == Enum.KeyCode.LeftShift then
            
                            getgenv().Speed = Nspeed
                            Walkspeed()
                        end
            
                    end
            
                end
            
            end
            
            
            
            userInput.InputBegan:Connect(beginSprint)
            
            userInput.InputEnded:Connect(endSprint)
            
            Player1:Slider('Jump Power', 'JumpPowerSlider', 50, 50, 1000,false, function(Value)
            JumpPower(Value)
            end)
    
            maxspeed = getgenv().Settings.flyspeednums
    
            flyspeedsets = Player1:Slider('Flight Speed', 'Flight Slider', getgenv().Settings.flyspeednums, 50, 250,false, function(Value)
            maxspeed = Value
            getgenv().Settings.flyspeednums = Value
            end)
            flyspeedsets:SetValue(getgenv().Settings.flyspeednums)
    
            Player1:Toggle('Sprint', '', true, function(Value)
                getgenv().ison = Value
                if not Value then
                getgenv().SprintSpeed = Nspeed
                end
                
                if Value then
                getgenv().SprintSpeed = NSspeed
                end
            end)
            
                    
            Player1:Toggle('Flight' ,'', false, function(Value)
                FlyingEnabled = Value
            end)
    
            Player1:Toggle('Infinite Jump', 'infj', false, function(Value)
            InfiniteJump(Value)
            end)
            
    
            Flyingkey = getgenv().Settings.flykey
    
            Player1:Keybind("Flight keybind", Enum.KeyCode.Q, function(Value)
            getgenv().Settings.flykey = Value
            Flyingkey = string.lower(Value)
            SaveSettings()
            end)
    
    
            Player1:Toggle('NoClip', '', false, function(Value)
            NoClip(Value)
            end)
            
            
            Player2:Toggle('Anti AFK', '', true, function(Value)
            AntiAFK(Value)
            end)
            
            
            Player2:Toggle('Light', '', false, function(Value)
            Light(Value)
            end)
            
            Player2:Button('Safe death', function()
                game.Players.LocalPlayer.Character.Head:Remove()
            end)
            
            Player2:Toggle('Custom Dragger', '', false, function(Value)
                CustomDragger = Value
            end)
            Dragger()
            
            Player2:Button('BTools', function()
                BTools()
            end)
            --#endregion
            
            
            
               --#region World Tab
        
        game.Lighting.Changed:Connect(function()
                if AlwaysDay then
                    game.Lighting.TimeOfDay = "12:00:00"
                    game.Lighting.SunPos.Value = 1
                    
                    game:GetService("Lighting").Ambient = Color3.new(1, 1, 1)
                    game:GetService("Lighting").ColorShift_Bottom = Color3.new(1, 1, 1)
                    game:GetService("Lighting").ColorShift_Top = Color3.new(1, 1, 1)
                end
                if AlwaysNight then
                    game.Lighting.TimeOfDay = "00:00:00"
                    game.Lighting.SunPos.Value = -1
                end
                if NoFog then
                    game.Lighting.FogEnd = 100000
                end
        end)
    
            AlwaysDay = getgenv().Settings.daystuff
        
            daythin = WorldTab1:Toggle('Day', '', getgenv().Settings.daystuff, function(Value)
            if Value == "" then
            AlwaysDay = true
            else
            getgenv().Settings.daystuff = Value
            AlwaysDay = Value
            SaveSettings()
            end
            end)
            
            AlwaysNight = getgenv().Settings.nightstuff
    
            nightthin = WorldTab1:Toggle('Night', '', getgenv().Settings.nightstuff, function(Value)
            if Value == "" then
            AlwaysNight = true
            else
            getgenv().Settings.nightstuff = Value
            AlwaysNight = Value
            SaveSettings()
            end
            end)
            
            NoFog = getgenv().Settings.nofogst
            
            WorldTab1:Toggle('No Fog', '', getgenv().Settings.nofogst, function(Value)
            if Value == "" then
            NoFog = true
            else
            getgenv().Settings.nofogst = Value
            NoFog = Value
            SaveSettings()
            end
            end)
            
    
            WorldTab1:Toggle('Shadows', '', true, function(Value)
            game:GetService("Lighting").GlobalShadows = Value
            end)
            
            WorldTab1:Toggle('Bridge', '', false, function(Value)
            BridgeDown(Value)
            end)
            
            
            WorldTab1:Button('Better Graphics', function()
                BetterG()
            end)
            
            WorldTab2:Button('Better Water', function()
                    for i,v in next, game.Workspace:GetDescendants() do
                    if v:IsA("Part") and v.Name == "SeaSand" then
                    v.Size = Vector3.new(2048, 60, 2048)
                end
                end
            
                for i,v in next, game.Workspace:GetDescendants() do
                if v:IsA("Part") and v.Name == "Water" then
                    v.Size = Vector3.new(20480, 6, 20080)
                    game.Workspace.Terrain:fillBlock(v.CFrame, v.Size, Enum.Material.Water)
                    v:Destroy()
                end
                end
            end)
            
            WorldTab2:Toggle('Walk On Water', '', false, function(Value)
                WalkOnWater(Value)
            end)
            
            WorldTab2:Toggle('Remove Water', '', false, function(Value)
                RemoveWater(Value)
            end)
            --#endregion
            
            

               --#region Timers Tab 

               local watercar = Timerstab1:Label("Ferry Departure:")

               local loadtimer = Timerstab1:Label("Canload:")

            task.spawn(function()
               while task.wait(0.5) do
               watercar.Text = "Ferry Departure: " .. tostring(game:GetService("Workspace").Ferry.TimeToDeparture.Value) .. " Seconds"
               if game:GetService("ReplicatedStorage").LoadSaveRequests.ClientMayLoad:InvokeServer(game.Players.LocalPlayer) then
                loadtimer.Text = "you can load"
                else
                loadtimer.Text = "you cant load"
                end
               end
            end)
            --#endregion

          
            
               --#region Slot tab
            slottt = Slot1:Slider('Slot Number', '', 1, 1, 6,false, function(Value)
                slot2NUM = Value
            end)
            
            skil = Slot1:Toggle('Fast Load', '', false, function(state)
                skipLoading = state
            end)
            
            Slot1:Button('Load Base', function()
            LoadSlot(slot2NUM)
            end)
            
            Slot2:Button('Free Land', function()
            FreeLand()
            end)
            
            Slot2:Button('Max Land', function()
            MaxLand()
            end)
            
            Slot2:Button('Sell Sold Sign', function()
            SellSoldSign()
            end)
            --#endregion
            

            
               --#region Vehicle tab
            Vehicle1:Slider('Vehicle speed', '', 1, 1, 5,false, function(Value)
            VehicleSpeed(Value)
            end)
            
            --GET PLAYERS table
            function GetPlrs()
                local Plrs = {}
                for i,v in next, game.Players:GetPlayers() do
                    if not table.find(Plrs,v.Name) then
                        table.insert(Plrs,v.Name)
                    end
                end
                return Plrs
            end
            --
            
            
            
            Vehicle1:Dropdown('Teleport Vehicle to Player', "Select...", GetPlrs(), function(v)
            carTP(v.Character.HumanoidRootPart.CFrame)
            end)
            
            
            Vehicle1:Dropdown("Teleport Vehicle to Player's Plot", "Select...", GetPlrs(), function(ve)
                    for i,v in next, game:GetService("Workspace").Properties:GetChildren() do
                    if v:FindFirstChild("Owner") then
                        if v.Owner.Value == ve then
                        carTP(v.OriginSquare.CFrame)
                    end
                end
                end
            end)
            
            Vehicle1:Toggle('Vehicle Fly', '', false, function(v)
                  if v == true then
                player = game.Players.LocalPlayer
                humanoid = player.Character.Humanoid
                if humanoid.Seated then
                local CurrentSeat = player.Character.Humanoid.SeatPart
                    if CurrentSeat and CurrentSeat.Parent.Type.Value == "Vehicle" then
                NOFLY()
            wait()
            sFLY(true)
                end
                end
              else
                NOFLY()
              end
            end)
            
            Vehicle1:Slider('Vehicle Fly Speed', '', 16, 16, 250,false, function(v)
                iyflyspeed = v
                vehicleflyspeed = v
            end)
            
            Vehicle1:Button('Flip Vehicle', function()
             FlipVehcile()
            end)
            
            
            Vehicle2:Dropdown('Car Colors', "Select...", {"Medium stone grey","Sand green","Sand red","Faded green","Dark grey metallic","Dark grey","Earth yellow","Earth orange","Silver","Brick yellow","Dark red","Hot pink",}, function(Value)
            SelectedSpawnColor = tostring(Value)
            return
            end)
            
            Vehicle2:Button('Start Vehicle Spawner', function()
            notifications:message{
                Title = "Butter",
                Description = "butter",
                Icon = 6023426926
            }
            VehicleSpawner(SelectedSpawnColor)
            end)
            
            Vehicle2:Button('Abort Vehicle Spawner', function()
             AbortVehicleSpawner = true
            end)
            --#endregion
            
        
            
               --#region DUPE tab
            local Label = Dupetab1:Label("if you have over 9 in your inventory at once you will be banned")
            
            Dupetab1:Slider('How many Dupes', '', 0, 0, 30,false, function(Value)
            AxeDupeAmount = Value
            end)
            
            Dupetab1:Slider('Slot number', '', 0, 0, 6,false, function(Value)
            slotnumberr = Value
            end)
            
            Dupetab1:Slider('Wait Time', '', 0, 0, 10,false, function(Value)
            timewhitt = Value
            end)
            
            Dupetab1:Button('Dupe Inventory', function()
            Dupe(slotnumberr,AxeDupeAmount,timewhitt)
            end)
            
            
            
             function CountAxesL(TESTPLERR)
                    Amount = 0
                        for a,b in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if b.Name ~= "BlueprintTool" and b.Name == "Tool" then
                                Amount = Amount + 1
                            end
                        end
                notifications:message{
                Title = "Butter",
                Description = 'You have ' ..Amount.. " axes in your Backpack",
                Icon = 6023426926
            }
            end
            
            
            Dupetab1:Button('Count your Axes', function()
            CountAxesL()
            end)
            
            function DropAllTools()
                for i,v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
                    if v:IsA("Tool") and v.Name == "Tool" then
                        repeat 
                            game:GetService("ReplicatedStorage").Interaction.ClientInteracted:FireServer(v,"Drop tool",game.Players.LocalPlayer.Character.Head.CFrame)
                            task.wait()
                        until v.Parent == nil
                        task.wait()
                    end
                end
            end
            
            Dupetab1:Button('DropAxes', function()
                DropAllTools()
            end)



            Dupetab2:Dropdown('Main', "Select...", GetPlrs(), function(Value)
                getgenv().Nameforsingdupe = Value
            end)

            Dupetab2:Slider('Best slot', '', 1, 1, 6,false, function(Value)
                getgenv().bestnummfordupe = Value
            end)

            
            Dupetab2:Toggle('Start', '', false, function(Value)
                getgenv().SoldSignAutoFarm = Value
                startnewdupe()
            end)

            Dupetab2:Button('Count SoldSigns', function()
            Signstuff()
            end)



              --#endregion
    
              
        
               --#region Trolling tab
        
        Trollingtab1:Toggle('ClearAllShopItems', '', false, function(Value)
            ClearAllShopItems = Value
            if Value then
                ClearShopItems()
            end
        end)
        
        Trollingtab1:Dropdown("Player", "Select...", GetPlrs(), function(Value)
        plrselected = Value
        end)
        
        Trollingtab1:Button('BringPlayer', function()
            BringPlayer()
        end)
        
        Trollingtab1:Button('KillPlayer', function()
            KillPlayer()
        end)
        
        --#endregion
        
        
            
               --#region Autobuy tab 
            
            
            
            
            Autobuy1:Slider('Amount', '', 1, 1, 100,false, function(Value)
            AutoBuyAmount = Value
            end)

            AOpenbox = false

            Autobuy1:Toggle('Open box', '', false, function(Value)
            AOpenbox = Value
            end)
            
            Autobuy1:Dropdown("Select Item", "Select...", GrabShopItems(), function(Value)
            ItemToBuy = string.split(Value," - ")[1]
                return
            end)
            
            Autobuy1:Button("Phurchase Selected Item(s)", function()
            AutoBuy(ItemToBuy,AutoBuyAmount,AOpenbox)
            end)
    
            Autobuy1:Button("Phurchase All Blueprints", function()
                for i,v in next, GetBlueprints() do
                AutoBuy(v,1,true,true)
                end
            end)
            
            Autobuy1:Button("Abort Phurchasing", function()
            AbortAutoBuy = true
            end)
            
            
            Autobuy2:Button("Toll Bridge", function()
            Pay(15)
            end)
            
            Autobuy2:Button("Ferry Ticket", function()
            Pay(13)
            end)
            
            Autobuy2:Button("Power Of Ease", function()
            Pay(3)
            end)
            
            --#endregion
            
            
            
               --#region Teleports tab
            Teleports1:Dropdown("Teleport to waypoints", "Select...", {"The Den", "Lighthouse", "Safari", "Bridge", "Bob's Shack", "EndTimes Cave", "The Swamp", "The Cabin", "Volcano", "Boxed Cars", "Tiaga Peak", "Land Store", "Link's Logic", "Palm Island", "Palm Island 2", "Palm Island 3", "Fine Art Shop", "SnowGlow Biome", "Cave", "Shrine Of Sight", "Fancy Furnishings", "Docks", "Strange Man", "Wood Dropoff", "Snow Biome", "Wood RUs", "Green Box", "Spawn", "Cherry Meadow", "Bird Cave",}, function(Value)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = WaypointsPositions[Value]
                return
            end)
            
            Teleports1:Dropdown("Teleport to Player", "Select...", GetPlrs(), function(Value)
                TeleportToPlayer(Value)
                return
            end)
            
            Teleports1:Dropdown("Teleport to Player Base", "Select...", GetPlrs(), function(Value)
                TeleportToBase(Value)
                return
            end)
            --#endregion
            
            
            
               --#region WOOD TAB
            Woodtab1:Dropdown("Select Item", "Select...", {"Generic", "Walnut", "Cherry", "SnowGlow", "Oak", "Birch", "Koa", "Fir", "Volcano", "GreenSwampy", "CaveCrawler", "Palm", "GoldSwampy", "Frost", "Spooky", "LoneCave",}, function(Value)
                getTree = Value
                return
            end)
        
            --woodnummath = 0
            
            Woodtab1:Button("Bring Tree", function()
            BringTreetime = tick()
            for i = 1,sdasdsad do
            wait() 
            bringTree(getTree)
            ResizeBar(i,sdasdsad)
            end
            notifications:message{Title = "Butter",Description = "Done in ".. string.format('%.1fs', tick() - BringTreetime),Icon = 6023426926}
            end)
            
            Woodtab1:Slider('Amount', '', 1, 1, 30,false, function(Value)
            sdasdsad = Value
            end)
            sdasdsad = 1
        
            Woodtab1:Button("Abort", function()
            treestop = false
            wait(0.4)
            treestop = true
            end)
            
            
            Woodtab2:Toggle('Cut Plank to one by one', '', false, function(Value)
                notifications:message{
                    Title = "Butter",
                    Description = "Click a plank cut one by one",
                    Icon = 6023426926
                }
            UnitCutter = Value
            OneUnitCutter(Value)
            end)
            
            
            Woodtab2:Toggle('Click To Sell', '', false, function(Value)
            ClickToSell(Value)
            end)
            
            Woodtab2:Button("Bring All Logs", function()
            BringAllLogs()
            end)
            
            Woodtab2:Button("Sell All Logs", function()
            SellAllLogs()
            end)
            
            Woodtab2:Button("Bring All Planks", function()
            BringAllPlanks()
            end)
            
            Woodtab2:Button("Sell All Planks", function()
            SellAllPlanks()
            end)
            
            Woodtab3:Button('DickmemberTree', function()
              notifications:message{
                  Title = "Butter",
                  Description = "Click a Tree to Cut",
                  Icon = 6023426926
              }
              DicmemberTree()
              end)
            
            Woodtab3:Button("Auto Sawmill if you move your Sawmill reload", function()
              -- shit method of getting sawmill
              -- change this with your selector thing
              -- has to be sawmax 02 L
              for _,v in pairs(game:GetService("Workspace").PlayerModels:GetDescendants()) do
                if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer and v.Name == "Sawmill4L" then
                  mil = v.Main
                  print("got mill")
                  mil.Parent.BlockageAlert.CanCollide = false
                  mil.Parent.BlockageAlert.Transparency = 0
                end
              end
              
              
              -- make parts no collide
              for _,v in pairs(mil.Parent.Parts:GetDescendants()) do
                if v.Size == Vector3.new(7.200000286102295 , 0.40000003576278687 ,2.4000000953674316) then
                  print("wedge got")
                  v.CanCollide = false
                  else
              
                  if v.Size == Vector3.new(0.10004663467407227, 0.40000009536743164, 1.4000000953674316) then
                    print("blockage got")
                    v.CanCollide = false
                    else
              
                    if v.Size == Vector3.new(2.3999977111816406,0.3999999761581421, 3.1999998092651367) then
                      print("wedge under got")
                      v.CanCollide = false
                      else
              
                      if v.Size == Vector3.new(16.599998474121094, 0.40000009536743164,7.199999809265137) then
                        print("long part got")
                        v.Transparency = 0
                        v.CanCollide = false
                        else
              
                        if v.Size == Vector3.new(7.200000286102295, 0.39999979734420776, 0.6000000238418579) then
                          print("long wedge got")
                          v.Transparency = 0
                          v.CanCollide = false
                        end
                      end
                    end
                  end
                end
              end
            
            SMBringAllPlanks()
            removehighlight()
            end)
            
            function UnitChecker(Val)
                if not Val then UnitCheckerClick:Disconnect() return end
                UnitCheckerClick = Mouse.Button1Up:Connect(function()
                    Clicked = Mouse.Target
                    Count = 0
                    if Clicked.Parent:FindFirstChild("TreeClass") then
                        for i,v in next, Clicked.Parent:GetChildren() do
                            if v.Name == "WoodSection" then
                                Count = Count + v.Size.X - (v.Size.Y * v.Size.Z)
                            end
                        end
                        notifications:message{
                            Title = "Butter",
                            Description = "Units "..math.round(Count),
                            Icon = 6023426926
                        }
                    end
                end)
            end
            
            
            Woodtab3:Toggle('Unit Checker', '', false, function(Value)
                UnitChecker(Value)
            end)
            
            Woodtab3:Toggle('View LoneCave Tree', '', false, function(Value)
                ViewEndTree(Value)
            end)
            
            --#endregion
    
    
    
               --#region keybinds
            CAMisEnabled = false
    
            function toggleFeature()
              CAMisEnabled = not CAMisEnabled
              if CAMisEnabled then
                camon()
              else
                camoff()
              end
            end
            
            -- Connect the function to a keybind
            game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
            if gameProcessedEvent then return end -- Ignore input if another part of the game is using it
            if input.KeyCode == Enum.KeyCode.C then
              toggleFeature()
            end
            end)
    --#endregion
    
    
    
               --#region math.random tips
            task.spawn(function()
            wait(5)
            local tips = math.random(1,7)
            if (tips == 1) then
            notifications:message{Title = "Did you know",Description = "Lumber Tycoon came out 14 years ago",Icon = 6023426926}
            elseif (tips == 2) then
            notifications:message{Title = "Did you know",Description = "Butter hub has a Discord server https://discord.gg/butterhub",Icon = 6023426926}
            elseif (tips == 3) then
            notifications:message{Title = "Did you know",Description = "The oldest GIFT in the game is the fire present",Icon = 6023426926}
            elseif (tips == 4) then
            notifications:message{Title = "Did you know",Description = "The owner of butter Hub is Applebox#0001 and Gamer",Icon = 6023426926}
            elseif (tips == 5) then
            notifications:message{Title = "Did you know",Description = "the best Lumber Tycoon shop is https://discord.gg/dhSPN8dZS3",Icon = 6023426926}
            elseif (tips == 6) then
            notifications:message{Title = "Did you know",Description = "Butter is good",Icon = 6023426926}
            elseif (tips == 7) then
            notifications:message{Title = "Did you know",Description = "Love Becky",Icon = 6023426926}
            end
            end)
            --#endregion
