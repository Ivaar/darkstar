-----------------------------------------
-- ID: 4524
-- Item: pot_of_royal_tea
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Vitality -1
-- Charisma 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4524);
end;

function onEffectGain(target, effect)
    target:addMod(dsp.mod.VIT, -1);
    target:addMod(dsp.mod.CHR, 3);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, -1);
    target:delMod(dsp.mod.CHR, 3);
end;
