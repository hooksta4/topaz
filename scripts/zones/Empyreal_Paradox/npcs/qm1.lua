-----------------------------------
-- Area: Empyreal_Paradox
-- NPC:  QM1 
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/quests")

function onTrade(player, npc, trade)
end
function onTrigger(player,npc)
    if
        player:hasCompletedQuest(JEUNO, tpz.quest.id.jeuno.APOCALYPSE_NIGH) and not
        (
            player:hasItem(15962) or
            player:hasItem(15963) or
            player:hasItem(15964) or
            player:hasItem(15965)
        )
        then
        player:startEvent(5)
    else
        player:messageSpecial(ID.text.QM_TEXT)
    end
end
function onEventUpdate(player,csid,option,extras)
end
function onEventFinish(player,csid,option)
    if (csid == 5 and option == 1) then
        player:delQuest(JEUNO,tpz.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED)
        player:delQuest(JEUNO,tpz.quest.id.jeuno.APOCALYPSE_NIGH)
    end
end