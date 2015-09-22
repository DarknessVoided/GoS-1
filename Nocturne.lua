NocturneMenu = Menu("Nocturne", "Nocturne:")
NocturneMenu:SubMenu("Combo", "Combo")
NocturneMenu.Combo:Boolean("Q", "Use Q", true)
NocturneMenu.Combo:Boolean("E", "Use E", true)
NocturneMenu.Combo:Boolean("KSQ", "Killsteal with Q", true)


OnLoop(function(myHero)


local target = GetCurrentTarget()
ks()


if IOW:Mode() == "Combo" then

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2200,625,1300,90,false,false)

                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 1200) and NocturneMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                         end						 
						                 
 						if CanUseSpell(myHero, _E) == READY and NocturneMenu.Combo.E:Value() and GoS:ValidTarget(target, 465) then
                         CastTargetSpell(target, _E) 
						 end
end
end)
						 
	  

  
 
  function ks()
	for i,unit in pairs(GoS:GetEnemyHeroes()) do
		if NocturneMenu.Combo.KSQ:Value() and CanUseSpell(myHero,_Q) and GoS:ValidTarget(unit,GetCastRange(myHero,_Q)) and GetCurrentHP(unit) < GoS:CalcDamage(myHero, unit, 0, (45*GetCastLevel(myHero,_Q)+15+GetBonusDmg(myHero)*0.75))+GetDmgShield(unit) then 
				local QPred = GetPredictionForPlayer(GoS:myHeroPos(),unit,GetMoveSpeed(unit),2200,625,1300,90,false,false)
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
	end
end
 

PrintChat("Eternum Nocturne by Musti")
