serialization_version = 1.0
PLAYER = {}

PLAYER.initializeEnt = function (self,ent, x, y)
	ent.left = false
	ent.right = false
	ent.move_time = 0.0
	ent.move_age = 0
	ent.flying = false
	ent.col_obj = nil
	ent.jump_time = 0
	ent.fall_time = 0
	ent.fire_rate = 20
	ent.fire_cooldown = ent.fire_rate
	ent.hair = 1
	ent.hurt_cooldown = 0
	ent.mouseClicked = function(self,ent)		
		if ent.fire_cooldown == 0 then
			ent.fire_cooldown = ent.fire_rate
			local bullet = addEntity("BULLET", ent.xpos, ent.ypos, false)
			bullet.shooter = ent
			bullet.setHeader(bullet, (mouse_x) / 2 - (ent.xpos - ent.col_width / 2 + camera_x / 2), mouse_y / 2 - (ent.ypos - ent.eye_height * 2 + camera_y / 2))
			bullet.speed = 3.5
			insertEntity(bullet)
		end
	end
	ent.hurtPlayer = function(self, val, ent)
		if self.hurt_cooldown == 0 then
			self.health = self.health - val
			self.hurt_cooldown = 20 + val * 40
			if self.hurt_cooldown > 200 then self.hurt_cooldown = 0 end
			return true
		else return false end
	end
	ent.canRemove = function(self)
		return false
	end
end

PLAYER.executeAI = function (self,ent)
	if isKeyPressed("a") then
		ent.left = true
	else
		ent.left = false
	end
	
	if isKeyPressed("d") then
		ent.right = true
	else
		ent.right = false
	end
	
	if ent.left == true or ent.right == true and ent.jump_time <= 20 then 
		if ent.move_time == 0 then 
			ent.move_age = age
		end
		
		ent.move_time = ent.move_time + 1 
	elseif ent.jump_time <= 10 then
		ent.move_time = 0 
		ent.move_age = 0 
	end
	
	if mouse_left == true then
		if ent.fire_cooldown == 0 then
			ent.fire_cooldown = ent.fire_rate
			local bullet = addEntity("BULLET", ent.xpos, ent.ypos, false)
			bullet.shooter = ent
			bullet.setHeader(bullet, (mouse_x) / 2 - (ent.xpos - ent.col_width / 2 + camera_x / 2), mouse_y / 2 - (ent.ypos - ent.eye_height * 2 + camera_y / 2))
			bullet.speed = 3.5
			insertEntity(bullet)
		end
	end
	
	local move = ent.move_time 
	if move > 10 then move = 10 end
	
	if isKeyPressed("space") and ent.jump_time <= 0 and ent.fall_time <= 0 then
		ent.jump_time = math.floor(move * 1.0 + 40) / 1.75
	end
	
	if isKeyPressed("h") and global_run_time % 2 == 0 then
		ent.health = ent.health + 1
	end
	
	local flag = true
	local flag1 = true
	local flag2 = true
	
	if ent.col_obj ~= nil then
		if ent.col_obj.allow_left_movement == false then
			ent.left = false
			ent.xpos = ent.xpos - ent.motion_x
			flag = false
		end
		if ent.col_obj.allow_right_movement == false then
			ent.right = false
			ent.xpos = ent.xpos - ent.motion_x
			flag1 = false
		end
		if ent.col_obj.allow_fall_movement == false then
			ent.fall_time = 0
			ent.ypos = ent.ypos - ent.motion_y
			flag2 = false
			
			if ent.motion_y > 0 then ent.motion_y = 0 end
		end
	end
	
	if ent.left == true and ent.right == false and flag then
		ent.motion_x = -1.0 * (move / 3.95)
	end
	
	if ent.right == true and ent.left == false and flag1 then
		ent.motion_x = 1.0 * (move / 3.95)
	end
	
	if ent.flying == false and ent.ypos < current_scene.scene_height - 32 and flag2 then
		ent.motion_y = ent.motion_y + ent.fall_time * 0.0225
		ent.fall_time = ent.fall_time + 1
	else
		ent.fall_time = 0
	end
	
	if ent.fire_cooldown > 0 then ent.fire_cooldown = ent.fire_cooldown - 1 end
	
	if ent.jump_time > 0 then
		local jum = ent.jump_time
		if jum > 30 then jum = 30 end
		if ent.jump_time >= 55 then jum = 60 end
		ent.motion_y = ent.motion_y - jum * 0.045
		ent.jump_time = ent.jump_time - 1
		ent.motion_x = ent.motion_x * 1.1
	end
	
	shader:send("red_tint", (ent.hurt_cooldown * 2) / 400)
	if ent.hurt_cooldown > 0 then ent.hurt_cooldown = ent.hurt_cooldown - 1 end
	camera_target_x = -ent.xpos * 2.0 + love.graphics.getWidth() / 2
	camera_target_y = 0
end
PLAYER.renderEnt = function (self,ent)
	local hurt = ent.hurt_cooldown
	if hurt > 200 then hurt = 200 end
	if ent.hurt_cooldown == 0 then hurt = 0 end
	local yo = math.cos(ent.age / 10) * 0.5

	if ent.right == false and ent.left == false or ent.right == true and ent.left == true then
		renderAnimation(ent.animpath, "body", ent.xpos, ent.ypos, ent.rot, 1.0, 1.0, ent.program_age)
		renderAnimation(ent.animpath, "head", ent.xpos, ent.ypos - 9 - yo, ent.rot, 1.0, 1.0, ent.program_age)
		renderAnimation(ent.animpath, "hair"..ent.hair, ent.xpos, ent.ypos - 9 - yo, ent.rot, 1.0, 1.0, ent.program_age)
	elseif ent.right == true and ent.left == false then
		renderAnimation(ent.animpath, "body_side", ent.xpos, ent.ypos, ent.rot, 1.0, 1.0, ent.program_age)
		renderAnimation(ent.animpath, "head_side", ent.xpos, ent.ypos - 9 - yo, ent.rot, 1.0, 1.0, ent.program_age)
		renderAnimation(ent.animpath, "hair"..ent.hair.."_side", ent.xpos, ent.ypos - 9 - yo, ent.rot, 1.0, 1.0, ent.program_age)
	elseif ent.right == false and ent.left == true then
		renderAnimation(ent.animpath, "body_left", ent.xpos - 64, ent.ypos, ent.rot, 1.0, 1.0, ent.program_age)
		renderAnimation(ent.animpath, "head_left", ent.xpos - 64, ent.ypos - 9 - yo, ent.rot, 1.0, 1.0, ent.program_age)
		renderAnimation(ent.animpath, "hair"..ent.hair.."_left", ent.xpos - 64, ent.ypos - 9 - yo, ent.rot, 1.0, 1.0, ent.program_age)
	end
	love.graphics.setColor(255,255,255)
end

return PLAYER