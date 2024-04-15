function toes()
    ImGui.Begin("growscan")
        if ImGui.Button("placed items") then
function round(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

store1 = {}

for k,v in pairs(getTiles()) do
    id = v.fg
    if store1[v.fg] == nil then
        store1[v.fg] = {id = v.fg, qty = 1}
    else
        store1[v.fg].qty = store1[v.fg].qty + 1
    end
    if store1[v.bg] == nil then
        store1[v.bg] = {id = v.bg, qty = 1}
    else
        store1[v.bg].qty = store1[v.bg].qty + 1
    end
end

placedshit = "add_spacer|small|"
for _,tile in pairs(store1) do
    count = round(tile.qty)
    placedshit =
        placedshit ..
        "\nadd_label_with_icon|small|`o " ..
            getItemInfo(tile.id).name .. " : " .. count .. "``|left|" .. tostring(tile.id)
end

varlist = {}
varlist[0] = "OnDialogRequest"
varlist[1] = "set_default_color|`o\nadd_label_with_icon|big|growscan``|left|6016\n"..placedshit.."\nadd_quick_exit"
sendVarlist(varlist)
end

 if ImGui.Button("floating items") then
function round(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

store1 = {}

for k, v in pairs(getObjects()) do
    id = v.id
    if store1[v.id] == nil then
        store1[v.id] = {id = v.id, qty = v.count}
    else
        store1[v.id].qty = store1[v.id].qty + v.count
    end
end

droppedshit = "add_spacer|small|"
for _, object in pairs(store1) do
    count = round(object.qty)
    droppedshit =
        droppedshit ..
        "\nadd_label_with_icon|small|`o " ..
            getItemInfo(object.id).name .. " : " .. count .. "``|left|" .. tostring(object.id)
end

varlist = {}
varlist[0] = "OnDialogRequest"
varlist[1] = "set_default_color|`o\nadd_label_with_icon|big|growscan``|left|6016\n" .. droppedshit .. "\nadd_quick_exit"

sendVarlist(varlist)
end

ImGui.End()
end
addHook("Render", "toe", toes)

