# erratic_coke
[Video showcase](https://www.youtube.com/watch?v=OU9ycYdx3Jw&feature=youtu.be)

[FiveM forum post](https://forum.cfx.re/t/release-erratic-coke-a-plane-coke-run/1188641)

Drug script that has you fly a plane to pick up drugs. Offers a few config options to make it fit into most servers. Comes with an English and German translation.

__IMPORTANT: YOU WILL HAVE TO PROTECT THE SERVER SIDE CODE YOURSELF__

---

# Prerequisites:
- ESX
- A working database

---

# Optional resources: 
Install these like you would normally and set this in the config

```lua
Config.useMythic = true
Config.progBar = true
```

_[Mythic_notify](https://github.com/JayMontana36/mythic_notify)_

_[Progress Bars 1.0](https://forum.cfx.re/t/release-progress-bars-1-0-standalone/526287)_

_[MLO used in the video](https://www.gta5-mods.com/maps/mlo-4x-drug-lab-interiors-sp-fivem)_

---

# How to install:

1. Download the resource from [GitHub](https://github.com/TTVErraticAlcoholic/erratic_coke)
2. Unzip it
3. Put it in your resource folder
4. Add "start erratic_coke" to your server.cfg
5. Run coke.sql
6. Done

---

# Config options:

- Config.Locale - __English or German. More translations might follow__
- Config.useMythic - __Use mythic or not__
- Config.progBar - __Use Progress Bar or not__
- Config.useCD - __Use a global cooldown or not__
- Config.cdTime - __Time in ms you want the cooldown to be__
- Config.price - __Price you pay for starting a run__
- Config.randBrick - __Amount of coke you get from breaking bricks__
- Config.takeBrick - __Amount of bricks it takes when processing__

---

# How to add more languages:

1. Open the locales folder
2. Create a new file in the locales folder and name it "yourlanguage".lua
3. Translate the locales from English/German to your preferred language
4. Add "yourlanguage".lua to the client_scripts and server_scripts in the fxmanifest.lua
5. Done

Your fxmanifest should look like this: 

```lua
client_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/yourlanguage.lua',
	'config.lua',
    	'client/erratic_coke_cl.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/yourlanguage.lua',
	'config.lua',
    	'server/erratic_coke_sv.lua'
}

