-----------------------------------------
--  ID: 5264
--  Item: Yellow Liquid
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    
    local result = 0;
    
    if (target:hasStatusEffect(dsp.effect.FOOD)) then
        result = 246;
    end
    
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,30,5264);
end;