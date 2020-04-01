-----------------------------------
-- Area: Promyvion holla
-- Memory Flux 4th floor
-----------------------------------
local ID = require("scripts/zones/Promyvion-Dem/IDs")
require("scripts/globals/missions")
require("scripts/globals/quests")
-----------------------------------

function onTrigger(player, npc)
    if (player:hasKeyItem(tpz.ki.PROMYVION_HOLLA_SLIVER)) then
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    elseif
        (player:getQuestStatus(JEUNO,tpz.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED) == QUEST_ACCEPTED ) then
        player:addKeyItem(tpz.ki.PROMYVION_HOLLA_SLIVER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.PROMYVION_HOLLA_SLIVER)
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
