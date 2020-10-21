Config = {


    ChanceToGetItem = 60, -- if math.random(0, 100) <= ChanceToGetItem then give item
    Items = {
    'metalscrap',
    'metalscrap',
    'metalscrap',
    'metalscrap',
    'metalscrap',
    'metalscrap',
    'metalscrap',
    'metalscrap',
    'plastic',
    'plastic',
    'plastic'},
    Sell = vector3(287.24, 2843.74, 44.4),
    Objects = {
        ['pickaxe'] = 'prop_tool_pickaxe',
    },
    MiningPositions = {
        {coords = vector3(2992.77, 2750.64, 42.78), heading = 209.29},
        {coords = vector3(2983.03, 2750.9, 42.02), heading = 214.08},
        {coords = vector3(2976.74, 2740.94, 43.63), heading = 246.21},
        {coords = vector3(2998.17, 2796.16, 44.94), heading = 279.59},
        {coords = vector3(3005.1, 2782.4, 44.48), heading = 290.25},
        {coords = vector3(2913.88, 2802.41, 44.56), heading = 60.43},
        {coords = vector3(2928.11, 2759.41, 45.12), heading = 146.34},
        {coords = vector3(2934.29, 2742.46, 44.24), heading = 98.54}
    },
}

Strings = {
    ['press_mine'] = 'Press ~INPUT_CONTEXT~ to mine.',
    ['mining_info'] = 'Press ~INPUT_ATTACK~ to chop, ~INPUT_FRONTEND_RRIGHT~ to stop.',
    ['you_sold'] = 'You sold %sx %s for %s',
    ['e_sell'] = 'Press ~INPUT_CONTEXT~ to sell all your mined items.',
    ['someone_close'] = 'There is a player too close to you!',
    ['mining'] = 'Mine',
    ['sell_mine'] = 'Ore Selling'
}