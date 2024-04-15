# Hooks
* [Usage](#usage)
* [Types](#types)
* [Examples](#examples)

If you return true in hook it wont execute the packet

## Usage
### addHook
`addHook(string type, string name, function)`

Hooks selected function to selected [hook type](#types)

### removeHook
`removeHook(string name)`

Removes hook with selected name

### removeHooks
`removeHooks()`

Removes all hooks

## Types
`Packet`
Arguments: (strint packet, int type)

`OnPacket`
Arguments: (string packet, int type)

`RawPacket`
Arguments: (GamePacket packet)

`OnRawPacket`
Arguments: (GamePacket packet)

`OnVarlist`
Arguments: (VariantList varlist)

`OnTrackPacket`
Arguments: (string packet)

`Render`
Arguments: (none)

## Examples
### Packet
```lua
-- Blocks respawn packet
function hook(packet, type)
if packet:find("action|respawn") then
return true;
end
end

addHook("Packet", "example_hook", hook)
```

### OnPacket
```lua
-- Blocks audios server sends to us
function hook(packet, type)
if packet:find("audio") then
return true;
end
end

addHook("OnPacket", "example_hook", hook)
```

### RawPacket
```lua
-- Blocks packet type 25 
function hook(packet)
if packet.type == 25 then
return true;
end
end

addHook("RawPacket", "example_hook", hook)
```

### OnRawPacket
```lua
-- Blocks packet type 5
function hook(packet)
if packet.type == 5 then
return true
end
end

addHook("OnRawPacket", "example_hook", hook)
```

### OnVarlist
```lua
-- Blocks all dialogs
function hook(varlist)
if varlist[0]:find("OnDialogRequest") then
return true
end
end

addHook("OnVarlist", "example_hook", hook)
```

### OnTrackPacket
```lua
-- Blocks all track packets
function hook(packet)
return true
end

addHook("OnTrackPacket", "example_hook", hook)
```

### Render
```lua
-- Draws red line from 0,0 to 100,100 screen position
color = {}
color.x = 1
color.y = 0
color.z = 0

function hook()
drawLine(0, 0, 100, 100, color)
end

addHook("Render", "example_hook", hook)
```
