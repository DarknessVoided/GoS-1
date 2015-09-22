ShenMenu = Menu("Shen", "Shen:")
ShenMenu:SubMenu("Combo", "Combo")
ShenMenu.Combo:Boolean("Q", "Use Q", true)
ShenMenu.Combo:Boolean("W", "Use W", true)
ShenMenu.Combo:Boolean("E", "Use E", true)
ShenMenu.Combo:Boolean("R", "Use R in combo", true)
ShenMenu.Combo:Boolean("AUTOR", "Use R AUTO", true)



OnLoop(function(myHero)
	local myHero = GetMyHero()
	local target = GetCurrentTarget()
	local myHeroPos = GetOrigin(myHero)
	local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1600,0,650,50,false,true)
	
	
	if ShenMenu.Combo.AUTOR then
	for _, ally in pairs(GoS:GetAllyHeroes()) do
			if ShenMenu.Combo.AUTOR then
			if GetCurrentHP(myHero)/GetMaxHP(myHero)<0.30 then return end
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.15 and
	            	CanUseSpell(myHero, _R) == READY and IsObjectAlive(ally) then
			CastTargetSpell(ally,_R)

					end
				end	
			end
	
	if IOW:Mode() == "Combo" then

	if "Shen" == GetObjectName(myHero) then
	if ShenMenu.Combo and IsObjectAlive(target) then
	if GoS:ValidTarget(target, 500) then

		if ShenMenu.Combo.Q then
			if CanUseSpell(myHero, _Q) == READY and GoS:GetDistance(myHero,unit) then
			CastTargetSpell(target,_Q)

		end
	end
end		

		if GoS:ValidTarget(target, 650) then
		if ShenMenu.Combo.E then
			if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
			CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)


		end
	end
end

		if GoS:ValidTarget(target, 200) then
		if ShenMenu.Combo.W then
			if CanUseSpell(myHero, _W) == READY and GoS:GetDistance(myHero,unit) then
			CastSpell(_W)

		end
	end
end	

		for _, ally in pairs(GoS:GetAllyHeroes()) do
			if ShenMenu.Combo.R then
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.15 and
	            	CanUseSpell(myHero, _R) == READY and IsObjectAlive(ally) then
			CastTargetSpell(ally,_R)

					end
				end	
			end
		end
	end
end
end
end)


PrintChat("Blood Moon Shen by Musti")
