serial_version = 1.0
return {
	add_ai_basics = function (self,ent, x, y)
		ent.xpos = x
		ent.ypos = y
		ent.motion_x = 0
		ent.motion_y = 0
		ent.rot = 0
		ent.age = 0
		ent.program_age = global_run_time
		ent.ent_id = cur_ent_id
	end,
	tile_check_collision = function (self,ent0,ent)
		if ent == nil or ent0 == nil then return false end
		if getDistance(ent0, ent) > math.sqrt(ent.col_width * ent.col_width + ent.col_height * ent.col_height) + 4 then return false else
			return true
		end
	end,
	update_entity_basics = function(self, ent)
		if ent.handlesownmotion ~= nil and ent.handlesownmovement == true then return end
		ent.xpos = ent.xpos + ent.motion_x * ent.friction
		ent.ypos = ent.ypos + ent.motion_y * ent.friction
		ent.motion_x = ent.motion_x * 0.85
		ent.motion_y = ent.motion_y * 0.85
		if math.abs(ent.motion_x) < 0.05 then ent.motion_x = 0 end
		if math.abs(ent.motion_y) < 0.05 then ent.motion_y = 0 end
		if ent.xpos < ent.col_height then ent.xpos = ent.col_height ent.left = false end
		if ent.xpos > current_scene.scene_width - ent.col_height then ent.xpos = current_scene.scene_width - ent.col_height ent.right = false end
		if ent.ypos < ent.col_height then ent.ypos = ent.col_height end
		if ent.ypos > current_scene.scene_height - ent.col_height then ent.ypos = current_scene.scene_height - ent.col_height end
	end,
}