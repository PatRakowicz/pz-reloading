-- Define the rock node object
RockNode = {
    name = "RockNode",
    texture = "rocktiles.png", -- The texture file for the new tileset
    minable = true, -- The rock node can be mined
    miningTime = 30, -- The time it takes to mine the rock node (in seconds)
    minTool = "Pickaxe", -- The rock node can only be mined with a pickaxe
    loot = {"Stone", "Stone", "Stone", "Stone"}, -- The loot table for the rock node
}

-- Register the rock node with the game world
function RockNode:create(x, y, z)
    local sq = getCell():getGridSquare(x, y, z)
    local tile = RockTile.name
    local north = RockTile.north
    local east = RockTile.east
    local south = RockTile.south
    local west = RockTile.west
    local object = IsoObject.new(getCell(), sq, tile, north, east, south, west)
    object:setName(RockNode.name)
    object:setIsSolid(false)
    sq:AddTileObject(object)

    -- Add the loot table to the rock node
    object:getModData().loot = RockNode.loot
end

-- Handle the rock node being mined
function RockNode:use(player, object)
    -- Check if the player has the required tool to mine the rock node
    if player:getPrimaryHandItem() and player:getPrimaryHandItem():getType() == RockNode.minTool then
        -- Remove the rock node and drop loot for the player
        object:getSquare():RemoveTileObject(object)
        for i = 1, #object:getModData().loot do
            local item = InventoryItemFactory.CreateItem(object:getModData().loot[i])
            player:getInventory():AddItem(item)
        end
        -- Play a mining sound effect
        getPlayer():playSound("break_rock")
    end
end

function RockNode:onDestroy(square, args)
    local numStones = ZombRand(1, 4)
    for i = 1, numStones do
        ISSpawnItemOnGround(square, "Base.Stone", 1)
    end
end