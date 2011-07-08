Libra = LibStub:GetLibrary("Libra-alpha")

LibraDemo = Libra.Addon:Create("LibraDemo")

--------------------------------------------------------------------------------------
-- function to catch command lines and than use apropriate functions for each keyword
--------------------------------------------------------------------------------------                             
local function generalSlashCommandTaker(commandline)
  --print("Commandline caught: "..commandline)
  
  if commandline:match(".*show.*") then
    LibraDemo:toggleVisibility()
  elseif commandline:match(".*setDemoText.*") then
    LibraDemo:setDemoText(commandline)
  end
end

LibraDemo:RegisterSlashCommand("LibraDemo","LibraDemo",generalSlashCommandTaker,"LibraDemo description text" )


--------------------------------------------------------
-- Function to catch the toogleVisibility Commandline
-------------------------------------------------------- 
function LibraDemo:toggleVisibility()
  wControllpanel:toggleVisibility()
  if demoWindows then
    
    for k,v in ipairs(demoWindows) do
      v:toggleVisibility()
    end
  end
end

--------------------------------------------------------
-- Function to set the demotext to the windows
--------------------------------------------------------
function LibraDemo:setDemoText(commandline) 
  print("setting demoText to: "..commandline:sub(#('setDemoText')+2)) 
   for k,v in ipairs(demoWindows) do
      v:Hide()
      dump(v.content)
      if not v.content.SetText then
        local text = Libra.UI.FrameManager:Create('Text', v)
        text:SetText(commandline:sub(#('setDemoText')+2))
        v:SetContent(text)
      else
        v.content:SetText(commandline:sub(#('setDemoText')+2))
      end
      v:Show()
    end
end
