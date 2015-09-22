ThreshMenu = Menu("Thresh", "Thresh:")
ThreshMenu:SubMenu("Combo", "Combo")
ThreshMenu.Combo:Boolean("Q", "Use Q", true)
ThreshMenu.Combo:Boolean("W", "Use W at 75% HP of ally", true)
ThreshMenu.Combo:Boolean("E", "Use E", true)
ThreshMenu.Combo:Boolean("R", "Use R", true)

 
 
OnLoop(function(myHero)
    if IOW:Mode() == "Combo" then
	
               local target = GetCurrentTarget()
                if GoS:ValidTarget(target, 1100) then
                               
            local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1900,500,1100,70,true,true) --               GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
                   
                     if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ThreshMenu.Combo.Q then
                     CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                     end
					 
		if ThreshMenu.Combo.W:Value() then
	  for _, ally in pairs(GoS:GetAllyHeroes()) do
            local WPred = GetPredictionForPlayer(GoS:myHeroPos(),ally,GetMoveSpeed(ally),3300,250,950,90,false,true)
            local AllyPos = GetOrigin(ally)
            local mousePos = GetMousePos()
			if (GoS:GetDistance(ally, target) > 600) then
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.75 and
            CanUseSpell(myHero,_W) and IsObjectAlive(ally) then
            CastSkillShot(_W,WPred.PredPos.x, WPred.PredPos.y, WPred.PredPos.z)
	    else
	    MoveToXYZ(mousePos.x, mousePos.y, mousePos.z)
	    end
         end
	end
 
 
                     local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1875,250,400,55,false,true)
                     if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and ThreshMenu.Combo.E then
                     CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                     end
 
           
                    local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,250,450,55,false,true)
                     if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and ThreshMenu.Combo.R then
                     CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                     end
            end
			end
			end
			end)
	
	PrintChat("Deep Terror Thresh by Musti")
