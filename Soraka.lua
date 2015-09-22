SorakaMenu = Menu("Soraka", "Soraka:")
SorakaMenu:SubMenu("Combo", "Combo")
SorakaMenu.Combo:Boolean("Q", "Use Q", true)
SorakaMenu.Combo:Boolean("W", "Use W", true)
SorakaMenu.Combo:Boolean("E", "Use E", true)
SorakaMenu.Combo:Boolean("R", "Use R", true)


OnLoop(function(myHero)
	local myHero = GetMyHero()
	local target = GetCurrentTarget()
	local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1750,500,950,300,false,true)
	local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1600,0,650,50,false,true)
	if "Soraka" == GetObjectName(myHero) then
	if SorakaMenu.Combo and IsObjectAlive(target) then
	
		if IOW:Mode() == "Combo" then

			
			for _, ally in pairs(GoS:GetAllyHeroes()) do
			if SorakaMenu.Combo.W then
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.6 and
	            	CanUseSpell(myHero, _W) == READY and GoS:GetDistance(myHero,unit) then
			CastTargetSpell(ally, _W)
		end
	end
end
			

			for _, ally in pairs(GoS:GetAllyHeroes()) do
			if SorakaMenu.Combo.R then
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.2 and
	            	CanUseSpell(myHero, _R) == READY and IsObjectAlive(ally) then
			CastSpell(_R)
		end
	end
end			
			if GoS:ValidTarget(target, 950) then
			if SorakaMenu.Combo.Q then
			if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
                 	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)

		end
	end
end
			
			if GoS:ValidTarget(target, 650) then
			if SorakaMenu.Combo.E then
			if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
                 	CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
					end
				end
			end
               end
      end
end	
end)

PrintChat("Soraka by Musti")
