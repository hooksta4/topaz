-----------------------------------
-- Area: Promyvion Dem
-- Memory Flux 4th floor
-----------------------------------
local ID = require("scripts/zones/Promyvion-Dem/IDs")
require("scripts/globals/keyitems");
-----------------------------------

function onTrigger(player, npc)
    if
        player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED) == QUEST_ACCEPTED and
        not player:hasKeyItem(tpz.ki.PROMYVION_DEM_SLIVER)
    then
        player:addKeyItem(tpz.ki.PROMYVION_DEM_SLIVER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.PROMYVION_DEM_SLIVER)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onTrade(player, npc, trade)   
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end