serialization_version = 1.0
AI = {}

AI.initializeEnt = function (self,ent, x, y)
	ent.canRemove = function(self)
		return self.health <= 0
	end
end
AI.executeAI = function (self,ent)
end
AI.onEntityDeath = function(self, ent)
end
AI.renderEnt = function (self,ent)
end
return AI