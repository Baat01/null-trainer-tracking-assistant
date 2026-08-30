-- you do not need this lua script, though it will allow you to with mgba 0.10 to export your pokemon to the calc
-- to use download this file on mgba select tools->scripting then file->open and open this file

move = {"",
"Pound",
"Karate Chop",
"Double Slap",
"Comet Punch",
"Mega Punch",
"Pay Day",
"Fire Punch",
"Ice Punch",
"Thunder Punch",
"Scratch",
"Vise Grip",
"Guillotine",
"Razor Wind",
"Swords Dance",
"Cut",
"Gust",
"Wing Attack",
"Whirlwind",
"Fly",
"Bind",
"Slam",
"Vine Whip",
"Stomp",
"Double Kick",
"Mega Kick",
"Jump Kick",
"Rolling Kick",
"Sand Attack",
"Headbutt",
"Horn Attack",
"Fury Attack",
"Horn Drill",
"Tackle",
"Body Slam",
"Wrap",
"Take Down",
"Thrash",
"Double-Edge",
"Tail Whip",
"Poison Sting",
"Twineedle",
"Pin Missile",
"Leer",
"Bite",
"Growl",
"Roar",
"Sing",
"Supersonic",
"Sonic Boom",
"Disable",
"Acid",
"Ember",
"Flamethrower",
"Mist",
"Water Gun",
"Hydro Pump",
"Surf",
"Ice Beam",
"Blizzard",
"Psybeam",
"Bubble Beam",
"Aurora Beam",
"Hyper Beam",
"Peck",
"Drill Peck",
"Submission",
"Low Kick",
"Counter",
"Seismic Toss",
"Strength",
"Absorb",
"Mega Drain",
"Leech Seed",
"Growth",
"Razor Leaf",
"Solar Beam",
"Poison Powder",
"Stun Spore",
"Sleep Powder",
"Petal Dance",
"String Shot",
"Dragon Rage",
"Fire Spin",
"Thunder Shock",
"Thunderbolt",
"Thunder Wave",
"Thunder",
"Rock Throw",
"Earthquake",
"Fissure",
"Dig",
"Toxic",
"Confusion",
"Psychic",
"Hypnosis",
"Meditate",
"Agility",
"Quick Attack",
"Rage",
"Teleport",
"Night Shade",
"Mimic",
"Screech",
"Double Team",
"Recover",
"Harden",
"Minimize",
"Smokescreen",
"Confuse Ray",
"Withdraw",
"Defense Curl",
"Barrier",
"Light Screen",
"Haze",
"Reflect",
"Focus Energy",
"Bide",
"Metronome",
"Mirror Move",
--"Self-Destruct",
"None",
"Egg Bomb",
"Lick",
"Smog",
"Sludge",
"Bone Club",
"Fire Blast",
"Waterfall",
"Clamp",
"Swift",
"Skull Bash",
"Spike Cannon",
"Constrict",
"Amnesia",
"Kinesis",
"Soft Boiled",
"High Jump Kick",
"Glare",
"Dream Eater",
"Poison Gas",
"Barrage",
"Leech Life",
"Lovely Kiss",
"Sky Attack",
"Transform",
"Bubble",
"Dizzy Punch",
"Spore",
"Flash",
"Psywave",
"Splash",
"Acid Armor",
"Crabhammer",
--"Explosion",
"None",
"Fury Swipes",
"Bonemerang",
"Rest",
"Rock Slide",
"Hyper Fang",
"Sharpen",
"Conversion",
"Tri Attack",
"Super Fang",
"Slash",
"Substitute",
"Struggle",
"Sketch",
"Triple Kick",
"Thief",
"Spider Web",
"Mind Reader",
"Nightmare",
"Flame Wheel",
"Snore",
"Curse",
"Flail",
"Conversion 2",
"Aeroblast",
"Cotton Spore",
"Reversal",
"Spite",
"Powder Snow",
"Protect",
"Mach Punch",
"Scary Face",
"Feint Attack",
"Sweet Kiss",
"Belly Drum",
"Sludge Bomb",
"Mud-Slap",
"Octazooka",
"Spikes",
"Zap Cannon",
"Foresight",
"Destiny Bond",
"Perish Song",
"Icy Wind",
"Detect",
"Bone Rush",
"Lock-On",
"Outrage",
"Sandstorm",
"Giga Drain",
"Endure",
"Charm",
"Rollout",
"False Swipe",
"Swagger",
"Milk Drink",
"Spark",
"Fury Cutter",
"Steel Wing",
"Mean Look",
"Attract",
"Sleep Talk",
"Heal Bell",
"Return",
"Present",
"Frustration",
"Safeguard",
"Pain Split",
"Sacred Fire",
"Magnitude",
"Dynamic Punch",
"Megahorn",
"Dragon Breath",
"Baton Pass",
"Encore",
"Pursuit",
"Rapid Spin",
"Sweet Scent",
"Iron Tail",
"Metal Claw",
"Vital Throw",
"Morning Sun",
"Synthesis",
"Moonlight",
"Hidden Power",
"Cross Chop",
"Twister",
"Rain Dance",
"Sunny Day",
"Crunch",
"Mirror Coat",
"Psych Up",
"Extreme Speed",
"Ancient Power",
"Shadow Ball",
"Future Sight",
"Rock Smash",
"Whirlpool",
"Beat Up",
"Fake Out",
"Uproar",
"Stockpile",
"Spit Up",
"Swallow",
"Heat Wave",
"Hail",
"Torment",
"Flatter",
"Will-O-Wisp",
"Memento",
"Facade",
"Focus Punch",
"Smelling Salts",
"Follow Me",
"Nature Power",
"Charge",
"Taunt",
"Helping Hand",
"Trick",
"Role Play",
"Wish",
"Assist",
"Ingrain",
"Superpower",
"Magic Coat",
"Recycle",
"Revenge",
"Brick Break",
"Yawn",
"Knock Off",
"Endeavor",
"Eruption",
"Skill Swap",
"Imprison",
"Refresh",
"Grudge",
"Snatch",
"Secret Power",
"Dive",
"Arm Thrust",
"Camouflage",
"Tail Glow",
"Luster Purge",
"Mist Ball",
"Feather Dance",
"Teeter Dance",
"Blaze Kick",
"Mud Sport",
"Ice Ball",
"Needle Arm",
"Slack Off",
"Hyper Voice",
"Poison Fang",
"Crush Claw",
"Blast Burn",
"Hydro Cannon",
"Meteor Mash",
"Astonish",
"Weather Ball",
"Aromatherapy",
"Fake Tears",
"Air Cutter",
"Overheat",
"Odor Sleuth",
"Rock Tomb",
"Silver Wind",
"Metal Sound",
"Grass Whistle",
"Tickle",
"Cosmic Power",
"Water Spout",
"Signal Beam",
"Shadow Punch",
"Extrasensory",
"Sky Uppercut",
"Sand Tomb",
"Sheer Cold",
"Muddy Water",
"Bullet Seed",
"Aerial Ace",
"Icicle Spear",
"Iron Defense",
"Block",
"Howl",
"Dragon Claw",
"Frenzy Plant",
"Bulk Up",
"Bounce",
"Mud Shot",
"Poison Tail",
"Covet",
"Volt Tackle",
"Magical Leaf",
"Water Sport",
"Calm Mind",
"Leaf Blade",
"Dragon Dance",
"Rock Blast",
"Shock Wave",
"Water Pulse",
"Doom Desire",
"Psycho Boost",
"Roost",
"Gravity",
"Miracle Eye",
"Wake-Up Slap",
"Hammer Arm",
"Gyro Ball",
"Healing Wish",
"Brine",
"Natural Gift",
"Feint",
"Pluck",
"Tailwind",
"Acupressure",
"Metal Burst",
"U-turn",
"Close Combat",
"Payback",
"Assurance",
"Embargo",
"Fling",
"Psycho Shift",
"Trump Card",
"Heal Block",
"Wring Out",
"Power Trick",
"Gastro Acid",
"Lucky Chant",
"Me First",
"Copycat",
"Power Swap",
"Guard Swap",
"Punishment",
"Last Resort",
"Worry Seed",
"Sucker Punch",
"Toxic Spikes",
"Heart Swap",
"Aqua Ring",
"Magnet Rise",
"Flare Blitz",
"Force Palm",
"Aura Sphere",
"Rock Polish",
"Poison Jab",
"Dark Pulse",
"Night Slash",
"Aqua Tail",
"Seed Bomb",
"Air Slash",
"X-Scissor",
"Bug Buzz",
"Dragon Pulse",
"Dragon Rush",
"Power Gem",
"Drain Punch",
"Vacuum Wave",
"Focus Blast",
"Energy Ball",
"Brave Bird",
"Earth Power",
"Switcheroo",
"Giga Impact",
"Nasty Plot",
"Bullet Punch",
"Avalanche",
"Ice Shard",
"Shadow Claw",
"Thunder Fang",
"Ice Fang",
"Fire Fang",
"Shadow Sneak",
"Mud Bomb",
"Psycho Cut",
"Zen Headbutt",
"Mirror Shot",
"Flash Cannon",
"Rock Climb",
"Defog",
"Trick Room",
"Draco Meteor",
"Discharge",
"Lava Plume",
"Leaf Storm",
"Power Whip",
"Rock Wrecker",
"Cross Poison",
"Gunk Shot",
"Iron Head",
"Magnet Bomb",
"Stone Edge",
"Captivate",
"Stealth Rock",
"Grass Knot",
"Chatter",
"Judgment",
"Bug Bite",
"Charge Beam",
"Wood Hammer",
"Aqua Jet",
"Attack Order",
"Defend Order",
"Heal Order",
"Head Smash",
"Double Hit",
"Roar of Time",
"Spacial Rend",
"Lunar Dance",
"Crush Grip",
"Magma Storm",
"Dark Void",
"Seed Flare",
"Ominous Wind",
"Shadow Force",
"Hone Claws",
"Wide Guard",
"Guard Split",
"Power Split",
"Wonder Room",
"Psyshock",
"Venoshock",
"Autotomize",
"Rage Powder",
"Telekinesis",
"Magic Room",
"Smack Down",
"Storm Throw",
"Flame Burst",
"Sludge Wave",
"Quiver Dance",
"Heavy Slam",
"Synchronoise",
"Electro Ball",
"Soak",
"Flame Charge",
"Coil",
"Low Sweep",
"Acid Spray",
"Foul Play",
"Simple Beam",
"Entrainment",
"After You",
"Round",
"Echoed Voice",
"Chip Away",
"Clear Smog",
"Stored Power",
"Quick Guard",
"Ally Switch",
"Scald",
"Shell Smash",
"Heal Pulse",
"Hex",
"Sky Drop",
"Shift Gear",
"Circle Throw",
"Incinerate",
"Quash",
"Acrobatics",
"Reflect Type",
"Retaliate",
--"Final Gambit",
"None",
"Bestow",
"Inferno",
"Water Pledge",
"Fire Pledge",
"Grass Pledge",
"Volt Switch",
"Struggle Bug",
"Bulldoze",
"Frost Breath",
"Dragon Tail",
"Work Up",
"Electroweb",
"Wild Charge",
"Drill Run",
"Dual Chop",
"Heart Stamp",
"Horn Leech",
"Sacred Sword",
"Razor Shell",
"Heat Crash",
"Leaf Tornado",
"Steamroller",
"Cotton Guard",
"Night Daze",
"Psystrike",
"Tail Slap",
"Hurricane",
"Head Charge",
"Gear Grind",
"Searing Shot",
"Techno Blast",
"Relic Song",
"Secret Sword",
"Glaciate",
"Bolt Strike",
"Blue Flare",
"Fiery Dance",
"Freeze Shock",
"Ice Burn",
"Snarl",
"Icicle Crash",
"V-create",
"Fusion Flare",
"Fusion Bolt",
"Flying Press",
"Mat Block",
"Belch",
"Rototiller",
"Sticky Web",
"Fell Stinger",
"Phantom Force",
"Trick-or-Treat",
"Noble Roar",
"Ion Deluge",
"Parabolic Charge",
"Forest's Curse",
"Petal Blizzard",
"Freeze-Dry",
"Disarming Voice",
"Parting Shot",
"Topsy-Turvy",
"Draining Kiss",
"Crafty Shield",
"Flower Shield",
"Grassy Terrain",
"Misty Terrain",
"Electrify",
"Play Rough",
"Fairy Wind",
"Moonblast",
"Boomburst",
"Fairy Lock",
"King's Shield",
"Play Nice",
"Confide",
"Diamond Storm",
"Steam Eruption",
"Hyperspace Hole",
"Water Shuriken",
"Mystical Fire",
"Spiky Shield",
"Aromatic Mist",
"Eerie Impulse",
"Venom Drench",
"Powder",
"Geomancy",
"Magnetic Flux",
"Happy Hour",
"Electric Terrain",
"Dazzling Gleam",
"Celebrate",
"Hold Hands",
"Baby-Doll Eyes",
"Nuzzle",
"Hold Back",
"Infestation",
"Power-Up Punch",
"Oblivion Wing",
"Thousand Arrows",
"Thousand Waves",
"Land's Wrath",
"Light of Ruin",
"Origin Pulse",
"Precipice Blades",
"Dragon Ascent",
"Hyperspace Fury",
"Shore Up",
"First Impression",
"Baneful Bunker",
"Spirit Shackle",
"Darkest Lariat",
"Sparkling Aria",
"Ice Hammer",
"Floral Healing",
"High Horsepower",
"Strength Sap",
"Solar Blade",
"Leafage",
"Spotlight",
"Toxic Thread",
"Laser Focus",
"Gear Up",
"Throat Chop",
"Pollen Puff",
"Anchor Shot",
"Psychic Terrain",
"Lunge",
"Fire Lash",
"Power Trip",
"Burn Up",
"Speed Swap",
"Smart Strike",
"Purify",
"Revelation Dance",
"Core Enforcer",
"Trop Kick",
"Instruct",
"Beak Blast",
"Clanging Scales",
"Dragon Hammer",
"Brutal Swing",
"Aurora Veil",
"Shell Trap",
"Fleur Cannon",
"Psychic Fangs",
"Stomping Tantrum",
"Shadow Bone",
"Accelerock",
"Liquidation",
"Prismatic Laser",
"Spectral Thief",
"Sunsteel Strike",
"Moongeist Beam",
"Tearful Look",
"Zing Zap",
"Nature's Madness",
"Multi-Attack",
"Mind Blown",
"Plasma Fists",
"Photon Geyser",
"Zippy Zap",
"Splishy Splash",
"Floaty Fall",
"Pika Papow",
"Bouncy Bubble",
"Buzzy Buzz",
"Sizzly Slide",
"Glitzy Glow",
"Baddy Bad",
"Sappy Seed",
"Freezy Frost",
"Sparkly Swirl",
"Veevee Volley",
"Double Iron Bash",
"Dynamax Cannon",
"Snipe Shot",
"Jaw Lock",
"Stuff Cheeks",
"No Retreat",
"Tar Shot",
"Magic Powder",
"Dragon Darts",
"Teatime",
"Octolock",
"Bolt Beak",
"Fishious Rend",
"Court Change",
"Clangorous Soul",
"Body Press",
"Decorate",
"Drum Beating",
"Snap Trap",
"Pyro Ball",
"Behemoth Blade",
"Behemoth Bash",
"Aura Wheel",
"Breaking Swipe",
"Branch Poke",
"Overdrive",
"Apple Acid",
"Grav Apple",
"Spirit Break",
"Strange Steam",
"Life Dew",
"Obstruct",
"False Surrender",
"Meteor Assault",
"Eternabeam",
"Steel Beam",
"Expanding Force",
"Steel Roller",
"Scale Shot",
"Meteor Beam",
"Shell Side Arm",
--"Misty Explosion",
"None",
"Grassy Glide",
"Rising Voltage",
"Terrain Pulse",
"Skitter Smack",
"Burning Jealousy",
"Lash Out",
"Poltergeist",
"Corrosive Gas",
"Coaching",
"Flip Turn",
"Triple Axel",
"Dual Wingbeat",
"Scorching Sands",
"Jungle Healing",
"Wicked Blow",
"Surging Strikes",
"Thunder Cage",
"Dragon Energy",
"Freezing Glare",
"Fiery Wrath",
"Thunderous Kick",
"Glacial Lance",
"Astral Barrage",
"Eerie Spell",
"Dire Claw",
"Psyshield Bash",
"Power Shift",
"Stone Axe",
"Springtide Storm",
"Mystical Power",
"Raging Fury",
"Wave Crash",
"Chloroblast",
"Mountain Gale",
"Victory Dance",
"Headlong Rush",
"Barb Barrage",
"Esper Wing",
"Bitter Malice",
"Shelter",
"Triple Arrows",
"Infernal Parade",
"Ceaseless Edge",
"Bleakwind Storm",
"Wildbolt Storm",
"Sandsear Storm",
"Lunar Blessing",
"Take Heart",
"Tera Blast",
"Silk Trap",
"Axe Kick",
"Last Respects",
"Lumina Crash",
"Order Up",
"Jet Punch",
"Spicy Extract",
"Spin Out",
"Population Bomb",
"Ice Spinner",
"Glaive Rush",
"Revival Blessing",
"Salt Cure",
"Triple Dive",
"Mortal Spin",
"Doodle",
"Fillet Away",
"Kowtow Cleave",
"Flower Trick",
"Torch Song",
"Aqua Step",
"Raging Bull",
"Make It Rain",
"Ruination",
"Collision Course",
"Electro Drift",
"Shed Tail",
"Chilly Reception",
"Tidy Up",
"Snowscape",
"Pounce",
"Trailblaze",
"Chilling Water",
"Hyper Drill",
"Twin Beam",
"Rage Fist",
"Armor Cannon",
"Bitter Blade",
"Double Shock",
"Gigaton Hammer",
"Comeuppance",
"Aqua Cutter",
"Blazing Torque",
"Wicked Torque",
"Noxious Torque",
"Combat Torque",
"Magical Torque",
"Psyblade",
"Hydro Steam",
"Blood Moon",
"Matcha Gotcha",
"Syrup Bomb",
"Ivy Cudgel",
"Electro Shot",
"Tera Starstorm",
"Fickle Beam",
"Burning Bulwark",
"Thunderclap", 
"Mighty Cleave",
"Tachyon Cutter", 
"Hard Press", 
"Dragon Cheer",
"Alluring Voice",
"Temper Flare",
"Supercell Slam",
"Psychic Noise",
"Upper Hand",
"Malignant Chain",
"Nihil Light"
}

