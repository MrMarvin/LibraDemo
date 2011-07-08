print("Welcome to LibraDemo. Controllpanel loading...")
local params = {["titletext"]="Controllpanel", ["size"]={["height"]=200, ["width"]=300}}
wControllpanel = Libra.UI.Window:Create(params)

local wControllpanelContentFrame = Libra.UI.FrameManager:Create("wControllpanel Content Frame", wControllpanel)

local numBox = Libra.UI.NumberBox:Create(wControllpanelContentFrame)
numBox:SetValue(10)
numBox:SetPoint("TOPLEFT",wControllpanelContentFrame, "TOPLEFT",5,5)
numBox:SetLayer(wControllpanelContentFrame:GetLayer()+1)

local createButton = Libra.UI.Button:Create(wControllpanelContentFrame)
createButton:SetText("create!")
createButton:SetPoint("TOPLEFT",numBox,"TOPRIGHT",5,0)

wControllpanel:SetContent(wControllpanelContentFrame) 
wControllpanel:SetToCenter()
wControllpanel:MoveRelative(-250,(-1/2)*wControllpanel:GetHeight())
wControllpanel:Show()

-- make sure there is the table with all the windows
if not demoWindows then
  demoWindows = {}
end


function createButton.Event:LeftUp() 
  -- create all the windows
  for w=1,numBox:GetValue() do
    local params = {
      ["titletext"]="Example Window "..w, 
      ["size"]={
        ["height"]=100,
        ["width"]=200},
      ["movable"]=true}
    local newWindow = Libra.UI.Window:Create(params)
    newWindow:Show()                        
    -- initialise the random generator with something more or less unique...
    math.randomseed(Inspect.System.Time()*42)
    -- set the windows to random positions
    newWindow:SetTo(math.random(UIParent:GetWidth()-newWindow:GetWidth()),math.random(UIParent:GetHeight()-newWindow:GetHeight()))
    -- add the new windo to the table with all the windows
    table.insert(demoWindows,newWindow)
  end
end
