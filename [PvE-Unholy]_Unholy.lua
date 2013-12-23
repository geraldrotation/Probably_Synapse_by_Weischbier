ProbablyEngine.rotation.register_custom(252, "[PvE] Unholy made by Weischbier v1.0",
-----------------------------------------------------------------------------------------------------------------------------
-- Combat ------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
{
-----------------------------------------------------------------------------------------------------------------------------
-- Pause -------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------		
	{ "pause", "modifier.lshift"}, 								-- Pause when lshift is pressed
-----------------------------------------------------------------------------------------------------------------------------
-- Queued Spells ------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------		
	{{
		{ "!50842", "@Synapse.checkQueue(50842)" },				-- Pestilence when queued
		{ "!45524", "@Synapse.checkQueue(45524)" },				-- Chains of Ice when queued
		{ "!73975", "@Synapse.checkQueue(73975)" },				-- Necrotic Strike when queued
		{ "!61999", { 
			"@Synapse.checkQueue(61999)",
			"target.exists",
			"!target.alive", }, "target" },						-- Raise Ally when queued
	}},
-----------------------------------------------------------------------------------------------------------------------------
-- Non Rotational Abilities ------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------	
	{{
-----------------------------------------------------------------------------------------------------------------------------
-- Interrupts --------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
		{{
			{ "47528" },										-- Mind Freeze with a casting target
			
			{ "108194", {										-- Asphyxiate
				"player.spell(108194).exists",					-- Asphyxiate when Asphyxiate exists in our Spellbook
				"player.spell(47528).cooldown < 14" }},			-- Asphyxiate with Mind Freeze less than 14s cooldowntime remaining
				
			{ "47476", {										-- Strangulate
				"player.spell(47476).exists",					-- Strangulate when Strangulate exists in our Spellbook
				"player.spell(47528).cooldown < 14" }},			-- Strangulate with Mind Freeze less than 14s cooldowntime remaining
			
			{ "47476", {										-- Strangulate
				"player.spell(47476).exists",					-- Strangulate when Strangulate exists in our Spellbook
				"target.range > 5",								-- Strangulate when target is not in Mind Freeze range
				"target.casting", }},							-- Strangulate with a casting target
				
			{ "108194", {										-- Asphyxiate
				"player.spell(108194).exists",					-- Asphyxiate when Asphyxiate exists in our Spellbook
				"target.range > 5",								-- Asphyxiate when target is not in Mind Freeze range
				"target.casting", }},							-- Asphyxiate with a casting target
		}, "modifier.interrupt" }, 								-- Interrupts with Interrupt modifier enabled
-----------------------------------------------------------------------------------------------------------------------------
-- Items -------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------	
		{{
			{ "#76095", {										-- Potion of Mogu Power
				"@Synapse.PotionOfMoguPower()",					-- Potion of Mogu Power with custom function  
				"!player.buff(105706)" }},						-- Potion of Mogu Power when we don't have Potion of Mogu Power buff
			
			{ "#5512", {										-- Healthstone
				"@Synapse.Healthstone()",						-- Healthstone with custom function  
				"player.health < 20" }},						-- Healthstone with less than 20% health
	
			{ "#89640", { 										-- Life Spirit
				"@Synapse.LifeSpirit()",						-- Life Spirit with custom function  
				"player.health < 40",							-- Life Spirit with less than 40% health  
				"!player.buff(130649)" }},						-- Life Spirit with no Life Spirit Buff
			
			{ "#77589", "@Synapse.Landshark()" }				-- G91 Landshark with custom function
		}}, -- End of Items
-----------------------------------------------------------------------------------------------------------------------------
-- Defensive Cooldowns ------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------		
		{{
			{ "59545", {										-- Gift of the Naaru (Dreanai racial)
				"player.health < 40",							-- Gift of the Naaru when player has les than 40% health
				"player.spell(59545).exists" }, "player"},		-- Gift of the Naaru when Death Siphon exists in our Spellbook
				
			{ "51052", { 										-- Anti-Magic Zone	
				"modifier.lalt",								-- Anti-Magic Zone with Left Alt pressed down			
				"player.spell(51052).exists" }, "ground" }, 	-- Anti-Magic Zone when Anti-Magic Zone exists in our Spellbook
			
			{ "108196", {										-- Death Siphon
				"player.health < 40",							-- Death Siphon when player has les than 40% health
				"player.spell(108196).exists" }},				-- Death Siphon when Death Siphon exists in our Spellbook
			
			{ "47541", {										-- Death Coil
				"player.buff(49039)",							-- Death Coil when player has Lichborne acive  
				"player.health < 90" }, "player" },				-- Death Coil when player has less than 90% health
			
			{ "49039", {										-- Lichborne
				"!player.buff(49039)",							-- Lichborne when we don't have Lichborne active  
				"player.health < 40",							-- Lichborne when player has less than 40% health  
				"player.spell(49039).exists" }},				-- Lichborne when Lichborne exists in our Spellbook
	
			{ "49998", {										-- Death Strike
				"player.health < 85",							-- Death Strike with less than 85% health  
				"player.buff(101568)" }},						-- Death Strike with Dark Succor Buff
		
			{ "119975", {										-- Conversion
				"player.spell(119975).exists",					-- Conversion when Conversion exists in our Spellbook  
				"player.runicpower >= 20",						-- Conversion with more or equal then 20 Runicpower  
				"player.health < 20",							-- Conversion with less than 20% health  
				"!player.buff(119975)" }, "player" },			-- Conversion with no Conversion Buff applied
		
			{ "!/cancelaura Conversion", {						-- Cancel Conversion EN Version
				"player.health > 90",							-- Cancel Conversion with at least 90% health  
				"player.buff(119975)" }},						-- Cancel Conversion with Conversion Buff applied
		
			{ "!/cancelaura Umwandlung", {						-- Cancel Conversion DE Version
				"player.health > 90",							-- Cancel Conversion with at least 90% health  
				"player.buff(119975)" }},						-- Cancel Conversion with Conversion Buff applied
		}, "toggle.def" }, -- End of Defenseive Cooldowns
-----------------------------------------------------------------------------------------------------------------------------
-- Dark Simulacrum ---------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------			
		--[[{{
			{ "77606", "focus.casting(144214)" , "focus" },		-- Dark Simulacrum when Focus is casting Froststorm Bolt (Wavebinder Kardris)
			{ "77606", "focus.casting(143432)" , "focus" },		-- Dark Simulacrum when Focus is casting Arcane Shock (General Nazgrim; Kor'kron Arcweaver)
			{ "77606", "focus.casting(145790)" , "focus" },		-- Dark Simulacrum when Focus is casting Residue (Spoils of Pandaria; Zar'thik Amber Priest)
			{ "77606", "focus.casting(145812)" , "focus" },		-- Dark Simulacrum when Focus is casting Rage of the Empress (Spoils of Pandaria; Set'thik Wind Wielder)
			{ "77606", "focus.casting(144584)" , "focus" },		-- Dark Simulacrum when Focus is casting Chain Lighning (Garrosh; Farseer Wolf Rider)
		}, { "focus.exists",
			 "focus.alive",
			 "focus.casting", }},]]
-----------------------------------------------------------------------------------------------------------------------------
-- Mirrored Spells ---------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------		
		{{
			{ "144214", "player.spell(144214).exists" , "target" },	-- Froststorm Bolt when spell exists on our target
			{ "143432", "player.spell(143432).exists" , "target" },	-- Arcane Shock when spell exists on our target
			{ "145790", "player.spell(145790).exists" , "player" },	-- Residue when spell exists on player (150.000,00 Healing Buff)
			{ "145812", "player.spell(145812).exists" , "player" },	-- Rage of the Empress when spell exists on player (5% more damage)
			{ "144584", "player.spell(144584).exists" , "target" },	-- Chain Lightning when spell exists on our target
		}},
-----------------------------------------------------------------------------------------------------------------------------
-- Offensive Cooldowns ------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------			
		{{ -- Let's line them up properly, it doesn't make sense to cast them async.			
			{ "49016", {										-- Unholy Frenzy
				"modifier.cooldowns",							-- Unholy Frenzy with Cooldowns modifier enabled  
				"!player.buff(49016)", }},						-- Unholy Frenzy when player has Buff Pillar of Frost
			
			{ "#gloves", "@Synapse.SynapseSprings()" },			-- Synapse Springs with custom function
			
			{ "46584", "!pet.alive" },							-- Raise Dead when Pet is dead
				
			{ "20572", {										-- Blood Fury (Orc racial)
				"modifier.cooldowns",							-- Blood Fury with Cooldowns modifier enabled  
				"player.spell(20572).exists",					-- Blood Fury when Blood Fury exists in our Spellbook  
				"player.buff(49016)", }},						-- Blood Fury when player has Buff Unholy Frenzy
				
			{ "26297", {										-- Berserking (Troll racial)
				"modifier.cooldowns",							-- Berserking with Cooldowns modifier enabled  
				"player.spell(26297).exists",					-- Berserking when Berserking exists in our Spellbook  
				"player.buff(49016)", }},						-- Berserking when player has Buff Unholy Frenzy
				
			{ "50613", {										-- Arcane Torrent (Belf racial)
				"modifier.cooldowns",							-- Arcane Torrent with Cooldowns modifier enabled  
				"player.spell(50613).exists",					-- Arcane Torrent when Arcane Torrent exists in our Spellbook  
				"player.runicpower < 100", }},					-- Arcane Torrent when players Runicower is below 100
				
			{ "69041", {										-- Rocket Barrage (Goblin racial)
				"modifier.cooldowns",							-- Rocket Barrage with Cooldowns modifier enabled  
				"player.spell(69041).exists",					-- Rocket Barrage when Rocket Barrage exists in our Spellbook  
				"player.buff(49016)", }},						-- Rocket Barrage when player has Buff Unholy Frenzy
				
		}, "target.range <= 13" },								-- Offensive Cooldowns with our target at least 13f close to us
-----------------------------------------------------------------------------------------------------------------------------
-- Misc Talents; Blood Tap, Tier 6, Pestilence ------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
		{{
			{ "69070", {										-- Rocket Jump (Gobin racial)
				"target.distance > 15",							-- Rocket Jump when our target is more than 15f away from player
				"player.spell(69070).exists" }},				-- Rocket Jump exists in our Spellbook
				
			{ "68992", {										-- Dark Flight (Worgen racial)
				"target.distance > 15",							-- Dark Flight when our target is more than 15f away from player
				"player.spell(68992).exists" }},				-- Dark Flight when our target is more than 15f away from player
				
			{ "96268", {										-- Deaths Advance (non Worgen Version)
				"target.distance > 15",							-- Deaths Advance when our target is more than 15f away from player
				"player.spell(96268).exists",					-- Deaths Advance when Deaths Advance exists in our Spellbook
				"!player.spell(68992).exists" }},				-- Deaths Advance when Dark Flight does not exist in our Spellbook
			
			{{													-- Tier 6 Talents
				{ "108199", "player.spell(108199).exists" },	-- Gorefiend's Graps when Gorfiend's Grasp exists in our Spellbook
				{ "108200", "player.spell(108200).exists" },	-- Remorseless Winter when Remorseless Winter exists in our Spellbook
				{ "108201", "player.spell(108201).exists" },	-- Desecrated Ground when Desecrated Ground exists in our Spellbook
			}, "modifier.ralt" },								-- Tier 6 Talent with Right Alt modifier pressed down
		}},
		
	}, { "target.exists",
		 "target.alive",
		 "player.alive" }}, -- End of Non Rotational Abilities
-----------------------------------------------------------------------------------------------------------------------------
-- Multitarget Rotation ----------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------	
	{{ 
		{{														 -- Unholy Blight
			{ "115989", "!target.debuff(55078)" },	 			 -- UnholyBlight with no Frost Fever ticking  
			{ "115989", "!target.debuff(55095)" },	 			 -- UnholyBlight with no Blood Plague no  
		}, { "!toggle.howling",									 -- Unholy Blight with custom condition
			 "player.spell(115989).exists" }},				 	 -- Unholy Blight when Unholy Blight exists in our Spellbook
			
		{ "77575", "!target.debuff(55095)" },					 -- Outbreak with no Frost Fever applied  
		{ "77575", "!target.debuff(55078)" },					 -- Outbreak with no Blood Plague applied

		
	
		{ "47568", { 											 -- Empower Rune Weapon
			"modifier.cooldowns", 								 -- Empower Rune Weapon when Cooldowns are enabled  
			"player.runicpower < 76", 							 -- Empower Rune Weapon when we have less than 76 Runicpower  
			"player.runes(death).count = 0", 					 -- Empower Rune Weapon when we have no Death Runes  
			"player.runes(frost).count = 0", 					 -- Empower Rune Weapon when we have no Frost Runes  
			"player.runes(unholy).count = 0" }},				 -- Empower Rune Weapon when we have no Unholy Runes  
	}, { "modifier.multitarget",
		 "target.exists",
		 "target.alive",
		 "player.alive" }}, -- End of Multitarget Rotation 
-----------------------------------------------------------------------------------------------------------------------------
-- Singletarget Rotation ----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
	{{
		{ "77575", "@Synapse.DotDamage()" },					-- Outbreak when we can apply a better dot
		
		{ "45462", "@Synapse.DotDamage()" },					-- Plague Strike when we can apply a better dot
		
		{ "45529", {											-- Blood Tap
			"player.runes.depleted",							-- Blood Tap with depleted runes 
			"player.buff(114851).count > 10",					-- Blood Tap with over 10 stacks of Blood Charge
			"player.runicpower >= 32",							-- Blood Tap with at least 32 Runicpower
			"player.spell(45529).exists" }},					-- Blood Tap when Blood Tap exists in our Spellbook
			
		{{														-- Unholy Blight
			{ "115989", "target.debuff(55078).duration < 3" },	-- UnholyBlight with Frost Fever remaining less than 3s  
			{ "115989", "target.debuff(55095).duration < 3" },	-- UnholyBlight with Blood Plague remaining less than 3s 
		}, { "toggle.howling",									-- Unholy Blight with custom condition
			 "player.spell(77575).cooldown > 0",			 	-- UnholyBlight with Outbreak on cooldown
			 "player.spell(115989).exists" }},				 	-- UnholyBlight when Unholy Blight exists in our Spellbook
			 
		{ "77575", "target.debuff(55095).duration < 3" },		-- Outbreak with no Frost Fever applied  
		
		{ "77575", "target.debuff(55078).duration < 3" },		-- Outbreak with no Blood Plague applied	 
		
		{ "130736", "target.health <= 35" },					-- Soul Reaper when target is lower or equal to 35% health
		
		{ "45529", {											-- Blood Tap
			"player.runes.depleted",							-- Blood Tap with depleted runes 
			"player.buff(114851).count >= 5",					-- Blood Tap with at least 5 stacks of Blood Charge
			"target.health <= 35",								-- Blood Tap when target is lower or equal than 35% health
			"player.spell(130736).cooldown <= 0",				-- Blood Tap with Soul Reaper off cooldown
			"player.spell(45529).exists" }},					-- Blood Tap when Blood Tap exists in our Spellbook
			
		{ "45462", "!target.debuff(55095)" },					-- Plague Strike with no Frost Fever applied  
		{ "45462", "!target.debuff(55078)" },					-- Plague Strike with no Blood Plague applied

		{ "49016", "modifier.cooldowns" },						-- Summon Gargoyle when modifier cooldowns is enabled
		
		{ "63560" },											-- Dark Transformation
		
		{ "47541", "player.runicpower > 90" },					-- Death Coil with more than 90 Runicpower
			
		{ "43265", {											-- Death and Decay
			"player.runes(unholy).count == 2",					-- Death and Decay with 2 Unholy Runes
			"toggle.dnd", }, "ground" }, 						-- Death and Decay with custom condition
			
		{ "45529", {											-- Blood Tap
			"player.runes.depleted",							-- Blood Tap with depleted runes 
			"player.buff(114851).count >= 5",					-- Blood Tap with at least 5 stacks of Blood Charge
			"player.runes(unholy).count == 2",					-- Blood Tap with 2 Unholy Runes
			"player.spell(43265).cooldown <= 0",				-- Blood Tap with Death and Decay off cooldown
			"player.spell(45529).exists" }},					-- Blood Tap when Blood Tap exists in our Spellbook
			
		{ "55090", "player.runes(unholy).count == 2" },			-- Scourge Strike with 2 Unholy Runes
		
		{ "85948", {											-- Festering Strike
			"player.runes(blood).count == 2",					-- Festering Strike with 2 Blood Runes
			"player.runes(frost).count == 2" }},				-- Festering Strike with 2 Frost Runes
			
		{ "43265", "toggle.dnd", "ground" }, 					-- Death and Decay with custom condition
		
		{ "45529", {											-- Blood Tap
			"player.runes.depleted",							-- Blood Tap with depleted runes 
			"player.buff(114851).count >= 5",					-- Blood Tap with at least 5 stacks of Blood Charge
			"player.spell(43265).cooldown <= 0",				-- Blood Tap with Death and Decay off cooldown
			"player.spell(45529).exists" }},					-- Blood Tap when Blood Tap exists in our Spellbook
		
		{ "47541", "player.buff(81340)" },						-- Death Coil with Sudden Doom Proc
		
		{ "47541", {											-- Death Coil
			"!pet.buff()",										-- Death Coil when Pet does NOT have Dark Transformation Buff
			"player.runes(unholy).count <= 1" }},				-- Death Coil with lower or equal than 1 Unholy Rune
			
		{ "55090" },											-- Scourge Strike with 2 Unholy Runes
		
		{ "123693", {											-- Plague Leech
			"player.spell(123693).exists",						-- Plague Leech does exist in our Spellbook  
			"player.spell(77575).cooldown < 1",					-- Plague Leech when Outbreak has less than 1s cooldown time remaining
			"target.debuff(55095).duration >= 1",				-- Plague Leech when our target has Frost Fever  
			"target.debuff(55078).duration >= 1",				-- Plague Leech when our target has Blood Plague  
			"player.runes(Unholy).count = 0",					-- Plague Leech when we have no Unholy Runes  
			"player.runes(Frost).count = 0",					-- Plague Leech when we have no Frost Runes  
			"player.buff(114851).count < 5", }},				-- Plague Leech when we have less than 5 Blood Charge stacks
			
		{ "85948" },											-- Festering Strike
		
		{ "57330" },					 						-- Horn of Winter
		
		{ "47541" },											-- Death Coil
		
		{ "45529", {											-- Blood Tap
			"player.runes.depleted",							-- Blood Tap with depleted runes 
			"player.buff(114851).count >= 8",					-- Blood Tap with at least 8 stacks of Blood Charge
			"player.spell(43265).cooldown <= 0",				-- Blood Tap with Death and Decay off cooldown
			"player.spell(45529).exists" }},					-- Blood Tap when Blood Tap exists in our Spellbook		
	
		{ "47568", { 											-- Empower Rune Weapon
			"modifier.cooldowns", 								-- Empower Rune Weapon when Cooldowns are enabled  
			"player.runicpower < 76", 							-- Empower Rune Weapon when we have less than 76 Runicpower  
			"player.runes(death).count = 0", 					-- Empower Rune Weapon when we have no Death Runes  
			"player.runes(frost).count = 0", 					-- Empower Rune Weapon when we have no Frost Runes  
			"player.runes(unholy).count = 0" }}					-- Empower Rune Weapon when we have no Unholy Runes
	}, { "!modifier.multitarget",
		 "target.exists",
		 "target.alive",
		 "player.alive" }}, -- End of Singletarget Rotation
},
-----------------------------------------------------------------------------------------------------------------------------
-- Out of Combat ------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
{
	{{ -- Misc Stuff
		{ "48265" , "!player.buff(48265)" },	-- Unholy Presence when we don't have Unholy Presence active
		
		{ "46584" , "!pet.alive" },	-- Unholy Presence when we don't have Unholy Presence active
		
		{ "57330", { 							-- Horn of Winter
			"target.exists", 					-- Horn of Winter when we have a target  
			"target.alive" }},					-- Horn of Winter when our target is alive
	
		{ "42650", { 							-- Army of Dead
			"modifier.rshift",					-- Army of Dead with Right Shift pressed down  
			"modifier.rcontrol",				-- Army of Dead with Right Control pressed down  
			"target.exists", 					-- Army of Dead when we have a target  
			"target.alive" }},					-- Army of Dead when our target is alive  
	}, "player.alive" }, -- Player must be alive to run this. I don't know, if it's nessecary but better safe than sorry.
},
-----------------------------------------------------------------------------------------------------------------------------
-- Custom Toggle ------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
function()
-- ProbablyEngine.toggle.create(
    -- 'audible',
    -- 'Interface\\Icons\\inv_misc_bell_01.png‎',
    -- 'Audible cues Toggle',
	-- 'Enable or Disable usage of audible cues,\n when changing a button state (cooldowns on/off)')
ProbablyEngine.toggle.create(
    'def',
    'Interface\\Icons\\spell_deathknight_iceboundfortitude.png‎',
    'Defensive CDs Toggle',
	'Enable or Disable usage of defensive cooldowns')
-- ProbablyEngine.toggle.create(
    -- 'howling',
    -- 'Interface\\Icons\\spell_frost_arcticwinds.png‎',
    -- 'Toggle Howling Blast',
	-- 'Enable or Disable Howling Blast to avoid cleave')
ProbablyEngine.toggle.create(
    'dnd',
    'Interface\\Icons\\spell_shadow_deathanddecay.png‎',
    'Toggle Death and Decay',
	'Enable or Disable Death and Decay to avoid cleave')
end)