mons = {
"Bulbasaur",
"Ivysaur",
"Venusaur",
"Charmander",
"Charmeleon",
"Charizard",
"Squirtle",
"Wartortle",
"Blastoise",
"Caterpie",
"Metapod",
"Butterfree",
"Weedle",
"Kakuna",
"Beedrill",
"Pidgey",
"Pidgeotto",
"Pidgeot",
"Rattata",
"Raticate",
"Spearow",
"Fearow",
"Ekans",
"Arbok",
"Pikachu",
"Raichu",
"Sandshrew",
"Sandslash",
"Nidoran-F",
"Nidorina",
"Nidoqueen",
"Nidoran-M",
"Nidorino",
"Nidoking",
"Clefairy",
"Clefable",
"Vulpix",
"Ninetales",
"Jigglypuff",
"Wigglytuff",
"Zubat",
"Golbat",
"Oddish",
"Gloom",
"Vileplume",
"Paras",
"Parasect",
"Venonat",
"Venomoth",
"Diglett",
"Dugtrio",
"Meowth",
"Persian",
"Psyduck",
"Golduck",
"Mankey",
"Primeape",
"Growlithe",
"Arcanine",
"Poliwag",
"Poliwhirl",
"Poliwrath",
"Abra",
"Kadabra",
"Alakazam",
"Machop",
"Machoke",
"Machamp",
"Bellsprout",
"Weepinbell",
"Victreebel",
"Tentacool",
"Tentacruel",
"Geodude",
"Graveler",
"Golem",
"Ponyta",
"Rapidash",
"Slowpoke",
"Slowbro",
"Magnemite",
"Magneton",
"Farfetch’d",
"Doduo",
"Dodrio",
"Seel",
"Dewgong",
"Grimer",
"Muk",
"Shellder",
"Cloyster",
"Gastly",
"Haunter",
"Gengar",
"Onix",
"Drowzee",
"Hypno",
"Krabby",
"Kingler",
"Voltorb",
"Electrode",
"Exeggcute",
"Exeggutor",
"Cubone",
"Marowak",
"Hitmonlee",
"Hitmonchan",
"Lickitung",
"Koffing",
"Weezing",
"Rhyhorn",
"Rhydon",
"Chansey",
"Tangela",
"Kangaskhan",
"Horsea",
"Seadra",
"Goldeen",
"Seaking",
"Staryu",
"Starmie",
"Mr. Mime",
"Scyther",
"Jynx",
"Electabuzz",
"Magmar",
"Pinsir",
"Tauros",
"Magikarp",
"Gyarados",
"Lapras",
"Ditto",
"Eevee",
"Vaporeon",
"Jolteon",
"Flareon",
"Porygon",
"Omanyte",
"Omastar",
"Kabuto",
"Kabutops",
"Aerodactyl",
"Snorlax",
"Articuno",
"Zapdos",
"Moltres",
"Dratini",
"Dragonair",
"Dragonite",
"Mewtwo",
"Mew",
"Chikorita",
"Bayleef",
"Meganium",
"Cyndaquil",
"Quilava",
"Typhlosion",
"Totodile",
"Croconaw",
"Feraligatr",
"Sentret",
"Furret",
"Hoothoot",
"Noctowl",
"Ledyba",
"Ledian",
"Spinarak",
"Ariados",
"Crobat",
"Chinchou",
"Lanturn",
"Pichu",
"Cleffa",
"Igglybuff",
"Togepi",
"Togetic",
"Natu",
"Xatu",
"Mareep",
"Flaaffy",
"Ampharos",
"Bellossom",
"Marill",
"Azumarill",
"Sudowoodo",
"Politoed",
"Hoppip",
"Skiploom",
"Jumpluff",
"Aipom",
"Sunkern",
"Sunflora",
"Yanma",
"Wooper",
"Quagsire",
"Espeon",
"Umbreon",
"Murkrow",
"Slowking",
"Misdreavus",
"Unown",
"Wobbuffet",
"Girafarig",
"Pineco",
"Forretress",
"Dunsparce",
"Gligar",
"Steelix",
"Snubbull",
"Granbull",
"Qwilfish",
"Scizor",
"Shuckle",
"Heracross",
"Sneasel",
"Teddiursa",
"Ursaring",
"Slugma",
"Magcargo",
"Swinub",
"Piloswine",
"Corsola",
"Remoraid",
"Octillery",
"Delibird",
"Mantine",
"Skarmory",
"Houndour",
"Houndoom",
"Kingdra",
"Phanpy",
"Donphan",
"Porygon2",
"Stantler",
"Smeargle",
"Tyrogue",
"Hitmontop",
"Smoochum",
"Elekid",
"Magby",
"Miltank",
"Blissey",
"Raikou",
"Entei",
"Suicune",
"Larvitar",
"Pupitar",
"Tyranitar",
"Lugia",
"Ho-Oh",
"Celebi",
"Treecko",
"Grovyle",
"Sceptile",
"Torchic",
"Combusken",
"Blaziken",
"Mudkip",
"Marshtomp",
"Swampert",
"Poochyena",
"Mightyena",
"Zigzagoon",
"Linoone",
"Wurmple",
"Silcoon",
"Beautifly",
"Cascoon",
"Dustox",
"Lotad",
"Lombre",
"Ludicolo",
"Seedot",
"Nuzleaf",
"Shiftry",
"Taillow",
"Swellow",
"Wingull",
"Pelipper",
"Ralts",
"Kirlia",
"Gardevoir",
"Surskit",
"Masquerain",
"Shroomish",
"Breloom",
"Slakoth",
"Vigoroth",
"Slaking",
"Nincada",
"Ninjask",
"Shedinja",
"Whismur",
"Loudred",
"Exploud",
"Makuhita",
"Hariyama",
"Azurill",
"Nosepass",
"Skitty",
"Delcatty",
"Sableye",
"Mawile",
"Aron",
"Lairon",
"Aggron",
"Meditite",
"Medicham",
"Electrike",
"Manectric",
"Plusle",
"Minun",
"Volbeat",
"Illumise",
"Roselia",
"Gulpin",
"Swalot",
"Carvanha",
"Sharpedo",
"Wailmer",
"Wailord",
"Numel",
"Camerupt",
"Torkoal",
"Spoink",
"Grumpig",
"Spinda",
"Trapinch",
"Vibrava",
"Flygon",
"Cacnea",
"Cacturne",
"Swablu",
"Altaria",
"Zangoose",
"Seviper",
"Lunatone",
"Solrock",
"Barboach",
"Whiscash",
"Corphish",
"Crawdaunt",
"Baltoy",
"Claydol",
"Lileep",
"Cradily",
"Anorith",
"Armaldo",
"Feebas",
"Milotic",
"Castform",
"Kecleon",
"Shuppet",
"Banette",
"Duskull",
"Dusclops",
"Tropius",
"Chimecho",
"Absol",
"Wynaut",
"Snorunt",
"Glalie",
"Spheal",
"Sealeo",
"Walrein",
"Clamperl",
"Huntail",
"Gorebyss",
"Relicanth",
"Luvdisc",
"Bagon",
"Shelgon",
"Salamence",
"Beldum",
"Metang",
"Metagross",
"Regirock",
"Regice",
"Registeel",
"Latias",
"Latios",
"Kyogre",
"Groudon",
"Rayquaza",
"Jirachi",
"Deoxys",
"Turtwig",
"Grotle",
"Torterra",
"Chimchar",
"Monferno",
"Infernape",
"Piplup",
"Prinplup",
"Empoleon",
"Starly",
"Staravia",
"Staraptor",
"Bidoof",
"Bibarel",
"Kricketot",
"Kricketune",
"Shinx",
"Luxio",
"Luxray",
"Budew",
"Roserade",
"Cranidos",
"Rampardos",
"Shieldon",
"Bastiodon",
"Burmy",
"Wormadam",
"Mothim",
"Combee",
"Vespiquen",
"Pachirisu",
"Buizel",
"Floatzel",
"Cherubi",
"Cherrim",
"Shellos",
"Gastrodon",
"Ambipom",
"Drifloon",
"Drifblim",
"Buneary",
"Lopunny",
"Mismagius",
"Honchkrow",
"Glameow",
"Purugly",
"Chingling",
"Stunky",
"Skuntank",
"Bronzor",
"Bronzong",
"Bonsly",
"Mime Jr.",
"Happiny",
"Chatot",
"Spiritomb",
"Gible",
"Gabite",
"Garchomp",
"Munchlax",
"Riolu",
"Lucario",
"Hippopotas",
"Hippowdon",
"Skorupi",
"Drapion",
"Croagunk",
"Toxicroak",
"Carnivine",
"Finneon",
"Lumineon",
"Mantyke",
"Snover",
"Abomasnow",
"Weavile",
"Magnezone",
"Lickilicky",
"Rhyperior",
"Tangrowth",
"Electivire",
"Magmortar",
"Togekiss",
"Yanmega",
"Leafeon",
"Glaceon",
"Gliscor",
"Mamoswine",
"Porygon-Z",
"Gallade",
"Probopass",
"Dusknoir",
"Froslass",
"Rotom",
"Uxie",
"Mesprit",
"Azelf",
"Dialga",
"Palkia",
"Heatran",
"Regigigas",
"Giratina",
"Cresselia",
"Phione",
"Manaphy",
"Darkrai",
"Shaymin",
"Arceus",
"Victini",
"Snivy",
"Servine",
"Serperior",
"Tepig",
"Pignite",
"Emboar",
"Oshawott",
"Dewott",
"Samurott",
"Patrat",
"Watchog",
"Lillipup",
"Herdier",
"Stoutland",
"Purrloin",
"Liepard",
"Pansage",
"Simisage",
"Pansear",
"Simisear",
"Panpour",
"Simipour",
"Munna",
"Musharna",
"Pidove",
"Tranquill",
"Unfezant",
"Blitzle",
"Zebstrika",
"Roggenrola",
"Boldore",
"Gigalith",
"Woobat",
"Swoobat",
"Drilbur",
"Excadrill",
"Audino",
"Timburr",
"Gurdurr",
"Conkeldurr",
"Tympole",
"Palpitoad",
"Seismitoad",
"Throh",
"Sawk",
"Sewaddle",
"Swadloon",
"Leavanny",
"Venipede",
"Whirlipede",
"Scolipede",
"Cottonee",
"Whimsicott",
"Petilil",
"Lilligant",
"Basculin",
"Sandile",
"Krokorok",
"Krookodile",
"Darumaka",
"Darmanitan",
"Maractus",
"Dwebble",
"Crustle",
"Scraggy",
"Scrafty",
"Sigilyph",
"Yamask",
"Cofagrigus",
"Tirtouga",
"Carracosta",
"Archen",
"Archeops",
"Trubbish",
"Garbodor",
"Zorua",
"Zoroark",
"Minccino",
"Cinccino",
"Gothita",
"Gothorita",
"Gothitelle",
"Solosis",
"Duosion",
"Reuniclus",
"Ducklett",
"Swanna",
"Vanillite",
"Vanillish",
"Vanilluxe",
"Deerling",
"Sawsbuck",
"Emolga",
"Karrablast",
"Escavalier",
"Foongus",
"Amoonguss",
"Frillish",
"Jellicent",
"Alomomola",
"Joltik",
"Galvantula",
"Ferroseed",
"Ferrothorn",
"Klink",
"Klang",
"Klinklang",
"Tynamo",
"Eelektrik",
"Eelektross",
"Elgyem",
"Beheeyem",
"Litwick",
"Lampent",
"Chandelure",
"Axew",
"Fraxure",
"Haxorus",
"Cubchoo",
"Beartic",
"Cryogonal",
"Shelmet",
"Accelgor",
"Stunfisk",
"Mienfoo",
"Mienshao",
"Druddigon",
"Golett",
"Golurk",
"Pawniard",
"Bisharp",
"Bouffalant",
"Rufflet",
"Braviary",
"Vullaby",
"Mandibuzz",
"Heatmor",
"Durant",
"Deino",
"Zweilous",
"Hydreigon",
"Larvesta",
"Volcarona",
"Cobalion",
"Terrakion",
"Virizion",
"Tornadus",
"Thundurus",
"Reshiram",
"Zekrom",
"Landorus",
"Kyurem",
"Keldeo",
"Meloetta",
"Genesect",
"Chespin",
"Quilladin",
"Chesnaught",
"Fennekin",
"Braixen",
"Delphox",
"Froakie",
"Frogadier",
"Greninja",
"Bunnelby",
"Diggersby",
"Fletchling",
"Fletchinder",
"Talonflame",
"Scatterbug",
"Spewpa",
"Vivillon",
"Litleo",
"Pyroar",
"Flabébé",
"Floette",
"Florges",
"Skiddo",
"Gogoat",
"Pancham",
"Pangoro",
"Furfrou",
"Espurr",
"Meowstic",
"Honedge",
"Doublade",
"Aegislash-Both",
"Spritzee",
"Aromatisse",
"Swirlix",
"Slurpuff",
"Inkay",
"Malamar",
"Binacle",
"Barbaracle",
"Skrelp",
"Dragalge",
"Clauncher",
"Clawitzer",
"Helioptile",
"Heliolisk",
"Tyrunt",
"Tyrantrum",
"Amaura",
"Aurorus",
"Sylveon",
"Hawlucha",
"Dedenne",
"Carbink",
"Goomy",
"Sliggoo",
"Goodra",
"Klefki",
"Phantump",
"Trevenant",
"Pumpkaboo",
"Gourgeist",
"Bergmite",
"Avalugg",
"Noibat",
"Noivern",
"Xerneas",
"Yveltal",
"Zygarde",
"Diancie",
"Hoopa",
"Volcanion",
"Rowlet",
"Dartrix",
"Decidueye",
"Litten",
"Torracat",
"Incineroar",
"Popplio",
"Brionne",
"Primarina",
"Pikipek",
"Trumbeak",
"Toucannon",
"Yungoos",
"Gumshoos",
"Grubbin",
"Charjabug",
"Vikavolt",
"Crabrawler",
"Crabominable",
"Oricorio",
"Cutiefly",
"Ribombee",
"Rockruff",
"Lycanroc",
"Wishiwashi",
"Mareanie",
"Toxapex",
"Mudbray",
"Mudsdale",
"Dewpider",
"Araquanid",
"Fomantis",
"Lurantis",
"Morelull",
"Shiinotic",
"Salandit",
"Salazzle",
"Stufful",
"Bewear",
"Bounsweet",
"Steenee",
"Tsareena",
"Comfey",
"Oranguru",
"Passimian",
"Wimpod",
"Golisopod",
"Sandygast",
"Palossand",
"Pyukumuku",
"Type: Null",
"Silvally",
"Minior",
"Komala",
"Turtonator",
"Togedemaru",
"Mimikyu",
"Bruxish",
"Drampa",
"Dhelmise",
"Jangmo-o",
"Hakamo-o",
"Kommo-o",
"Tapu Koko",
"Tapu Lele",
"Tapu Bulu",
"Tapu Fini",
"Cosmog",
"Cosmoem",
"Solgaleo",
"Lunala",
"Nihilego",
"Buzzwole",
"Pheromosa",
"Xurkitree",
"Celesteela",
"Kartana",
"Guzzlord",
"Necrozma",
"Magearna",
"Marshadow",
"Poipole",
"Naganadel",
"Stakataka",
"Blacephalon",
"Zeraora",
"Meltan",
"Melmetal",
"Grookey",
"Thwackey",
"Rillaboom",
"Scorbunny",
"Raboot",
"Cinderace",
"Sobble",
"Drizzile",
"Inteleon",
"Skwovet",
"Greedent",
"Rookidee",
"Corvisquire",
"Corviknight",
"Blipbug",
"Dottler",
"Orbeetle",
"Nickit",
"Thievul",
"Gossifleur",
"Eldegoss",
"Wooloo",
"Dubwool",
"Chewtle",
"Drednaw",
"Yamper",
"Boltund",
"Rolycoly",
"Carkol",
"Coalossal",
"Applin",
"Flapple",
"Appletun",
"Silicobra",
"Sandaconda",
"Cramorant",
"Arrokuda",
"Barraskewda",
"Toxel",
"Toxtricity",
"Sizzlipede",
"Centiskorch",
"Clobbopus",
"Grapploct",
"Sinistea",
"Polteageist",
"Hatenna",
"Hattrem",
"Hatterene",
"Impidimp",
"Morgrem",
"Grimmsnarl",
"Obstagoon",
"Perrserker",
"Cursola",
"Sirfetch’d",
"Mr. Rime",
"Runerigus",
"Milcery",
"Alcremie",
"Falinks",
"Pincurchin",
"Snom",
"Frosmoth",
"Stonjourner",
"Eiscue",
"Indeedee",
"Morpeko",
"Cufant",
"Copperajah",
"Dracozolt",
"Arctozolt",
"Dracovish",
"Arctovish",
"Duraludon",
"Dreepy",
"Drakloak",
"Dragapult",
"Zacian",
"Zamazenta",
"Eternatus",
"Kubfu",
"Urshifu",
"Zarude",
"Regieleki",
"Regidrago",
"Glastrier",
"Spectrier",
"Calyrex",
"Wyrdeer",
"Kleavor",
"Ursaluna",
"Basculegion",
"Sneasler",
"Overqwil",
"Enamorus",
"Sprigatito",
"Floragato",
"Meowscarada",
"Fuecoco",
"Crocalor",
"Skeledirge",
"Quaxly",
"Quaxwell",
"Quaquaval",
"Lechonk",
"Oinkologne",
"Tarountula",
"Spidops",
"Nymble",
"Lokix",
"Pawmi",
"Pawmo",
"Pawmot",
"Tandemaus",
"Maushold",
"Fidough",
"Dachsbun",
"Smoliv",
"Dolliv",
"Arboliva",
"Squawkabilly",
"Nacli",
"Naclstack",
"Garganacl",
"Charcadet",
"Armarouge",
"Ceruledge",
"Tadbulb",
"Bellibolt",
"Wattrel",
"Kilowattrel",
"Maschiff",
"Mabosstiff",
"Shroodle",
"Grafaiai",
"Bramblin",
"Brambleghast",
"Toedscool",
"Toedscruel",
"Klawf",
"Capsakid",
"Scovillain",
"Rellor",
"Rabsca",
"Flittle",
"Espathra",
"Tinkatink",
"Tinkatuff",
"Tinkaton",
"Wiglett",
"Wugtrio",
"Bombirdier",
"Finizen",
"Palafin",
"Varoom",
"Revavroom",
"Cyclizar",
"Orthworm",
"Glimmet",
"Glimmora",
"Greavard",
"Houndstone",
"Flamigo",
"Cetoddle",
"Cetitan",
"Veluza",
"Dondozo",
"Tatsugiri",
"Annihilape",
"Clodsire",
"Farigiraf",
"Dudunsparce",
"Kingambit",
"Great Tusk",
"Scream Tail",
"Brute Bonnet",
"Flutter Mane",
"Slither Wing",
"Sandy Shocks",
"Iron Treads",
"Iron Bundle",
"Iron Hands",
"Iron Jugulis",
"Iron Moth",
"Iron Thorns",
"Frigibax",
"Arctibax",
"Baxcalibur",
"Gimmighoul",
"Gholdengo",
"Wo-Chien",
"Chien-Pao",
"Ting-Lu",
"Chi-Yu",
"Roaring Moon",
"Iron Valiant",
"Koraidon",
"Miraidon",
"Walking Wake",
"Iron Leaves",
"Dipplin",
"Poltchageist",
"Sinistcha",
"Okidogi",
"Munkidori",
"Fezandipiti",
"Ogerpon",
"Archaludon",
"Hydrapple",
"Gouging-Fire",
"Raging-Bolt",
"Iron-Boulder",
"Iron-Crown",
"Terapagos",
"Pecharunt",
"Venusaur-Mega",
"Charizard-Mega-X",
"Charizard-Mega-Y",
"Blastoise-Mega",
"Beedrill-Mega",
"Pidgeot-Mega",
"Alakazam-Mega",
"Slowbro-Mega",
"Gengar-Mega",
"Kangaskhan-Mega",
"Pinsir-Mega",
"Gyarados-Mega",
"Aerodactyl-Mega",
"Mewtwo-Mega-X",
"Mewtwo-Mega-Y",
"Ampharos-Mega",
"Steelix-Mega",
"Scizor-Mega",
"Heracross-Mega",
"Houndoom-Mega",
"Tyranitar-Mega",
"Sceptile-Mega",
"Blaziken-Mega",
"Swampert-Mega",
"Gardevoir-Mega",
"Sableye-Mega",
"Mawile-Mega",
"Aggron-Mega",
"Medicham-Mega",
"Manectric-Mega",
"Sharpedo-Mega",
"Camerupt-Mega",
"Altaria-Mega",
"Banette-Mega",
"Absol-Mega",
"Glalie-Mega",
"Salamence-Mega",
"Metagross-Mega",
"Latias-Mega",
"Latios-Mega",
"Lopunny-Mega",
"Garchomp-Mega",
"Lucario-Mega",
"Abomasnow-Mega",
"Gallade-Mega",
"Audino-Mega",
"Diancie-Mega",
"Rayquaza-Mega",
"Kyogre-Primal",
"Groudon-Primal",
"Rattata-Alola",
"Raticate-Alola",
"Raichu-Alola",
"Sandshrew-Alola",
"Sandslash-Alola",
"Vulpix-Alola",
"Ninetales-Alola",
"Diglett-Alola",
"Dugtrio-Alola",
"Meowth-Alola",
"Persian-Alola",
"Geodude-Alola",
"Graveler-Alola",
"Golem-Alola",
"Grimer-Alola",
"Muk-Alola",
"Exeggutor-Alola",
"Marowak-Alola",
"Meowth-Galar",
"Ponyta-Galar",
"Rapidash-Galar",
"Slowpoke-Galar",
"Slowbro-Galar",
"Farfetch’d-Galar",
"Weezing-Galar",
"Mr. Mime-Galar",
"Articuno-Galar",
"Zapdos-Galar",
"Moltres-Galar",
"Slowking-Galar",
"Corsola-Galar",
"Zigzagoon-Galar",
"Linoone-Galar",
"Darumaka-Galar",
"Darmanitan-Galar",
"Yamask-Galar",
"Stunfisk-Galar",
"Growlithe-Hisui",
"Arcanine-Hisui",
"Voltorb-Hisui",
"Electrode-Hisui",
"Typhlosion-Hisui",
"Qwilfish-Hisui",
"Sneasel-Hisui",
"Samurott-Hisui",
"Lilligant-Hisui",
"Zorua-Hisui",
"Zoroark-Hisui",
"Braviary-Hisui",
"Sliggoo-Hisui",
"Goodra-Hisui",
"Avalugg-Hisui",
"Decidueye-Hisui",
"Wooper-Paldea",
"Tauros-Paldea-Combat",
"Pikachu-Cosplay",
"Pikachu-Rock-Star",
"Pikachu-Belle",
"Pikachu-Pop-Star",
"Pikachu-PhD",
"Pikachu-Libre",
"Pikachu-Original",
"Pikachu-Hoenn",
"Pikachu-Sinnoh",
"Pikachu-Unova",
"Pikachu-Kalos",
"Pikachu-Alola",
"Pikachu-Partner",
"Pikachu-World",
"Pichu-Spiky-eared",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Unown",
"Castform-Sunny",
"Castform-Rainy",
"Castform-Snowy",
"Deoxys-Attack",
"Deoxys-Defense",
"Deoxys-Speed",
"Burmy",
"Burmy",
"Wormadam-Sandy",
"Wormadam-Trash",
"Cherrim-Sunshine",
"Shellos",
"Gastrodon",
"Rotom-Heat",
"Rotom-Wash",
"Rotom-Frost",
"Rotom-Fan",
"Rotom-Mow",
"Dialga-Origin",
"Palkia-Origin",
"Giratina-Origin",
"Shaymin-Sky",
"Arceus-Fighting",
"Arceus-Flying",
"Arceus-Poison",
"Arceus-Ground",
"Arceus-Rock",
"Arceus-Bug",
"Arceus-Ghost",
"Arceus-Steel",
"Arceus-Fire",
"Arceus-Water",
"Arceus-Grass",
"Arceus-Electric",
"Arceus-Psychic",
"Arceus-Ice",
"Arceus-Dragon",
"Arceus-Dark",
"Arceus-Fairy",
"Basculin-Blue-Striped",
"Basculin-White-Striped",
"Darmanitan-Zen",
"Darmanitan-Galar-Zen",
"Deerling",
"Deerling",
"Deerling",
"Sawsbuck",
"Sawsbuck",
"Sawsbuck",
"Tornadus-Therian",
"Thundurus-Therian",
"Landorus-Therian",
"Enamorus-Therian",
"Kyurem-White",
"Kyurem-Black",
"Keldeo-Resolute",
"Meloetta-Pirouette",
"Genesect-Douse",
"Genesect-Shock",
"Genesect-Burn",
"Genesect-Chill",
"Greninja",
"Greninja-Ash",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Vivillon",
"Flabébé",
"Flabébé",
"Flabébé",
"Flabébé",
"Floette",
"Floette",
"Floette",
"Floette",
"Floette-Eternal",
"Florges",
"Florges",
"Florges",
"Florges",
"Furfrou",
"Furfrou",
"Furfrou",
"Furfrou",
"Furfrou",
"Furfrou",
"Furfrou",
"Furfrou",
"Furfrou",
"Meowstic-F",
"Aegislash-Blade",
"Pumpkaboo-Small",
"Pumpkaboo-Large",
"Pumpkaboo-Super",
"Gourgeist-Small",
"Gourgeist-Large",
"Gourgeist-Super",
"Xerneas",
"Zygarde-10",
"Zygarde-10",
"Zygarde",
"Zygarde-Complete",
"Hoopa-Unbound",
"Oricorio-Pom-Pom",
"Oricorio-Pa'u ",
"Oricorio-Sensu",
"Rockruff",
"Lycanroc-Midnight",
"Lycanroc-Dusk",
"Wishiwashi-School",
"Silvally-Fighting",
"Silvally-Flying",
"Silvally-Poison",
"Silvally-Ground",
"Silvally-Rock",
"Silvally-Bug",
"Silvally-Ghost",
"Silvally-Steel",
"Silvally-Fire",
"Silvally-Water",
"Silvally-Grass",
"Silvally-Electric",
"Silvally-Psychic",
"Silvally-Ice",
"Silvally-Dragon",
"Silvally-Dark",
"Silvally-Fairy",
"Minior",
"Minior",
"Minior",
"Minior",
"Minior",
"Minior",
"Minior",
"Minior",
"Minior",
"Minior",
"Minior",
"Minior",
"Minior",
"Mimikyu-Busted",
"Necrozma-Dusk-Mane",
"Necrozma-Dawn-Wings",
"Necrozma-Ultra",
"Magearna-Original",
"Cramorant-Gulping",
"Cramorant-Gorging",
"Toxtricity-Low-Key",
"Sinistea-Antique",
"Polteageist-Antique",
"Alcremie",
"Alcremie",
"Alcremie",
"Alcremie",
"Alcremie",
"Alcremie",
"Alcremie",
"Alcremie",
"Eiscue-Noice",
"Indeedee-F",
"Morpeko-Hangry",
"Zacian-Crowned",
"Zamazenta-Crowned",
"Eternatus-Eternamax",
"Urshifu-Rapid-Strike",
"Zarude-Dada",
"Calyrex-Ice",
"Calyrex-Shadow",
"Basculegion-F",
"Oinkologne-F",
"Maushold-Four",
"Squawkabilly-Blue",
"Squawkabilly-Yellow",
"Squawkabilly-White",
"Palafin-Hero",
"Tatsugiri",
"Tatsugiri",
"Dudunsparce-Three-Segment",
"Gimmighoul-Roaming",
"Tauros-Paldea-Blaze",
"Tauros-Paldea-Aqua",
"Ogerpon-Wellspring",
"Ogerpon-Hearthflame",
"Ogerpon-Cornerstone",
"Ogerpon-Teal-Tera",
"Ogerpon-Wellspring-Tera",
"Ogerpon-Hearthflame-Tera",
"Ogerpon-Cornerstone-Tera",
"Ursaluna-Bloodmoon",
"Terapagos-Terastal",
"Terapagos-Stellar",
"Clefable-Mega",
"Victreebel-Mega",
"Starmie-Mega",
"Dragonite-Mega",
"Meganium-Mega",
"Feraligatr-Mega",
"Skarmory-Mega",
"Froslass-Mega",
"Emboar-Mega",
"Excadrill-Mega",
"Scolipede-Mega",
"Scrafty-Mega",
"Eelektross-Mega",
"Chandelure-Mega",
"Chesnaught-Mega",
"Delphox-Mega",
"Greninja-Mega",
"Pyroar-Mega",
"Floette-Eternal-Mega",
"Malamar-Mega",
"Barbaracle-Mega",
"Dragalge-Mega",
"Hawlucha-Mega",
"Zygarde-Complete-Mega",
"Drampa-Mega",
"Falinks-Mega"
}

