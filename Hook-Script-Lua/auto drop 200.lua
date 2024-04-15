seedid = 2

function findItem(id)
    for _, itm in pairs(getInventory()) do
        if itm.id == id then
            if itm.count < 0 then
                itm.count = itm.count + 256
            end
           sleep(50)
            return itm.count
        end
    end
    return 0
end
function hook2(varlist)
if varlist[0]:find("OnDialogRequest") and varlist[1]:find("end_dialog|drop_item") then
pkt = string.format([[action|dialog_return
dialog_name|drop_item
itemID|%d|
count|%d
]], varlist[1]:match("itemID|(%d+)"), varlist[1]:match("count||(%d+)") )

sendPacket(false,pkt, 2)
return true
end
end
addHook("OnVarlist", "fastdrop", hook2)

while true do
if findItem(seedid) > 199 then
sendPacket(false, "action|drop\nitemID|"..seedid, 2)
end
sleep(500)
end
