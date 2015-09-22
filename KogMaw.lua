KogMenu = Menu("KogMaw", "KogMaw:")
KogMenu:SubMenu("Combo", "Combo")
KogMenu.Combo:Boolean("Q", "Use Q", true)
KogMenu.Combo:Boolean("W", "Use W", true)
KogMenu.Combo:Boolean("E", "Use E", true)
KogMenu.Combo:Boolean("R", "Use R", true)

KogMenu:SubMenu("Harass", "Harass")
KogMenu.Harass:Boolean("Q", "Use Q", true)
KogMenu.Harass:Boolean("R", "Use R", true)



OnLoop(function(myHero)
	local myHero = GetMyHero()
	local target = GetCurrentTarget()
	local myHeroPos = GetOrigin(myHero)
	local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1650,250,1200,70,true,true)
	local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1400,250,1360,120,false,true)
	local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),math.huge,1200,1800,150,false,false)	
	
	
	if IOW:Mode() == "Combo" then
	if "KogMaw" == GetObjectName(myHero)
		then
		if KogMenu.Combo and IsObjectAlive(target) then	
		if GoS:ValidTarget(target, 1200) then
			if KogMenu.Combo.Q then
                 	if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
                 	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
end
end
end
		if GoS:ValidTarget(target, 600) then
			if KogMenu.Combo.W then
                        CastSpell(_W)
end
end

		if GoS:ValidTarget(target, 1360) then
			if KogMenu.Combo.E then
	        	if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
                 	CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
end
end
end
		if GoS:ValidTarget(target, 1800) then
			if KogMenu.Combo.R then
	        	if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 then
                 	CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
end
end
end

end
end
end
        if IOW:Mode() == "Harass" then
      local target = GetCurrentTarget()
	  if KogMenu.Harass and IsObjectAlive(target) then	
		if GoS:ValidTarget(target, 1200) then
			if KogMenu.Harass.Q then
                 	if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
                 	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
end
end
end
           if GoS:ValidTarget(target, 1800) then
			if KogMenu.Harass.R then
	        	if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 then
                 	CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
end
end
end
end
end	   
end)

PrintChat("Battlecast KogMaw by Musti")
