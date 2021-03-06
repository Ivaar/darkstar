-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Machielle
-- Only sells when Bastok controls Norvallen Region
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == 1) then
        if (trade:hasItemQty(532,1) == true and trade:getItemCount() == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    else
        onHalloweenTrade(player,trade,npc);
    end
end;

function onTrigger(player,npc)

    local RegionOwner = GetRegionOwner(dsp.region.NORVALLEN);

    if (RegionOwner ~= dsp.nation.SANDORIA) then
        player:showText(npc,MACHIELLE_CLOSED_DIALOG);
    else
        player:showText(npc,MACHIELLE_OPEN_DIALOG);

        local stock =
        {
            688, 18,  -- Arrowwood Log
            621, 25,  -- Crying Mustard
            618, 25,  -- Blue Peas
            698, 88   -- Ash Log
        }
        dsp.shop.general(player, stock, SANDORIA);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
