-----------------------------------
-- Area: Windurst Woods
--  NPC: Manyny
-- Standard Merchant NPC
-- Confirmed shop stock, August 2013
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,MANYNY_SHOP_DIALOG);

    stock = {
        0x13A8,  3112,       --Sinewy Etude
        0x13A9,  2784,       --Dextrous Etude
        0x13AA,  2184,       --Vivacious Etude
        0x13AB,  1892,       --Quick Etude
        0x13AC,  1550,       --Learned Etude
        0x13AD,  1252,       --Spirited Etude
        0x13AE,   990        --Enchanting Etude
    }
    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
