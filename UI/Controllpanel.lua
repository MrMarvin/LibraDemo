print("Welcome to LibraDemo. Controllpanel loading...")
local params = {["titletext"]="Controllpanel", ["size"]={["height"]=100, ["width"]=200}}
wControllpanel = Libra.UI.Window:Create(params)
--wControllpanel:Resize(200,500)
wControllpanel:Show()

--local context = UI.CreateContext("foo")
--print("ContextWidth:" .. UIParent:GetWidth())
--print("ContextHeight:" .. UIParent:GetHeight())
wControllpanel:SetToCenter()
wControllpanel:MoveRelative(-250,0)