item = {"Poke Ball",
"Great Ball",
"Ultra Ball",
"Master Ball",
"Premier Ball",
"Heal Ball",
"Net Ball",
"Nest Ball",
"Dive Ball",
"Dusk Ball",
"Timer Ball",
"Quick Ball",
"Repeat Ball",
"Luxury Ball",
"Level Ball",
"Lure Ball",
"Moon Ball",
"Friend Ball",
"Love Ball",
"Fast Ball",
"Heavy Ball",
"Dream Ball",
"Safari Ball",
"Sport Ball",
"Park Ball",
"Beast Ball",
"Cherish Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Berry Juice",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Bottle Cap",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Rare Bone",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Helix Fossil",
"Dome Fossil",
"Old Amber",
"Root Fossil",
"Claw Fossil",
"Armor Fossil",
"Skull Fossil",
"Cover Fossil",
"Plume Fossil",
"Jaw Fossil",
"Sail Fossil",
"Fossilized Bird",
"Fossilized Fish",
"Fossilized Drake",
"Fossilized Dino",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Mail",
"Mail",
"Mail",
"Mail",
"Mail",
"Mail",
"Mail",
"Mail",
"Mail",
"Mail",
"Mail",
"Mail",
"Fire Stone",
"Water Stone",
"Thunder Stone",
"Leaf Stone",
"Ice Stone",
"Sun Stone",
"Moon Stone",
"Shiny Stone",
"Dusk Stone",
"Dawn Stone",
"Sweet Apple",
"Tart Apple",
"Cracked Pot",
"Chipped Pot",
"Galarica Cuff",
"Galarica Wreath",
"Dragon Scale",
"Up-Grade",
"Protector",
"Electirizer",
"Magmarizer",
"Dubious Disc",
"Reaper Cloth",
"Prism Scale",
"Whipped Dream",
"Sachet",
"Oval Stone",
"Strawberry Sweet",
"Love Sweet",
"Berry Sweet",
"Clover Sweet",
"Flower Sweet",
"Star Sweet",
"Ribbon Sweet",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Flame Plate",
"Splash Plate",
"Zap Plate",
"Meadow Plate",
"Icicle Plate",
"Fist Plate",
"Toxic Plate",
"Earth Plate",
"Sky Plate",
"Mind Plate",
"Insect Plate",
"Stone Plate",
"Spooky Plate",
"Draco Plate",
"Dread Plate",
"Iron Plate",
"Pixie Plate",
"Douse Drive",
"Shock Drive",
"Burn Drive",
"Chill Drive",
"Fire Memory",
"Water Memory",
"Electric Memory",
"Grass Memory",
"Ice Memory",
"Fighting Memory",
"Poison Memory",
"Ground Memory",
"Flying Memory",
"Psychic Memory",
"Bug Memory",
"Rock Memory",
"Ghost Memory",
"Dragon Memory",
"Dark Memory",
"Steel Memory",
"Fairy Memory",
"Rusted Sword",
"Rusted Shield",
"Red Orb",
"Blue Orb",
"Venusaurite",
"Charizardite X",
"Charizardite Y",
"Blastoisinite",
"Beedrillite",
"Pidgeotite",
"Alakazite",
"Slowbronite",
"Gengarite",
"Kangaskhanite",
"Pinsirite",
"Gyaradosite",
"Aerodactylite",
"Mewtwonite X",
"Mewtwonite Y",
"Ampharosite",
"Steelixite",
"Scizorite",
"Heracronite",
"Houndoominite",
"Tyranitarite",
"Sceptilite",
"Blazikenite",
"Swampertite",
"Gardevoirite",
"Sablenite",
"Mawilite",
"Aggronite",
"Medichamite",
"Manectite",
"Sharpedonite",
"Cameruptite",
"Altarianite",
"Banettite",
"Absolite",
"Glalitite",
"Salamencite",
"Metagrossite",
"Latiasite",
"Latiosite",
"Lopunnite",
"Garchompite",
"Lucarionite",
"Abomasite",
"Galladite",
"Audinite",
"Diancite",
"Normal Gem",
"Fire Gem",
"Water Gem",
"Electric Gem",
"Grass Gem",
"Ice Gem",
"Fighting Gem",
"Poison Gem",
"Ground Gem",
"Flying Gem",
"Psychic Gem",
"Bug Gem",
"Rock Gem",
"Ghost Gem",
"Dragon Gem",
"Dark Gem",
"Steel Gem",
"Fairy Gem",
"Normalium Z",
"Firium Z",
"Waterium Z",
"Electrium Z",
"Grassium Z",
"Icium Z",
"Fightinium Z",
"Poisonium Z",
"Groundium Z",
"Flyinium Z",
"Psychium Z",
"Buginium Z",
"Rockium Z",
"Ghostium Z",
"Dragonium Z",
"Darkinium Z",
"Steelium Z",
"Fairium Z",
"Pikanium Z",
"Eevium Z",
"Snorlium Z",
"Mewnium Z",
"Decidium Z",
"Incinium Z",
"Primarium Z",
"Lycanium Z",
"Mimikium Z",
"Kommonium Z",
"Tapunium Z",
"Solganium Z",
"Lunalium Z",
"Marshadium Z",
"Aloraichium Z",
"Pikashunium Z",
"Ultranecrozium Z",
"Light Ball",
"Leek",
"Thick Club",
"Lucky Punch",
"Metal Powder",
"Quick Powder",
"Deep Sea Scale",
"Deep Sea Tooth",
"Soul Dew",
"Adamant Orb",
"Lustrous Orb",
"Griseous Orb",
"Sea Incense",
"Lax Incense",
"Odd Incense",
"Rock Incense",
"Full Incense",
"Wave Incense",
"Rose Incense",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Macho Brace",
"Power Weight",
"Power Bracer",
"Power Belt",
"Power Lens",
"Power Band",
"Power Anklet",
"Silk Scarf",
"Charcoal",
"Mystic Water",
"Magnet",
"Miracle Seed",
"Never-Melt Ice",
"Black Belt",
"Poison Barb",
"Soft Sand",
"Sharp Beak",
"Twisted Spoon",
"Silver Powder",
"Hard Stone",
"Spell Tag",
"Dragon Fang",
"Black Glasses",
"Metal Coat",
"Choice Band",
"Choice Specs",
"Choice Scarf",
"Flame Orb",
"Toxic Orb",
"Damp Rock",
"Heat Rock",
"Smooth Rock",
"Icy Rock",
"Electric Seed",
"Psychic Seed",
"Misty Seed",
"Grassy Seed",
"Absorb Bulb",
"Cell Battery",
"Luminous Moss",
"Snowball",
"Bright Powder",
"White Herb",
"Poke Ball",
"Quick Claw",
"Poke Ball",
"Mental Herb",
"King's Rock",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Focus Band",
"Poke Ball",
"Scope Lens",
"Leftovers",
"Shell Bell",
"Wide Lens",
"Muscle Band",
"Wise Glasses",
"Expert Belt",
"Light Clay",
"Life Orb",
"Power Herb",
"Focus Sash",
"Zoom Lens",
"Metronome",
"Iron Ball",
"Lagging Tail",
"Destiny Knot",
"Black Sludge",
"Grip Claw",
"Sticky Barb",
"Shed Shell",
"Big Root",
"Razor Claw",
"Razor Fang",
"Eviolite",
"Float Stone",
"Rocky Helmet",
"Air Balloon",
"Red Card",
"Ring Target",
"Binding Band",
"Eject Button",
"Weakness Policy",
"Assault Vest",
"Safety Goggles",
"Adrenaline Orb",
"Terrain Extender",
"Protective Pads",
"Throat Spray",
"Eject Pack",
"Heavy-Duty Boots",
"Blunder Policy",
"Room Service",
"Utility Umbrella",
"Cheri Berry",
"Chesto Berry",
"Pecha Berry",
"Rawst Berry",
"Aspear Berry",
"Leppa Berry",
"Oran Berry",
"Persim Berry",
"Lum Berry",
"Sitrus Berry",
"Figy Berry",
"Wiki Berry",
"Mago Berry",
"Aguav Berry",
"Iapapa Berry",
"Razz Berry",
"Bluk Berry",
"Nanab Berry",
"Wepear Berry",
"Pinap Berry",
"Pomeg Berry",
"Kelpsy Berry",
"Qualot Berry",
"Hondew Berry",
"Grepa Berry",
"Tamato Berry",
"Cornn Berry",
"Magost Berry",
"Rabuta Berry",
"Nomel Berry",
"Spelon Berry",
"Pamtre Berry",
"Watmel Berry",
"Durin Berry",
"Belue Berry",
"Chilan Berry",
"Occa Berry",
"Passho Berry",
"Wacan Berry",
"Rindo Berry",
"Yache Berry",
"Chople Berry",
"Kebia Berry",
"Shuca Berry",
"Coba Berry",
"Payapa Berry",
"Tanga Berry",
"Charti Berry",
"Kasib Berry",
"Haban Berry",
"Colbur Berry",
"Babiri Berry",
"Roseli Berry",
"Liechi Berry",
"Ganlon Berry",
"Salac Berry",
"Petaya Berry",
"Apicot Berry",
"Lansat Berry",
"Starf Berry",
"Enigma Berry",
"Micle Berry",
"Custap Berry",
"Jaboca Berry",
"Rowap Berry",
"Kee Berry",
"Maranga Berry",
"Enigma Berry",
"TM01",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"TM98",
"Poke Ball",
"Poke Ball",
"HM01",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"HM06",
"Poke Ball",
"HM08",
"Oval Charm",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Mach Bike",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Mystic Ticket",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Ability Shield",
"Clear Amulet",
"Punching Glove",
"Covert Cloak",
"Loaded Dice",
"Auspicious Armor",
"Booster Energy",
"Big Bamboo Shoot",
"Poke Ball",
"Poke Ball",
"Malicious Armor",
"Mirror Herb",
"Scroll of Darkness",
"Scroll of Waters",
"Tera Orb",
"Tiny Bamboo Shoot",
"Clefablite",
"Victreebelite",
"Starminite",
"Dragoninite",
"Meganiumite",
"Feraligite",
"Skarmorite",
"Froslassite",
"Emboarite",
"Excadrite",
"Scolipite",
"Scraftinite",
"Eelektrossite",
"Chandelurite",
"Chesnaughtite",
"Delphoxite",
"Greninjite",
"Pyroarite",
"Adamant Crystal",
"Griseous Core",
"Lustrous Globe",
"Black Augurite",
"Linking Cord",
"Peat Block",
"Berserk Gene",
"Fairy Feather",
"Syrupy Apple",
"Unremarkable Teacup",
"Poke Ball",
"Cornerstone Mask",
"Wellspring Mask",
"Hearthflame Mask",
"Floettite",
"Malamarite",
"Barbaracite",
"Dragalgite",
"Hawluchanite",
"Zygardite",
"Drampanite",
"Falinksite",
"Common Candy",
"Repellent",
"Pretty Feather",
"Candy Jar",
"Raichunite X",
"Raichunite Y",
"Chimechite",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
"Poke Ball",
}
abilities = {
"Stench",
"Drizzle",
"Speed Boost",
"Battle Armor",
"Sturdy",
"Damp",
"Limber",
"Sand Veil",
"Static",
"Volt Absorb",
"Water Absorb",
"Oblivious",
"Cloud Nine",
"Compound Eyes",
"Insomnia",
"Color Change",
"Immunity",
"Flash Fire",
"Shield Dust",
"Own Tempo",
"Suction Cups",
"Intimidate",
"Shadow Tag",
"Rough Skin",
"Wonder Guard",
"Levitate",
"Effect Spore",
"Synchronize",
"Clear Body",
"Natural Cure",
"Lightning Rod",
"Serene Grace",
"Swift Swim",
"Chlorophyll",
"Illuminate",
"Trace",
"Huge Power",
"Poison Point",
"Inner Focus",
"Magma Armor",
"Water Veil",
"Magnet Pull",
"Soundproof",
"Rain Dish",
"Sand Stream",
"Pressure",
"Thick Fat",
"Early Bird",
"Flame Body",
"Run Away",
"Keen Eye",
"Hyper Cutter",
"Pickup",
"Truant",
"Hustle",
"Cute Charm",
"Plus",
"Minus",
"Forecast",
"Sticky Hold",
"Shed Skin",
"Guts",
"Marvel Scale",
"Liquid Ooze",
"Overgrow",
"Blaze",
"Torrent",
"Swarm",
"Rock Head",
"Drought",
"Arena Trap",
"Vital Spirit",
"White Smoke",
"Pure Power",
"Shell Armor",
"Air Lock",
"Tangled Feet",
"Motor Drive",
"Rivalry",
"Steadfast",
"Snow Cloak",
"Gluttony",
"Anger Point",
"Unburden",
"Heatproof",
"Simple",
"Dry Skin",
"Download",
"Iron Fist",
"Poison Heal",
"Adaptability",
"Skill Link",
"Hydration",
"Solar Power",
"Quick Feet",
"Normalize",
"Sniper",
"Magic Guard",
"No Guard",
"Stall",
"Technician",
"Leaf Guard",
"Klutz",
"Mold Breaker",
"Super Luck",
"Aftermath",
"Anticipation",
"Forewarn",
"Unaware",
"Tinted Lens",
"Filter",
"Slow Start",
"Scrappy",
"Storm Drain",
"Ice Body",
"Solid Rock",
"Snow Warning",
"Honey Gather",
"Frisk",
"Reckless",
"Multitype",
"Flower Gift",
"Bad Dreams",
"Pickpocket",
"Sheer Force",
"Contrary",
"Unnerve",
"Defiant",
"Defeatist",
"Cursed Body",
"Healer",
"Friend Guard",
"Weak Armor",
"Heavy Metal",
"Light Metal",
"Multiscale",
"Toxic Boost",
"Flare Boost",
"Harvest",
"Telepathy",
"Moody",
"Overcoat",
"Poison Touch",
"Regenerator",
"Big Pecks",
"Sand Rush",
"Wonder Skin",
"Analytic",
"Illusion",
"Imposter",
"Infiltrator",
"Mummy",
"Moxie",
"Justified",
"Rattled",
"Magic Bounce",
"Sap Sipper",
"Prankster",
"Sand Force",
"Iron Barbs",
"Zen Mode",
"Victory Star",
"Turboblaze",
"Teravolt",
"Aroma Veil",
"Flower Veil",
"Cheek Pouch",
"Protean",
"Fur Coat",
"Magician",
"Bulletproof",
"Competitive",
"Strong Jaw",
"Refrigerate",
"Sweet Veil",
"Stance Change",
"Gale Wings",
"Mega Launcher",
"Grass Pelt",
"Symbiosis",
"Tough Claws",
"Pixilate",
"Gooey",
"Aerilate",
"Parental Bond",
"Dark Aura",
"Fairy Aura",
"Aura Break",
"Primordial Sea",
"Desolate Land",
"Delta Stream",
"Stamina",
"Wimp Out",
"Emergency Exit",
"Water Compaction",
"Merciless",
"Shields Down",
"Stakeout",
"Water Bubble",
"Steelworker",
"Berserk",
"Slush Rush",
"Long Reach",
"Liquid Voice",
"Triage",
"Galvanize",
"Surge Surfer",
"Schooling",
"Disguise",
"Battle Bond",
"Power Construct",
"Corrosion",
"Comatose",
"Queenly Majesty",
"Innards Out",
"Dancer",
"Battery",
"Fluffy",
"Dazzling",
"Soul Heart",
"Tangling Hair",
"Receiver",
"Power Of Alchemy",
"Beast Boost",
"Rks System",
"Electric Surge",
"Psychic Surge",
"Misty Surge",
"Grassy Surge",
"Full Metal Body",
"Shadow Shield",
"Prism Armor",
"Neuroforce",
"Intrepid Sword",
"Dauntless Shield",
"Libero",
"Ball Fetch",
"Cotton Down",
"Propeller Tail",
"Mirror Armor",
"Gulp Missile",
"Stalwart",
"Steam Engine",
"Punk Rock",
"Sand Spit",
"Ice Scales",
"Ripen",
"Ice Face",
"Power Spot",
"Mimicry",
"Screen Cleaner",
"Steely Spirit",
"Perish Body",
"Wandering Spirit",
"Gorilla Tactics",
"Neutralizing Gas",
"Pastel Veil",
"Hunger Switch",
"Quick Draw",
"Unseen Fist",
"Curious Medicine",
"Transistor",
"Dragons Maw",
"Chilling Neigh",
"Grim Neigh",
"As One (Glastrier)",
"As One (Spectrier)",
"Lingering Aroma",
"Seed Sower",
"Thermal Exchange",
"Anger Shell",
"Purifying Salt",
"Well Baked Body",
"Wind Rider",
"Guard Dog",
"Rocky Payload",
"Wind Power",
"Zero To Hero",
"Commander",
"Electromorphosis",
"Protosynthesis",
"Quark Drive",
"Good As Gold",
"Vessel Of Ruin",
"Sword Of Ruin",
"Tablets Of Ruin",
"Beads Of Ruin",
"Orichalcum Pulse",
"Hadron Engine",
"Opportunist",
"Cud Chew",
"Sharpness",
"Supreme Overlord",
"Costar",
"Toxic Debris",
"Armor Tail",
"Earth Eater",
"Mycelium Might",
"Hospitality",
"Mind's Eye",
"Embody Aspect (Teal)",
"Embody Aspect (Hearthflame)",
"Embody Aspect (Wellspring)",
"Embody Aspect (Cornerstone)",
"Toxic Chain",
"Supersweet Syrup"
}

