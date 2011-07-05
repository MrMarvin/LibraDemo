Libra = LibStub:GetLibrary("Libra-alpha")

LibraDemo = Libra.Addon:Create("LibraDemo")

local function generalSlashCommandTaker(commandline)
  --print("Commandline caught: "..commandline)
  
  if commandline:match(".*show.*") then
    wControllpanel:toggleVisibility()
  end
end

LibraDemo:RegisterSlashCommand("LibraDemo","LibraDemo",generalSlashCommandTaker,"LibraDemo description text" )
