serialization_version = 1.0
SPIDER = {}

SPIDER.initializeEnt = function (self,ent, x, y)
	ent.agro_ticks = 0
	ent.triggered = false
	ent.instance_rand = math.random() * 1000
	ent.active_time = 0
	ent.move = 0
	ent.hurt_cooldown = 0
	ent.onBulletHit = function(self, ent)
		local tx = self.xpos - ent.xpos
		self.motion_x = self.motion_x + tx * 0.35
		return self.agro_ticks < 0
	end
	ent.canRemove = function(self)
		return self.health <= 0
	end
end
SPIDER.executeAI = function (self,ent)
	if ent.age % 30 == 0 then
		if isEntityInRange(ent, getPlayer(), 256.0) then
			ent.triggered = true
		else
			ent.triggered = false
		end
	end
	
	if ent.triggered then
		ent.active_time = ent.active_time + 1
		local targ = getPlayer().xpos - ent.xpos
		local act = ent.active_time / 15.0
		local mo = ent.move
		
		if mo > 20 then mo = 20 end
		if ent.agro_ticks > 0 and mo > 0 then mo = mo * 3 end
		
		if targ < 0 then
			if ent.motion_x > 0 and ent.move > 10 then ent.move = -10 end
			ent.motion_x = ent.motion_x - 0.01 * mo 
			ent.move = ent.move + 1
		else
			if ent.motion_x < 0 and ent.move > 10 then ent.move = -10 end
			ent.motion_x = ent.motion_x + 0.01 * mo
			ent.move = ent.move + 1
		end
		
		if act > 80 then act = 80 end
		if math.abs(targ) < getPlayer().col_width * 18 then
			if (ent.instance_rand + ent.age) % (120 - act) <= 2 and ent.agro_ticks < -300 + act * 2 then
				ent.agro_ticks = 195
				
				if  ent.cur_bullet_ring ~= nil then
					for i=0, getOrraySize(ent.cur_bullet_ring) do
						local bul = ent.cur_bullet_ring[i]
						if bul ~= nil then bul.noclip = false end
					end
				end
				
				ent.cur_bullet_ring = {}
				ent.index = 0
			end
		end
		
		if getDistance(ent, getPlayer()) < ent.col_width - 8 then
			local ty = getPlayer().ypos - ent.ypos
			
			if ty > -ent.col_height and ty < -ent.col_height / 8 then
				getPlayer().motion_y = 0
				getPlayer().fall_time = 0
				getPlayer().jump_time = 25
			else
				ent.motion_x = -ent.motion_x * 2
				ent.move = -10
				getPlayer():hurtPlayer(1, ent)
			end
		end
		
		ent.motion_y = ent.motion_y + 0.35
		ent.agro_ticks = ent.agro_ticks - 1
	end
	
	if math.abs(ent.motion_x) > 15 then ent.motion_x = ent.motion_x * 0.8 end
	
	ent.motion_y = ent.motion_y + 0.125
end
SPIDER.onEntityDeath = function(self, ent)
	if cur_bullet_ring ~= nil then
		for i=0, getOrraySize(ent.cur_bullet_ring) do
			local bul = ent.cur_bullet_ring[i]
			if bul ~= nil then bul.noclip = false end
		end
	end
end
SPIDER.renderEnt = function (self,ent)
	local anim = "walk"
	local x = 0
	local y = 0
	if ent.agro_ticks > 0 then anim = "roll" end
	
	if ent.agro_ticks > 180 then
		anim = "drop"
		if ent.motion_x < 0 then
			renderAnimation(ent.animpath, anim, ent.xpos + x - 64, ent.ypos, 0, -1, 1, ent.instance_rand, (ent.agro_ticks - 180) / 5)
		else
			renderAnimation(ent.animpath, anim, ent.xpos + x, ent.ypos, 0, 1, 1, ent.instance_rand, (ent.agro_ticks - 180) / 5)
		end
	else
		local rot = 0
		
		if ent.agro_ticks > 0 then
			local m = 1
			if ent.motion_x < 0 then m = -1 end
			rot = -ent.agro_ticks * 8 * (m)
			y = ent.col_height / 4
		end
		
		if ent.motion_x < 0 then
			renderAnimation(ent.animpath, anim, ent.xpos + x - 64, ent.ypos + y + math.sin(rot * 4), rot, -1, 1, ent.instance_rand)
		else
			renderAnimation(ent.animpath, anim, ent.xpos + x, ent.ypos + y, rot + math.sin(rot * 4), 1, 1, ent.instance_rand)
		end
	end
end
return SPIDER