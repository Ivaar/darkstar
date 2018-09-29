-----------------------------------
-- Area: Norg
--   NPC: Vaultimand
-- Type: Fame Checker
-- @zone 252
-- !pos -10.839 -1 18.730
--
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    NorgFame = player:getFameLevel(NORG);

    player:startEvent(100 + (NorgFame - 1));
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

