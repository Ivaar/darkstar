-----------------------------------
-- Area: Temenos N T
--  NPC: Goblin_Slaughterman

-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
 local mobID = mob:getID();
 -- print(mobID);
      local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

 if (mobID ==16928773) then
       GetNPCByID(16928768+18):setPos(330,70,468);
    GetNPCByID(16928768+18):setStatus(dsp.status.NORMAL);
  elseif (mobID ==16928772) then
      GetNPCByID(16928770+450):setStatus(dsp.status.NORMAL);
 end
end;
