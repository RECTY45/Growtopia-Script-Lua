wrenchkick = false

function hook(varlist)
if varlist[1]:find("add_button|report_player|") then
if wrenchkick == true then
sendPacket(false, "action|dialog_return\ndialog_name|popup\nnetID|"..varlist[1]:match("netID|(%d+)").."|\nnetID|"..varlist[1]:match("netID|(%d+)").."|\nbuttonClicked|kick",2)
return true
end
end
end

function renderhook()
ImGui.Begin("wrench kick")
if ImGui.Button("toggle wrenchkick") then
if wrenchkick == false then
wrenchkick = true
else
wrenchkick = false
end
end
ImGui.End()
end

addHook("Render", "renderhook", renderhook)
addHook("OnVarlist", "varlisthook", hook)


