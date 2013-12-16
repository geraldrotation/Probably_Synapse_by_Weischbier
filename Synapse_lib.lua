-- thanks to root and chumii!
local Synapse = { }

Synapse.items = { }
Synapse.flagged = GetTime()
Synapse.unflagged = GetTime()

Synapse.PvP_AMSPreventList = {       
    5782, 	-- fear
	8122, 	-- psychic scream
	5484, 	-- Howl of terror
	5246, 	-- Intimidating shout
	64044, 	-- Psychic horror
	111397, -- Blood fear
	113792, -- Pcychic terror
	16508, 	-- Intimidating roar
	51514, 	-- Hex
	118, 	-- Polymorph
	61305, 	-- Polymorph: Black Cat
	28272, 	-- Polymorph: Pig
	61721, 	-- Polymorph: Rabbit
	61780, 	-- Polymorph: Turkey
	28271, 	-- Polymorph: Turtle
} 

Synapse.DMGImmuneList = {    
    33786, 	-- Cyclone
    113506, -- Cyclone
    45438, 	-- Ice Block
    110700, -- Divine Shield (Paladin)
    110696, -- Ice Block (Mage)
    19263, 	-- Deterrence
    45438, 	-- Ice Block
    122464, -- Dematerialize
    --122470, -- touch of karma
    642, 	-- Divine Shield
} 

