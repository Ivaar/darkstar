-----------------------------------
--
-- Zone: Dynamis-Xarcabard
--
-----------------------------------
package.loaded["scripts/zones/Dynamis-Xarcabard/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");
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
    local cs = 0;
    local inst = 0;

    if player:isBcnmsFull() == 1 then
        -- run currently in progress
        -- add player to the run if they entered via markings, or if they reconnected to a run they were previously in
        -- gms will be automatically registered
        if player:getVar("enteringDynamis") == 1 or player:getVar("DynamisID") == GetServerVariable("[DynaXarcabard]UniqueID") or player:getGMLevel() > 0 then
            inst = player:addPlayerToDynamis(1285);
        end
    else
        -- no run yet in progress
        -- register run by player if they entered via markings
        -- gms will be automatically registered
        if player:getVar("enteringDynamis") == 1 or player:getGMLevel() > 0 then
            inst = player:bcnmRegister(1285);
        end
    end

    if inst == 1 then
        player:bcnmEnter(1285);
        cs = -1;
        if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
            player:setPos(569.312,-0.098,-270.158,90);
        end
    end

    player:setVar("enteringDynamis",0);
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 0) then
        player:setPos(569.312,-0.098,-270.158,90,0x70);
    end
end;
