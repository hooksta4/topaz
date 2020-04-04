-----------------------------------
-- Area: Emperial Paradox
-- Mob: Eald'narche
-- Apocalypse Nigh Final Fight
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobInitialize(mob)
    -- 60% fast cast, -75% physical damage taken, 10tp/tick regain, no standback
--    mob:addMod(tpz.mod.UFASTCAST, 60)
--   mob:addMod(tpz.mod.UDMGMAGIC, -75)
--    mob:addMod(tpz.mod.REGAIN, 100)
--    mob:setMobMod(tpz.mobMod.HP_STANDBACK,-1)
end

function onMobSpawn(mob)
end

function onMobEngaged(mob,target)
--[[    local mobid = mob:getID()

    for member = mobid-5, mobid+2 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end --]]
end;

function onMobFight(mob,target) --TODO Figure out the teleport around.
--[[
    if  (bit.band(mob:getBehaviour(),tpz.behavior.STANDBACK) > 0) then
        mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(tpz.behavior.STANDBACK)))
        mob:setMobMod(tpz.mobMod.TELEPORT_TYPE,0);
        mob:setMobMod(tpz.mobMod.SPAWN_LEASH,0);
        mob:setSpellList(0);
    end
    if (bit.band(mob:getBehaviour(),tpz.behavior.STANDBACK) == 0) then
        mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.STANDBACK))
        mob:setMobMod(tpz.mobMod.TELEPORT_TYPE,1);
        mob:setMobMod(tpz.mobMod.SPAWN_LEASH,22);
        mob:setSpellList(308);
    end --]]
end;

function onMobDeath(mob, player, isKiller)
end;