-- PP values dictionary (mapping move names to their base PP)
movePPDict = {
["Absorb"]=25,["Accelerock"]=20,["Acid"]=30,["Acid Armor"]=20,["Acid Spray"]=20,["Acrobatics"]=15,["Acupressure"]=30,["Aerial Ace"]=20,["Aeroblast"]=5,["After You"]=15,["Agility"]=30,["Air Cutter"]=25,["Air Slash"]=15,["Ally Switch"]=15,["Amnesia"]=20,["Anchor Shot"]=20,["Ancient Power"]=5,["Apple Acid"]=10,["Aqua Jet"]=20,["Aqua Ring"]=20,["Aqua Tail"]=10,["Arm Thrust"]=20,["Aromatherapy"]=5,["Aromatic Mist"]=20,["Assist"]=20,["Assurance"]=10,["Astonish"]=15,["Astral Barrage"]=5,["Attack Order"]=15,["Attract"]=15,["Aura Sphere"]=20,["Aura Wheel"]=10,["Aurora Beam"]=20,["Aurora Veil"]=20,["Autotomize"]=15,["Avalanche"]=10,["Baby-Doll Eyes"]=10,["Baneful Bunker"]=10,["Barrage"]=20,["Barrier"]=20,["Baton Pass"]=40,["Beak Blast"]=15,["Beat Up"]=10,["Belch"]=10,["Belly Drum"]=10,["Bestow"]=15,["Bide"]=10,["Bind"]=20,["Bite"]=25,["Blast Burn"]=5,["Blaze Kick"]=10,["Blizzard"]=5,["Block"]=5,["Blue Flare"]=5,["Body Press"]=10,["Body Slam"]=15,["Bolt Beak"]=10,["Bolt Strike"]=5,["Bone Club"]=20,["Bonemerang"]=10,["Bone Rush"]=10,["Boomburst"]=10,["Bounce"]=5,["Branch Poke"]=40,["Brave Bird"]=15,["Breaking Swipe"]=15,["Brick Break"]=15,["Brine"]=10,["Brutal Swing"]=20,["Bubble"]=30,["Bubble Beam"]=20,["Bug Bite"]=20,["Bug Buzz"]=10,["Bulk Up"]=20,["Bulldoze"]=20,["Bullet Punch"]=30,["Bullet Seed"]=30,["Burning Jealousy"]=5,["Burn Up"]=5,["Calm Mind"]=20,["Camouflage"]=20,["Captivate"]=5,["Celebrate"]=40,["Charge"]=20,["Charge Beam"]=10,["Charm"]=5,["Chatter"]=20,["Chip Away"]=20,["Circle Throw"]=10,["Clamp"]=15,["Clanging Scales"]=5,["Clangorous Soul"]=5,["Clear Smog"]=15,["Close Combat"]=5,["Coaching"]=10,["Coil"]=20,["Comet Punch"]=15,["Confide"]=20,["Confuse Ray"]=10,["Confusion"]=25,["Constrict"]=35,["Conversion"]=30,["Conversion 2"]=30,["Copycat"]=20,["Core Enforcer"]=10,["Corrosive Gas"]=40,["Cosmic Power"]=20,["Cotton Guard"]=10,["Cotton Spore"]=40,["Counter"]=20,["Court Change"]=10,["Covet"]=25,["Crabhammer"]=10,["Crafty Shield"]=10,["Cross Chop"]=5,["Cross Poison"]=20,["Crunch"]=15,["Crush Claw"]=10,["Crush Grip"]=5,["Curse"]=10,["Cut"]=30,["Darkest Lariat"]=10,["Dark Pulse"]=15,["Dark Void"]=10,["Dazzling Gleam"]=10,["Decorate"]=15,["Defend Order"]=10,["Defense Curl"]=40,["Defog"]=15,["Destiny Bond"]=5,["Detect"]=5,["Diamond Storm"]=5,["Dig"]=10,["Disable"]=20,["Disarming Voice"]=15,["Discharge"]=15,["Dive"]=10,["Dizzy Punch"]=10,["Doom Desire"]=5,["Double-Edge"]=15,["Double Hit"]=10,["Double Iron Bash"]=5,["Double Kick"]=30,["Double Slap"]=10,["Double Team"]=15,["Draco Meteor"]=5,["Dragon Ascent"]=5,["Dragon Breath"]=20,["Dragon Claw"]=15,["Dragon Dance"]=20,["Dragon Darts"]=10,["Dragon Energy"]=5,["Dragon Hammer"]=15,["Dragon Pulse"]=10,["Dragon Rage"]=10,["Dragon Rush"]=10,["Dragon Tail"]=10,["Draining Kiss"]=10,["Drain Punch"]=10,["Dream Eater"]=15,["Drill Peck"]=20,["Drill Run"]=10,["Drum Beating"]=10,["Dual Chop"]=15,["Dual Wingbeat"]=10,["Dynamic Punch"]=5,["Earth Power"]=10,["Earthquake"]=10,["Echoed Voice"]=15,["Eerie Impulse"]=5,["Eerie Spell"]=5,["Egg Bomb"]=10,["Electric Terrain"]=10,["Electrify"]=20,["Electro Ball"]=10,["Electroweb"]=15,["Embargo"]=15,["Ember"]=25,["Encore"]=5,["Endeavor"]=5,["Endure"]=10,["Energy Ball"]=10,["Entrainment"]=15,["Eruption"]=5,["Expanding Force"]=10,["Explosion"]=5,["Extrasensory"]=20,["Extreme Speed"]=5,["Facade"]=20,["Fairy Lock"]=10,["Fairy Wind"]=30,["Fake Out"]=5,["Fake Tears"]=5,["False Surrender"]=10,["False Swipe"]=40,["Feather Dance"]=5,["Feint"]=10,["Feint Attack"]=20,["Fell Stinger"]=25,["Fiery Dance"]=10,["Fiery Wrath"]=10,["Final Gambit"]=5,["Fire Blast"]=5,["Fire Fang"]=15,["Fire Lash"]=15,["Fire Pledge"]=10,["Fire Punch"]=15,["Fire Spin"]=15,["First Impression"]=10,["Fishious Rend"]=10,["Fissure"]=5,["Flail"]=15,["Flame Burst"]=15,["Flame Charge"]=20,["Flame Wheel"]=25,["Flamethrower"]=15,["Flare Blitz"]=15,["Flash"]=20,["Flash Cannon"]=10,["Flatter"]=15,["Fleur Cannon"]=5,["Fling"]=10,["Flip Turn"]=20,["Floral Healing"]=10,["Flower Shield"]=10,["Fly"]=15,["Flying Press"]=10,["Focus Blast"]=5,["Focus Energy"]=30,["Focus Punch"]=20,["Follow Me"]=20,["Force Palm"]=10,["Foresight"]=40,["Forest's Curse"]=20,["Foul Play"]=15,["Freeze-Dry"]=20,["Freeze Shock"]=5,["Freezing Glare"]=10,["Frenzy Plant"]=5,["Frost Breath"]=10,["Frustration"]=20,["Fury Attack"]=20,["Fury Cutter"]=20,["Fury Swipes"]=15,["Fusion Bolt"]=5,["Fusion Flare"]=5,["Future Sight"]=10,["Gastro Acid"]=10,["Gear Grind"]=15,["Gear Up"]=20,["Geomancy"]=10,["Giga Drain"]=10,["Giga Impact"]=5,["Glacial Lance"]=5,["Glaciate"]=10,["Glare"]=30,["Grass Knot"]=20,["Grass Pledge"]=10,["Grass Whistle"]=15,["Grassy Glide"]=20,["Grassy Terrain"]=10,["Grav Apple"]=10,["Gravity"]=5,["Growl"]=10,["Growth"]=20,["Grudge"]=5,["Guard Split"]=10,["Guard Swap"]=10,["Guillotine"]=5,["Gunk Shot"]=5,["Gust"]=35,["Gyro Ball"]=5,["Hail"]=10,["Hammer Arm"]=10,["Happy Hour"]=30,["Harden"]=5,["Haze"]=30,["Headbutt"]=15,["Head Charge"]=15,["Head Smash"]=5,["Heal Bell"]=5,["Heal Block"]=15,["Healing Wish"]=10,["Heal Order"]=10,["Heal Pulse"]=10,["Heart Stamp"]=25,["Heart Swap"]=10,["Heat Crash"]=10,["Heat Wave"]=10,["Heavy Slam"]=10,["Helping Hand"]=20,["Hex"]=10,["Hidden Power"]=15,["Hidden Power Bug"]=15,["Hidden Power Dark"]=15,["Hidden Power Dragon"]=15,["Hidden Power Electric"]=15,["Hidden Power Fighting"]=15,["Hidden Power Fire"]=15,["Hidden Power Flying"]=15,["Hidden Power Ghost"]=15,["Hidden Power Grass"]=15,["Hidden Power Ground"]=15,["Hidden Power Ice"]=15,["Hidden Power Poison"]=15,["Hidden Power Psychic"]=15,["Hidden Power Rock"]=15,["Hidden Power Steel"]=15,["Hidden Power Water"]=15,["High Horsepower"]=10,["High Jump Kick"]=10,["Hold Back"]=40,["Hold Hands"]=40,["Hone Claws"]=15,["Horn Attack"]=25,["Horn Drill"]=5,["Horn Leech"]=10,["Howl"]=40,["Hurricane"]=10,["Hydro Cannon"]=5,["Hydro Pump"]=5,["Hyper Beam"]=5,["Hyper Fang"]=15,["Hyperspace Fury"]=5,["Hyperspace Hole"]=5,["Hyper Voice"]=10,["Hypnosis"]=20,["Ice Ball"]=20,["Ice Beam"]=10,["Ice Burn"]=5,["Ice Fang"]=15,["Ice Hammer"]=10,["Ice Punch"]=15,["Ice Shard"]=30,["Icicle Crash"]=10,["Icicle Spear"]=30,["Icy Wind"]=15,["Imprison"]=10,["Incinerate"]=15,["Inferno"]=5,["Infestation"]=20,["Ingrain"]=20,["Instruct"]=15,["Ion Deluge"]=25,["Iron Defense"]=15,["Iron Head"]=15,["Iron Tail"]=15,["Jaw Lock"]=10,["Judgment"]=10,["Jump Kick"]=10,["Jungle Healing"]=10,["Karate Chop"]=25,["Kinesis"]=15,["King's Shield"]=10,["Knock Off"]=20,["Land's Wrath"]=10,["Laser Focus"]=30,["Lash Out"]=5,["Last Resort"]=5,["Lava Plume"]=15,["Leafage"]=40,["Leaf Blade"]=15,["Leaf Storm"]=5,["Leaf Tornado"]=10,["Leech Life"]=10,["Leech Seed"]=10,["Leer"]=10,["Lick"]=30,["Life Dew"]=10,["Light of Ruin"]=5,["Light Screen"]=30,["Liquidation"]=10,["Lock-On"]=5,["Lovely Kiss"]=10,["Low Kick"]=20,["Low Sweep"]=20,["Lucky Chant"]=30,["Lunar Blessing"]=5,["Lunar Dance"]=10,["Lunge"]=15,["Luster Purge"]=5,["Mach Punch"]=30,["Magical Leaf"]=20,["Magic Coat"]=15,["Magic Powder"]=20,["Magic Room"]=10,["Magma Storm"]=5,["Magnet Bomb"]=20,["Magnetic Flux"]=20,["Magnet Rise"]=10,["Magnitude"]=30,["Mat Block"]=10,["Mean Look"]=5,["Meditate"]=40,["Me First"]=20,["Mega Drain"]=15,["Megahorn"]=10,["Mega Kick"]=5,["Mega Punch"]=20,["Memento"]=10,["Metal Burst"]=10,["Metal Claw"]=35,["Metal Sound"]=5,["Meteor Assault"]=5,["Meteor Beam"]=10,["Meteor Mash"]=10,["Metronome"]=10,["Milk Drink"]=5,["Mimic"]=10,["Mind Blown"]=5,["Mind Reader"]=5,["Minimize"]=10,["Miracle Eye"]=40,["Mirror Coat"]=20,["Mirror Move"]=20,["Mirror Shot"]=10,["Mist"]=30,["Mist Ball"]=5,["Misty Explosion"]=5,["Misty Terrain"]=10,["Moonblast"]=15,["Moongeist Beam"]=5,["Moonlight"]=5,["Morning Sun"]=5,["Mud Bomb"]=10,["Mud Shot"]=15,["Mud-Slap"]=10,["Mud Sport"]=15,["Muddy Water"]=10,["Multi-Attack"]=10,["Mystical Fire"]=10,["Mystical Power"]=10,["Nasty Plot"]=20,["Natural Gift"]=15,["Nature Power"]=20,["Nature's Madness"]=10,["Needle Arm"]=15,["Night Daze"]=10,["Nightmare"]=15,["Night Shade"]=15,["Night Slash"]=15,["Noble Roar"]=10,["No Retreat"]=5,["Nuzzle"]=20,["Oblivion Wing"]=10,["Obstruct"]=10,["Octazooka"]=10,["Octolock"]=15,["Odor Sleuth"]=40,["Ominous Wind"]=5,["Origin Pulse"]=10,["Outrage"]=10,["Overdrive"]=10,["Overheat"]=5,["Pain Split"]=20,["Parabolic Charge"]=20,["Parting Shot"]=20,["Payback"]=10,["Pay Day"]=20,["Peck"]=35,["Perish Song"]=5,["Petal Blizzard"]=15,["Petal Dance"]=10,["Phantom Force"]=10,["Photon Geyser"]=5,["Pin Missile"]=20,["Plasma Fists"]=15,["Play Nice"]=10,["Play Rough"]=10,["Pluck"]=20,["Poison Fang"]=15,["Poison Gas"]=40,["Poison Jab"]=20,["Poison Powder"]=35,["Poison Sting"]=35,["Poison Tail"]=25,["Pollen Puff"]=15,["Poltergeist"]=5,["Pound"]=35,["Powder"]=20,["Powder Snow"]=25,["Power Gem"]=20,["Power Split"]=10,["Power Swap"]=10,["Power Trick"]=10,["Power Trip"]=10,["Power-Up Punch"]=20,["Power Whip"]=10,["Precipice Blades"]=10,["Present"]=15,["Prismatic Laser"]=10,["Protect"]=10,["Psybeam"]=20,["Psych Up"]=10,["Psychic"]=10,["Psychic Fangs"]=10,["Psychic Terrain"]=10,["Psycho Boost"]=5,["Psycho Cut"]=20,["Psycho Shift"]=10,["Psyshock"]=10,["Psystrike"]=10,["Psywave"]=15,["Punishment"]=5,["Purify"]=20,["Pursuit"]=20,["Pyro Ball"]=5,["Quash"]=15,["Quick Attack"]=30,["Quick Guard"]=15,["Quiver Dance"]=20,["Rage"]=20,["Rage Fist"]=10,["Rage Powder"]=20,["Rain Dance"]=5,["Rapid Spin"]=40,["Razor Leaf"]=25,["Razor Shell"]=10,["Razor Wind"]=10,["Recover"]=5,["Recycle"]=10,["Reflect"]=20,["Reflect Type"]=15,["Refresh"]=20,["Relic Song"]=10,["Rest"]=5,["Retaliate"]=5,["Return"]=20,["Revelation Dance"]=15,["Revenge"]=10,["Reversal"]=15,["Rising Voltage"]=20,["Roar"]=20,["Roar of Time"]=5,["Rock Blast"]=10,["Rock Climb"]=20,["Rock Polish"]=20,["Rock Slide"]=10,["Rock Smash"]=15,["Rock Throw"]=15,["Rock Tomb"]=15,["Rock Wrecker"]=5,["Role Play"]=10,["Rolling Kick"]=15,["Rollout"]=20,["Roost"]=5,["Rototiller"]=10,["Round"]=15,["Sacred Fire"]=5,["Sacred Sword"]=15,["Safeguard"]=25,["Sand Attack"]=5,["Sandstorm"]=10,["Sand Tomb"]=15,["Scald"]=15,["Scale Shot"]=20,["Scary Face"]=10,["Scorching Sands"]=10,["Scratch"]=35,["Screech"]=5,["Searing Shot"]=5,["Secret Power"]=20,["Secret Sword"]=10,["Seed Bomb"]=15,["Seed Flare"]=5,["Seismic Toss"]=20,["Self-Destruct"]=5,["Shadow Ball"]=15,["Shadow Bone"]=10,["Shadow Claw"]=15,["Shadow Force"]=5,["Shadow Punch"]=20,["Shadow Sneak"]=30,["Sharpen"]=30,["Sheer Cold"]=5,["Shell Side Arm"]=10,["Shell Smash"]=15,["Shell Trap"]=5,["Shift Gear"]=10,["Shock Wave"]=20,["Shore Up"]=5,["Signal Beam"]=15,["Silver Wind"]=5,["Simple Beam"]=15,["Sing"]=15,["Sketch"]=1,["Skill Swap"]=10,["Skitter Smack"]=10,["Skull Bash"]=10,["Sky Attack"]=5,["Sky Drop"]=10,["Sky Uppercut"]=15,["Slack Off"]=5,["Slam"]=20,["Slash"]=20,["Sleep Powder"]=15,["Sleep Talk"]=10,["Sludge"]=20,["Sludge Bomb"]=10,["Sludge Wave"]=10,["Smack Down"]=15,["Smart Strike"]=10,["Smelling Salts"]=10,["Smog"]=20,["Smokescreen"]=20,["Snap Trap"]=15,["Snarl"]=10,["Snatch"]=10,["Snipe Shot"]=15,["Snore"]=15,["Soak"]=20,["Soft-Boiled"]=5,["Solar Beam"]=10,["Solar Blade"]=10,["Sonic Boom"]=20,["Spacial Rend"]=5,["Spark"]=20,["Sparkling Aria"]=10,["Spectral Thief"]=10,["Speed Swap"]=10,["Spider Web"]=10,["Spike Cannon"]=15,["Spikes"]=20,["Spiky Shield"]=10,["Spirit Break"]=15,["Spirit Shackle"]=10,["Spit Up"]=10,["Spite"]=10,["Splash"]=40,["Spore"]=15,["Spotlight"]=15,["Stealth Rock"]=20,["Steam Eruption"]=5,["Steamroller"]=20,["Steel Beam"]=5,["Steel Roller"]=5,["Steel Wing"]=25,["Sticky Web"]=20,["Stockpile"]=20,["Stomp"]=20,["Stomping Tantrum"]=10,["Stone Edge"]=5,["Stored Power"]=10,["Storm Throw"]=10,["Strange Steam"]=10,["Strength"]=15,["Strength Sap"]=10,["String Shot"]=40,["Struggle"]=1,["Struggle Bug"]=10,["Stuff Cheeks"]=10,["Stun Spore"]=30,["Submission"]=20,["Substitute"]=10,["Sucker Punch"]=5,["Sunny Day"]=5,["Sunsteel Strike"]=5,["Super Fang"]=10,["Superpower"]=5,["Supersonic"]=20,["Surf"]=15,["Surging Strikes"]=5,["Swagger"]=15,["Swallow"]=10,["Sweet Kiss"]=10,["Sweet Scent"]=20,["Swift"]=20,["Switcheroo"]=10,["Swords Dance"]=20,["Synchronoise"]=10,["Synthesis"]=5,["Tackle"]=35,["Tail Glow"]=20,["Tail Slap"]=10,["Tail Whip"]=30,["Tailwind"]=15,["Take Down"]=20,["Tar Shot"]=15,["Taunt"]=20,["Tearful Look"]=10,["Teatime"]=10,["Techno Blast"]=5,["Teeter Dance"]=20,["Telekinesis"]=15,["Teleport"]=20,["Terrain Pulse"]=10,["Thief"]=25,["Thousand Arrows"]=10,["Thousand Waves"]=10,["Thrash"]=10,["Throat Chop"]=15,["Thunder"]=10,["Thunderbolt"]=15,["Thunder Cage"]=15,["Thunder Fang"]=15,["Thunderous Kick"]=10,["Thunder Punch"]=15,["Thunder Shock"]=30,["Thunder Wave"]=20,["Tickle"]=10,["Topsy-Turvy"]=20,["Torment"]=15,["Toxic"]=10,["Toxic Spikes"]=20,["Toxic Thread"]=20,["Transform"]=10,["Tri Attack"]=10,["Trick"]=10,["Trick-or-Treat"]=20,["Trick Room"]=5,["Triple Axel"]=10,["Triple Kick"]=10,["Trop Kick"]=15,["Trump Card"]=5,["Twineedle"]=20,["Twister"]=20,["U-turn"]=20,["Uproar"]=10,["Vacuum Wave"]=30,["V-create"]=5,["Venom Drench"]=20,["Venoshock"]=10,["Vine Whip"]=25,["Vise Grip"]=30,["Vital Throw"]=10,["Volt Switch"]=20,["Volt Tackle"]=15,["Wake-Up Slap"]=10,["Waterfall"]=15,["Water Gun"]=25,["Water Pledge"]=10,["Water Pulse"]=20,["Water Shuriken"]=20,["Water Sport"]=15,["Water Spout"]=5,["Weather Ball"]=10,["Whirlpool"]=15,["Whirlwind"]=20,["Wicked Blow"]=5,["Wide Guard"]=10,["Wild Charge"]=15,["Will-O-Wisp"]=15,["Wing Attack"]=35,["Wish"]=10,["Withdraw"]=40,["Wonder Room"]=10,["Wood Hammer"]=15,["Work Up"]=30,["Worry Seed"]=10,["Wrap"]=20,["Wring Out"]=5,["X-Scissor"]=15,["Yawn"]=10,["Zap Cannon"]=5,["Zen Headbutt"]=15,["Zing Zap"]=10}

