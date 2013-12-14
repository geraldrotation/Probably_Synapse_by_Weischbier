ProbablyEngine.rotation.register_custom(251, "[PvE] Dual Wield made by Weischbier v1.0", 
{ -- Combat	
	{{ -- Non Rotational Abilities
		{{ -- Interrupts
			{ "47528", "target.casting" },						-- Mind Freeze with a casting target
			
			{ "108194", {										-- Asphyxiate
				"player.spell(108194).exists",					-- Asphyxiate when Asphyxiate exists in our Spellbook AND
				"player.spell(47528).cooldown < 12",			-- Asphyxiate with Mind Freeze less than 12s cooldowntime remaining AND
				"target.casting", }},							-- Asphyxiate with a casting target
			
			{ "47476", {										-- Strangulate
				"player.spell(47476).exists",					-- Strangulate when Strangulate exists in our Spellbook AND
				"player.spell(47528).cooldown < 12",			-- Strangulate with Mind Freeze less than 12s cooldowntime remaining AND
				"target.casting", }},							-- Strangulate with a casting target
		}, "modifier.interrupt" }, 								-- Interrupts with Interrupt modifier enabled
	
		{{ -- Items
			{ "#76095", {										-- Potion of Mogu Power
				"modifier.cooldowns",							-- Potion of Mogu Power with modifier Cooldowns enabled AND
				"@Synapse.PotionOfMoguPower()",					-- Potion of Mogu Power with custom function AND
				"!player.buff(105706)" }},						-- Potion of Mogu Power when we don't have Potion of Mogu Power buff
			
			{ "#5512", {										-- Healthstone
				"@Synapse.Healthstone()",						-- Healthstone with custom function AND
				"player.health < 20" }},						-- Healthstone with less than 20% health
	
			{ "#89640", { 										-- Life Spirit
				"@Synapse.LifeSpirit()",						-- Life Spirit with custom function AND
				"player.health < 40",							-- Life Spirit with less than 40% health AND
				"!player.buff(130649)" }},						-- Life Spirit with no Life Spirit Buff
			
			{ "#77589", "@Synapse.Landshark()" }				-- G91 Landshark with custom function
		}}, -- End of Items
		
		{{ -- Defensive Cooldowns
			{ "59545", {										-- Gift of the Naaru (Dreanai racial)
				"player.health < 40",							-- Gift of the Naaru when player has les than 40% health
				"player.spell(59545).exists" }},				-- Gift of the Naaru when Death Siphon exists in our Spellbook
				
			{ "51052", { 										-- Anti-Magic Zone	
				"modifier.lalt",								-- Anti-Magic Zone with Left Alt pressed down			
				"player.spell(51052).exists" }, "ground" }, 	-- Anti-Magic Zone when Anti-Magic Zone exists in our Spellbook
			
			{ "47541", {										-- Death Siphon
				"player.health < 40",							-- Death Siphon when player has les than 40% health
				"player.spell(47541).exists" }},				-- Death Siphon when Death Siphon exists in our Spellbook
			
			{ "47541", {										-- Death Coil
				"player.buff(49039)",							-- Death Coil when player has Lichborne acive AND
				"player.health < 90" }},						-- Death Coil when player has less than 90% health
			
			{ "49039", {										-- Lichborne
				"!player.buff(49039)",							-- Lichborne when we don't have Lichborne active AND
				"player.health < 40",							-- Lichborne when player has less than 40% health AND
				"player.spell(49039).exists" }},				-- Lichborne when Lichborne exists in our Spellbook
	
			{ "49998", {										-- Death Strike
				"player.health < 85",							-- Death Strike with less than 85% health AND
				"player.buff(101568)" }},						-- Death Strike with Dark Succor Buff
		
			{ "119975", {										-- Conversion
				"player.spell(119975).exists",					-- Conversion when Conversion exists in our Spellbook AND
				"player.runicpower >= 20",						-- Conversion with more or equal then 20 Runicpower AND
				"player.health < 20",							-- Conversion with less than 20% health AND
				"!player.buff(119975)" }},						-- Conversion with no Conversion Buff applied
		
			{ "!/cancelaura Conversion", {						-- Cancel Conversion EN Version
				"player.health > 90",							-- Cancel Conversion with at least 90% health AND
				"player.buff(119975)" }},						-- Cancel Conversion with Conversion Buff applied
		
			{ "!/cancelaura Umwandlung", {						-- Cancel Conversion DE Version
				"player.health > 90",							-- Cancel Conversion with at least 90% health AND
				"player.buff(119975)" }},						-- Cancel Conversion with Conversion Buff applied
		}}, -- End of Defenseive Cooldowns
			
		{{ -- Dark Simulacrum Usage on Focus
			{ "77606", "focus.casting(144214)" , "focus" },		-- Dark Simulacrum when Focus is casting Froststorm Bolt (Wavebinder Kardris)
			{ "77606", "focus.casting(143432)" , "focus" },		-- Dark Simulacrum when Focus is casting Arcane Shock (General Nazgrim; Kor'kron Arcweaver)
			{ "77606", "focus.casting(145790)" , "focus" },		-- Dark Simulacrum when Focus is casting Residue (Spoils of Pandaria; Zar'thik Amber Priest)
			{ "77606", "focus.casting(145812)" , "focus" },		-- Dark Simulacrum when Focus is casting Rage of the Empress (Spoils of Pandaria; Set'thik Wind Wielder)
			{ "77606", "focus.casting(144584)" , "focus" },		-- Dark Simulacrum when Focus is casting Chain Lighning (Garrosh; Farseer Wolf Rider)
		}, { "focus.exists",
			 "focus.alive",
			 "focus.casting" }},
		
		{{ -- Use mirrored Spells
			{ "144214", "player.spell(144214).exists" , "target" },	-- Froststorm Bolt when spell exists on our target
			{ "143432", "player.spell(143432).exists" , "target" },	-- Arcane Shock when spell exists on our target
			{ "145790", "player.spell(145790).exists" , "player" },	-- Residue when spell exists on player (150.000,00 Healing Buff)
			{ "145812", "player.spell(145812).exists" , "player" },	-- Rage of the Empress when spell exists on player (5% more damage)
			{ "144584", "player.spell(144584).exists" , "target" },	-- Chain Lightning when spell exists on our target
		}},
			
		{{ -- Offensive Cooldowns; Let's line them up properly, it doesn't make sense to cast them async.			
			{ "51271" },										-- Pillar of Frost		
			
			{ "#gloves", {										-- Synapse Springs
				"@Synapse.SynapseSprings()",					-- Synapse Springs with custom function
				"player.buff(51271)" }},						-- Synapse Springs with Pillar of Frost Buff applied	
			
			{ "46584", {										-- Raise Dead
				"modifier.cooldowns",							-- Raise Dead with Cooldowns modifier enabled AND
				"player.buff(51271)", }},						-- Raise Dead with Pillar of Frost Buff applied
				
			{ "20572", {										-- Blood Fury (Orc racial)
				"modifier.cooldowns",							-- Blood Fury with Cooldowns modifier enabled AND
				"player.spell(20572).exists",					-- Blood Fury when Blood Fury exists in our Spellbook AND
				"player.buff(51271)", }},						-- Blood Fury when player has Buff Pillar of Frost
				
			{ "26297", {										-- Berserking (Troll racial)
				"modifier.cooldowns",							-- Berserking with Cooldowns modifier enabled AND
				"player.spell(26297).exists",					-- Berserking when Berserking exists in our Spellbook AND
				"player.buff(51271)", }},						-- Berserking when player has Buff Pillar of Frost 
				
			{ "50613", {										-- Arcane Torrent (Belf racial)
				"modifier.cooldowns",							-- Arcane Torrent with Cooldowns modifier enabled AND
				"player.spell(50613).exists",					-- Arcane Torrent when Arcane Torrent exists in our Spellbook AND
				"player.runicpower < 100", }},					-- Arcane Torrent when players Runicower is below 100
				
			{ "69041", {										-- Rocket Barrage (Goblin racial)
				"modifier.cooldowns",							-- Rocket Barrage with Cooldowns modifier enabled AND
				"player.spell(69041).exists",					-- Rocket Barrage when Rocket Barrage exists in our Spellbook AND
				"player.buff(51271)", }},						-- Rocket Barrage when player has Buff Pillar of Frost 
				
		}, "target.range <= 13" },								-- Offensive Cooldowns with our target at least 13f close to us

		{{ -- Misc Talents; Blood Tap, Tier 6, Pestilence
			{ "69070", {										-- Rocket Jump (Gobin racial)
				"target.distance > 15",							-- Rocket Jump when our target is more than 15f away from player AND
				"player.spell(69070).exists" }},				-- Rocket Jump exists in our Spellbook
				
			{ "68992", {										-- Dark Flight (Worhen racial)
				"target.distance > 15",							-- Dark Flight when our target is more than 15f away from player AND
				"player.spell(68992).exists" }},				-- Dark Flight when our target is more than 15f away from player AND
				
			{ "96268", {										-- Deaths Advance (non Worgen Version)
				"target.distance > 15",							-- Deaths Advance when our target is more than 15f away from player AND
				"player.spell(96268).exists",					-- Deaths Advance when Deaths Advance exists in our Spellbook AND
				"!player.spell(68992).exists" }},				-- Deaths Advance when Dark Flight does not exist in our Spellbook
			
			{{
				{ "108199", "player.spell(108199).exists" },	-- Gorefiend's Graps when Gorfiend's Grasp exists in our Spellbook OR
				{ "108200", "player.spell(108200).exists" },	-- Remorseless Winter when Remorseless Winter exists in our Spellbook OR
				{ "108201", "player.spell(108201).exists" },	-- Desecrated Ground when Desecrated Ground exists in our Spellbook AND
			}, "modifier.ralt" },								-- Tier 6 Talent with Right Alt modifier pressed down
			
			{ "45529", {										-- Blood Tap
				"player.runes.depleted",						-- Blood Tap with depleted runes 
				"player.buff(114851).count >= 5",				-- Blood Tap with at least 5 stacks of Blood Charge
				"player.spell(45529).exists" }},				-- Blood Tap when Blood Tap exists in our Spellbook
	
			{ "50842", {										-- Pestilence; made it available at all time so you don't need to switch rotation styles always. Figured it would make more sense this way. lol
				"modifier.lcontrol",							-- Pestilence with Left Control (STRG) pressed down AND
				"target.debuff(55078)",							-- Pestilence with Frost Fever applied AND
				"target.debuff(55095)", }},						-- Pestilence with Blood Plague applied
		}},
		
	}, { "target.exists",
		 "target.alive",
		 "player.alive" }}, -- End of Non Rotational Abilities
		
	{{ -- Multitarget Rotation
		{{														 -- Unholy Blight
			{ "115989", "!target.debuff(55078)" },	 			 -- UnholyBlight with no Frost Fever ticking OR
			{ "115989", "!target.debuff(55095)" },	 			 -- UnholyBlight with no Blood Plague no AND
		}, "player.spell(115989).exists" },				 	 	 -- UnholyBlight when Unholy Blight exists in our Spellbook
			
		{ "77575", "!target.debuff(55095)" },					 -- Outbreak with no Frost Fever applied OR
		{ "77575", "!target.debuff(55078)" },					 -- Outbreak with no Blood Plague applied

		{ "45462", {											 -- Plague Strike
			"!target.debuff(55078)",							 -- Plague Strike with no Blood Plague applied AND
			"player.runes(unholy).count > 0", }},				 -- Plague Strike with at least 1 Unholy Rune
			
		{{
			{ "49184", "player.runes(frost).count > 0" },		 -- Howling Blast with at least 1 Frost Rune OR
			{ "49184", "player.buff(59052)" },					 -- Howling Blast with a Rime Proc AND
		}, "!target.debuff(55095)" },							 -- Howling Blast with no Frost Fever applied
	
		{ "43265", "player.runes(unholy).count > 0", "ground" }, -- Death and Decay with at least 1 Unholy Rune
	
		{ "49184" },											 -- Howling Blast
	
		{ "49143" },											 -- Frost Strike
	
		{ "57330", "player.runicpower < 20" },					 -- Horn of Winter when we have less than 20 Runicpower
	
		{ "123693", {											 -- Plague Leech
			"player.spell(123693).exists",						 -- Plague Leech does exist in our Spellbook AND
			"target.debuff(55095)",								 -- Plague Leech when our target has Frost Fever AND
			"target.debuff(55078)",								 -- Plague Leech when our target has Blood Plague AND
			"player.runes(Unholy).count = 0",					 -- Plague Leech when we have no Unholy Runes AND
			"player.runes(Frost).count = 0",					 -- Plague Leech when we have no Frost Runes AND
			"player.buff(114851).count < 5", }},				 -- Plague Leech when we have less than 5 Blood Charge stacks
	
		{ "47568", { 											 -- Empower Rune Weapon
			"modifier.cooldowns", 								 -- Empower Rune Weapon when Cooldowns are enabled AND
			"player.runicpower < 76", 							 -- Empower Rune Weapon when we have less than 76 Runicpower AND
			"player.runes(death).count = 0", 					 -- Empower Rune Weapon when we have no Death Runes AND
			"player.runes(frost).count = 0", 					 -- Empower Rune Weapon when we have no Frost Runes AND
			"player.runes(unholy).count = 0" }},				 -- Empower Rune Weapon when we have no Unholy Runes AND
	}, { "modifier.multitarget",
		 "target.exists",
		 "target.alive",
		 "player.alive" }}, -- End of Multitarget Rotation 
		
	{{ -- Singletarget Rotation
		{ "49143", "player.runicpower > 88" },					 -- Frost Strike with higher than 88 Runicpower OR
		{ "49143", "player.buff(51124)" },						 -- Frost Strike with Killing Machine Proc

		{ "49184", "player.runes(frost).count > 1" },			 -- Howling Blast with 2 Frost Runes OR
		{ "49184", "player.runes(death).count > 1" },			 -- Howling Blast with 2 Death Runes
		
		{ "77575", "!target.debuff(55095)" },					 -- Outbreak with no Frost Fever applied OR
		{ "77575", "!target.debuff(55078)" },					 -- Outbreak with no Blood Plague applied

		{{
			{ "115989", "target.debuff(55078).duration < 3" },	 -- UnholyBlight with Frost Fever remaining less than 3s OR
			{ "115989", "target.debuff(55095).duration < 3" },	 -- UnholyBlight with Blood Plague remaining less than 3s AND
		}, { "player.spell(77575).cooldown > 0",			 	 -- UnholyBlight with Outbreak on cooldown
			 "player.spell(115989).exists" }},				 	 -- UnholyBlight when Unholy Blight exists in our Spellbook
		
		{{
			{ "49184", "player.runes(frost).count > 0" },		 -- Howling Blast with at least 1 Frost Rune OR
			{ "49184", "player.buff(59052)" },					 -- Howling Blast with a Rime Proc AND
		}, "!target.debuff(55095)"},							 -- Howling Blast with no Frost Fever applied

		{ "45462", {											 -- Plague Strike
			"!target.debuff(55078)",							 -- Plague Strike with no Blood Plague applied AND
			"player.runes(unholy).count > 0", }},				 -- Plague Strike with at least 1 Unholy Rune

		{ "49184", "player.buff(59052)" },						 -- Howling Blast with a Rime Proc

		{ "49143", "player.runicpower > 76" },					 -- Frost Strike with more than 76 Runicpower

		{ "49184" },											 -- Howling Blast

		{ "49143", "player.runicpower >= 40" },					 -- Frost Strike with more or equal than 76 Runicpower

		{ "57330", "player.runicpower < 20" },					 -- Horn of Winter when we have less than 20 Runicpower
	
		{ "123693", {											 -- Plague Leech
			"player.spell(123693).exists",						 -- Plague Leech does exist in our Spellbook AND
			"target.debuff(55095)",								 -- Plague Leech when our target has Frost Fever AND
			"target.debuff(55078)",								 -- Plague Leech when our target has Blood Plague AND
			"player.runes(Unholy).count = 0",					 -- Plague Leech when we have no Unholy Runes AND
			"player.runes(Frost).count = 0",					 -- Plague Leech when we have no Frost Runes AND
			"player.buff(114851).count < 5", }},				 -- Plague Leech when we have less than 5 Blood Charge stacks
	
		{ "47568", { 											 -- Empower Rune Weapon
			"modifier.cooldowns", 								 -- Empower Rune Weapon when Cooldowns are enabled AND
			"player.runicpower < 76", 							 -- Empower Rune Weapon when we have less than 76 Runicpower AND
			"player.runes(death).count = 0", 					 -- Empower Rune Weapon when we have no Death Runes AND
			"player.runes(frost).count = 0", 					 -- Empower Rune Weapon when we have no Frost Runes AND
			"player.runes(unholy).count = 0" }},				 -- Empower Rune Weapon when we have no Unholy Runes AND

		{ "43265", "player.runes(unholy).count > 0", "ground" }, -- Death and Decay with at least 1 Unholy Rune

		{ "45462", "player.runes(unholy).count > 0" },			 -- Plague Strike with at least 1 Unholy Rune
	}, { "!modifier.multitarget",
		 "target.exists",
		 "target.alive",
		 "player.alive" }}, -- End of Singletarget Rotation
},
{ -- Out of Combat
	{{ -- Misc Stuff
		{ "48266" , "!player.buff(48266)" },	-- Frost Presence when we don't have Frost Presence active
		
		{ "57330", { 							-- Horn of Winter
			"target.exists", 					-- Horn of Winter when we have a target AND
			"target.alive" }},					-- Horn of Winter when our target is alive
	
		{ "42650", { 							-- Army of Dead
			"modifier.rshift",					-- Army of Dead with Right Shift pressed down AND
			"modifier.rcontrol",				-- Army of Dead with Right Control pressed down AND
			"target.exists", 					-- Army of Dead when we have a target AND
			"target.alive" }},					-- Army of Dead when our target is alive AND
	}, "player.alive" }, -- Player must be alive to run this. I don't know, if it's nessecary but better safe than sorry.
})