Synapse.DSIMCopySpellList = {  
    49016, 	-- Unholy Frenzy
    13750, 	-- Adrenaline Rush
    79140, 	-- Vendetta
    34692, 	-- Beast Within
    31884, 	-- Avenging Wrath
    107574, -- Avatar
    12292, 	-- Bloodbath
    1719, 	-- Recklessness
    114049, -- Ascendance
	-- Some SoO spells
	144214, -- Froststorm Bolt (Wavebinder Kardris)
	143432, -- Arcane Shock (General Nazgrim; Kor'kron Arcweaver)
	145790, -- Residue (Spoils of Pandaria; Zar'thik Amber Priest)
	145812, -- Rage of the Empress (Spoils of Pandaria; Set'thik Wind Wielder)
	144584, -- Chain Lighning (Garrosh; Farseer Wolf Rider)
} 

Synapse.KickSpellList = {      
    2637,  	-- Hibernate
    33786, 	-- Cyclone
    605,  	-- Dominate Mind
    51505, 	-- Lava Burst
    51514, 	-- Hex
    5782, 	-- Fear
    48181, 	-- Haunt
    30108,
    33786, 	-- Cyclone		(cast)\
    28272, 	-- Pig Poly		(cast)
    118, 	-- Sheep Poly		(cast)
    61305, 	-- Cat Poly		(cast)
    61721, 	-- Rabbit Poly		(cast)
    61780, 	-- Turkey Poly		(cast)
    28271, 	-- Turtle Poly		(cast)
    51514, 	-- Hex			(cast)
    51505, 	-- Lava Burst		(cast)
    339, 	-- Entangling Roots	(cast)
    30451, 	-- Arcane Blast		(cast)
    605, 	-- Dominate Mind		(cast)
    20066, 	-- Repentance		(cast)
    116858, -- Chaos Bolt		(cast)
    113092, -- Frost Bomb		(cast)
    8092, 	-- Mind Blast		(cast)
    11366, 	-- Pyroblast		(cast)
    48181, 	-- Haunt			(cast)
    102051, -- Frost Jaw		(cast)
    73920, 	-- Healing Rain		(cast)
    51505, 	-- Lava Burst		(cast)
    32375, 	-- Mass Dispel		(cast)
    2006, 	-- Resurrection		(cast)
    7328, 	-- Redemption		(cast)
    2008, 	-- Ancestral Spirit	(cast)
    50769, 	-- Revive		(cast)
    2812, 	-- Denounce		(cast)
    10326, 	-- Turn Evil		(cast)
    82326, 	-- Divine Light		(cast)
    82012, 	-- Repentance		(cast)
    115310, -- Revival		(cast)
    44614, 	-- Frostfire Bolt	(cast)
    1513, 	-- Scare Beast		(cast)
    982, 	-- Revive Pet		(cast)
    111771, -- Demonic Gateway			(cast)
    124465, -- Vampiric Touch			(cast)
    32375, 	-- Mass Dispel				(cast)
} 

-- Commands -- bug thanks to chumii
-----------------------------------------------------------------------------------------------------------------------------
-- Notify Frame -- (c)xrn overlay for pqr -----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
    local function onUpdate(self,elapsed) 
      if self.time < GetTime() - 2.5 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    itb = CreateFrame("Frame",nil,ChatFrame1) 
    itb:SetSize(ChatFrame1:GetWidth(),30)
    itb:Hide()
    itb:SetScript("OnUpdate",onUpdate)
    itb:SetPoint("TOPLEFT",0,150)
    itb.text = itb:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    itb.text:SetAllPoints()
    itb.texture = itb:CreateTexture()
    itb.texture:SetAllPoints()
    itb.texture:SetTexture(0,0,0,.50) 
    itb.time = 0
    function itb:message(message) 
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime() 
      self:Show() 
    end
    
    local function onUpdate(self,elapsed) 
      if self.time < GetTime() - 2.8 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    itb = CreateFrame("Frame",nil,ChatFrame1) 
    itb:SetSize(ChatFrame1:GetWidth(),30)
    itb:Hide()
    itb:SetScript("OnUpdate",onUpdate)
    itb:SetPoint("TOP",0,0)
    itb.text = itb:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    itb.text:SetAllPoints()
    itb.texture = itb:CreateTexture()
    itb.texture:SetAllPoints()
    itb.texture:SetTexture(0,0,0,.50) 
    itb.time = 0
    function itb:message(message) 
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime() 
      self:Show() 
    end
-----------------------------------------------------------------------------------------------------------------------------
-- Macros ------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
ProbablyEngine.command.register('syn', function(msg, box)
  local command, text = msg:match("^(%S*)%s*(.-)$")
-- Toggle -------------------------------------------------------------------------------------------------------------------
  if command == 'toggle' then
    if ProbablyEngine.toggle.states.MasterToggle then
        ProbablyEngine.buttons.toggle('MasterToggle')
        itb:message("|cFFB30000Synapse off")
    else
        ProbablyEngine.buttons.toggle('MasterToggle')
        itb:message("|cFF0A94FFSynapse on")
    end
  end
  
  if command == 'kick' then
    if ProbablyEngine.toggle.states.interrupt then
      ProbablyEngine.buttons.toggle('interrupt')
      itb:message("|cFFB30000Interrupts off")
    else
      ProbablyEngine.buttons.toggle('interrupt')
      itb:message("|cFF00B34AInterrupts on")
    end
  end

  if command == 'pillar' then
    if ProbablyEngine.toggle.states.cooldowns then
      ProbablyEngine.buttons.toggle('cooldowns')
      itb:message("|cFFB30000Cooldowns off")
    else
      ProbablyEngine.buttons.toggle('cooldowns')
      itb:message("|cFF00B34ACooldowns on")
    end
  end

  if command == 'aoe' then
    if ProbablyEngine.toggle.states.multitarget then
      ProbablyEngine.buttons.toggle('multitarget')
      itb:message("|cFFB30000AoE off")
    else
      ProbablyEngine.buttons.toggle('multitarget')
      itb:message("|cFF00B34AAoE on")
    end
  end  

  if command == 'def' then
    if ProbablyEngine.toggle.states.def then
      ProbablyEngine.buttons.toggle('def')
      itb:message("|cFFB30000Defensive Cooldowns off")
    else
      ProbablyEngine.buttons.toggle('def')
      itb:message("|cFF00B34ADefensive Cooldowns on")
    end
  end
  
  if command == 'howling' then
    if ProbablyEngine.toggle.states.howling then
      ProbablyEngine.buttons.toggle('howling')
      itb:message("|cFFB30000Howling Blast off")
    else
      ProbablyEngine.buttons.toggle('howling')
      itb:message("|cFF00B34AHowling Blast on")
    end
  end

  if command == 'dnd' then
    if ProbablyEngine.toggle.states.dnd then
      ProbablyEngine.buttons.toggle('dnd')
      itb:message("|cFFB30000Death and Decay off")
    else
      ProbablyEngine.buttons.toggle('dnd')
      itb:message("|cFF00B34ADeath and Decay on")
    end
  end
  -- Spell Queue -- thank you merq for basic code -----------------------------------------------------------------------------
  if command == "sChains" or command == 45524 then
    Synapse.queueSpell = 45524
    itb:message("Chains of Ice queued")
  elseif command == "sNecro" or command == 73975 then
    Synapse.queueSpell = 73975
    itb:message("Necrotic Strike queued")
  elseif command == "sRaise" or command == 61999 then
    Synapse.queueSpell = 61999
    itb:message("Raise Ally queued. Mouseover NOW!")
  elseif command == "sPest" or command == 50842 then
    Synapse.queueSpell = 50842
    itb:message("Pestilence queued")
  else
    Synapse.queueSpell = nil
  end
  if Synapse.queueSpell ~= nil then Synapse.queueTime = GetTime() end
end)

-----------------------------------------------------------------------------------------------------------------------------
-- Spell Queue Check -- thank you merq for basic code ----------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
Synapse.checkQueue = function (spellId)
	local firstLaunch = true
	if Synapse.queueTime == nil and firstLaunch then
		Synapse.queueTime = 1
		firstLaunch = false
	end
    if (GetTime() - Synapse.queueTime) > 4 then
        Synapse.queueTime = 0
        Synapse.queueSpell = nil
    return false
    else
    if Synapse.queueSpell then
        if Synapse.queueSpell == spellId then
            if ProbablyEngine.parser.lastCast == GetSpellName(spellId) then
                Synapse.queueSpell = nil
                Synapse.queueTime = 0
            end
        return true
        end
    end
    end
    return false
end

-- Required checks
function Synapse.CanCast(spellID, target)
	local isKnown = IsSpellKnown(spellID, false)
	local isUsable = IsUsableSpell(spellID)
	local inRange = IsSpellInRange(spellID, target)
	local spellCooldown = select(2,GetSpellCooldown(spellID))
	
	if isKnown and isUsable and inRange and spellCooldown <= 0 then
		return true
	else
		 return false
	end
end

function Synapse.CastSpell(spellID, target)
	local canCast = Synapse.CanCast(spellID, target)
	if canCast then
		CastSpellByID(spellID, target)
	end
end

function Synapse.t2d(target)
  if ProbablyEngine.condition["deathin"](target) then
    return ProbablyEngine.condition["deathin"](target)
	end
  return 600
end

Synapse.setFlagged = function (self, ...)
  Synapse.flagged = GetTime()
end

Synapse.setUnflagged = function (self, ...)
  Synapse.unflagged = GetTime()
  if Synapse.items[77589] then
    Synapse.items[77589].exp = Synapse.unflagged + 60
  end
end

Synapse.eventHandler = function(self, ...)
  local timestamp		 = select(1, ...)
  local event		 	 = select(2, ...)
  local hideCaster		 = select(3, ...)
  local sourceGUID		 = select(4, ...)
  local sourceName		 = select(5, ...)
  local sourceFlags		 = select(6, ...)
  local sourceFlags2	 = select(7, ...)
  local destGUID		 = select(8, ...)
  local destName		 = select(9, ...)
  local destFlags		 = select(10, ...)
  local destFlags2		 = select(11, ...)
  --Prefix "Spell_" or "SPELL_PERIODIC_" or "RANGE_"
  local spellID		 	 = select(12, ...)
  local spellName		 = select(13, ...)
  local spellSchool		 = select(14, ...)
  --Suffix "_DAMAGE" or "_AURA_APPPLIED" or "_AURA_REMOVEDD" or "_AURA_REFRESH"
  local amount		 	 = select(15, ...)
  local overkill		 = select(16, ...)
  local school		 	 = select(17, ...)
  local resisted		 = select(18, ...)
  local blocked		 	 = select(19, ...)
  local absorbed		 = select(20, ...)
  local critical		 = select(21, ...) -- 1 or nil
  local glancing		 = select(22, ...) -- 1 or nil
  local crushing		 = select(23, ...) -- 1 or nil
  
  --[[if destGUID == UnitGUID("player") then
	if event = "SPELL_DAMAGE" or event = "SPELL_PERIODIC_DAMAGE" or event = "SWING_DAMAGE" or event = "RANGE_DAMAGE" then
		local amountReducedByAMS = amount * 75/100 -- Let's get the amount of inc dmg when we would have AMS applied on us; 75% DMG reduction without Glyph.
		local realamountAfterAMS = amount - amountReducedByAMS
		local remainingHealthWithAMS = UnitHealth("player") - realamountAfterAMS -- Let's get the remaining health after amount of damage was applied.
		-- Let's see if we can get some additional Runicpower with Anti-Magic Shell
		if amount >= 100000 and school == 126 and UnitHealth("player") > (amount * 1.5) then -- 126 is Magic Spell School (I hope)
			Synapse.CastSpell(48707, "player")	
		-- If we're low on health and spell school is Magic then safe my fucking a$$
		elseif amount > UnitHealth("player") and school == 126 and remainingHealthWithAMS > 0 then
			Synapse.CastSpell(48707, "player")	
		end
		-- Let's see if we can survive damage with Icebound Fortitude
		local amountReducedByIbF = amount * 20/100 -- Let's get the amount of inc dmg when we would have IbF applied to us; 20% DMG reduction.
		local realamountAfterIbF = amount - amountReduced
		local remainingHealthWithIbF = UnitHealth("player") - realamountIbF -- Let's get the remaining health after amount of damage was applied.
		if amount > UnitHealth("player") and remainingHealthWithIbF > 0 then -- If the amount of incoming dmg is higher than our current health and IbF would safe us from dying then use it!
			Synapse.CastSpell(48792, "player")
		end
	end
  end--]]
  
  -- Item checks
  if UnitName("player") == sourceName then
    if event == "SPELL_CAST_SUCCESS" then
      if spellID == 6262 then -- Healthstone
        Synapse.items[6262] = { lastCast = GetTime() }
      end
      if spellID == 124199 then -- Landshark (itemId 77589)
        Synapse.items[77589] = { lastCast = GetTime(), exp = 0 }
      end
    end 
  end
  -- PvE checks
  if not UnitIsPVP("player") then	
	if event == "SPELL_CAST_SUCCESS" then
		-- IsCopySpell check
		for i = 1, #Synapse.DSIMCopySpellList do
			if spellID == Synapse.DSIMCopySpellList[spellID] then
				Synapse.CastSpell(77606, "sourceName")
				--_copySpell = true
			end
		end
		
		-- IsPreventSpell check  
		if destGUID == UnitGUID("player") then		
			for i = 1, #Synapse.PvP_AMSPreventList do
				if spellID == Synapse.PvP_AMSPreventList[spellID] then
					_preventSpell = true
				end
			end	
		end
	end	
  end   
  -- PvP checks
  if UnitIsPVP("player") then
	
	if event == "SPELL_AURA_APPLIED" and destGUID == sourceGUID then
		-- IsTargetImmune check
		for i = 1, #Synapse.DMGImmuneList do
			if spellID == Synapse.DMGImmuneList[spellID] then
				_targetImmune = true
			end
		end
	end	
	
	if event == "SPELL_CAST_SUCCESS" then
		-- IsCopySpell check
		for i = 1, #Synapse.DSIMCopySpellList do
			if spellID == Synapse.DSIMCopySpellList[spellID] then
				Synapse.CastSpell(77606, "sourceName")
				--_copySpell = true
			end
		end
	end
  
	if destGUID == UnitGUID("player") then
		if event == "SPELL_CAST_SUCCESS" then
		-- IsPreventSpell check  
		for i = 1, #Synapse.PvP_AMSPreventList do
			if spellID == Synapse.PvP_AMSPreventList[spellID] then
				_preventSpell = true
			end
		end
		
		-- IsKickableSpell check
		for i = 1, #Synapse.KickSpellList do
			if spellID == Synapse.KickSpellList[spellID] then
				_kickSpell = true
			end
		end		
	  end
	end	
  end   
end

ProbablyEngine.listener.register("Synapse", "COMBAT_LOG_EVENT_UNFILTERED", Synapse.eventHandler)
ProbablyEngine.listener.register("Synapse", "PLAYER_REGEN_DISABLED", Synapse.setFlagged)
ProbablyEngine.listener.register("Synapse", "PLAYER_REGEN_DISABLED", Synapse.setUnflagged)

-- PvP checks
local _kickSpell = false
local _targetImmune = false
local _copySpell = false
local _preventSpell = false
local _incomingDamage = false

function Synapse.IsKickableSpell()
	if _kickSpell then return true else return false end
end

function Synapse.IsTargetImmune()
	if _targetImmune then return true else return false end
end

function Synapse.IsCopySpell()
	if _copySpell then return true else return false end
end

function Synapse.IsPreventSpell()
	if _preventSpell then return true else return false end
end

-- Potion of Mogu Power
function Synapse.PotionOfMoguPower()
	if not (UnitBuff("player", 2825) or
			UnitBuff("player", 32182) or 
			UnitBuff("player", 80353) or
			UnitBuff("player", 90355)) then
		return false
	end
	if GetItemCount(76095) < 1 then return false end
	if GetItemCooldown(76095) ~= 0 then return false end
	if not ProbablyEngine.condition["modifier.cooldowns"] then return false end
	return true 
end

-- Synapse Springs check
function Synapse.SynapseSprings()
  local hasEngi = false
  for i=1,9 do
    if select(7,GetProfessionInfo(i)) == 202 then 
		hasEngi = true 
	end
  end
  if hasEngi == false then 
	return false 
  end
  if GetItemCooldown(GetInventoryItemID("player", 10)) > 0 then 
	return false 
  end 
  local PoF = select(2,GetSpellCooldown(51271))
  if PoF > 10 and PoF < 20 then
    return false
  end
  return true
end

-- G91 Landshark
function Synapse.Landshark()
  if GetItemCount(77589, false, false) > 0 then
    if not Synapse.items[77589] then return true end
    if Synapse.items[77589].exp ~= 0 and
      Synapse.items[77589].exp < GetTime() then return true end
  end
end

-- Life Spirit
function Synapse.LifeSpirit()
  if GetItemCount(89640, false, false) > 0 then
    if not Synapse.items[89640] then return true end
    if Synapse.items[89640].exp ~= 0 and
      Synapse.items[89640].exp < GetTime() then return true end
  end
end

-- Healthstone
function Synapse.Healthstone()
  if GetItemCount(5512, false, true) > 0 then
    if not Synapse.items[5512] then return true end
    if Synapse.items[5512].exp ~= 0 and
      Synapse.items[5512].exp < GetTime() then return true end
  end
end

ProbablyEngine.library.register("Synapse", Synapse)