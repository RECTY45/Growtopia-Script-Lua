removeHooks()
function retrieve(varlist)
if varlist[0]:find("OnDialogRequest") and varlist[1]:find("end_dialog|itemsucker_block|Close|Update|") then
kt = string.format([[action|dialog_return
dialog_name|itemsucker_block
tilex|%d|
tiley|%d|
buttonClicked|additem

chk_enablesucking|1
]], varlist[1]:match("tilex|(%d+)"),varlist[1]:match("tiley|(%d+)"))
sendPacket(false, kt, 2)
return true
end
if varlist[0]:find("OnDialogRequest") and varlist[1]:find("end_dialog|itemaddedtosucker|Close|Add|") then
pkt = string.format([[action|dialog_return
dialog_name|itemaddedtosucker
tilex|%d|
tiley|%d|
itemtoadd|200
]], varlist[1]:match("tilex|(%d+)"),varlist[1]:match("tiley|(%d+)"), varlist[1]:match("itemtoadd|(%d+)"))

sendPacket(false, pkt, 2)
return true
end
end
addHook("OnVarlist", "fastretrieveut", retrieve)
