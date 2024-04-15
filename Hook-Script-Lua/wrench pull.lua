wrenchpull = false

function hook(varlist)
if varlist[1]:find("add_button|report_player|") then
if wrenchpull == true then
sendPacket(false, "action|dialog_return\ndialog_name|popup\nnetID|"..varlist[1]:match("netID|(%d+)").."|\nnetID|"..varlist[1]:match("netID|(%d+)").."|\nbuttonClicked|pull",2)
return true
end
end
end

function renderhook()
ImGui.Begin("wrench pull")
if ImGui.Button("toggle wrenchpull") then
if wrenchpull == false then
wrenchpull = true
else
wrenchpull = false
end
end
ImGui.End()
end

addHook("Render", "renderhook", renderhook)
addHook("OnVarlist", "varlisthook", hook)


