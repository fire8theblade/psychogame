serial_version = 1.0
EMPTY = {}

EMPTY.initializeEnt = function (self,ent, x, y)
	if ent.max_anims <= 1 then ent.anim_type = "" ent.variants = false else
		ent.anim_type = math.floor((global_run_time + math.random() * 1000) % ent.max_anims)
	end
end

EMPTY.executeAI = function (self,ent)
end
EMPTY.renderEnt = function (self,ent)
	if ent.variants ~= nil and ent.variants == false then
		renderAnimation(ent.animpath, "idle", ent.xpos, ent.ypos + 32, ent.rot, 1.0, 1.0, ent.program_age)
	else
		renderAnimation(ent.animpath, "idle"..ent.anim_type, ent.xpos, ent.ypos + 32, ent.rot, 1.0, 1.0, ent.program_age)
	end
end
return EMPTY