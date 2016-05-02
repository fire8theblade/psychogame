serial_version = 1.0
TILE = {}

TILE.initializeEnt = function (self,ent, x, y)
	if ent.max_anims <= 1 then ent.anim_type = "" ent.variants = false else
		ent.anim_type = math.floor((global_run_time + math.random() * 1000) % ent.max_anims)
	end
end

TILE.executeAI = function (self,ent)
	local pl = getPlayer()
	local x = (ent.xpos + ent.col_width / 2) - (pl.xpos + pl.col_width / 2)
	local y = (ent.ypos + ent.eye_height) - (pl.ypos + ent.col_height)
	local dist = getDistance(ent, pl)
	local size = math.sqrt(ent.col_width * ent.col_width + ent.eye_height * ent.eye_height)
	
	if x + pl.col_width / 2 < ent.col_width + pl.col_width / 2 and x + pl.col_width / 2 > 0 then
		ePrint("Height="..y)
		if y < pl.col_height / -4 then
			getPlayer().col_obj = ent
			if x + pl.col_width / 2 > pl.col_width and getPlayer().right then
				ent.allow_right_movement = false
				ent.allow_left_movement = true
			elseif x + pl.col_width / 2 <= pl.col_width and getPlayer().left then
				ent.allow_right_movement = true
				ent.allow_left_movement = false
			end
		else
			ent.allow_right_movement = true
			ent.allow_left_movement = true
			
			if y > pl.col_height / -8 and y < pl.col_height and math.abs(x + pl.col_width / 2) > ent.col_width / 2 then
				ent.allow_fall_movement = false
			else
				ent.allow_fall_movement = true
			end
		end
	elseif getPlayer().col_obj == ent then getPlayer().col_obj = nil end
end
TILE.renderEnt = function (self,ent)
	if ent.variants ~= nil and ent.variants == false then
		renderAnimation(ent.animpath, "idle", ent.xpos, ent.ypos + ent.col_height / 2, ent.rot, 1.0, 1.0, ent.program_age)
	else
		renderAnimation(ent.animpath, "idle"..ent.anim_type, ent.xpos, ent.ypos + ent.col_height / 2, ent.rot, 1.0, 1.0, ent.program_age)
	end
end
return TILE