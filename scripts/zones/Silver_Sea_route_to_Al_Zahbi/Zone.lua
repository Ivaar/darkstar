-----------------------------------
--
-- Zone: Silver_Sea_route_to_Al_Zahbi
--
-----------------------------------
package.loaded["scripts/zones/Silver_Sea_route_to_Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Silver_Sea_route_to_Al_Zahbi/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    return cs;
end;

function onRegionEnter(player,region)
end;

function onTransportEvent(player,transport)
    player:startEvent(1025);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 1025) then
        player:setPos(0,0,0,0,50);
    end
end;


