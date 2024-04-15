BCOUNT='AMOUNT HERE'

function fastbuy(v)
if v[0]=='OnDialogRequest' and v[1]:find('Vending Machine') then
local tilex,tiley=v[1]:match('tilex|[%d]+'):sub(7),v[1]:match('tiley|[%d]+'):sub(7)
local expPrice=v[1]:match('expectprice|[%d%-]+'):match('%|.*'):sub(2)
local expItem=v[1]:match('expectitem|[%d%-]+'):match('%|.*'):sub(2)

sendPacket(false, 'action|dialog_return\ndialog_name|vending\ntilex|'..tilex..'|\ntiley|'..tiley..'|\nexpectprice|'..expPrice..'|\nexpectitem|'..expItem..'|\nbuycount|'..BCOUNT, 2)
sendPacket(false, 'action|dialog_return\ndialog_name|vending\ntilex|'..tilex..'|\ntiley|'..tiley..'|\nverify|1|\nbuycount|'..BCOUNT..'|\nexpectprice|'..expPrice..'|\nexpectitem|'..expItem..'|', 2)
end
end
removeHooks()
addHook('onvarlist','fb',fastbuy)
