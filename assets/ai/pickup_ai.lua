serialization_version = 1.0
PICKUPS = {}
local pickups = {"heart", "", "", ""}
PICKUPS.initializeEnt = function (self,ent, x, y)
	ent.pickup_type = 0
	ent.picked_up = false
	ent.canRemove = function(self)
		return self.picked_up == true
	end
end
PICKUPS.executeAI = function (self,ent)
	if ent.age % 10 == 0 and getDistance(ent, getPlayer()) <= 32 then
		if ent.pickup_type == 0 and (ent.inactive == nil or ent.inactive == false) then
			getPlayer().health = getPlayer().health + 1
		end
		
		ent.inactive = true
		ent.picked_up = true
	end
	
	local age = ent.age
	
	if age > 200 then age = 200 end
	ent.motion_y = ent.motion_y + 0.03 * (age / 20)
	local xmot = (getPlayer().xpos - ent.xpos)
	
	if xmot > 1.0 then xmot = 1.0 end
	if xmot < -1.0 then xmot = -1.0 end
	
	ent.motion_x = ent.motion_x + (xmot * 0.0015)
end
PICKUPS.renderEnt = function (self,ent)
	renderAnimation(ent.animpath, "heart", ent.xpos, ent.ypos, 0, 1 + math.cos(ent.age / 25.0) * 0.025, 1 + math.sin(ent.age / 25.0) * 0.025, 0, 0)
end
return PICKUPS