nature = {"Hardy","Lonely","Brave","Adamant","Naughty",
			"Bold","Docile","Relaxed","Impish","Lax",
			"Timid","Hasty","Serious","Jolly","Naive",
			"Modest","Mild","Quiet","Bashful","Rash",
			"Calm","Gentle","Sassy","Careful","Quirky"}

charmap = { [0]=
	" ", "À", "Á", "Â", "Ç", "È", "É", "Ê", "Ë", "Ì", "こ", "Î", "Ï", "Ò", "Ó", "Ô",
	"Œ", "Ù", "Ú", "Û", "Ñ", "ß", "à", "á", "ね", "ç", "è", "é", "ê", "ë", "ì", "ま",
	"î", "ï", "ò", "ó", "ô", "œ", "ù", "ú", "û", "ñ", "º", "ª", " ", "&", "+", "あ",
	"ぃ", "ぅ", "ぇ", "ぉ", "v", "=", "ょ", "が", "ぎ", "ぐ", "げ", "ご", "ざ", "じ", "ず", "ぜ",
	"ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", "ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ",
	"っ", "¿", "¡", "P\u{200d}k", "M\u{200d}n", "P\u{200d}o", "K\u{200d}é", " ", " ", " ", "Í", "%", "(", ")", "セ", "ソ",
	"タ", "チ", "ツ", "テ", "ト", "ナ", "ニ", "ヌ", "â", "ノ", "ハ", "ヒ", "フ", "ヘ", "ホ", "í",
	"ミ", "ム", "メ", "モ", "ヤ", "ユ", "ヨ", "ラ", "リ", "⬆", "⬇", "⬅", "➡", "ヲ", "ン", "ァ",
	"ィ", "ゥ", "ェ", "ォ", "ャ", "ュ", "ョ", "ガ", "ギ", "グ", "ゲ", "ゴ", "ザ", "ジ", "ズ", "ゼ",
	"ゾ", "ダ", "ヂ", "ヅ", "デ", "ド", "バ", "ビ", "ブ", "ベ", "ボ", "パ", "ピ", "プ", "ペ", "ポ",
	"ッ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "?", ".", "-", "・",
	"…", "“", "”", "‘", "’", "♂", "♀", "$", ",", "×", "/", "A", "B", "C", "D", "E",
	"F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
	"V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
	"l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "▶",
	":", "Ä", "Ö", "Ü", "ä", "ö", "ü", "⬆", "⬇", "⬅", " ", " ", " ", " ", " ", ""
}

metLocations = {
      [0x00] = "Littleroot Town",
        [0x01] = "Oldale Town",
        [0x02] = "Dewford Town",
        [0x03] = "Lavaridge Town",
        [0x04] = "Fallarbor Town",
        [0x05] = "Verdanturf Town",
        [0x06] = "Pacifidlog Town",
        [0x07] = "Petalburg City",
        [0x08] = "Slateport City",
        [0x09] = "Mauville City",
        [0x0A] = "Rustboro City",
        [0x0B] = "Fortree City",
        [0x0C] = "Lilycove City",
        [0x0D] = "Mossdeep City",
        [0x0E] = "Sootopolis City",
        [0x0F] = "Ever Grande City",
        [0x10] = "Route 101",
        [0x11] = "Route 102",
        [0x12] = "Route 103",
        [0x13] = "Route 104",
        [0x14] = "Route 105",
        [0x15] = "Route 106",
        [0x16] = "Route 107",
        [0x17] = "Route 108",
        [0x18] = "Route 109",
        [0x19] = "Route 110",
        [0x1A] = "Route 111",
        [0x1B] = "Route 112",
        [0x1C] = "Route 113",
        [0x1D] = "Route 114",
        [0x1E] = "Route 115",
        [0x1F] = "Route 116",
        [0x20] = "Route 117",
        [0x21] = "Route 118",
        [0x22] = "Route 119",
        [0x23] = "Route 120",
        [0x24] = "Route 121",
        [0x25] = "Route 122",
        [0x26] = "Route 123",
        [0x27] = "Route 124",
        [0x28] = "Route 125",
        [0x29] = "Route 126",
        [0x2A] = "Route 127",
        [0x2B] = "Route 128",
        [0x2C] = "Route 129",
        [0x2D] = "Route 130",
        [0x2E] = "Route 131",
        [0x2F] = "Route 132",
        [0x30] = "Route 133",
        [0x31] = "Route 134",
        [0x32] = "Underwater (Route 124)",
        [0x33] = "Underwater (Route 126)",
        [0x34] = "Underwater (Route 127)",
        [0x35] = "Underwater (Route 128)",
        [0x36] = "Underwater (Sootopolis City)",
        [0x37] = "Granite Cave",
        [0x38] = "Mt. Chimney",
        [0x39] = "Safari Zone",
        [0x3A] = "Battle Frontier",
        [0x3B] = "Petalburg Woods",
        [0x3C] = "Rusturf Tunnel",
        [0x3D] = "Abandoned Ship",
        [0x3E] = "New Mauville",
        [0x3F] = "Meteor Falls",
        [0x40] = "Meteor Falls (unused)",
        [0x41] = "Mt. Pyre",
        [0x42] = "Magma/Aqua Hideout",
        [0x43] = "Shoal Cave",
        [0x44] = "Seafloor Cavern",
        [0x45] = "Underwater (Seafloor Cavern)",
        [0x46] = "Victory Road",
        [0x47] = "Mirage Island",
        [0x48] = "Cave of Origin",
        [0x49] = "Southern Island",
        [0x4A] = "Fiery Path",
        [0x4B] = "Fiery Path (unused)",
        [0x4C] = "Mt. Chimney", -- Previously Jagged Pass
        [0x4D] = "Jagged Pass (unused)",
        [0x4E] = "Sealed Chamber",
        [0x4F] = "Underwater (Route 134)",
        [0x50] = "Scorched Slab",
        [0x51] = "Island Cave",
        [0xB1] = "Icicle Cave",
        [0x52] = "Desert Ruins",
        [0x53] = "Ancient Tomb",
        [0x54] = "Inside of Truck",
        [0x55] = "Sky Pillar",
        [0x56] = "Secret Base",
        [0x57] = "Ferry",
        [0xC5] = "Aqua Hideout",
        [0xC6] = "Magma Hideout",
        [0xC7] = "Mirage Tower",
        [0xC8] = "Birth Island",
        [0xC9] = "Faraway Island",
        [0xCA] = "Artisan Cave",
        [0xCB] = "Marine Cave",
        [0xCC] = "Underwater (Marine Cave)",
        [0xCD] = "Land Cave",
        [0xCE] = "Underwater (Route 105)",
        [0xCF] = "Underwater (Route 125)",
        [0xD0] = "Underwater (Route 129)",
        [0xD1] = "Desert Underpass",
        [0xD2] = "Altering Cave",
        [0xD3] = "Navel Rock",
        [0xD4] = "Trainer Hill",

    -- Groves (directly after Emerald main locations)
    [0xD5] = "Littleroot Grove",
    [0xD6] = "Oldale Grove",
    [0xD7] = "Petalburg Grove",
    [0xD8] = "Verdanturf Tunnel",
    [0xD9] = "Verdanturf Grotto",
    [0xDA] = "Altering Grove",
    [0xDB] = "Route 102 Grove",
    [0xDC] = "Rustboro Grove",
    [0xDD] = "Rustboro Grove",
    [0xDE] = "Trainer Hill",
    [0xDF] = "Land Cave",
    [0xE0] = "Altering Grove",
    [0xE1] = "Navel Rock",
    [0xE2] = "Battle Frontier",
    [0xE3] = "Artisan Cave",
    [0xE4] = "Southern Island",




	[0xFF] = "Starter",
}

