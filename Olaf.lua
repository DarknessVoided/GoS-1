OlafMenu = Menu("Olaf", "Olaf:")
OlafMenu:SubMenu("Combo", "Combo")
OlafMenu.Combo:Boolean("Q", "Use Q", true)
OlafMenu.Combo:Boolean("W", "Use W", true)
OlafMenu.Combo:Boolean("E", "Use E", true)
OlafMenu.Combo:Boolean("KSQ", "Killsteal with Q", true)


OnLoop(function(myHero)


local target = GetCurrentTarget()
ks()


if IOW:Mode() == "Combo" then

                        local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),2200,625,1300,90,false,false)

                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GoS:ValidTarget(target, 850) and OlafMenu.Combo.Q:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                         end
						 
                        if CanUseSpell(myHero, _W) == READY and GoS:ValidTarget(target, 300) and OlafMenu.Combo.W:Value() then
                        CastSpell(_W)
                         end						 
						                 
 						if CanUseSpell(myHero, _E) == READY and OlafMenu.Combo.E:Value() and GoS:ValidTarget(target, 325) then
                         CastTargetSpell(target, _E) 
						 end
end
end)
						 
	  

  
 
  function ks()
	for i,unit in pairs(GoS:GetEnemyHeroes()) do
		if OlafMenu.Combo.KSQ:Value() and CanUseSpell(myHero,_Q) and GoS:ValidTarget(unit,GetCastRange(myHero,_Q)) and GetCurrentHP(unit) < GoS:CalcDamage(myHero, unit, 0, (45*GetCastLevel(myHero,_Q)+25+GetBonusDmg(myHero)*1.00))+GetDmgShield(unit) then 
				local QPred = GetPredictionForPlayer(GoS:myHeroPos(),unit,GetMoveSpeed(unit),2200,625,1300,90,false,false)
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
	end
end
 

PrintChat("Pentakill OLaf by Musti")
