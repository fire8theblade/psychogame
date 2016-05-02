serialization_version = 1.0
BOSS_SPIDER = {}

BOSS_SPIDER.initializeEnt = function (self,ent, x, y)
	ent.agro_ticks = 30
	ent.agro_type = 1
	ent.triggered = false
	ent.instance_rand = math.random() * 1000
	ent.active_time = 0
	ent.cur_bullet_ring = {}
	ent.index = 0
	ent.cur_spiders = {}
	ent.spider_index = 0
	ent.canRemove = function(self)
		return self.health <= 0
	end
end
BOSS_SPIDER.executeAI = function (self,ent)
	if ent.age % 30 == 0 then
		if isEntityInRange(ent, getPlayer(), 512.0) then
			ent.triggered = true
		else
			ent.triggered = false
		end
	end
	
	if ent.triggered then
		local regen = 240
		if reverse_world then regen = 90 end
		if ent.age % regen == 0 then ent.health = ent.health + 1 end
		if ent.health > ent.max_health then ent.health = ent.max_health end
	
		boss_entity = ent
		ent.active_time = ent.active_time + 1
		if ent.ypos > 160 + math.cos((ent.instance_rand + ent.age) / 80) * 128 then ent.motion_y = ent.motion_y - 0.25 end
		local tx = (ent.xpos - getPlayer().xpos) * 0.02
		if reverse_world then tx = tx * 1.5 end
		ent.motion_x = -tx
		local targ = getPlayer().xpos + math.tan((ent.instance_rand + ent.age) / 90) * 80 - ent.xpos - 20
		local act = ent.active_time / 15.0
		
		if act > 80 then act = 80 end
		
		if math.abs(targ) < getPlayer().col_width * 6 then
			if (ent.instance_rand + ent.age) % (120 - act) <= 2 and ent.agro_ticks < -300 + act * 2 then
				ent.agro_ticks = 60
				if ent.spider_index < 4 and math.random() < 0.4 then ent.agro_type = 2 else ent.agro_type = 1 end
				
				if  ent.cur_bullet_ring ~= nil then
					for i=0, getOrraySize(ent.cur_bullet_ring) do
						local bul = ent.cur_bullet_ring[i]
						if bul ~= nil then bul.noclip = false end
					end
				end
				
				if ent.agro_type == 1 then
					ent.cur_bullet_ring = {}
					ent.index = 0
				end
			end
		end
		
		ent.agro_ticks = ent.agro_ticks - 1
		if ent.health < ent.max_health / 4 then if reverse_world == false then ent.max_health = ent.max_health * 1.5 ent.health = ent.max_health end reverse_world = true end
		
		for i=0, getOrraySize(ent.cur_bullet_ring) do
			local bullet = ent.cur_bullet_ring[i]
			
			if bullet ~= nil then
				local ang = 0.0625 + math.cos(ent.age / 10) * 0.01
				if math.floor(i / 24) == 1 then
					bullet.target_angle = bullet.target_angle - ang
				else
					bullet.target_angle = bullet.target_angle + ang
				end
				
				local t = bullet.ypos - ent.ypos + math.cos(ent.age / 120) * 60.0
				if bullet.age > 120 then
					bullet.ypos = bullet.ypos - t * 0.0125
				end
			end
		end
		
		local flag = false
		
		for i=0, getOrraySize(ent.cur_spiders) do
			local spd = ent.cur_spiders[i]
			
			if spd ~= nil then
				local xoff = ent.xpos + math.cos((spd.instance_rand + spd.age) / 100) * 100.0
				spd.xpos = -16 + xoff
				local dist = spd.xpos - ent.xpos
				
				if spd.agro_ticks > 45 then
					spd.agro_ticks = 45
				end
				
				if spd.inactive then
					ent.cur_spiders[i] = nil
					flag = true
				end
			end
		end
		
		if ent.agro_type == 2 and ent.spider_index == 4 and flag then
			ent.cur_spiders = {}
			ent.spider_index = 0
		end
		
		local art = 20
		if reverse_world then art = 10 end
		
		if ent.agro_ticks % art == 5 and ent.agro_ticks > 0 and ent.agro_type == 1 then
			local ring_size = 4
			local ang_size = 360 / ring_size
			if reverse_world then ring_size = 6 end
			
			for i=0, ring_size do
				local bullet = addEntity("BULLET", ent.xpos, ent.ypos, false)
				bullet.target_angle = ang_size * i
				bullet.speed = 1.95
				if reverse_world then bullet.speed = 1.5 end
				bullet.shooter = ent
				bullet.noclip = true
				ent.cur_bullet_ring[ent.index] = bullet
				insertEntity(bullet)
				ent.index = ent.index + 1
			end
		end
		
		if ent.agro_ticks == 20 and ent.spider_index < 4 and ent.agro_type == 2 then
			if reverse_world == false then
				ent.cur_spiders[ent.spider_index] = addEntity("SPIDER", ent.xpos + ent.col_width / 2, -100)
				ent.cur_spiders[ent.spider_index].health = 4
				ent.cur_spiders[ent.spider_index].drop_chance = 0.5
				ent.spider_index = ent.spider_index + 1
			else
				if ent.health < ent.max_health / 3 or math.random() < 0.5 and ent.health < ent.max_health then
					ent.health = ent.health + math.floor(ent.max_health / 6)
					if ent.health > ent.max_health then ent.health = ent.max_health end
				else
					for i=0, 3 do
						ent.cur_spiders[ent.spider_index] = addEntity("SPIDER", ent.xpos + ent.col_width / 2, -100)
						ent.cur_spiders[ent.spider_index].health = 1
						ent.cur_spiders[ent.spider_index].drop_chance = 0.8
						ent.spider_index = ent.spider_index + 1
					end
				end
			end
		end
	end
	
	ent.motion_y = ent.motion_y + 0.125
	boss_entity = ent
end
BOSS_SPIDER.renderEnt = function (self,ent)
	local anim = "idle"
	local x = 32
	if ent.agro_ticks > 0 then if ent.agro_type == 1 then anim = "attack" elseif ent.agro_type == 2 then anim = "summon" end end
	if reverse_world then anim = anim.."_reverse" end
	renderAnimation(ent.animpath, anim, ent.xpos + x - 16, ent.ypos, 0, 1, 1, 0)
	renderAnimation(ent.animpath, "web", ent.xpos + x, ent.ypos - 64, 0, 1, 1, 0)
	renderAnimation(ent.animpath, "web", ent.xpos + x, ent.ypos - 128, 0, 1, 1, 0)
	renderAnimation(ent.animpath, "web", ent.xpos + x, ent.ypos - 192, 0, 1, 1, 0)
	renderAnimation(ent.animpath, "web", ent.xpos + x, ent.ypos - 224, 0, 1, 1, 0)
	renderAnimation(ent.animpath, "web", ent.xpos + x, ent.ypos - 288, 0, 1, 1, 0)
end
BOSS_SPIDER.onEntityDeath = function(self, ent)
	if cur_bullet_ring ~= nil then
		for i=0, getOrraySize(ent.cur_bullet_ring) do
			local bul = ent.cur_bullet_ring[i]
			if bul ~= nil then bul.noclip = false end
		end
	end
	
	cur_spiders = nil
	spider_index = 0
	local heart = addEntity("PICKUPS", ent.xpos + ent.col_width / 2, ent.ypos + ent.col_height / 2, false)
	heart.pickup_type = 0
	shader:send("active", 0)
	insertEntity(heart)
	reverse_world = false
end
return BOSS_SPIDER