pokemon_mega_data = {
    -- Pokémon avec plusieurs formes
    ["Absol"] = {
        {78, "Absol-Mega", "Absolite", "Magic Bounce"},
        {100, "Absol-Mega-Z", "Absolite Z", "Aura Break"}
    },
    ["Charizard"] = {
        {78, "Charizard-Mega-X", "Charizardite X", "Tough Claws"},
        {78, "Charizard-Mega-Y", "Charizardite Y", "Solar Power"}
    },
    ["Garchomp"] = {
        {83, "Garchomp-Mega", "Garchompite", "Sand Force"},
        {100, "Garchomp-Mega-Z", "Garchompite Z", "Aura Break"}
    },
    ["Lucario"] = {
        {92, "Lucario-Mega", "Lucarionite", "Adaptability"},
        {100, "Lucario-Mega-Z", "Lucarionite Z", "Aura Break"}
    },
    ["Raichu"] = {
        {67, "Raichu-Mega-X", "Raichunite X", "Motor Drive"},
        {67, "Raichu-Mega-Y", "Raichunite Y", "Volt Absorb"}
    },
    ["Tatsugiri"] = {
        {73, "Tatsugiri-Curly-Mega", "Tatsugirinite", "Speed Boost"},
        {73, "Tatsugiri-Droopy-Mega", "Tatsugirinite", "Speed Boost"},
        {73, "Tatsugiri-Stretchy-Mega", "Tatsugirinite", "Speed Boost"}
    },

    -- Pokémon avec une seule forme
    ["Abomasnow"] = { {67, "Abomasnow-Mega", "Abomasite", "Bulletproof"} },
    ["Aerodactyl"] = { {83, "Aerodactyl-Mega", "Aerodactylite", "Tough Claws"} },
    ["Aggron"] = { {73, "Aggron-Mega", "Aggronite", "Filter"} },
    ["Alakazam"] = { {83, "Alakazam-Mega", "Alakazite", "Trace"} },
    ["Altaria"] = { {78, "Altaria-Mega", "Altarianite", "Pixilate"} },
    ["Ampharos"] = { {60, "Ampharos-Mega", "Ampharosite", "Mold Breaker"} },
    ["Audino"] = { {60, "Audino-Mega", "Audinite", "Friend Guard"} },
    ["Banette"] = { {54, "Banette-Mega", "Banettite", "Prankster"} },
    ["Barbaracle"] = { {46, "Barbaracle-Mega", "Barbaracite", "Skill Link"} },
    ["Baxcalibur"] = { {96, "Baxcalibur-Mega", "Baxcalibrite", "Hyper Cutter"} },
    ["Beedrill"] = { {73, "Beedrill-Mega", "Beedrillite", "Adaptability"} },
    ["Blastoise"] = { {73, "Blastoise-Mega", "Blastoisinite", "Mega Launcher"} },
    ["Blaziken"] = { {92, "Blaziken-Mega", "Blazikenite", "Inner Focus"} },
    ["Camerupt"] = { {60, "Camerupt-Mega", "Cameruptite", "Sheer Force"} },
    ["Chandelure"] = { {78, "Chandelure-Mega", "Chandelurite", "Technician"} },
    ["Chesnaught"] = { {83, "Chesnaught-Mega", "Chesnaughtite", "Bulletproof"} },
    ["Chimecho"] = { {54, "Chimecho-Mega", "Chimechite", "Levitate"} },
    ["Clefable"] = { {78, "Clefable-Mega", "Clefablite", "Dazzling"} },
    ["Crabominable"] = { {67, "Crabominable-Mega", "Crabominite", "Sheer Force"} },
    ["Darkrai"] = { {100, "Darkrai-Mega", "Darkranite", "Bad Dreams"} },
    ["Delphox"] = { {83, "Delphox-Mega", "Delphoxite", "Serene Grace"} },
    ["Diancie"] = { {96, "Diancie-Mega", "Diancite", "Magic Bounce"} },
    ["Dragalge"] = { {78, "Dragalge-Mega", "Dragalgite", "Multiscale"} },
    ["Dragonite"] = { {92, "Dragonite-Mega", "Dragoninite", "No Guard"} },
    ["Drampa"] = { {73, "Drampa-Mega", "Drampanite", "Wind Rider"} },
    ["Eelektross"] = { {60, "Eelektross-Mega", "Eelektrossite", "Levitate"} },
    ["Emboar"] = { {60, "Emboar-Mega", "Emboarite", "Supreme Overlord"} },
    ["Excadrill"] = { {87, "Excadrill-Mega", "Excadrite", "Clear Body"} },
    ["Falinks"] = { {78, "Falinks-Mega", "Falinksite", "Sharpness"} },
    ["Feraligatr"] = { {73, "Feraligatr-Mega", "Feraligite", "Dragon's Maw"} },
    ["Floette"] = { {96, "Floette-Mega", "Floettite", "Aura Break"} },
    ["Froslass"] = { {78, "Froslass-Mega", "Froslassite", "Refrigerate"} },
    ["Gallade"] = { {83, "Gallade-Mega", "Galladite", "Inner Focus"} },
    ["Gardevoir"] = { {83, "Gardevoir-Mega", "Gardevoirite", "Pixilate"} },
    ["Gengar"] = { {78, "Gengar-Mega", "Gengarite", "Shadow Tag"} },
    ["Glalie"] = { {54, "Glalie-Mega", "Glalitite", "Refrigerate"} },
    ["Glimmora"] = { {83, "Glimmora-Mega", "Glimmorite", "Levitate"} },
    ["Golisopod"] = { {100, "Golisopod-Mega", "Golisopite", "Water Bubble"} },
    ["Golurk"] = { {73, "Golurk-Mega", "Golurkite", "Solid Rock"} },
    ["Greninja"] = { {83, "Greninja-Mega", "Greninjite", "Sniper"} },
    ["Gyarados"] = { {83, "Gyarados-Mega", "Gyaradosite", "Mold Breaker"} },
    ["Hawlucha"] = { {78, "Hawlucha-Mega", "Hawluchanite", "Reckless"} },
    ["Heatran"] = { {100, "Heatran-Mega", "Heatranite", "Heatproof"} },
    ["Heracross"] = { {73, "Heracross-Mega", "Heracronite", "Skill Link"} },
    ["Houndoom"] = { {78, "Houndoom-Mega", "Houndoominite", "Solar Power"} },
    ["Kangaskhan"] = { {73, "Kangaskhan-Mega", "Kangaskhanite", "Parental Bond"} },
    ["Latias"] = { {92, "Latias-Mega", "Latiasite", "Levitate"} },
    ["Latios"] = { {92, "Latios-Mega", "Latiosite", "Levitate"} },
    ["Lopunny"] = { {87, "Lopunny-Mega", "Lopunnite", "Scrappy"} },
    ["Magearna"] = { {100, "Magearna-Mega", "Magearnite", "Simple"} },
    ["Malamar"] = { {78, "Malamar-Mega", "Malamarite", "Neuroforce"} },
    ["Manectric"] = { {67, "Manectric-Mega", "Manectite", "Intimidate"} },
    ["Mawile"] = { {78, "Mawile-Mega", "Mawilite", "Huge Power"} },
    ["Medicham"] = { {83, "Medicham-Mega", "Medichamite", "Pure Power"} },
    ["Meganium"] = { {73, "Meganium-Mega", "Meganiumite", "Flower Veil"} },
    ["Meowstic"] = { {67, "Meowstic-Mega", "Meowsticite", "Synchronize"} },
    ["Metagross"] = { {92, "Metagross-Mega", "Metagrossite", "Tough Claws"} },
    ["Pidgeot"] = { {60, "Pidgeot-Mega", "Pidgeotite", "No Guard"} },
    ["Pinsir"] = { {73, "Pinsir-Mega", "Pinsirite", "Aerilate"} },
    ["Pyroar"] = { {73, "Pyroar-Mega", "Pyroarite", "Blaze"} },
    ["Sableye"] = { {100, "Sableye-Mega", "Sablenite", "Magic Bounce"} },
    ["Salamence"] = { {78, "Salamence-Mega", "Salamencite", "Aerilate"} },
    ["Sceptile"] = { {73, "Sceptile-Mega", "Sceptilite", "Limber"} },
    ["Scizor"] = { {73, "Scizor-Mega", "Scizorite", "Technician"} },
    ["Scolipede"] = { {67, "Scolipede-Mega", "Scolipite", "Steelworker"} },
    ["Scovillain"] = { {67, "Scovillain-Mega", "Scovillainite", "Chlorophyll"} },
    ["Scrafty"] = { {67, "Scrafty-Mega", "Scraftinite", "Justified"} },
    ["Sharpedo"] = { {73, "Sharpedo-Mega", "Sharpedonite", "Strong Jaw"} },
    ["Skarmory"] = { {73, "Skarmory-Mega", "Skarmorite", "Tough Claws"} },
    ["Slowbro"] = { {92, "Slowbro-Mega", "Slowbronite", "Shell Armor"} },
    ["Staraptor"] = { {73, "Staraptor-Mega", "Staraptite", "Gale Wings"} },
    ["Starmie"] = { {87, "Starmie-Mega", "Starminite", "Pure Power"} },
    ["Steelix"] = { {67, "Steelix-Mega", "Steelixite", "Sand Force"} },
    ["Swampert"] = { {83, "Swampert-Mega", "Swampertite", "Swift Swim"} },
    ["Tyranitar"] = { {78, "Tyranitar-Mega", "Tyranitarite", "Battle Armor"} },
    ["Venusaur"] = { {87, "Venusaur-Mega", "Venusaurite", "Thick Fat"} },
    ["Victreebel"] = { {73, "Victreebel-Mega", "Victreebelite", "Supersweet Syrup"} },
    ["Zeraora"] = { {100, "Zeraora-Mega", "Zeraorite", "Static"} }
}

poisonAbility = {
	["Toxic Boost"] = true,
	["Quick Feet"] = true,
	["Marvel Scale"] = true
}

burnAbility = {
	["Guts"] = true,
	["Flare Boost"] = true
}

poisonMove = {
	["Facade"] = true
}

NICKNAME_OFFSET = 0x09
NICKNAME_LEN    = 12

LANG_OFFSET     = 0x14
FLAGS_OFFSET    = 0x15

OTNAME_OFFSET   = 0x16
OTNAME_LEN      = 7

MARKINGS_OFFSET = 0x1D
CHECKSUM_OFFSET = 0x1E

ENCRYPTED_OFFSET = 0x24

local terminator=0xFF
local monNameLength=12
local speciesNameLength=13
local playerNameLength=10
local boxMonSize=80
local partyMonSize=104
local partyloc=0x2005370 --gPlayerParty
local partyCount=0x200536d --gPlayerPartyCount
local storageLoc=0x200a154 -- gPokemonStorage
local speciesInfo=0x83e0448 -- gSpeciesInfo



local speciesNameTable=0x83b4db8
function getCurve(n)
	return emu:read8(speciesInfo+(36*n)+21)
end
function slowCurve(n)
    return math.floor((5*(n^3))/4)
end
function fastCurve(n)
    return math.floor((4*(n^3))/5)
end
function medfastCurve(n)
    return n^3
end
function medslowCurve(n)
    return math.floor((6 * (n)^3) / 5) - (15 * (n)^2) + (100 * n) - 140
end
function erraticCurve(n)
    if (n<=50) then
        return math.floor(((100 - n)*n^3)/50)
    end
    if (n<=68) then
        return math.floor(((150 - n)*n^3)/100)
    end
    if (n<=98) then
        return math.floor(math.floor((1911 - 10 * n) / 3) * n^3 / 500)
    end
    return math.floor((160 - n) * n^3 / 100)
end
function flutuatingCurve(n)
	if (n<15) then
	  return math.floor((math.floor((n + 1) / 3) + 24) * n^3 / 50)
	end
	if (n<=36) then
		return math.floor((n + 14) * n^3 / 50)
	end
	return math.floor((math.floor(n / 2) + 32) * n^3 / 50)
end

function calcLevel(exp, species)
	level = 1
	while (exp>=expRequired(species,level+1)) do
		level=level+1
	end
	return level
end

function expRequired(species,level)
	expCurve = getCurve(species)
	if (expCurve == 0) then return medfastCurve(level) end
	if (expCurve == 1) then return erraticCurve(level) end
	if (expCurve == 2) then return flutuatingCurve(level) end
	if (expCurve == 3) then return medslowCurve(level) end
	if (expCurve == 4) then return fastCurve(level) end
	if (expCurve == 5) then return slowCurve(level) end
end

function getParty()
	local party = {}
	local monStart = partyloc
	for i = 1, emu:read8(partyCount) do
		party[i] = readPartyMon(monStart)
		monStart = monStart + partyMonSize
	end
	return party
end

function toString(rawstring)
    local result = ""

    for i = 1, #rawstring do
        local char = rawstring:byte(i)

        local mapped
        if char == 0xFF then
            -- Fin de chaîne, arrêt immédiat
            break
        elseif char == 0x00 then
            -- Espace standard Pokémon GBA
            mapped = " "
        else
            mapped = charmap[char]
        end

        -- Sécurité anti-crash si le caractère n'est pas dans la charmap
        if mapped ~= nil and mapped ~= "" then
            result = result .. mapped
        end
    end

    -- Filtre regex : supprime les caractères non imprimables et l'octet de langue parasite (Á)
    result = result:gsub("[^\32-\126]", "")
    return result
end

function getSlotAddress(slot)
	if (slot < 1 or slot > emu:read8(partyCount)) then
		console:log("Invalid slot number silly :3")
		return nil
	end
	local addr = partyloc + partyMonSize * (slot - 1)
	-- console:log("Pulling from address " .. addr)
	return addr
end

function indexOf(array, val)
	for i, v in ipairs(array) do
		if v == val then return i end
	end
end

function setBoxMon(address, newNature, IVs, moveSlot, moveName, level, species, abilityNum, heldItem)
	local mon = readBoxMon(address)
	local key = mon.otId ~ mon.personality

	local substructSelector = {
		[ 0] = {0, 1, 2, 3},
		[ 1] = {0, 1, 3, 2},
		[ 2] = {0, 2, 1, 3},
		[ 3] = {0, 3, 1, 2},
		[ 4] = {0, 2, 3, 1},
		[ 5] = {0, 3, 2, 1},
		[ 6] = {1, 0, 2, 3},
		[ 7] = {1, 0, 3, 2},
		[ 8] = {2, 0, 1, 3},
		[ 9] = {3, 0, 1, 2},
		[10] = {2, 0, 3, 1},
		[11] = {3, 0, 2, 1},
		[12] = {1, 2, 0, 3},
		[13] = {1, 3, 0, 2},
		[14] = {2, 1, 0, 3},
		[15] = {3, 1, 0, 2},
		[16] = {2, 3, 0, 1},
		[17] = {3, 2, 0, 1},
		[18] = {1, 2, 3, 0},
		[19] = {1, 3, 2, 0},
		[20] = {2, 1, 3, 0},
		[21] = {3, 1, 2, 0},
		[22] = {2, 3, 1, 0},
		[23] = {3, 2, 1, 0},
	}

	local pSel = substructSelector[mon.personality % 24]

	local ss0, ss1, ss2, ss3 = {}, {}, {}, {}

	-- NULL-SPECIFIC: encrypted data starts at address + 32 + 4
	for i = 0, 2 do
		ss0[i] = emu:read32(address + 32 + 4 + pSel[1] * 12 + i * 4) ~ key
		ss1[i] = emu:read32(address + 32 + 4 + pSel[2] * 12 + i * 4) ~ key
		ss2[i] = emu:read32(address + 32 + 4 + pSel[3] * 12 + i * 4) ~ key
		ss3[i] = emu:read32(address + 32 + 4 + pSel[4] * 12 + i * 4) ~ key
	end

	-- NULL-SPECIFIC IV packing: HP 0..4, Atk 5..9, Def 10..14, Spe 15..19, SpA 20..24, SpD 25..29
	if IVs ~= nil then
		ss3[1] =
			(ss3[1] & 0xC0000000) |
			((IVs[1] & 0x1F) << 0)  |
			((IVs[2] & 0x1F) << 5)  |
			((IVs[3] & 0x1F) << 10) |
			((IVs[6] & 0x1F) << 15) |
			((IVs[4] & 0x1F) << 20) |
			((IVs[5] & 0x1F) << 25)
	end

	-- NULL-SPECIFIC: hiddenNature bits are 21..25, with pokeball in 16..20
	if newNature ~= nil then
		local natureIx = indexOf(nature, newNature)
		if natureIx == nil then
			console:log("Invalid nature silly :3	")
			return
		end
		ss0[2] = (ss0[2] & 0xFC1FFFFF) | (((natureIx - 1) & 0x1F) << 21)
	end

	if moveSlot ~= nil then
		local moveIx = 0
		if moveName ~= nil then
			local tmp = indexOf(move, moveName)
			if tmp == nil then
				console:log("Invalid move silly :3")
				return
			end
			moveIx = tmp - 1
		end

		if moveSlot < 1 or moveSlot > 4 then
			console:log("Invalid move slot number silly :3")
			return
		end

		if moveSlot == 1 then
			ss1[0] = (ss1[0] & 0xFFFF0000) | moveIx
		elseif moveSlot == 2 then
			ss1[0] = (ss1[0] & 0x0000FFFF) | (moveIx << 16)
		elseif moveSlot == 3 then
			ss1[1] = (ss1[1] & 0xFFFF0000) | moveIx
		elseif moveSlot == 4 then
			ss1[1] = (ss1[1] & 0x0000FFFF) | (moveIx << 16)
		end
	end

	if abilityNum ~= nil then
		ss3[2] = (ss3[2] & 0x1FFFFFFF) | ((abilityNum & 0x3) << 29)
	end

	if level ~= nil then
		-- important note! NULL-SPECIFIC PARTY LEVEL @ address + 88
		emu:write8(address + 84 + 4, level)
		ss0[1] = expRequired(mon.species, level)
	end

	if species ~= nil then
		local speciesIx = indexOf(mons, species)
		if speciesIx == nil then
			console:log("Invalid species silly :3")
			return
		end
		ss0[0] = (ss0[0] & 0xFFFF0000) | speciesIx
		ss0[1] = expRequired(speciesIx, calcLevel(mon.experience, speciesIx))
	end

	if heldItem ~= nil then
		local itemIx = indexOf(item, heldItem)
		if itemIx == nil then
			console:log("Invalid item")
			return
		end
		ss0[0] = (ss0[0] & 0x0000FFFF) | (itemIx << 16)
	end

	-- checksum
	local checksum = 0
	for i = 0, 2 do
		checksum = checksum + (ss0[i] & 0xFFFF) + (ss0[i] >> 16)
		checksum = checksum + (ss1[i] & 0xFFFF) + (ss1[i] >> 16)
		checksum = checksum + (ss2[i] & 0xFFFF) + (ss2[i] >> 16)
		checksum = checksum + (ss3[i] & 0xFFFF) + (ss3[i] >> 16)
	end
	checksum = checksum & 0xFFFF
	emu:write16(address + CHECKSUM_OFFSET, checksum)

	for i = 0, 2 do
		emu:write32(address + 32 + 4 + pSel[1] * 12 + i * 4, ss0[i] ~ key)
		emu:write32(address + 32 + 4 + pSel[2] * 12 + i * 4, ss1[i] ~ key)
		emu:write32(address + 32 + 4 + pSel[3] * 12 + i * 4, ss2[i] ~ key)
		emu:write32(address + 32 + 4 + pSel[4] * 12 + i * 4, ss3[i] ~ key)
	end
end

