-----------------------------------
--
-- Zone: Throne_Room (165)
--
-----------------------------------
package.loaded["scripts/zones/Throne_Room/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Throne_Room/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(114.308,-7.639,0.022,126);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 7) then
        -- You will be transported back to the entrance of Castle Zvahl Baileys
        player:setPos(378.222,-12,-20.299,125,0xA1);
    end
end;
