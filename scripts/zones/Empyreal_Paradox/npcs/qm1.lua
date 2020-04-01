-----------------------------------
-- Area: Empyreal_Paradox
-- NPC:  QM1 
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/keyitems");

local Earring =
{
    15962, -- Static Earring
    15963, -- Magnetic Earring
    15964, -- Hollow Earring
    15965  -- Ethereal Earring

}

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == tpz.mission.id.cop.THE_LAST_VERSE ) and player:hasItem(15962) or player:hasItem(15963) or player:hasItem(15964) or player:hasItem(15965) or player:hasItem(15966)then
    return
    else	
        player:startEvent(5)
    end
end;

function onEventUpdate(player,csid,option,extras)
    if ((csid == 5 and option == 0)) then
    end

end
-----------------------------------
-- onEventFinish Action 
-----------------------------------

function onEventFinish(player,csid,option)

    if (csid == 5 and option == 1) then
        player:delQuest(JEUNO,tpz.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED)
        player:delQuest(JEUNO,tpz.quest.id.jeuno.APOCALYPSE_NIGH)
        player:addMission(COP, tpz.mission.id.cop.DAWN)
    end
end; 