-- Modifie les PP d'une attaque spécifique (ou recalcule le max si ppValue est nil)
function setOnePP(slot, moveSlot, ppValue)
    if (moveSlot < 1 or moveSlot > 4) then
        console:log("Invalid move slot number silly :3")
        return
    end

    local address = getSlotAddress(slot)
    if not address then return end

    local mon = readBoxMon(address)
    local key = mon.otId ~ mon.personality

    local substructSelector = {
        [ 0] = {0, 1, 2, 3}, [ 1] = {0, 1, 3, 2}, [ 2] = {0, 2, 1, 3}, [ 3] = {0, 3, 1, 2},
        [ 4] = {0, 2, 3, 1}, [ 5] = {0, 3, 2, 1}, [ 6] = {1, 0, 2, 3}, [ 7] = {1, 0, 3, 2},
        [ 8] = {2, 0, 1, 3}, [ 9] = {3, 0, 1, 2}, [10] = {2, 0, 3, 1}, [11] = {3, 0, 2, 1},
        [12] = {1, 2, 0, 3}, [13] = {1, 3, 0, 2}, [14] = {2, 1, 0, 3}, [15] = {3, 1, 0, 2},
        [16] = {2, 3, 0, 1}, [17] = {3, 2, 0, 1}, [18] = {1, 2, 3, 0}, [19] = {1, 3, 2, 0},
        [20] = {2, 1, 3, 0}, [21] = {3, 1, 2, 0}, [22] = {2, 3, 1, 0}, [23] = {3, 2, 1, 0},
    }

    local pSel = substructSelector[mon.personality % 24]
    local ss0, ss1, ss2, ss3 = {}, {}, {}, {}

    -- Lecture des 4 sous-structures chiffrées (décalage + 32 + 4 pour Pokémon Null)
    for i = 0, 2 do
        ss0[i] = emu:read32(address + 32 + 4 + pSel[1] * 12 + i * 4) ~ key
        ss1[i] = emu:read32(address + 32 + 4 + pSel[2] * 12 + i * 4) ~ key
        ss2[i] = emu:read32(address + 32 + 4 + pSel[3] * 12 + i * 4) ~ key
        ss3[i] = emu:read32(address + 32 + 4 + pSel[4] * 12 + i * 4) ~ key
    end

    -- Calcul automatique des PP max si aucune valeur n'est fournie
    if ppValue == nil then
        local moveId = 0
        if moveSlot == 1 then
            moveId = ss1[0] & 0xFFFF
        elseif moveSlot == 2 then
            moveId = ss1[0] >> 16
        elseif moveSlot == 3 then
            moveId = ss1[1] & 0xFFFF
        elseif moveSlot == 4 then
            moveId = ss1[1] >> 16
        end

        if moveId == 0 then
            ppValue = 0
        else
            local moveName = move[moveId + 1] or "Unknown"
            local basePP = (movePPDict and movePPDict[moveName]) or 10

            -- Bonus PP Up stockés sur 2 bits par move dans ss0[2]
            local moveBonus = ((mon.ppBonuses or 0) >> ((moveSlot - 1) * 2)) & 0x3
            ppValue = math.floor(basePP * (1 + moveBonus * 0.2))
        end
    end

    -- Écriture des PP dans ss1[2]
    if moveSlot == 1 then
        ss1[2] = (ss1[2] & 0xFFFFFF00) | (ppValue & 0xFF)
    elseif moveSlot == 2 then
        ss1[2] = (ss1[2] & 0xFFFF00FF) | ((ppValue & 0xFF) << 8)
    elseif moveSlot == 3 then
        ss1[2] = (ss1[2] & 0xFF00FFFF) | ((ppValue & 0xFF) << 16)
    elseif moveSlot == 4 then
        ss1[2] = (ss1[2] & 0x00FFFFFF) | ((ppValue & 0xFF) << 24)
    end

    -- Recalcul et écriture du checksum à l'offset 0x1E
    local checksum = 0
    for i = 0, 2 do
        checksum = checksum + (ss0[i] & 0xFFFF) + (ss0[i] >> 16)
        checksum = checksum + (ss1[i] & 0xFFFF) + (ss1[i] >> 16)
        checksum = checksum + (ss2[i] & 0xFFFF) + (ss2[i] >> 16)
        checksum = checksum + (ss3[i] & 0xFFFF) + (ss3[i] >> 16)
    end
    checksum = checksum & 0xFFFF
    emu:write16(address + CHECKSUM_OFFSET, checksum)

    -- Réécriture des sous-structures rechiffrées
    for i = 0, 2 do
        emu:write32(address + 32 + 4 + pSel[1] * 12 + i * 4, ss0[i] ~ key)
        emu:write32(address + 32 + 4 + pSel[2] * 12 + i * 4, ss1[i] ~ key)
        emu:write32(address + 32 + 4 + pSel[3] * 12 + i * 4, ss2[i] ~ key)
        emu:write32(address + 32 + 4 + pSel[4] * 12 + i * 4, ss3[i] ~ key)
    end
end

-- Applique le changement de PP à un slot ou à toute l'équipe
function setPP(slot, moveSlot, ppValue)
    local currentCount = emu:read8(partyCount)

    if slot == nil then
        for s = 1, currentCount do
            setPP(s, moveSlot, ppValue)
        end
        return
    end

    if slot < 1 or slot > currentCount then
        console:log("Invalid slot number silly :3")
        return
    end

    if moveSlot == nil then
        for m = 1, 4 do
            setOnePP(slot, m, ppValue)
        end
    else
        setOnePP(slot, moveSlot, ppValue)
    end
end

-- Raccourci pour soigner toute l'équipe
function healparty()
    heal()
end

function presleep(slot)
    local address = getSlotAddress(slot)
    if address then emu:write32(address + 80, 1 << 0 | 1 << 1 | 1 << 2) end
end

function prepoison(slot)
    local address = getSlotAddress(slot)
    if address then emu:write32(address + 80, 1 << 3) end
end

function preburn(slot)
    local address = getSlotAddress(slot)
    if address then emu:write32(address + 80, 1 << 4) end
end

function prefreeze(slot)
    local address = getSlotAddress(slot)
    if address then emu:write32(address + 80, 1 << 5) end
end

function prepara(slot)
    local address = getSlotAddress(slot)
    if address then emu:write32(address + 80, 1 << 6) end
end

function pretoxic(slot)
    local address = getSlotAddress(slot)
    if address then emu:write32(address + 80, 1 << 7) end
end


function setIVs(slot, IVs)
	local address = getSlotAddress(slot)
	if address then setBoxMon(address, nil, IVs, nil, nil, nil, nil, nil, nil) end
end

function setNature(slot, newNature)
	local address = getSlotAddress(slot)
	if address then setBoxMon(address, newNature, nil, nil, nil, nil, nil, nil, nil) end
end

function setNatureAndIVs(slot, newNature, IVs)
	local address = getSlotAddress(slot)
	if address then setBoxMon(address, newNature, IVs, nil, nil, nil, nil, nil, nil) end
end

function perfect(slot, newNature)
	local address = getSlotAddress(slot)
	if address then
		setBoxMon(address, newNature, {31,31,31,31,31,31}, nil, nil, nil, nil, nil, nil)
	end
end

function setMove(slot, moveSlot, moveName)
	local address = getSlotAddress(slot)
	if address then setBoxMon(address, nil, nil, moveSlot, moveName, nil, nil, nil, nil) end
end

function setLevel(slot, newLevel)
	local address = getSlotAddress(slot)
	if address then setBoxMon(address, nil, nil, nil, nil, newLevel, nil, nil, nil) end
end

function setSpecies(slot, newSpecies)
	local address = getSlotAddress(slot)
	if address then setBoxMon(address, nil, nil, nil, nil, nil, newSpecies, nil, nil) end
end

function setAbility(slot, newAbilityNum)
	local address = getSlotAddress(slot)
	if address then setBoxMon(address, nil, nil, nil, nil, nil, nil, newAbilityNum, nil) end
end

function setItem(slot, newHeldItem)
	local address = getSlotAddress(slot)
	if address then setBoxMon(address, nil, nil, nil, nil, nil, nil, nil, newHeldItem) end
end

function _read16BE(emu, address)
	return (emu:read8(address) << 8) | emu:read8(address + 1)
end

function readBoxMon(address)
	local mon = {}
	mon.personality = emu:read32(address + 0)
	mon.otId = emu:read32(address + 4)
	if (toString(emu:readRange(address + NICKNAME_OFFSET-1,1)) == "ヲ") then
		mon.nickname = toString(emu:readRange(address + NICKNAME_OFFSET, NICKNAME_LEN))
	else
		mon.nickname = toString(emu:readRange(address + NICKNAME_OFFSET-1, NICKNAME_LEN))
	end
	mon.language = emu:read8(address + LANG_OFFSET)
	local flags = emu:read8(address + FLAGS_OFFSET)
	mon.isBadEgg = flags & 1
	mon.hasSpecies = (flags >> 1) & 1
	mon.isEgg = (flags >> 2) & 1
	mon.otName  = toString(emu:readRange(address + OTNAME_OFFSET, OTNAME_LEN))
	mon.markings = emu:read8(address + MARKINGS_OFFSET)
	mon.checksum = emu:read16(address + CHECKSUM_OFFSET)

	local key = mon.otId ~ mon.personality
	local substructSelector = {
		[ 0] = {0, 1, 2, 3},
		[ 1] = {0, 1, 3, 2},
		[ 2] = {0, 2, 1, 3},
		[ 3] = {0, 3, 1, 2},
		[ 4] = {0, 2, 3, 1},
		[ 5] = {0, 3, 2, 1},
		[ 6] = {1, 0, 2, 3},
		[ 7] = {1, 0, 3, 2},
		[ 8] = {2, 0, 1, 3},
		[ 9] = {3, 0, 1, 2},
		[10] = {2, 0, 3, 1},
		[11] = {3, 0, 2, 1},
		[12] = {1, 2, 0, 3},
		[13] = {1, 3, 0, 2},
		[14] = {2, 1, 0, 3},
		[15] = {3, 1, 0, 2},
		[16] = {2, 3, 0, 1},
		[17] = {3, 2, 0, 1},
		[18] = {1, 2, 3, 0},
		[19] = {1, 3, 2, 0},
		[20] = {2, 1, 3, 0},
		[21] = {3, 1, 2, 0},
		[22] = {2, 3, 1, 0},
		[23] = {3, 2, 1, 0},
	}

	local pSel = substructSelector[mon.personality % 24]
	local ss0 = {}
	local ss1 = {}
	local ss2 = {}
	local ss3 = {}

	for i = 0, 2 do
		ss0[i] = emu:read32(address + 32  + 4 + pSel[1] * 12 + i * 4) ~ key
		ss1[i] = emu:read32(address + 32 + 4 + pSel[2] * 12 + i * 4) ~ key
		ss2[i] = emu:read32(address + 32 + 4 + pSel[3] * 12 + i * 4) ~ key
		ss3[i] = emu:read32(address + 32 + 4 + pSel[4] * 12 + i * 4) ~ key
	end

	mon.species = ss0[0] & 0xFFFF
	mon.heldItem = ss0[0] >> 16
	mon.experience = ss0[1]
	mon.ppBonuses = ss0[2] & 0xFF
	mon.friendship = (ss0[2] >> 8) & 0xFF
	mon.pokeball = (ss0[2] >> 16) & 0x1F
	mon.hiddenNature = (ss0[2] >> 21) & 0x1F

	mon.moves = {
		ss1[0] & 0xFFFF,
		ss1[0] >> 16,
		ss1[1] & 0xFFFF,
		ss1[1] >> 16
	}
	mon.pp = {
		ss1[2] & 0xFF,
		(ss1[2] >> 8) & 0xFF,
		(ss1[2] >> 16) & 0xFF,
		ss1[2] >> 24
	}

	mon.hpEV = ss2[0] & 0xFF
	mon.attackEV = (ss2[0] >> 8) & 0xFF
	mon.defenseEV = (ss2[0] >> 16) & 0xFF
	mon.speedEV = ss2[0] >> 24
	mon.spAttackEV = ss2[1] & 0xFF
	mon.spDefenseEV = (ss2[1] >> 8) & 0xFF
	mon.cool = (ss2[1] >> 16) & 0xFF
	mon.beauty = ss2[1] >> 24
	mon.cute = ss2[2] & 0xFF
	mon.smart = (ss2[2] >> 8) & 0xFF
	mon.tough = (ss2[2] >> 16) & 0xFF
	mon.sheen = ss2[2] >> 24

	mon.pokerus = ss3[0] & 0xFF
	mon.metLocation = (ss3[0] >> 8) & 0xFF
	flags = ss3[0] >> 16
	mon.metLevel = flags & 0x7F
	mon.metGame = (flags >> 7) & 0xF
	mon.pokeball = (flags >> 11) & 0xF
	mon.otGender = (flags >> 15) & 0x1
	flags = ss3[1]
	mon.hpIV = (flags >> 0) & 0x1F
	mon.attackIV = (flags >> 5) & 0x1F
	mon.defenseIV = (flags >> 10) & 0x1F
	mon.speedIV = (flags >> 15) & 0x1F
	mon.spAttackIV = (flags >> 20) & 0x1F
	mon.spDefenseIV = (flags >> 25) & 0x1F
	-- Bit 30 is another "isEgg" bit
	flags = ss3[2]
	mon.coolRibbon = flags & 7
	mon.beautyRibbon = (flags >> 3) & 7
	mon.cuteRibbon = (flags >> 6) & 7
	mon.smartRibbon = (flags >> 9) & 7
	mon.toughRibbon = (flags >> 12) & 7
	mon.championRibbon = (flags >> 15) & 1
	mon.winningRibbon = (flags >> 16) & 1
	mon.victoryRibbon = (flags >> 17) & 1
	mon.artistRibbon = (flags >> 18) & 1
	mon.effortRibbon = (flags >> 19) & 1
	mon.marineRibbon = (flags >> 20) & 1
	mon.landRibbon = (flags >> 21) & 1
	mon.skyRibbon = (flags >> 22) & 1
	mon.countryRibbon = (flags >> 23) & 1
	mon.nationalRibbon = (flags >> 24) & 1
	mon.earthRibbon = (flags >> 25) & 1
	mon.worldRibbon = (flags >> 26) & 1
	mon.altAbility = (flags >> 29) & 3
	return mon
end


function setShiny(slot)

    local address = getSlotAddress(slot)
    local mon = readBoxMon(address)
    local nature = getNature(mon)

    local key = mon.otId ~ mon.personality

    local substructSelector = {
        [0]={0,1,2,3},[1]={0,1,3,2},[2]={0,2,1,3},[3]={0,3,1,2},
        [4]={0,2,3,1},[5]={0,3,2,1},[6]={1,0,2,3},[7]={1,0,3,2},
        [8]={2,0,1,3},[9]={3,0,1,2},[10]={2,0,3,1},[11]={3,0,2,1},
        [12]={1,2,0,3},[13]={1,3,0,2},[14]={2,1,0,3},[15]={3,1,0,2},
        [16]={2,3,0,1},[17]={3,2,0,1},[18]={1,2,3,0},[19]={1,3,2,0},
        [20]={2,1,3,0},[21]={3,1,2,0},[22]={2,3,1,0},[23]={3,2,1,0},
    }

    local pSel = substructSelector[mon.personality % 24]

    local ss0, ss1, ss2, ss3 = {}, {}, {}, {}

    -- NULL FORMAT offset (+4)
    for i = 0, 2 do
        ss0[i] = emu:read32(address + 32 + 4 + pSel[1]*12 + i*4) ~ key
        ss1[i] = emu:read32(address + 32 + 4 + pSel[2]*12 + i*4) ~ key
        ss2[i] = emu:read32(address + 32 + 4 + pSel[3]*12 + i*4) ~ key
        ss3[i] = emu:read32(address + 32 + 4 + pSel[4]*12 + i*4) ~ key
    end

    -- generate shiny personality
    mon.personality = findShinyPersonality(mon.otId)


    emu:write32(address + 0, mon.personality)

    key = mon.otId ~ mon.personality

    local pSelAfter = substructSelector[mon.personality % 24]

    local ss0After, ss1After, ss2After, ss3After = {}, {}, {}, {}

    for i = 0, 2 do
        ss0After[i] = ss0[i]
        ss1After[i] = ss1[i]
        ss2After[i] = ss2[i]
        ss3After[i] = ss3[i]
    end

    -- checksum
    local checksum = 0
    for i = 0, 2 do
        checksum = checksum + (ss0After[i] & 0xFFFF) + (ss0After[i] >> 16)
        checksum = checksum + (ss1After[i] & 0xFFFF) + (ss1After[i] >> 16)
        checksum = checksum + (ss2After[i] & 0xFFFF) + (ss2After[i] >> 16)
        checksum = checksum + (ss3After[i] & 0xFFFF) + (ss3After[i] >> 16)
    end

    checksum = checksum & 0xFFFF
    emu:write16(address + CHECKSUM_OFFSET, checksum)

    for i = 0, 2 do
        emu:write32(address + 32 + 4 + pSelAfter[1]*12 + i*4, ss0After[i] ~ key)
        emu:write32(address + 32 + 4 + pSelAfter[2]*12 + i*4, ss1After[i] ~ key)
        emu:write32(address + 32 + 4 + pSelAfter[3]*12 + i*4, ss2After[i] ~ key)
        emu:write32(address + 32 + 4 + pSelAfter[4]*12 + i*4, ss3After[i] ~ key)
    end

    setNature(slot, nature)

end

function findShinyPersonality(otId)

    local tid = otId & 0xFFFF
    local sid = (otId >> 16) & 0xFFFF

    -- on choisit un high PID aléatoire
    local pid_hi = math.random(0, 0xFFFF)

    -- on calcule le low PID pour garantir shiny
    local pid_lo = pid_hi ~ tid ~ sid

    -- shiny value = 0
    return (pid_hi << 16) | (pid_lo & 0xFFFF)

end

