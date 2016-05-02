serialization_version = 1.0
BULLET = {}

BULLET.initializeEnt = function (self,ent, x, y)
	ent.target_angle = 0
	ent.speed = 0.1
	ent.death_time = -1
	ent.dead = false
	ent.anim = "alive"
	ent.homing = false
	ent.target = nil
	ent.shooter = nil
	ent.canHurtOthers = false
	ent.noclip = false
	ent.damage = 1
	
	ent.attemptTarget = function(ent)
		local ent1 = getClosestEntityTo(ent,loaded_entities)
		
		if (ent.shooter == getPlayer() or ent.canHurtOthers == true) and ent1 ~= nil and ent1 ~= ent.shooter and (ent1.anti_projectile == nil or ent1.anti_projectile == false) then
			local ang = math.atan2((ent1.ypos + ent1.eye_height) - ent.ypos, (ent1.xpos + ent1.col_width / 2) - ent.xpos)
			ent.target = ent1
		elseif ent1 ~= ent.shooter then
			ent.target = getPlayer()
		end
	end
	ent.setHeader = function(ent, x, y)
		ent.target_angle = math.atan2(y, x)
	end
	ent.canRemove = function(self)
		return self.dead
	end
end
BULLET.executeAI = function (self,ent)
	ent.motion_x = math.cos(ent.target_angle) * ent.speed
	ent.motion_y = math.sin(ent.target_angle) * ent.speed
	local flag = false
	
	if ent.homing and ent.target ~= nil then 
		local dir = math.atan2((ent.target.ypos + ent.target.eye_height) - ent.ypos, (ent.target.xpos + ent.target.col_width / 2) - ent.xpos)
		ent.target_angle = dir
	end
	
	if ent.age % 10 == 0 then ent.attemptTarget(ent) end
	
	if ent.death_time < 0 then
		ent.xpos = ent.xpos + ent.motion_x * ent.friction
		ent.ypos = ent.ypos + ent.motion_y * ent.friction
		ent.motion_x = ent.motion_x * 0.85
		ent.motion_y = ent.motion_y * 0.85
		if math.abs(ent.motion_x) < 0.05 then ent.motion_x = 0 end
		if math.abs(ent.motion_y) < 0.05 then ent.motion_y = 0 end
		if math.abs(ent.motion_x + ent.motion_y ) < 0.125 and ent.death_time < -120 then ent.death_time = 0 end
		
		ent.death_time = ent.death_time - 1
		
		if ent.target ~= nil then
			if getDistance(ent.target, ent) < ent.col_width * 1.5 then
				ent.death_time = 0
				flag = true
			end
		end
	else
		if ent.death_time >= 12 then
			ent.dead = true
			ent.play_identifier = -1
		end
		
		ent.motion_x = 0
		ent.motion_y = 0
		ent.death_time = ent.death_time + 1
	end
	
	if ent.death_time <= -300 / ent.speed then ent.death_time = 0 end
	
	if flag and ent.target ~= nil then
		if ent.target == getPlayer() then
			getPlayer():hurtPlayer(ent.damage, ent)
		else
			if ent.target.onBulletHit ~= nil then
				if ent.target:onBulletHit(ent) then
					ent.target.health = ent.target.health - ent.damage
				end
			else
				ent.target.health = ent.target.health - ent.damage
			end
		end
	end

	if ent.noclip == false then
		ent.handlesownmovement = true
		if ent.xpos < ent.col_height then ent.death_time = 0 end
		if ent.xpos > current_scene.scene_width - ent.col_height then ent.death_time = 0 end
		if ent.ypos < ent.col_height then ent.death_time = 0 end
		if ent.ypos > current_scene.scene_height - ent.col_height then ent.death_time = 0 end
	end
end
BULLET.renderEnt = function (self,ent)
	ent.anim = "alive"
	if ent.death_time >= 0 then ent.anim = "death" end
	if ent.shooter == getPlayer() then ent.anim = ent.anim.."_player" end
	
	if ent.dead == false then
		if ent.death_time >= 0 then
			renderAnimation(ent.animpath, ent.anim, ent.xpos, ent.ypos, math.deg(ent.target_angle) - (ent.age * 24) % 360, 1, 1, 0, ent.death_time / 3)
		else
			renderAnimation(ent.animpath, ent.anim, ent.xpos, ent.ypos, math.deg(ent.target_angle) - (ent.age * 24) % 360, 1, 1)
		end
	end
end
BULLET.setHeader = function(ent, x, y)
	ent.target_angle = math.atan2(ent.ypos-y, ent.xpos-y)
end
return BULLET