-- FUNCTIONS

function drop(x, y, id, count)
local pkt = {}
pkt.type = 0
pkt.pos_x = x * 32
pkt.pos_y = y * 32
pkt.flags = 0
sendPacketRaw(pkt)

if not count then
for _,item in ipairs(getInventory()) do
if item.id==id then
count=item.count
break
end
end
if not count then return end
end

sendPacket(false, "action|drop\n|itemID|"..id, 2)
sendPacket(false, ([[action|dialog_return
dialog_name|drop_item
itemID|%d|
count|%d]]):format(id, count), 2)
end

-- HOOK

function nodialog(v)
if v[0]=='OnDialogRequest' then
return true
end
end

removeHooks()
addHook('OnVarlist','nodialog',nodialog)

-- MAIN
-- Auto Growganoth by SexyG0n

growx=50
growy=15
id="ITEM ID"
count="AMMOUNT TO DROP"

for i=1,count do
findPath(growx, growy)
sleep(500)

t=getLocal().tile
drop(t.x,t.y,id,1)
sleep(2800)
end

removeHook('nodialog')

