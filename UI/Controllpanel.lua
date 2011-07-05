print("Welcome to LibraDemo. Controllpanel loading...")
local params = {["titletext"]="Controllpanel", ["size"]={["height"]=100, ["width"]=100}}
local window = Libra.UI.Window:Create(params)
--window:Resize(200,500)
window:Show()

local context = UI.CreateContext("foo")
print("ContextWidth:" .. UIParent:GetWidth())
print("ContextHeight:" .. UIParent:GetHeight())
window:SetToCenter()