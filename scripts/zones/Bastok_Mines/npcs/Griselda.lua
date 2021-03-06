-----------------------------------
-- Area: Bastok Mines
--  NPC: Griselda
-- Standard Merchant NPC
-- !pos -25.749 -0.044 52.360 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs")
require("scripts/globals/quests")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local WildcatBastok = player:getVar("WildcatBastok")

    if player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and not player:getMaskBit(WildcatBastok,15)  then
        player:startEvent(507)
    else
        local stock =
        {
            4442, 360, 1,    -- Pineapple Juice
            4391,  21, 2,    -- Bretzel
            4490, 432, 2,    -- Pickled Herring
            4424, 990, 2,    -- Melon Juice
            4499,  90, 3,    -- Iron Bread
            4376, 108, 3,    -- Meat Jerky
            4509,  10, 3,    -- Distilled Water
        }

        player:showText(npc, GRISELDA_SHOP_DIALOG)
        dsp.shop.nation(player, stock, dsp.nation.BASTOK)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 507 then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",15,true)
    end
end
