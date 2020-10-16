# qb-gangs
OG-Gangs for QB-Core with Gang Support instead of Jobs.

# Features:

All Gangs Are Combined in One Script & The Script Is Completely Optimised
Can Be Easily Converted For Any Framework
Instructions:

# Installation
Add Gangs into qb-core/shared.lua like this:
```lua
QBShared.Gangs = {
	["geen"] = {
		label = "No Gang"
	},
	["ballas"] = {
		label = "Ballas"
	},
	["thefamily"] = {
		label = "The Family"
	},
	["vagos"] = {
		label = "Vagos"
	},
	["marabunta"] = {
		label = "marabunta"
	},
}

```

To enable lockable doors for gangs, you need to modify qb-doorlocks/client/main.lua line 217 like this:
```lua
function IsAuthorized(doorID)
	local PlayerData = QBCore.Functions.GetPlayerData()

	for _,job in pairs(doorID.authorizedJobs) do
		if job == PlayerData.job.name then
			return true
		end
	end

	for _,gang in pairs(doorID.authorizedJobs) do
		if gang == PlayerData.job.name then
			return true
		end
	end
	
	return false
end
```

# Required Resources:

- Ballas Interior - https://github.com/TRANEdAK1nG/Ballas-Interior
- TheFamily Interior - https://github.com/TRANEdAK1nG/Famillies-Interior
- Vagos Interior - https://github.com/TRANEdAK1nG/Vagos-Interior
- Marabunta Interior - https://github.com/TRANEdAK1nG/Marabunta-Interior
- Warmenu - https://github.com/warxander/warmenu
- Script Author : SBRULEZ#6969
- Modifications by: Mojito#4595 and Toddyym#8296
