Config = {}
Config.Locale = 'en' -- English, German or Spanish - (en/de/es)

Config.useCD = false -- change this if you want to have a global cooldown or not
Config.cdTime = 5000 -- global cooldown in ms. Set to 20 minutes by default - (https://www.timecalculator.net/minutes-to-milliseconds)
Config.doorHeading = 330.38 -- change this to the proper heading to look at the door you start the runs with
Config.price = 5000 -- amount you have to pay to start a run 
Config.randBrick = math.random(16,30) -- change the numbers to how much coke you want players to receive after breaking down bricks
Config.takeBrick = 1 -- amount of brick you want to take after processing
Config.getCoords = false -- gets coords with /mycoords
Config.pilotPed = "s_m_m_pilot_02" -- change this to have a different ped as the planes pilot - (lsit of peds: https://wiki.rage.mp/index.php?title=Peds)
Config.landPlane = false -- change this if you want the plane to fly and land or if it should spawn on the ground

Config.locations = {
	[1] = { 
		fuel = {x = 1753.874, y = 3300.229, z = 41.15534}, -- location of the jerry can/waypoint
		landingLoc = {x = 1743.822, y = 3258.627, z = 41.36734}, -- don't mess with this unless you know what you're doing
		plane = {x = 736.6801, y = 2973.17, z = 93.81644, h = 284.13}, -- don't mess with this unless you know what you're doing
		runwayStart = {x = 1709.604, y = 3251.045, z = 41.03549}, -- don't mess with this unless you know what you're doing
		runwayEnd = {x = 1064.045, y = 3076.735, z = 41.16898}, -- don't mess with this unless you know what you're doing
		fuselage = {x = 1729.039, y = 3311.423, z = 41.2235}, -- location of the 3D text to fuel the plane
		stationary = {x = 1730.208, y = 3315.586, z = 41.22352, h = 16.29}, -- location of the plane if Config.landPlane is false 
		delivery = {x = 149.2108, y = 4086.845, z = 31.6526}, -- delivery location
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, -- end location
		parking = {x = 1730.208, y = 3315.586, z = 41.22352}, -- don't mess with this unless you know what you're doing															
	},
	[2] = { 
		fuel = {x = 2140.458, y = 4789.831, z = 40.97033},
		landingLoc = {x = 2102.974, y = 4794.949, z = 41.06044},
		plane = {x = 1506.836, y = 4524.545, z = 97.78197, h = 296.68},
		runwayStart = {x = 2082.278, y = 4785.483, z = 41.06053},
		runwayEnd = {x = 1855.845, y = 4673.433, z = 52.04392},
		fuselage = {x = 2137.618, y = 4812.194, z = 41.19522},
		stationary = {x = 2137.618, y = 4812.194, z = 41.19522, h = 296.68},
		delivery = {x = -195.8702, y = 7051.156, z = 0.8857441},
		hangar = {x = 1730.208, y = 3315.586, z = 41.22352}, 
		parking = {x = 2137.618, y = 4812.194, z = 41.19522},															
	},
	[3] = { 
		fuel = {x = 2140.458, y = 4789.831, z = 40.97033},
		landingLoc = {x = 2116.447, y = 4812.256, z = 41.22142},
		plane = {x = 1506.836, y = 4524.545, z = 97.78197, h = 296.68},
		runwayStart = {x = 2082.278, y = 4785.483, z = 41.06053},
		runwayEnd = {x = 1855.845, y = 4673.433, z = 52.04392},
		fuselage = {x = 2137.618, y = 4812.194, z = 41.19522},
		stationary = {x = 2137.618, y = 4812.194, z = 41.19522, h = 296.68},
		delivery = {x = -1865.63, y = 4660.856, z = 0.6967332},
		hangar = {x = 1730.208, y = 3315.586, z = 41.22352}, 
		parking = {x = 2137.618, y = 4812.194, z = 41.19522},																
	},
	[4] = { 
		fuel = {x = 1753.874, y = 3300.229, z = 41.15534},
		landingLoc = {x = 1743.822, y = 3258.627, z = 41.36734},
		plane = {x = 736.6801, y = 2973.17, z = 93.81644, h = 284.13},
		runwayStart = {x = 1709.604, y = 3251.045, z = 41.03549},
		runwayEnd = {x = 1064.045, y = 3076.735, z = 41.16898},
		fuselage = {x = 1729.039, y = 3311.423, z = 41.2235},
		stationary = {x = 1730.208, y = 3315.586, z = 41.22352, h = 16.29},
		delivery = {x = -2158.379, y = 2596.311, z = 1.746785},
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, 
		parking = {x = 1730.208, y = 3315.586, z = 41.22352},															
	},
	[5] = { 
		fuel = {x = 1753.874, y = 3300.229, z = 41.15534},
		landingLoc = {x = 1743.822, y = 3258.627, z = 41.36734},
		plane = {x = 736.6801, y = 2973.17, z = 93.81644, h = 284.13},
		runwayStart = {x = 1709.604, y = 3251.045, z = 41.03549},
		runwayEnd = {x = 1064.045, y = 3076.735, z = 41.16898},
		fuselage = {x = 1729.039, y = 3311.423, z = 41.2235},
		stationary = {x = 1730.208, y = 3315.586, z = 41.22352, h = 16.29},
		delivery = {x = -977.0155, y = -1674.477, z = 0.5961025},
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, 
		parking = {x = 1730.208, y = 3315.586, z = 41.22352},															
	},
	[6] = { 
		fuel = {x = 2140.458, y = 4789.831, z = 40.97033},
		landingLoc = {x = 2116.447, y = 4812.256, z = 41.22142},
		plane = {x = 1506.836, y = 4524.545, z = 97.78197, h = 296.68},
		runwayStart = {x = 2082.278, y = 4785.483, z = 41.06053},
		runwayEnd = {x = 1855.845, y = 4673.433, z = 52.04392},
		fuselage = {x = 2137.618, y = 4812.194, z = 41.19522},
		stationary = {x = 2137.618, y = 4812.194, z = 41.19522, h = 296.68},
		delivery = {x = 639.0598, y = -2154.924, z = -0.472851},
		hangar = {x = 1730.208, y = 3315.586, z = 41.22352}, 
		parking = {x = 2137.618, y = 4812.194, z = 41.19522},																
	},
	[7] = { 
		fuel = {x = 2140.458, y = 4789.831, z = 40.97033},
		landingLoc = {x = 2116.447, y = 4812.256, z = 41.22142},
		plane = {x = 1506.836, y = 4524.545, z = 97.78197, h = 296.68},
		runwayStart = {x = 2082.278, y = 4785.483, z = 41.06053},
		runwayEnd = {x = 1855.845, y = 4673.433, z = 52.04392},
		fuselage = {x = 2137.618, y = 4812.194, z = 41.19522},
		stationary = {x = 2137.618, y = 4812.194, z = 41.19522, h = 296.68},
		delivery = {x = 3202.445, y = -86.88914, z = -0.1562858},
		hangar = {x = 1730.208, y = 3315.586, z = 41.22352}, 
		parking = {x = 2137.618, y = 4812.194, z = 41.19522},																
	},
	[8] = { 
		fuel = {x = 2140.458, y = 4789.831, z = 40.97033},
		landingLoc = {x = 2116.447, y = 4812.256, z = 41.22142},
		plane = {x = 1506.836, y = 4524.545, z = 97.78197, h = 296.68},
		runwayStart = {x = 2082.278, y = 4785.483, z = 41.06053},
		runwayEnd = {x = 1855.845, y = 4673.433, z = 52.04392},
		fuselage = {x = 2137.618, y = 4812.194, z = 41.19522},
		stationary = {x = 2137.618, y = 4812.194, z = 41.19522, h = 296.68},
		delivery = {x = 2947.497, y = 800.189, z = -0.26062},
		hangar = {x = 1730.208, y = 3315.586, z = 41.22352}, 
		parking = {x = 2137.618, y = 4812.194, z = 41.19522},																
	},
	[9] = { 
		fuel = {x = 1753.874, y = 3300.229, z = 41.15534},
		landingLoc = {x = 1743.822, y = 3258.627, z = 41.36734},
		plane = {x = 736.6801, y = 2973.17, z = 93.81644, h = 284.13},
		runwayStart = {x = 1709.604, y = 3251.045, z = 41.03549},
		runwayEnd = {x = 1064.045, y = 3076.735, z = 41.16898},
		fuselage = {x = 1729.039, y = 3311.423, z = 41.2235},
		stationary = {x = 1730.208, y = 3315.586, z = 41.22352, h = 16.29},
		delivery = {x = -2084.292, y = -534.9019, z = 5.34939},
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, 
		parking = {x = 1730.208, y = 3315.586, z = 41.22352},															
	},
	[10] = { 
		fuel = {x = 1753.874, y = 3300.229, z = 41.15534},
		landingLoc = {x = 1743.822, y = 3258.627, z = 41.36734},
		plane = {x = 736.6801, y = 2973.17, z = 93.81644, h = 284.13},
		runwayStart = {x = 1709.604, y = 3251.045, z = 41.03549},
		runwayEnd = {x = 1064.045, y = 3076.735, z = 41.16898},
		fuselage = {x = 1729.039, y = 3311.423, z = 41.2235},
		stationary = {x = 1730.208, y = 3315.586, z = 41.22352, h = 16.29},
		delivery = {x = -1895.818, y = 5183.544, z = 0.1384194},
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, 
		parking = {x = 1730.208, y = 3315.586, z = 41.22352},															
	},
	[11] = { 
		fuel = {x = 1753.874, y = 3300.229, z = 41.15534},
		landingLoc = {x = 1743.822, y = 3258.627, z = 41.36734},
		plane = {x = 736.6801, y = 2973.17, z = 93.81644, h = 284.13},
		runwayStart = {x = 1709.604, y = 3251.045, z = 41.03549},
		runwayEnd = {x = 1064.045, y = 3076.735, z = 41.16898},
		fuselage = {x = 1729.039, y = 3311.423, z = 41.2235},
		stationary = {x = 1730.208, y = 3315.586, z = 41.22352, h = 16.29},
		delivery = {x = 3732.616, y = 5042.03, z = 0.743489},
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, 
		parking = {x = 1730.208, y = 3315.586, z = 41.22352},															
	},
	[12] = { 
		fuel = {x = 2140.458, y = 4789.831, z = 40.97033},
		landingLoc = {x = 2116.447, y = 4812.256, z = 41.22142},
		plane = {x = 1506.836, y = 4524.545, z = 97.78197, h = 296.68},
		runwayStart = {x = 2082.278, y = 4785.483, z = 41.06053},
		runwayEnd = {x = 1855.845, y = 4673.433, z = 52.04392},
		fuselage = {x = 2137.618, y = 4812.194, z = 41.19522},
		stationary = {x = 2137.618, y = 4812.194, z = 41.19522, h = 296.68},
		delivery = {x = 2090.646, y = 2784.851, z = 51.93738},
		hangar = {x = 1730.208, y = 3315.586, z = 41.22352}, 
		parking = {x = 2137.618, y = 4812.194, z = 41.19522},																
	},
	[13] = { 
		fuel = {x = 2140.458, y = 4789.831, z = 40.97033},
		landingLoc = {x = 2116.447, y = 4812.256, z = 41.22142},
		plane = {x = 1506.836, y = 4524.545, z = 97.78197, h = 296.68},
		runwayStart = {x = 2082.278, y = 4785.483, z = 41.06053},
		runwayEnd = {x = 1855.845, y = 4673.433, z = 52.04392},
		fuselage = {x = 2137.618, y = 4812.194, z = 41.19522},
		stationary = {x = 2137.618, y = 4812.194, z = 41.19522, h = 296.68},
		delivery = {x = 1992.478, y = 247.0378, z = 160.4266},
		hangar = {x = 1730.208, y = 3315.586, z = 41.22352}, 
		parking = {x = 2137.618, y = 4812.194, z = 41.19522},																
	},
	[14] = { 
		fuel = {x = 2140.458, y = 4789.831, z = 40.97033},
		landingLoc = {x = 2116.447, y = 4812.256, z = 41.22142},
		plane = {x = 1506.836, y = 4524.545, z = 97.78197, h = 296.68},
		runwayStart = {x = 2082.278, y = 4785.483, z = 41.06053},
		runwayEnd = {x = 1855.845, y = 4673.433, z = 52.04392},
		fuselage = {x = 2137.618, y = 4812.194, z = 41.19522},
		stationary = {x = 2137.618, y = 4812.194, z = 41.19522, h = 296.68},
		delivery = {x = 2340.029, y = -2184.161, z = 0.5633808},
		hangar = {x = 1730.208, y = 3315.586, z = 41.22352}, 
		parking = {x = 2137.618, y = 4812.194, z = 41.19522},																
	},
	[15] = { 
		fuel = {x = 1753.874, y = 3300.229, z = 41.15534},
		landingLoc = {x = 1743.822, y = 3258.627, z = 41.36734},
		plane = {x = 736.6801, y = 2973.17, z = 93.81644, h = 284.13},
		runwayStart = {x = 1709.604, y = 3251.045, z = 41.03549},
		runwayEnd = {x = 1064.045, y = 3076.735, z = 41.16898},
		fuselage = {x = 1729.039, y = 3311.423, z = 41.2235},
		stationary = {x = 1730.208, y = 3315.586, z = 41.22352, h = 16.29},
		delivery = {x = 47.28404, y = -2325.05, z = -0.5137783},
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, 
		parking = {x = 1730.208, y = 3315.586, z = 41.22352},															
	},
}




