---------------------------------------------------
--  Unblest Jambiya
--  Family: Qutrub
--  Description: Steals HP from targets in an area of effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: AoE 15'
--  Notes: Used only by certain NM's when their primary sword isn't broken.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() == 0) then
        return 0;
    else
        return 1;
    end
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.3;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_WIPE_SHADOWS);

    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg));

    return dmg;
end;