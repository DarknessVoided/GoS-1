if GetObjectName(myHero) ~= "Kindred" then return end

KindredM = Menu("Kindred", "Kindred")
KindredM:SubMenu("Combo", "Combo")
KindredM.Combo:Boolean("Q", "Use Q", true)
KindredM.Combo:Boolean("W", "Use W", true)
KindredM.Combo:Boolean("E", "Use E", true)
KindredM:SubMenu("JungleClear", "JungleClear")
KindredM.JungleClear:Boolean("Q", "Use Q", true)
KindredM.JungleClear:Boolean("E", "Use E", true)
KindredM:SubMenu("LaneClear", "LaneClear")
KindredM.LaneClear:Boolean("Q", "Use Q", true)
KindredM.LaneClear:Boolean("E", "Use E", true)
KindredM:SubMenu("Drawings", "Drawings")
KindredM.Drawings:Boolean("Q", "Draw Q Range", true)
KindredM:SubMenu("Misc", "Misc")
KindredM.Misc:Boolean("Autolvl", "Auto level", true)


OnLoop(function(myHero)
   local target = GetCurrentTarget()

---COMBO---
if IOW:Mode() == "Combo" then

	if GoS:ValidTarget(target, 550) then

		if GetCastName(myHero, _Q) == "KindredQ" then
			local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1700,250,750,50,false,true)
			if KindredM.Combo.Q:Value() then
				if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
					CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
				end
			end
        end
    end 
	
	if GoS:ValidTarget(target, 700) and 
		if KindredM.Combo.W:Value() then
			if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and GoS:ValidTarget(target, 700) then
				CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
			end			
		end
	end	
						          
								  
	if KindredM.Combo.E:Value() then
		if CanUseSpell(myHero, _E) == READY and GoS:ValidTarget(target,GetCastRange(myHero,_E)) then
		   CastTargetSpell(target,_E)
		end
	end
end		

---JUNGLECLEAR---- Thanks Deftsu <3
if IOW:Mode() == "LaneClear" then
		
	for _,mob in pairs(GoS:GetAllMinions(MINION_JUNGLE)) do
	
		if CanUseSpell(myHero, _Q) == READY and KindredM.JungleClear.Q:Value() and GoS:ValidTarget(mob, 450) then
			mobPos=GetOrigin(mob)
			CastSkillShot(_Q,mobPos.x,mobPos.y,mobPos.z)
		end
	    if CanUseSpell(myHero, _E) == READY and KindredM.JungleClear.E:Value() and GoS:ValidTarget(mob, 450) then
			CastTargetSpell(mob, _E)
		end
		
	end
end



---LANECLEAR----
if IOW:Mode() == "LaneClear" then


	for _,minion in pairs(GoS:GetAllMinions(MINION_ENEMY)) do
		if CanUseSpell(myHero, _Q) == READY and KindredM.LaneClear.Q:Value() and GoS:ValidTarget(minion, 450) then
		   minionPos=GetOrigin(minion)
			CastSkillShot(_Q,minionPos.x,minionPos.y,minionPos.z)
		end
		
		
	    if CanUseSpell(myHero, _E) == READY and KindredM.LaneClear.E:Value() and GoS:ValidTarget(minion, 450) then
			CastTargetSpell(minion, _E)
		end
		

		
	end
end

---DRAWINGS----
if KindredM.Drawings.Q:Value() then DrawCircle(GoS:myHeroPos().x,GoS:myHeroPos().y,GoS:myHeroPos().z,550,1,128,0xff00ff00) end


----AUTOLVL-----
local leveltable = {_Q, _W, _E, _Q, _Q, _R, _E, _E, _E, _Q, _R, _E, _Q, _W, _W, _R, _W, _W}
if KindredM.Misc.Autolvl:Value() then  
	if GetLevel(myHero) == 3 then
		LevelSpell(leveltable[3])
		LevelSpell(leveltable[2])
		LevelSpell(leveltable[1])
	else
		LevelSpell(leveltable[GetLevel(myHero)]) 
	end
end
end)

PrintChat("Shadowfire Kindred by Musti")
