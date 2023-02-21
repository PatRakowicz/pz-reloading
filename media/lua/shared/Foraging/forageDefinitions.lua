require 'Foraging/forageSystem'

Events.onAddForageDefs.Add(function()

	local BirdExcrement = {
		type = "Reloading.BirdExcrement",
		minCount = 8,
		maxCount = 24,
		xp = 5,
		categories = { "Stones" },
		zones = {
			DeepForest      = 10,
			Forest          = 8,
			Vegitation      = 7,
			FarmLand        = 6,
			Farm            = 6,
			TrailerPark     = 4,
			TownZone        = 5,
			Nav             = 5,
		},
		months = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		itemSizeModifier = 0.7,
	};

forageSystem.addItemDef(BirdExcrement);

forageSystem.generateLootTable()

end)