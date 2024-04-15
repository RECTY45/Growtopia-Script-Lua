removeHook("toe")

function toes()

ImGui.Begin("Useful menu")

ImGui.Text("Command's")

if ImGui.Button("Turn ON Command /fossil") then-- remove the hook incase you execute again/are testing
removeHook("fossilFinder")
sleep(250)

function hook(packet, type)
    if packet:find("action|input\n|text|/fossil") then
        local count = 0 -- set count to 0
        local fossilpos = {}
        for _, tile in ipairs(getTiles()) do -- for each tile in the world
            if tile.fg == 3918 then -- check if tile is 3918 (fossil rock)
                table.insert(fossilpos, tile.pos)
                count = count + 1 -- add 1 to the count
            end
        end
        
        log("Found "..count.." fossils in total at this world!")
        if count > 0 then
            for i = 1, count do
                log(i..": X: "..fossilpos[i].x.." Y: "..fossilpos[i].y)
            end
        end
        return true
    end
end
addHook("Packet", "fossilFinder", hook) -- add the hook..
end

if ImGui.Button("Turn OFF /fossil") then
removeHook("fossilFinder")
end

ImGui.Text("")

if ImGui.Button("Turn ON Command /warp") then
function hook(packet, type)
if packet:find("action|input") then
text = packet:gsub("action|input\n|text|", "")
if text:find("/") then
cmd = text:gsub("/", "")
if cmd:find("warp ") then
world = cmd:gsub("warp ", "")
log("`$Magically warping to world`5 "..world.."`$...")
sendPacket(false, "action|join_request\nname|"..world, 3)
return true
end
end
end
end

addHook("Packet", "warphook", hook)
end

if ImGui.Button("Turn OFF /warp") then
removeHook("warphook")
end

ImGui.Text("\nOther's")
removeHook("hook_type_5")
if ImGui.Button("Drop All") then
function hook(varlist)
if varlist[0]:find("OnDialogRequest") and varlist[1]:find("end_dialog|drop_item") then
return true
end
end

addHook(5, "hook_type_5", hook)

for k,v in ipairs(getInventory()) do
sendPacket(false,"action|drop\n|itemID|"..v.id,2)
sendPacket(false,"action|dialog_return\ndialog_name|drop_item\nitemID|"..v.id.."|\ncount|"..v.count,2)
end
end

ImGui.Text("")

if ImGui.Button("Turn ON Fast Drop") then
function hook2(varlist)
if varlist[0]:find("OnDialogRequest") and varlist[1]:find("end_dialog|drop_item") then
pkt = string.format([[action|dialog_return
dialog_name|drop_item
itemID|%d|
count|%d
]], varlist[1]:match("itemID|(%d+)"), varlist[1]:match("count||(%d+)"))

sendPacket(false, pkt, 2)
return true
end
end

addHook("OnVarlist", "fastdrop", hook2)
end

if ImGui.Button("Turn OFF Fast Drop") then
removeHook("trashdrop")
end

ImGui.Text("\n\n\n")

if ImGui.Button("Unhook all") then
removeHooks()
end

if ImGui.Button("Unhook Menu") then
removeHook("toe")
end

ImGui.End()
end
addHook("Render", "toe", toes)
