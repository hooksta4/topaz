-----------------------------------
-- Area: Misareaux_Coast
-- NPC:  ??? (Spawn Ziphius)
-- !pos 76 -16 534 25
-----------------------------------

require("scripts/globals/npc_util")
local ID = require("scripts/zones/Misareaux_Coast/IDs")
local ZIPHIUS_QM_BASE = 16879919
local ZIPHIUS         = 16879900
function onTrade(player,npc,trade)
    local baited = GetServerVariable("[Ziphius]Bait Trap")
    
    -- Trade Slice of Carp
    if (npcUtil.tradeHas(trade, 16994) and bit.band(baited, bit.lshift(1, (npc:getID() - ZIPHIUS_QM_BASE))) == 0) then
        baited = bit.bor(baited, bit.lshift(1, (npc:getID() - ZIPHIUS_QM_BASE)))
        player:tradeComplete()
        player:messageSpecial(ID.text.PUT_IN_TRAP, 16994)
        SetServerVariable("[Ziphius]Bait Trap", baited)
    else
        player:messageSpecial(ID.text.NOTHING_HERE_YET)
    end
end

function onTrigger(player,npc)
    local baited = GetServerVariable("[Ziphius]Bait Trap")

    if (VanadielHour() >= 22 or VanadielHour() < 4) then
        if (bit.band(baited, bit.lshift(1, (npc:getID() - ZIPHIUS_QM_BASE))) == 0) then
            player:messageSpecial(ID.text.APPEARS_TO_BE_TRAP)
        else
            player:messageSpecial(ID.text.NOTHING_HERE_YET)
        end
    elseif (VanadielHour() >= 4 and VanadielHour() < 7) then
        if (bit.band(baited, bit.lshift(1, 6)) == 0) then
            if (math.random(1,1000) <= 176) then
                SpawnMob(ZIPHIUS):updateClaim(player)
                GetMobByID(ZIPHIUS):setPos(npc:getXPos(),npc:getYPos(),npc:getZPos()-1)
                npc:setStatus(tpz.status.DISAPPEAR)
                for i = 6, 11, 1 do
                    baited = bit.bor(baited, bit.lshift(1, i))
                    SetServerVariable("[Ziphius]Bait Trap", baited)
                end
            else
                player:messageSpecial(ID.text.DID_NOT_CATCH_ANYTHING)
            end
            baited = bit.bor(baited, bit.lshift(1, 6))
            SetServerVariable("[Ziphius]Bait Trap", baited)
        else
            player:messageSpecial(ID.text.DID_NOT_CATCH_ANYTHING)
        end
    end
end

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid)
    -- printf("RESULT: %u",option)
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid)
    -- printf("RESULT: %u",option)
end