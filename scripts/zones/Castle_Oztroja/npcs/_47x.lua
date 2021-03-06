-----------------------------------
-- Area: Castle Oztroja
--  NPC: _47x (Handle)
-- Notes: Opens door _477
-- !pos -99 -71 -41 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Castle_Oztroja/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onTrigger(player,npc)

    local DoorID = npc:getID() - 1;
    local DoorA = GetNPCByID(DoorID):getAnimation();

    if (player:getZPos() > -45) then
      if (DoorA == 9 and npc:getAnimation() == 9) then
        npc:openDoor(6.5);
        -- Should be a ~1 second delay here before the door opens
        GetNPCByID(DoorID):openDoor(4.5);
      end
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;