-----------------------------------
-- Area: Empyreal_Paradox
-- NPC:  QM1 
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/quests");

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    if player:getCurrentMission(COP) == tpz.mission.id.cop.THE_LAST_VERSE and 
    player:hasItem(15962) or
    player:hasItem(15963) or
    player:hasItem(15964) or
    player:hasItem(15965) or 
    player:hasItem(15966) then
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    else	
        player:startEvent(5)
    end
end

function onEventUpdate(player,csid,option,extras)
end

function onEventFinish(player,csid,option)

    if (csid == 5 and option == 1) then
        player:delQuest(JEUNO,tpz.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED)
        player:delQuest(JEUNO,tpz.quest.id.jeuno.APOCALYPSE_NIGH)
        player:addMission(COP, tpz.mission.id.cop.DAWN)
        player:setCharVar('PromathiaStatus',7)
    end
end 