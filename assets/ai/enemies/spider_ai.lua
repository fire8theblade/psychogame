serialization_version = 1.0
SPIDER = {}

SPIDER.initializeEnt = function (self,ent, x, y)
	ent.agro_ticks = 30
	ent.triggered = false
	ent.instance_rand = math.random() * 1000
	ent.active_time = 0
	ent.cur_bullet_ring = {}
	ent.index = 0
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
		if ent.ypos > 160 + math.cos((ent.instance_rand + ent.age) / 60) * 128 then ent.motion_y = ent.motion_y - 0.25 end
		local targ = getPlayer().xpos + math.tan((ent.instance_rand + ent.age) / 90) * 80 - ent.xpos - 20
		local act = ent.active_time / 15.0
		
		if act > 80 then act = 80 end
		
		if math.abs(targ) < getPlayer().col_width * 6 then
			if (ent.instance_rand + ent.age) % (120 - act) <= 2 and ent.agro_ticks < -300 + act * 2 then
				ent.agro_ticks = 60
				
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
		
		ent.agro_ticks = ent.agro_ticks - 1
		
		for i=0, getOrraySize(ent.cur_bullet_ring) do
			local bullet = ent.cur_bullet_ring[i]
			
			if bullet ~= nil then
				if math.floor(i / 24) == 1 then
					bullet.target_angle = bullet.target_angle - 0.0625
				else
					bullet.target_angle = bullet.target_angle + 0.0625
				end
				
				local t = bullet.ypos - ent.ypos
				
				if bullet.age > 120 then
					bullet.ypos = bullet.ypos - t * 0.0125
				end
			end
		end
		
		if ent.agro_ticks == 10 or ent.agro_ticks == 20 or ent.agro_ticks == 30 or ent.agro_ticks == 40 then
			
			local ring_size = 5
			local ang_size = 360 / ring_size
			
			for i=0, ring_size do
				local bullet = addEntity("BULLET", ent.xpos, ent.ypos, false)
				bullet.target_angle = ang_size * i
				bullet.speed = 1.65
				bullet.shooter = ent
				bullet.noclip = true
				ent.cur_bullet_ring[ent.index] = bullet
				insertEntity(bullet)
				ent.index = ent.index + 1
			end
		end
	end
	
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
	local anim = "idle"
	local x = 0
	if ent.agro_ticks > 0 then anim = "attack" end
	renderAnimation(ent.animpath, anim, ent.xpos + x, ent.ypos, 0, 1, 1, 0)
	renderAnimation(ent.animpath, "web", ent.xpos + x, ent.ypos - 64, 0, 1, 1, 0)
	renderAnimation(ent.animpath, "web", ent.xpos + x, ent.ypos - 128, 0, 1, 1, 0)
	renderAnimation(ent.animpath, "web", ent.xpos + x, ent.ypos - 192, 0, 1, 1, 0)
	renderAnimation(ent.animpath, "web", ent.xpos + x, ent.ypos - 224, 0, 1, 1, 0)
	renderAnimation(ent.animpath, "web", ent.xpos + x, ent.ypos - 288, 0, 1, 1, 0)
end
return SPIDER