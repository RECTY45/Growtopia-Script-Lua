trees = {}

tree_id = 15 -- dirt seed

function hit_tile(x, y)
pkt = {}
pkt.type = 3
pkt.int_data = 18
pkt.int_x = x
pkt.int_y = y
pkt.pos_x = getLocal().pos.x
pkt.pos_y = getLocal().pos.y
sendPacketRaw(false, pkt)
end

for _, tile in pairs(getTiles()) do
if tile.fg == tree_id then
table.insert(trees, tile.pos)
end
end

for _, pos in pairs(trees) do
findPath(pos.x, pos.y)
sleep(100)
hit_tile(pos.x, pos.y)
sleep(200)
end
