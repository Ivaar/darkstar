-----------------------------------
-- Area: East Ronfaure
--  NPC: Logging Point
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/logging");
require("scripts/zones/East_Ronfaure/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    startLogging(player,player:getZoneID(),npc,trade,0x0385);
end;

function onTrigger(player,npc)
    player:messageSpecial(LOGGING_IS_POSSIBLE_HERE,1021);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;