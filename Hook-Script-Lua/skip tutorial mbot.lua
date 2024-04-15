isRunning = true
function wrench_tile(x, y)
    pkt = {}
    pkt.type = 3
    pkt.int_data = 32 
    pkt.int_x = x
    pkt.int_y = y
    pkt.pos_x = getLocal().pos.x
    pkt.pos_y = getLocal().pos.y
    sendPacketRaw(pkt)
end

function drophook(varlist)
if varlist[0]:find("OnDialogRequest") and varlist[1]:find("end_dialog|drop_item") then
pkt = string.format([[action|dialog_return
dialog_name|drop_item
itemID|%d|
count|%d
]], varlist[1]:match("itemID|(%d+)"), varlist[1]:match("count||(%d+)") )

sendPacket(pkt, 2)
return true
end
end

addHook("OnVarlist", "fastdrop", drophook)

function testhook(varlist)
if varlist[0]:find("OnTextOverlay") and varlist[1]:find("You can't drop that here, find an emptier spot!") then
local posx = getLocal().pos.x / 32
local posy = getLocal().pos.y / 32
findPath(posx, posy+1)
sendPacket("action|drop\n|itemID|435", 2)
2)
end
end

addHook("OnVarlist", "fastdrop", testhook)

function stophook(vlist)
if vlist[0]:find("OnConsoleMessage") and vlist[1]:find("stop") then
isRunning = false
end
end

addHook("OnVarlist", "stop buy", stophook)

function allvendhook(vlist)
if vlist[0]:find("OnDialogRequest") and vlist[1]:find("end_dialog|vending") then
pkt = string.format([[action|dialog_return
dialog_name|vending
tilex|%d|
tiley|%d|
buttonClicked|pullstock

setprice|0
chk_peritem|0
chk_perlock|1
]], vlist[1]:match("tilex|(%d+)"), vlist[1]:match("tiley|(%d+)"))
sendPacket(pkt, 2)

return true
end
end

addHook("OnVarlist", "all in one", allvendhook)
while isRunning do
findPath(47,51)
sleep(100)
wrench_tile(47,51)
sleep(1000)
findPath(47,47)
sleep(100)
wrench_tile(47,47)
sleep(1000)
findPath(47,43)
sleep(100)
wrench_tile(47,43)
sleep(1000)
findPath(53,53)
sendPacket("action|drop\n|itemID|435", 2)
sleep(10000)
end
--if you dont stop this script it will suck all seed in the vend!
