-----------------------------------------
-- ID: 4364
-- Item: loaf_of_black_bread
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 8
-- Dexterity -1
-- Vitality 2
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,4364);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 8);
    target:addMod(dsp.mod.DEX, -1);
    target:addMod(dsp.mod.VIT, 2);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 8);
    target:delMod(dsp.mod.DEX, -1);
    target:delMod(dsp.mod.VIT, 2);
end;
