-----------------------------------------
-- ID: 5160
-- Item: plate_of_urchin_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Health 40
-- Strength 1
-- Vitality 5
-- Accuracy % 16
-- Ranged ACC % 16
-- Sleep Resist 5
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5160);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 40);
    target:addMod(MOD_STR, 1);
    target:addMod(MOD_VIT, 5);
    target:addMod(MOD_ACCP, 16);
    target:addMod(MOD_RACCP, 16);
    target:addMod(MOD_SLEEPRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 40);
    target:delMod(MOD_STR, 1);
    target:delMod(MOD_VIT, 5);
    target:delMod(MOD_ACCP, 16);
    target:delMod(MOD_RACCP, 16);
    target:delMod(MOD_SLEEPRES, 5);
end;
