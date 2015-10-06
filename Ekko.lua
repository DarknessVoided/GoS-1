if GetObjectName(GetMyHero()) == "Ekko" then

EkkoMenu = Menu("Ekko", "Ekko")
EkkoMenu:SubMenu("Combo", "Combo")
EkkoMenu.Combo:Boolean("Q", "Use Q", true)
EkkoMenu.Combo:Boolean("W", "Use W", true)
EkkoMenu.Combo:Boolean("E", "Use E", true)
EkkoMenu.Combo:Boolean("R", "Use R", true)

--Start
OnLoop(function(myHero)
    local unit = GetCurrentTarget()
    if GetCastName(myHero, _R) == "EkkoR" then
            if EkkoMenu.Combo.R:Value() then
                     if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.2 and
                    CanUseSpell(myHero, _R) == READY and IsObjectAlive(myHero) and GoS:GetDistance(unit, 1000) then
            CastTargetSpell(myHero,_R)
            end
        end
    end
if IOW:Mode() == "Combo" then
local unit = GetCurrentTarget()
if GoS:ValidTarget(unit, 1200) then
 
        if GetCastName(myHero, _Q) == "EkkoQ" then
                local QPred = GetPredictionForPlayer(GoS:myHeroPos(),unit,GetMoveSpeed(unit),1700,250,1075,50,false,true)
                        if EkkoMenu.Combo.Q:Value() then
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
                end
        end
		
    if GetCastName(myHero, _W) == "EkkoW" then
        local WPred = GetPredictionForPlayer(GoS:myHeroPos(),unit,GetMoveSpeed(unit),1700,250,1600,50,false,true)
            if EkkoMenu.Combo.W:Value then
            if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 then
            CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
            end
        end
    end
	
    if GetCastName(myHero, _E) == "EkkoE" then
        local EPred = GetPredictionForPlayer(GoS:myHeroPos(),unit,GetMoveSpeed(unit),1700,250,750,50,false,true)
            if EkkoMenu.Combo.E:Value() then
            if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
            CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
            end
        end
    end
	
    if GetCastName(myHero, _R) == "EkkoR" then
            if EkkoMenu.Combo.R:Value() then
              local ult = (GetCastLevel(myHero,_R)*150+50)+(GetBonusAP(myHero)*1.30)
                      local EPred = GetPredictionForPlayer(GoS:myHeroPos(),unit,GetMoveSpeed(unit),1700,250,325,50,false,true)
                         if CanUseSpell(myHero, _R) and GoS:GetDistance(unit, 325) then 
            if CalcDamage(myHero, unit, ult) > GetCurrentHP(unit) then
            CastSkillShot(_R,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z) 
              end
            end
            end
    end
end
end
end)
PrintChat("Sandstorm Ekko by Musti")
end
