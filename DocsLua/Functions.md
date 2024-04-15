# Functions
* [sendPacket](#sendpacket)
* [sendPacketRaw](#sendpacketraw)
* [sendVarlist](#sendvarlist)
* [log](#log)
* [findPath](#findpath)
* [getLocal](#getlocal)
* [getInventory](#getinventory)
* [getPlayers](#getplayers)
* [getObjects](#getobjects)
* [getTile](#gettile)
* [getTiles](#gettiles)
* [getItemInfo](#getiteminfo)
* [isSolid](#issolid)
* [drawLine](#drawline)
* [drawText](#drawtext)
* [drawRect](#drawrect)
* [worldToScreen](#worldtoscreen)
* [patchBytes](#patchbytes)


## sendPacket
`sendPacket(bool client, string packet, int type)`

Sends text packet with selected type to client or server, if client is set to true then it sends to client and if its false it sends to server.

Example:
```lua
-- Sends respawn packet to server
sendPacket(false, "action|respawn", 2)
```

## sendPacketRaw
`sendPacketRaw(bool client, GamePacket packet)`

Sends [GamePacket](Structs.md#gamepacket) to server or client, if client is set to true then it sends to client and if its false it sends to server.

Example:
```lua
-- Sends wear clothing packet to server
packet = {}
packet.type = 10 
packet.int_data = 48 -- Clothing ID (Jeans)
sendPacketRaw(false, packet)
```
## sendVarlist
`sendVarlist(Variantlist varlist)`

Sends [Variantlist](Structs.md#variantlist) to client

Example:
```lua
-- Sends OnConsoleMessage to client
varlist = {}
varlist[0] = "OnConsoleMessage" -- Function name
varlist[1] = "Hello!" -- Param 1
sendVarlist(varlist)
```

## log
`log(string message)`

Logs message to Growtopias console (only client side)

Example:
```lua
-- Logs "Hello!" to Growtopias console
log("Hello!")
```

## findPath
`findPath(int x, int y)`

Finds path to selected x,y

Example:
```lua
-- Finds path to top left corner of the world
findPath(0, 0)
```

## getLocal
`getLocal()`

Returns local [NetAvatar](#Structs.md#netavatar) struct

Example:
```lua
-- Logs local players name
me = getLocal()
log(me.name)
```

## getInventory
`getInventory()`

Returns table of [InventoryItems](Structs.md#inventoryitem)

Example:
```lua
-- Logs all item ids in your inventory
for _,cur in pairs(getInventory()) do
log(cur.id)
end
```

## getPlayers
`getPlayers()`

Returns table of [NetAvatars](Structs.md#netavatar)

Example:
```lua
-- Logs current worlds players names
for _,player in pairs(getPlayers()) do
log(player.name)
end
```

## getObjects
`getObjects()`

Returns table of [WorldObjects](Structs.md#worldobject)

Example:
```lua
-- Logs current worlds objects item id's
for _,object in pairs(getObjects()) do
log(object.id)
end
```

## getTile
`getTile(int x, int y)`

Returns world [Tile](Structs.md#tile) in selected position

Example:
```lua
-- Logs top left corners foreground block id
tile = getTile(0, 0)
log(tile.fg)
```

## getTiles
`getTiles()`

Returns table of [Tiles](Structs.md#tile)

Example:
```lua
-- Logs current worlds all foreground block id's
for _,tile in pairs(getTiles()) do
log(tile.fg)
end
```

## getItemInfo
`getItemInfo(int itemid)`

Returns [ItemInfo](Structs.md#iteminfo) of selected Item ID

Example:
```lua
-- Logs Item ID 2's name (Dirt)
log(getItemInfo(2).name)
```

## isSolid
`isSolid(int x, int y)`

Returns true if block is solid and false if its not

Example:
```lua
if isSolid(0, 0) then
log("Tile 0, 0 is solid")
else
log("Tile 0, 0 is not solid")
end
```

## drawLine
`drawLine(int startx, int starty, int endx, int endy, vec3 color)`

Draws line from start pos to end pos (Only can be used in render hook)

Example:
```lua
-- Draws red line from 0,0 to 100,100 screen position
color = {}
color.x = 1
color.y = 0
color.z = 0

function rend()
drawLine(0, 0, 100, 100, color)
end

addHook("Render", "example", rend)
```

## drawText
`drawText(int posx, int posy, string text, vec3 color)`

Draws selected text to selected position (Only can be used in render hook)

Example:
```lua
-- Draws red "Hello" text to 100,100 screen position
color = {}
color.x = 1
color.y = 0
color.z = 0

function rend()
drawText(100, 100, "Hello", color)
end

addHook("Render", "example", rend)
```

## drawRect
`drawRect(int startx, int starty, int endx, int endy, vec3 color)`

Draws rectangle from start pos to end pos (Only can be used in render hook)

Example:
```lua
-- Draws red rectangle from 50,50 to 100,100 screen position
color = {}
color.x = 1
color.y = 0
color.z = 0

function rend()
drawRect(50, 50, 100, 100, color)
end

addHook("Render", "example", rend)
```

## worldToScreen
`worldToScreen(vec2 pos)`

Returns screen coordinates of selected position

Example:
```lua
-- Logs local player x screen position
w2s = worldToScreen(getLocal().pos)
log(w2s.x)
```

## patchBytes
`patchBytes(int address, table bytes)`

Patches selected address's bytes

Example:
```lua
-- Changes memory in address 0x12345 to 0x90, 0x90
bytes = {0x90, 0x90}
patchBytes(0x12345, bytes)
```
