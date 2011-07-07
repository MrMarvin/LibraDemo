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

function createButton.Event:LeftUp()
  if not windows then
    windows = {}
    for w=1,numBox:GetValue() do
      local params = {
        ["titletext"]="Example Window "..w, 
        ["size"]={
          ["height"]=100,
          ["width"]=200},
        ["movable"]=true}
      local newWindow = Libra.UI.Window:Create(params)
      newWindow:Show()
      math.randomseed(Inspect.System.Time())
      newWindow:SetTo(math.random(UIParent:GetWidth()-newWindow:GetWidth()),math.random(UIParent:GetHeight()-newWindow:GetHeight()))
      table.insert(windows,newWindow)
    end
  end 
end
 
wControllpanel:SetContent(wControllpanelContentFrame) 
wControllpanel:SetToCenter()
wControllpanel:MoveRelative(-250,(-1/2)*wControllpanel:GetHeight())
wControllpanel:Show()