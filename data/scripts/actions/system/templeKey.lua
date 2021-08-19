templeKey = Action()

cooldown = {
  check = function (cid, storage)
    return getPlayerStorageValue(cid, storage) >= os.time(t)
  end,

  get = function (cid, storage)
    exhaust = getPlayerStorageValue(cid, storage)
    if(exhaust > 0) then
      left = exhaust - os.time(t)
      if(left >= 0) then
        return left
      end
    end
  return false
  end,

  set = function (cid, storage, time)
    setPlayerStorageValue(cid, storage, os.time(t) + time)
  end,

  make = function (cid, storage, time)
    exhaust = cooldown.get(cid, storage)
    if(not exhaust) then
      cooldown.set(cid, storage, time)
      return true
    end
  return false
  end
}

time = 3600 --in second

function templeKey.onUse(player, item, fromPosition, target, toPosition, isHotkey)
  cid = player:getId()

  if cooldown.check(cid, 1605) then
    return doPlayerSendCancel(cid, "Cooldown Remaining: "..(math.floor(cooldown.get(cid,1605)/60)).." minutes and " ..(cooldown.get(cid,1605)%60).. " seconds.") and doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
  end

  if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) or player:isPzLocked() then
    return doPlayerSendCancel(cid, "You may not use the Temple Key while in combat.") and doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
  end

  player:teleportTo(player:getTown():getTemplePosition())
  player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
  player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have been teleported to your hometown.')
  cooldown.set(cid, 1605, time)
  return true
end

templeKey:id(36423)
templeKey:register()
