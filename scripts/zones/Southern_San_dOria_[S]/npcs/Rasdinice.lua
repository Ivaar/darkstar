-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Rasdinice
-- @zone 80
-- !pos -8 1 35
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, 11637); -- (Couldn't find default text so i threw this in) Perhaps you should first attend to more pressing matters...
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;