function randomMon(slot)

    local address = getSlotAddress(slot)
    if not address then
        console:log("Invalid slot")
        return
    end

    -- Génère 6 IVs aléatoires (0–31)
    local ivs = {}
    for i = 1, 6 do
        ivs[i] = math.random(0, 31)
    end

    -- Nature aléatoire
    local randomNature = nature[math.random(1, #nature)]

    -- Applique directement au Pokémon
    setBoxMon(address, randomNature, ivs, nil, nil, nil, nil, nil, nil)

end

function readPartyMon(address)
	local mon = readBoxMon(address)
	mon.status = emu:read32(address + 80)
	mon.level = emu:read8(address + 84 + 4)
	mon.mail = emu:read32(address + 85 + 4)
	mon.hp = emu:read16(address + 86 + 4)
	mon.maxHP = emu:read16(address + 88 + 4)
	mon.attack = emu:read16(address + 90 + 4)
	mon.defense = emu:read16(address + 92 + 4)
	mon.speed = emu:read16(address + 94 + 4)
	mon.spAttack = emu:read16(address + 96 + 4)
	mon.spDefense = emu:read16(address + 98 + 4)
	return mon
end

 -- DEBUG FUNCTIONS
-- function getMonNameAtAddress(address)
-- 	local mon = readBoxMon(address)
-- 	local speciesName = mons[mon.species] or ("<species " .. tostring(mon.species) .. ">")
-- 	return {
-- 		speciesId = mon.species,
-- 		speciesName = speciesName,
-- 		nickname = mon.nickname,
-- 		isBadEgg = mon.isBadEgg,
-- 		hasSpecies = mon.hasSpecies,
-- 		isEgg = mon.isEgg,
-- 	}
-- end

function debugFlagsAtSlot(slot)
  local addr = getSlotAddress(slot)
  if not addr then return end
  local raw = emu:read8(addr + FLAGS_OFFSET)
  console:log(string.format("slot=%d addr=%08X flagsByte=%02X  badEgg=%d hasSpecies=%d isEgg=%d",
    slot, addr, raw, raw & 1, (raw >> 1) & 1, (raw >> 2) & 1))
end

function computeBoxChecksum(address)
  local mon = readBoxMon(address)
  local key = mon.otId ~ mon.personality

  local substructSelector = {
    [0]={0,1,2,3},[1]={0,1,3,2},[2]={0,2,1,3},[3]={0,3,1,2},[4]={0,2,3,1},[5]={0,3,2,1},
    [6]={1,0,2,3},[7]={1,0,3,2},[8]={2,0,1,3},[9]={3,0,1,2},[10]={2,0,3,1},[11]={3,0,2,1},
    [12]={1,2,0,3},[13]={1,3,0,2},[14]={2,1,0,3},[15]={3,1,0,2},[16]={2,3,0,1},[17]={3,2,0,1},
    [18]={1,2,3,0},[19]={1,3,2,0},[20]={2,1,3,0},[21]={3,1,2,0},[22]={2,3,1,0},[23]={3,2,1,0}
  }
  local pSel = substructSelector[mon.personality % 24]

  local ss = {{},{},{},{}}
  for i = 0, 2 do
    ss[1][i] = emu:read32(address + 32 + 4 + pSel[1]*12 + i*4) ~ key
    ss[2][i] = emu:read32(address + 32 + 4 + pSel[2]*12 + i*4) ~ key
    ss[3][i] = emu:read32(address + 32 + 4 + pSel[3]*12 + i*4) ~ key
    ss[4][i] = emu:read32(address + 32 + 4 + pSel[4]*12 + i*4) ~ key
  end

  local sum = 0
  for b = 1, 4 do
    for i = 0, 2 do
      sum = sum + (ss[b][i] & 0xFFFF) + (ss[b][i] >> 16)
    end
  end
  return sum & 0xFFFF
end

-- important: checksum stored and computed need to match !! thanks chatgpt for the checksum stuff, don't blame me if it doesn't work lol <3
function debugChecksumAtSlot(slot)
  local addr = getSlotAddress(slot)
  if not addr then return end
  local stored = emu:read16(addr + CHECKSUM_OFFSET)
  local computed = computeBoxChecksum(addr)
  console:log(string.format("slot=%d checksum stored=%04X computed=%04X", slot, stored, computed))
end

local function dumpBytes(addr, len)
  local s = {}
  for i = 0, len - 1 do
    s[#s+1] = string.format("%02X", emu:read8(addr + i))
  end
  return table.concat(s, " ")
end

function getNickBytesAtSlot(slot)
  local base = getSlotAddress(slot)
  if not base then return nil end
  local nickAddr = base + 8 -- see readBoxMon in NullLua
  local raw = { emu:readRange(nickAddr, monNameLength):byte(1, monNameLength) }
  return raw, nickAddr
end

local function matchAt(addr, pat)
  for i = 1, #pat do
    if emu:read8(addr + (i-1)) ~= pat[i] then return false end
  end
  return true
end

function findNickPatternInEWRAM(slot)
  local pat, nickAddr = getNickBytesAtSlot(slot)
  if not pat then return end

  console:log(string.format("Slot %d nickname bytes @ %08X:", slot, nickAddr))
  console:log(dumpBytes(nickAddr, monNameLength))

  local startAddr = 0x02000000
  local endAddr   = 0x02040000 - monNameLength

  local found = 0
  for addr = startAddr, endAddr do
    if matchAt(addr, pat) then
      found = found + 1
      console:log(string.format("Match #%d: nick @ %08X (candidate base=%08X)", found, addr, addr - 8))
      if found >= 10 then break end
    end
  end
  console:log("Done. Matches found: " .. found)
end

function findLikelyFlagsOffsets(base)
  console:log(string.format("Scanning candidate flag bytes near %08X", base))
  for off = 0, 40 do
    local b = emu:read8(base + off)
    local badEgg = b & 1
    local hasSpecies = (b >> 1) & 1
    local isEgg = (b >> 2) & 1
    if hasSpecies == 1 and badEgg == 0 then
      console:log(string.format("  candidate off=+%02X  value=%02X  (badEgg=%d hasSpecies=%d isEgg=%d)",
        off, b, badEgg, hasSpecies, isEgg))
    end
  end
end

function dumpBytesHex(base, startOff, len)
  local out = {}
  for i = 0, len-1 do
    out[#out+1] = string.format("%02X", emu:read8(base + startOff + i))
  end
  console:log(string.format("base=%08X +%02X..+%02X: %s",
    base, startOff, startOff+len-1, table.concat(out, " ")))
end

function dumpBoxMonHeader(base)
  dumpBytesHex(base, 0x00, 0x30)
end

 -- END DEBUG

function getTest(n)
	return console:log(string.format("%d",emu:read16(speciesInfo+(36*n)+24)))
end

function getAbility(mon)
	current = abilities[emu:read16(speciesInfo+(36*mon.species)+24+(mon.altAbility*2))]
    if (current == "None") then
        current = ability[(mon.species*3)+1]
    end
    return current
end

function getNature(mon)
	if (mon.hiddenNature ~= 26) then
		return nature[mon.hiddenNature + 1]
	end
	return nature[(mon.personality % 25)+1]
end

function addItem(mon)
    local str = "" -- Utilise 'local' pour ne pas polluer l'espace global
    local ability = getAbility(mon)
    
    -- 1. Test des talents prioritaires
    if poisonAbility[ability] then
        str = str .. " @ Toxic Orb"
    elseif burnAbility[ability] then
        str = str .. " @ Flame Orb"
    else
        -- 2. Test des attaques si aucun talent n'a matché
        for i = 1, 4 do
            local move_id = mon.moves[i]
            -- On vérifie que le move existe (différent de 0 ou -1 selon ton moteur)
            if move_id and move_id > 0 then 
                local mv = move[move_id + 1]
                if poisonMove[mv] then
                    str = str .. " @ Toxic Orb"
                    break -- On sort de la boucle for immédiatement
                end
            end
        end
    end
    
    return str
end


function heal(slot)
    if slot == nil then
        for s = 1, emu:read8(partyCount) do
            heal(s)
        end
        return
    end
    local address = getSlotAddress(slot)
    local maxHP = emu:read16(address + 88)
    predamage(slot, maxHP)
    setPP(slot)
end


function predamage(slot, damage)
    local address = getSlotAddress(slot)
    local maxHP = emu:read16(address + 88 + 4) -- null address diff
    if (damage <= 0) then
        console:log("You probably don't want to do that")
        return
    end
    if (damage > maxHP) then damage = maxHP end
    emu:write16(address + 86 + 4, damage & 0xFFFF)
end

function getPartyPrint(mon,level,mode)
	str = ""
	if mons[mon.species] == nil then
		return str
	end
	str = str .. mons[mon.species]
	if (mode==1) then
		if (item[mon.heldItem]) then
			str = str .. string.format(" @ %s", item[mon.heldItem])
		end
		else
		if (mode==2) then
			str = str .. addItem(mon)
		end
	end
	str = str .. string.format("\n")
	str = str .. "Ability: " .. string.format("%s", getAbility(mon)) .. string.format("\n")
	if(level == nil) then
        str = str .. string.format("Level: %d\n", mon.level)
    else
        str = str .. string.format("Level: %d\n", level)
    end
	str = str .. string.format("%s", getNature(mon)) .. " Nature" .. string.format("\n")
	str = str .. string.format("IVs: %d HP / %d Atk / %d Def / %d SpA / %d SpD / %d Spe", mon.hpIV, mon.attackIV, mon.defenseIV, mon.spAttackIV, mon.spDefenseIV, mon.speedIV) .. string.format("\n")
	for i=1,4 do
		local mv = move[mon.moves[i] + 1]
		if(mv == "Hidden Power") then
			str = str .. string.format("- Hidden Power %s\n", getHP(mon))
			else
			if(mv ~= "") then
				str = str .. string.format("- %s\n", mv)
			end
		end
	end

	str = str .. string.format("\n")

	if pokemon_mega_data[mons[mon.species]] ~= nil then
    	str = str .. getMegaPrint(mon,level)
	end

	return str
end

function getPCPrint(mon,level,mode)
	str = ""
	if mons[mon.species] == nil then
		return str
	end
	str = str ..  mons[mon.species]
	if (mode==1) then
		if (item[mon.heldItem]) then
			str = str .. string.format(" @ %s", item[mon.heldItem])
		end
		else
		if (mode==2) then
			str = str .. addItem(mon)
		end
	end
	str = str .. string.format("\n")
	str = str .. "Ability: " .. string.format("%s", getAbility(mon)) .. string.format("\n")
	if(level == nil) then
        str = str .. string.format("Level: %d\n", calcLevel(mon.experience, mon.species))
    else
        str = str .. string.format("Level: %d\n", level)
    end
	str = str .. string.format("%s", getNature(mon)) .. " Nature" .. string.format("\n")
	str = str .. string.format("IVs: %d HP / %d Atk / %d Def / %d SpA / %d SpD / %d Spe", mon.hpIV, mon.attackIV, mon.defenseIV, mon.spAttackIV, mon.spDefenseIV, mon.speedIV) .. string.format("\n")
	for i=1,4 do
		local mv = move[mon.moves[i] + 1]
		if(mv == "Hidden Power") then
			str = str .. string.format("- Hidden Power %s\n", getHP(mon))
			else
			if(mv ~= "") then
				str = str .. string.format("- %s\n", mv)
			end
		end
	end

	str = str .. string.format("\n")

	if pokemon_mega_data[mons[mon.species]] ~= nil then
    	str = str .. getMegaPrint(mon,level)
	end

	return str
end

function getMegaPrint(mon,level)
    local finalStr = ""
    local speciesName = mons[mon.species]

    if speciesName == nil then
        return finalStr
    end

    local forms = pokemon_mega_data[speciesName]
    if forms == nil then
        return finalStr
    end

    local currentLevel = level

    if(level == nil) then
    	currentLevel = calcLevel(mon.experience, mon.species)
    end

    for i, data in ipairs(forms) do
        local requiredLevel = data[1]

        if currentLevel >= requiredLevel then
            finalStr = finalStr .. getMegaPrintByData(mon, data, currentLevel)
        end
    end

    return finalStr
end

function getMegaPrintByData(mon, data, level)
    local megaName = data[2]
    local itemName = data[3]
    local abilityName = data[4]
    
    local str = ""
    str = str .. string.format("%s", megaName)
    str = str .. string.format(" @ %s", itemName)
    str = str .. string.format("\n")
    str = str .. string.format("Ability: %s",abilityName) .. string.format("\n")
    str = str .. string.format("Level: %d", level) .. string.format("\n")
    str = str .. string.format("%s",getNature(mon))  .. " Nature" .. string.format("\n")
    str = str .. string.format("IVs: %d HP / %d Atk / %d Def / %d SpA / %d SpD / %d Spe", 
        mon.hpIV, mon.attackIV, mon.defenseIV, mon.spAttackIV, mon.spDefenseIV, mon.speedIV) .. string.format("\n")
    
    for i=1,4 do
        local mv = move[mon.moves[i] + 1]
        if(mv == "Hidden Power") then
            str = str .. string.format("- Hidden Power %s", getHP(mon)) .. string.format("\n")
        elseif(mv ~= nil and mv ~= "") then
            str = str .. string.format("- %s", mv) .. string.format("\n")
        end
    end
    
    str = str .. string.format("\n")
    return str
end

function printPartyStatus(buffer,level,mode)
    address = storageLoc + 4
    i = 0
	buffer:clear()
	for _, mon in ipairs(getParty()) do
		if (mon.species ~= 0) then
			buffer:print(getPartyPrint(mon,level,mode))
		end
	end
    while i<120 do
		if (emu:read32(address) ~=0) then 
			buffer:print(getPCPrint(readBoxMon(address),level,mode))
		end
		i = i+1
		address = address + 84
	end
end

function getHP(mon)
    hptype = ((mon.hpIV%2 + (2*(mon.attackIV%2))+(4*(mon.defenseIV%2))+(8*(mon.speedIV%2))+(16*(mon.spAttackIV%2))+(32*(mon.spDefenseIV%2)))*5)/21
    hptype = math.floor(hptype)
	if (hptype == 0) then
		return "Fighting"
	end
	if (hptype == 1) then
		return "Flying"
	end
	if (hptype == 2) then
		return "Poison"
	end
	if (hptype == 3) then
		return "Ground"
	end
	if (hptype == 4) then
		return "Rock"
	end
	if (hptype ==5) then
		return "Bug"
	end
	if (hptype == 6) then
		return "Ghost"
	end
	if (hptype ==7) then
		return "Steel"
	end
	if (hptype == 8) then
		return "Fire"
	end
	if (hptype == 9) then
		return "Water"
	end
	if (hptype == 10) then
		return "Grass"
	end
	if (hptype == 11) then
		return "Electric"
	end
	if (hptype == 12) then
		return "Psychic"
	end
	if (hptype == 13) then
		return "Ice"
	end
	if (hptype == 14) then
		return "Dragon"
	end
	if (hptype == 15) then
		return "Dark"
	end
end



function getHiddens(buffer)
	address = storageLoc + 4
	i = 0
	buffer:clear()
	for _, mon in ipairs(getParty()) do
		if (mon.species ~= 0) then
			buffer:print(string.format("%s - %s\n", mons[mon.species], getHP(mon)))
		end
	end
	while i<120 do
		if (emu:read32(address) ~=0) then 
			buffer:print(string.format("%s - %s\n",mons[readBoxMon(address).species], getHP(readBoxMon(address))))
		end
		i = i+1
		address = address + 84
	end
end

function hiddens()
	if not hiddenBuffer then
		console:log("error")
		return
	end
	getHiddens(hiddenBuffer)
end

function startScript()
	console:log('To update your exports type "export()"')
	if not partyBuffer then
		partyBuffer = console:createBuffer("Showdown Export")
		partyBuffer:setSize(800,1000)
	end
	if not hiddenBuffer then
		hiddenBuffer = console:createBuffer("Hidden Powers")
		hiddenBuffer:setSize(200,200)
	end

	if not killCounterBuffer then
        killCounterBuffer = console:createBuffer("Null Nuzlocke Tracker")
        killCounterBuffer:setSize(400, 800)
    end

	if not helpBuffer then
		helpBuffer = console:createBuffer("Help Text")
		helpBuffer:setSize(250, 300)
		helpBuffer:clear()
		helpBuffer:print('To update your exports type `export()`\n')
		helpBuffer:print('To update your exports with held items type `exportItem()`\n')
		helpBuffer:print('To update your exports with preburn/toxic type `exportStatus()`\n')
		helpBuffer:print('To update your exports with a specific level type `export(Level)`\n')
		helpBuffer:print('To update hidden powers type `hiddens()`\n')
		helpBuffer:print('To perfect a mon: `perfect(slotNum, "Nature")`\n')
		helpBuffer:print('To set a move: `setMove(slotNum, moveSlotNum, "MoveName")`\n')
		helpBuffer:print('To set a nature: `setNature(slotNum, "Nature")`\n')
		helpBuffer:print('To set IVs: `setIVs(slotNum, {hp, atk, def, spa, spd, spe})`\n')
		helpBuffer:print('To set nature + IVs: `setNatureAndIVs(slotNum, "Nature", {hp, atk, def, spa, spd, spe})`\n')
		helpBuffer:print('To set level: `setLevel(slotNum, level)`\n')
		helpBuffer:print('To set species: `setSpecies(slotNum, "Species")`\n')
		helpBuffer:print('To set ability slot: `setAbility(slotNum, abilityNum)`\n')
		helpBuffer:print('To set item: `setItem(slotNum, "Item")`\n')
		helpBuffer:print('To pre-damage: `predamage(slotNum, desiredHP)`\n')
		helpBuffer:print('To heal a mon / party: `heal(slotNum)` or `healparty()`\n')
		helpBuffer:print('To pre-status: `prepoison(slotNum)`, `preburn(slotNum)`, `pretoxic(slotNum)`, `prepara(slotNum)`, `presleep(slotNum)`, `prefreeze(slotNum)`\n')
		helpBuffer:print('To heal status only: `healStatus(slotNum)`\n')
		helpBuffer:print('To restore/set PP: `setPP(slotNum, [moveSlotNum], [ppValue])`\n')
		helpBuffer:print('To set shiny: `setShiny(slotNum)`\n')
		helpBuffer:print('To randomize the nature and IVs of a mon (Soft bag): `randomMon(slotNum)`\n')
	end


	export()
end


function export(level)
	if not partyBuffer then
		console:log("error party buffer")
		return
	end
	printPartyStatus(partyBuffer,level,0)
	if not hiddenBuffer then
		console:log("error hidden buffer")
		return
	end
	hiddens()


	if not killCounterBuffer then
		console:log("error encounter tracking buffer")
		return
	end
    exportFull(killCounterBuffer)
end

function exportItem(level)
	if not partyBuffer then
		console:log("error party buffer")
		return
	end
	printPartyStatus(partyBuffer,level,1)
	if not hiddenBuffer then
		console:log("error hidden buffer")
		return
	end
	hiddens()


	if not killCounterBuffer then
		console:log("error encounter tracking buffer")
		return
	end
    exportFull(killCounterBuffer)
end

function exportStatus(level)
	if not partyBuffer then
		console:log("error party buffer")
		return
	end
	printPartyStatus(partyBuffer,level,2)
	if not hiddenBuffer then
		console:log("error hidden buffer")
		return
	end
	hiddens()


	if not killCounterBuffer then
		console:log("error encounter tracking buffer")
		return
	end
    exportFull(killCounterBuffer)
end

function getMetLocationName(id)
    return metLocations[id] or ("Unknown Location (0x" .. string.format("%X", id) .. ")")
end

function exportFull(buffer)
    buffer:clear()

    -- PARTY
    for _, mon in ipairs(getParty()) do
        if mon.species ~= 0 and mons[mon.species] ~= nil then
            buffer:print(string.format(
                "Name: %s\nNickname: %s\nMet Location: %s\nNature: %s\nAbility: %s\nIVs: HP %d / Atk %d / Def %d / SpA %d / SpD %d / Spe %d\n\n",
                mons[mon.species],
                mon.nickname ~= "" and mon.nickname or "None",
                getMetLocationName(mon.metLocation),
                getNature(mon),
                getAbility(mon),
                mon.hpIV or 0,
                mon.attackIV or 0,
                mon.defenseIV or 0,
                mon.spAttackIV or 0,
                mon.spDefenseIV or 0,
                mon.speedIV or 0
            ))
        end
    end

    -- PC BOXES
    local boxBaseAddress = storageLoc + 4
    local totalBoxMons = 120
    local slotSize = 84

    for i = 0, totalBoxMons - 1 do
        local address = boxBaseAddress + i * slotSize
        if emu:read32(address) ~= 0 then
            local mon = readBoxMon(address)
            if mon and mon.species ~= 0 and mons[mon.species] ~= nil then
                buffer:print(string.format(
                    "Name: %s\nNickname: %s\nMet Location: %s\nNature: %s\nAbility: %s\nIVs: HP %d / Atk %d / Def %d / SpA %d / SpD %d / Spe %d\n\n",
                    mons[mon.species],
                    mon.nickname ~= "" and mon.nickname or "None",
                    getMetLocationName(mon.metLocation),
                    getNature(mon),
                    getAbility(mon),
                    mon.hpIV or 0,
                    mon.attackIV or 0,
                    mon.defenseIV or 0,
                    mon.spAttackIV or 0,
                    mon.spDefenseIV or 0,
                    mon.speedIV or 0
                ))
            end
        end
    end

        -- DEAD BOXES
    local totalBoxMons = 90
    local slotSize = 84
    local boxBaseAddress = storageLoc + 4 + 11*slotSize*30

    for i = 0, totalBoxMons - 1 do
        local address = boxBaseAddress + i * slotSize
        if emu:read32(address) ~= 0 then
            local mon = readBoxMon(address)
            if mon and mon.species ~= 0 and mons[mon.species] ~= nil then
                buffer:print(string.format(
                    "Name: %s\nNickname: %s\nMet Location: %s\nNature: %s\nAbility: %s\nIVs: HP %d / Atk %d / Def %d / SpA %d / SpD %d / Spe %d\n\n",
                    mons[mon.species],
                    mon.nickname ~= "" and mon.nickname or "None",
                    getMetLocationName(mon.metLocation),
                    getNature(mon),
                    getAbility(mon),
                    mon.hpIV or 0,
                    mon.attackIV or 0,
                    mon.defenseIV or 0,
                    mon.spAttackIV or 0,
                    mon.spDefenseIV or 0,
                    mon.speedIV or 0
                ))
            end
        end
    end
end

callbacks:add("start", startScript)
if emu then
	startScript()
end

