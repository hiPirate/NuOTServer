--[[
	Look README.md for see the reserved action/unique numbers
	From range 5000 to 6000 is reserved for keys chest
	From range 6001 to 14000 is reserved for script reward
	Path: data\scripts\actions\system\quest_reward_common.lua

	From range 14001 to 15000 is reserved for others scripts (varied rewards)

	There is no need to tamper with the chests scripts, just register a new table and configure correctly
	So the quest will work in-game

	Example:
	[xxxx] = {
		-- For use of the map
		itemId = xxxx,
		itemPos = {x = xxxxx, y = xxxxx, z = x},
		-- For use of the script
		container = xxxx (it's for use reward in a container, only put the id of the container here)
		keyAction = xxxx, (it's for use one key in the chest and is reward in container, only put the key in reward and action here)
		reward = {{xxxx, x}},
		storage = xxxxx
	},

	Note:
	The "for use of the map" variables are only used to create the action or unique on the map during startup
	If the reward is an key, do not need to use "keyAction", only set the storage as same action id

	The "for use of the script" variables are used by the scripts
	To allow a single script to manage all rewards
]]

ChestAction = {
}

ChestUnique = {
  -- Rookgaard: Dagger Chest
  [6001] = {
		itemId = 26408,
		itemPos = {x = 1029, y = 1272, z = 8},
		reward = {{2379, 1}},
		storage = 6101
  },

  -- Rookgaard: Leather Legs Chest
  [6002] = {
    itemId = 26408,
    itemPos = {x = 1041, y = 1294, z = 8},
    reward = {{2649, 1}},
    storage = 6102
  },

  -- Rookgaard: Wooden Shield Chest
  [6003] = {
    itemId = 26408,
    itemPos = {x = 1020, y = 1296, z = 9},
    reward = {{2512, 1}},
    storage = 6103
  },
}
