-- Load the RockNode.lua file to define the rock node object
require("RockNode")

-- Define the coordinates where you want to spawn the rock nodes

--local rockNodePositions = {
--    { x = 100, y = 100, z = 0 },
--    { x = 200, y = 200, z = 0 },
--    { x = 300, y = 300, z = 0 }
--}

RockNode:create(0,0,0)

---- Create a new rock node at each of the specified coordinates
--for i = 1, rockNodePositions do
--    RockNode:create(rockNodePositions[i].x, rockNodePositions[i].y, rockNodePositions[i].z)
--end

