-----------------------------------
-- Area: AlTaieu
--  MOB: Aw_euvhi
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/AlTaieu/TextIDs");
require("scripts/zones/AlTaieu/MobIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();

    if (mobID == EUVHIS_WHITE+0 or mobID == EUVHIS_WHITE+2 or mobID == EUVHIS_WHITE+4) then
        if (not player:hasKeyItem(dsp.ki.WHITE_CARD)) then
            player:addKeyItem(dsp.ki.WHITE_CARD);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.WHITE_CARD);
        end

    elseif (mobID == EUVHIS_RED+0 or mobID == EUVHIS_RED+2 or mobID == EUVHIS_RED+4) then
        if (not player:hasKeyItem(dsp.ki.RED_CARD)) then
            player:addKeyItem(dsp.ki.RED_CARD);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.RED_CARD);
        end

    elseif (mobID == EUVHIS_BLACK+0 or mobID == EUVHIS_BLACK+2 or mobID == EUVHIS_BLACK+4) then
        if (not player:hasKeyItem(dsp.ki.BLACK_CARD)) then
            player:addKeyItem(dsp.ki.BLACK_CARD);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.BLACK_CARD);
        end

    end
end;