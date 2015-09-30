if GetObjectName(GetMyHero()) ~= "Rengar" then return end

require("Inspired")
require("IOW")

local Config = Menu("Rengar", "Rengar")
Config:SubMenu("c", "Combo")
Config.c:Boolean("Q", "EMP Q", true)
Config.c:Boolean("W", "EMP W", false)
Config.c:Boolean("E", "EMP E", true)

PrintChat("Headhunter Rengar by Musti")
OnLoop(function(myHero)
  taa = GoS:GetTarget(210)
  tQ = GoS:GetTarget(250)
  tW = GoS:GetTarget(400)
  tE = GoS:GetTarget(1000)
  renpos = GetOrigin(myHero)
  textpos = WorldToScreen(1, renpos.x, renpos.y, renpos.z)
  if Config.c.Q and (not Config.c.W and not Config.c.E) then
    DrawText("Q", 20, textpos.x, textpos.y, 0xffffffff)
  end
  if Config.c.W and (not Config.c.Q and not Config.c.E) then
    DrawText("W", 20, textpos.x, textpos.y, 0xffffffff)
  end
  if Config.c.E and (not Config.c.Q and not Config.c.W) then
    DrawText("E", 20, textpos.x, textpos.y, 0xffffffff)
  end
  if GetCurrentHP(myHero) < 350 and GetCurrentMana(myHero) == 5 then
    CastSpell(_W)
  end
  if KeyIsDown(0x20) then
    if GotBuff(myHero, "rengarpassivebuff") == 0 then
      if GetCurrentHP(myHero) > 350 then
        if (CanUseSpell(myHero, _Q) == 0 or CanUseSpell(myHero, _W) == 0 or CanUseSpell(myHero, _E) == 0) then
        end
      end
      if GetCurrentMana(myHero) <= 4 then
        if GotBuff(myHero, "rengarqbase") == 1 or GotBuff(myHero, "rengarqemp") == 1 then
        end
        if CanUseSpell(myHero, _E) == 0 then
          CastE(tE)
        end
        if CanUseSpell(myHero, _W) == 0 then
          CastW(tW)
        end
        if CanUseSpell(myHero, _Q) == 0 then
          CastQ(tQ)
        end
      end
      if GetCurrentMana(myHero) == 5 then
        if GetCurrentHP(myHero) >= 500 then
          if Config.c.Q then
            CastQ(tQ)
          end
          if Config.c.E then
            CastEE(tE)
          end
        end
        if Config.c.W then
          CastW(tW)
        end
      end
    end
    if GotBuff(myHero, "rengarpassivebuff") == 1 then
      if GetCurrentMana(myHero) <= 4 then
        if CanUseSpell(myHero, _Q) == 0 then
          CastQQ(tE)
        end
      end
      if GetCurrentMana(myHero) == 5 then
        if Config.c.Q then
          CastQQ(tE)
        end
      end
    end
  end
end)

function CastQ(unit)
  if GoS:ValidTarget(unit, 250) then
    CastSpell(_Q)
  end
end

function CastQQ(unit)
  if GoS:ValidTarget(unit, 950) then
    CastSpell(_Q)
  end
end

function CastW(unit)
  if GoS:ValidTarget(unit, 400) then
    CastSpell(_W)
  end
end

function CastE(unit)
  if GoS:ValidTarget(unit, 1000) then
    local pe = GetPredictionForPlayer(GetOrigin(GetMyHero()), unit, GetMoveSpeed(unit), 2000, 300, 1000, 80, false, true)
    if pe.HitChance == 1 then
      CastSkillShot(_E, pe.PredPos.x, pe.PredPos.y, pe.PredPos.z)
    end
  end
end

function CastEE(unit)
  if GoS:ValidTarget(unit, 1000) then
    local pe = GetPredictionForPlayer(GetOrigin(GetMyHero()), unit, GetMoveSpeed(unit), 2000, 300, 1000, 80, true, true)
    if pe.HitChance == 1 then
      CastSkillShot(_E, pe.PredPos.x, pe.PredPos.y, pe.PredPos.z)
    end
  end
end
