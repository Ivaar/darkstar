-----------------------------------
-- Ability: Drachen Roll
-- Enhances pet accuracy for party members within area of effect
-- Optimal Job: Dragoon
-- Lucky Number: 4
-- Unlucky Number: 8
-- Level: 23
-- Phantom Roll +1 Value: 5
--
-- Die Roll    |No DRG  |With DRG
-- --------    -------  -----------
-- 1           |+10     |+25
-- 2           |+13     |+28
-- 3           |+15     |+30
-- 4           |+40     |+55
-- 5           |+18     |+33
-- 6           |+20     |+35
-- 7           |+25     |+40
-- 8           |+5      |+20
-- 9           |+28     |+43
-- 10          |+30     |+45
-- 11          |+50     |+65
-- Bust        |-15     |-15
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = dsp.effect.DRACHEN_ROLL
    ability:setRange(ability:getRange() + player:getMod(dsp.mod.ROLL_RANGE));
    if (player:hasStatusEffect(effectID)) then
        return dsp.msg.basic.ROLL_ALREADY_ACTIVE,0;
    elseif atMaxCorsairBusts(player) then
        return dsp.msg.basic.CANNOT_PERFORM,0;
    else
        return 0,0;
    end
end;

function onUseAbility(caster,target,ability,action)
    if (caster:getID() == target:getID()) then
        corsairSetup(caster, ability, action, dsp.effect.DRACHEN_ROLL, dsp.job.DRG);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(dsp.merit.WINNING_STREAK) + caster:getMod(dsp.mod.PHANTOM_DURATION)
    local effectpowers = {10, 13, 15, 40, 18, 20, 25, 5, 28, 30, 50, 15}
    local effectpower = effectpowers[total];
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 15
    end
-- Apply Additional Phantom Roll+ Buff
    local phantomBase = 5; -- Base increment buff
    local effectpower = effectpower + (phantomBase * phantombuffMultiple(caster))
-- Check if COR Main or Sub
    if (caster:getMainJob() == dsp.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == dsp.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(dsp.merit.BUST_DURATION), dsp.effect.DRACHEN_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_PET_ACC) == false) then
        ability:setMsg(dsp.msg.basic.ROLL_MAIN_FAIL);
    elseif total > 11 then
        ability:setMsg(dsp.msg.basic.DOUBLEUP_BUST);
    end
    return total;
end
