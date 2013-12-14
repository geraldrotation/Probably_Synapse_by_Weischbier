local Synapse = { }

Synapse.items = { }
Synapse.flagged = GetTime()
Synapse.unflagged = GetTime()

-- Required checks
function Synapse.spellCooldown(spell)
  local spellName = GetSpellInfo(spell)
  if spellName then
    local spellCDstart,spellCDduration,_ = GetSpellCooldown(spellName)
    if spellCDduration == 0 then
      return 0
    elseif spellCDduration > 0 then
      local spellCD = spellCDstart + spellCDduration - GetTime()
      return spellCD
    end
  end
  return 0
end

function Synapse.t2d(target)
  if ProbablyEngine.condition["deathin"](target) then
    return ProbablyEngine.condition["deathin"](target)
	end
  return 600
end

function Synapse.spellCooldown(spell)
  local spellName = GetSpellInfo(spell)
  if spellName then
    local spellCDstart,spellCDduration,_ = GetSpellCooldown(spellName)
    if spellCDduration == 0 then
      return 0
    elseif spellCDduration > 0 then
      local spellCD = spellCDstart + spellCDduration - GetTime()
      return spellCD
    end
  end
  return 0
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
  local subEvent		= select(1, ...)
  local source		= select(4, ...)
  local destGUID		= select(7, ...)
  local spellID		= select(11, ...)
  local failedType = select(14, ...)
    
  if UnitName("player") == source then
    if subEvent == "SPELL_CAST_SUCCESS" then
      if spellID == 6262 then -- Healthstone
        Synapse.items[6262] = { lastCast = GetTime() }
      end
      if spellID == 124199 then -- Landshark (itemId 77589)
        Synapse.items[77589] = { lastCast = GetTime(), exp = 0 }
      end
    end 
  end
end

ProbablyEngine.listener.register("Synapse", "COMBAT_LOG_EVENT_UNFILTERED", Synapse.eventHandler)
ProbablyEngine.listener.register("Synapse", "PLAYER_REGEN_DISABLED", Synapse.setFlagged)
ProbablyEngine.listener.register("Synapse", "PLAYER_REGEN_DISABLED", Synapse.setUnflagged)

-- Potion of Mogu Power
function Synapse.PotionOfMoguPower
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
function Synapse.SynapseSprings
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
  local PoF = Synapse.spellCooldown(51271)
  if PoF > 10 and PoF < 20 then
    return false
  end
  return true
end

-- G91 Landshark
function Synapse.Landshark
  if GetItemCount(77589, false, false) > 0 then
    if not Synapse.items[77589] then return true end
    if Synapse.items[77589].exp ~= 0 and
      Synapse.items[77589].exp < GetTime() then return true end
  end
end

-- Life Spirit
function Synapse.LifeSpirit
  if GetItemCount(89640, false, false) > 0 then
    if not Synapse.items[89640] then return true end
    if Synapse.items[89640].exp ~= 0 and
      Synapse.items[89640].exp < GetTime() then return true end
  end
end

-- Healthstone
function Synapse.Healthstone
  if GetItemCount(5512, false, true) > 0 then
    if not Synapse.items[5512] then return true end
    if Synapse.items[5512].exp ~= 0 and
      Synapse.items[5512].exp < GetTime() then return true end
  end
end

ProbablyEngine.library.register("Synapse", Synapse)