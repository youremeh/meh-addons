Config = {} -- Don't touch

--[[
    Config.NotifyDuration               How long a notification should stay on a players screen?

    Config.EnableParkingMeters          Should we enable parking meters to be looted?
    Config.ParkingMeterCashAmountMin    What's the least amount of money a person should loot?
    Config.ParkingMeterCashAmountMax    What's the most amount of money a person should loot?
    Config.ParkingMeters                What props should we use?
    Config.ParkingMeterRefillTime       How long (in minutes) should it take to refill a parking meter?
    Config.SearchParkingMeterTime       How long (in seconds) should it take to loot the parking meter?

    Config.EnableTrashBins              Should we enable trash bins to be looted?
    Config.TrashBins                    What props should we use?
    Config.BinRefillTime                How long (in minutes) should it take to refill the trash bin?
    Config.SearchTrashCanTime           How long (in seconds) should it take to loot the trash bin?
    Config.TrashBinAmountMin            The minimum amount of items a player should get
    Config.TrashBinAmountMax            The maximum amount of items a player should get
    Config.TrashBinItems                A table of all the items you want players to be able to get

    Config.EnableTrashCans              Should we enable trash cans to be looted?
    Config.TrashCans                    What props should we use?
    Config.TrashRefillTime              How long (in minutes) should it take to refill the trash can?
    Config.SearchTrashBinTime           How long (in seconds) should it take to search the trash can?
    Config.LowTierItemChance            The number chance to get a low tier item (1-100) ||||| READ BELOW |||||
    Config.LowTierAmountMinChance       The minimum amount of items a player should get from low tier
    Config.LowTierAmountMaxChance       The maximum amount of items a player should get from low tier
    Config.LowTierItems                 A table of all the items you want players to be able to get

    Config.HighTierAmountMinChance      The minimum amount of items a player should get from high tier
    Config.HighTierAmountMaxChance      The maximum amount of items a player should get from high tier
    Config.HighTierItemChance           The number chance to get a high tier item (1-100) ||||| READ BELOW |||||
    Config.HighTierItems                A table of all the items you want players to be able to get

    Config.LowTierItemChance and Config.HighTierItemChance MUST EQUAL 100 WITH NO OVERLAPPING NUMBER
    Config.LowTierItemChance and Config.HighTierItemChance MUST EQUAL 100 WITH NO OVERLAPPING NUMBER
    Config.LowTierItemChance and Config.HighTierItemChance MUST EQUAL 100 WITH NO OVERLAPPING NUMBER
]]

Config.NotifyDuration = 5

Config.EnableParkingMeters = true
Config.ParkingMeterCashAmountMin = 1
Config.ParkingMeterCashAmountMax = 25
Config.ParkingMeters = {'prop_parknmeter_01'}
Config.ParkingMeterRefillTime = 5
Config.SearchParkingMeterTime = 15

Config.EnableTrashBins = true
Config.TrashBins = {'prop_dumpster_02a', 'prop_dumpster_02b', 'prop_dumpster_01a'}
Config.BinRefillTime = 10
Config.SearchTrashCanTime = 5
Config.TrashBinAmountMin = 1
Config.TrashBinAmountMax = 10
Config.TrashBinItems = {
    'rubber',
    'glass',
    'steel',
    'iron',
    'aluminum',
    'copper',
    'metalscrap',
    'plastic'
}

Config.EnableTrashCans = true
Config.TrashCans = {'pop_cs_bin_02', 'prop_bin_01a'}
Config.TrashRefillTime = 10
Config.SearchTrashBinTime = 20
Config.LowTierItemChance = 95
Config.LowTierAmountMinChance = 1
Config.LowTierAmountMaxChance = 15
Config.LowTierItems = {
    'bandage',
    'pinger',
    'casinochips',
    'radio',
    'fitbit',
    'lockpick',
    'empty_weed_bag',
    'rolling_paper'
}

Config.HighTierAmountMinChance = 1
Config.HighTierAmountMaxChance = 2
Config.HighTierItemChance = 4
Config.HighTierItems = {
    'cryptostick',
    'suppressor_attachment',
    'weapontint_1',
    'weapontint_6'
}

Config.TrashTranslate = {
    -- Someone has already looted the item
    [1] = 'Trash can is empty',
    [2] = 'Trash bin is empyy',
    [3] = 'Parking meter is empty',

    -- Unable to find the items
    [4] = 'No trash can found nearby',
    [5] = 'No trash bin found nearby',
    [6] = 'No parking meter found nearby',

    -- Third eye text option
    [7] = 'Search Trash Can',
    [8] = 'Search Trash Bin',
    [9] = 'Search Parking Meter',

    -- Progress bar text
    [10] = 'Searching trash can',
    [11] = 'Searching trash bin',
    [12] = 'Searching parking meter',
}