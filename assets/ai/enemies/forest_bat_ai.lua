serialization_version = 1.0
FOREST_BAT = {}

FOREST_BAT.initializeEnt = function (self,ent, x, y)
	ent.agro_ticks = 30
	ent.triggered = false
	ent.move = 0
	ent.instance_rand = math.random() * 1000
	ent.active_time = 0
	ent.canRemove = function(self)
		return self.health <= 0
	end
end
FOREST_BAT.executeAI = function (self,ent)
	if ent.age % 30 == 0 then
		if isEntityInRange(ent, getPlayer(), 256.0) then
			ent.triggered = true
		else
			ent.triggered = false
		end
	end
	
	if ent.triggered then
		ent.active_time = ent.active_time + 1
		if ent.ypos > 128 + math.cos((ent.instance_rand + ent.age) / 60) * 32 then ent.motion_y = ent.motion_y - 0.25 end
		local targ = getPlayer().xpos + math.tan((ent.instance_rand + ent.age) / 90) * 80 - ent.xpos - 20
		local mo = ent.move
		
		if mo > 20 then mo = 20 end
		
		if targ < 0 then
			if ent.motion_x > 0 and ent.move > 10 then ent.move = -10 end
			ent.motion_x = ent.motion_x - 0.01 * mo
			ent.move = ent.move + 1
		else
			if ent.motion_x < 0 and ent.move > 10 then ent.move = -10 end
			ent.motion_x = ent.motion_x + 0.01 * mo
			ent.move = ent.move + 1
		end
		
		local act = ent.active_time / 15.0
		
		if act > 80 then act = 80 end
		
		if ent.active_time > 1800 then act = 95 end
		
		if math.abs(targ) < getPlayer().col_width * 6 then
			if (ent.instance_rand + ent.age) % (120 - act) <= 2 and ent.agro_ticks < -200 + act * 2 then
				ent.agro_ticks = 30
			end
		end
		
		ent.agro_ticks = ent.agro_ticks - 1
		
		if ent.agro_ticks == 15 then
			local bullet = addEntity("BULLET", ent.xpos, ent.ypos, false)
			local ang = math.atan2((getPlayer().ypos + getPlayer().col_height / 2) - ent.ypos, (getPlayer().xpos + getPlayer().col_width / 2) - ent.xpos)
			bullet.target_angle = ang
			bullet.shooter = ent
			bullet.speed = 1.5
			insertEntity(bullet)
		end
	end
	
	ent.motion_y = ent.motion_y + 0.125
end
FOREST_BAT.renderEnt = function (self,ent)
	local anim = "fly"
	local x = 0
	if ent.agro_ticks > 0 then anim = "attack" end
	if ent.motion_x > 0 then anim = anim.."_right" x = -64 end	
	renderAnimation(ent.animpath, anim, ent.xpos + x, ent.ypos, 0, 1, 1, ent.instance_rand)
end
return FOREST_BAT