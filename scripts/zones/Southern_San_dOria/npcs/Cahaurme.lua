-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Cahaurme
-- Involved in Quest: A Knight's Test, Lost Chick
-- @zone 230
-- !pos 55.749 -8.601 -29.354
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.BOOK_OF_TASKS) and player:hasKeyItem(dsp.ki.BOOK_OF_THE_EAST) == false) then
        player:startEvent(633);
    else
        player:showText(npc, 7817); -- nothing to report

    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 633) then
        player:addKeyItem(dsp.ki.BOOK_OF_THE_EAST);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.BOOK_OF_THE_EAST);
    end

end;
--- for future use
    -- player:startEvent(847) --are you the chicks owner