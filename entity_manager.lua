loaded_entities = {}
entity_reg = {}
entityid_reg = {}
ai_reg = {}
local entities = dofile("assets/entities.lua")
local baseai = dofile("assets/ai/baseai.lua")
local cur_ent_id = 0
boss_entity = nil
local filter_check = 3

function loadEntityList()
	local count = 0
	
	for entity in pairs(entities) do 
		entityid_reg[count] = entity
		count = count + 1
	end
	
	for i=0,getOrraySize(entityid_reg) do
		local entity = entities[entityid_reg[i]]
		registerEntity(entity, entityid_reg[i])
	end
	
	ePrint("[Entities] After initialization, EntityList size is "..getOrraySize(entity_reg)..".")
end

function wipeEntities()
	loaded_entities = {}
	cur_ent_id = 0
end

function filterEntities() 
	local ret = {}    
	local index = 0
	local prev_count = getOrraySize(loaded_entities)
	for _,v in pairs(loaded_entities) do
		if v.canRemove ~= nil and v:canRemove() == false or v.canRemove == nil then
			ret[index] = v
			index = index + 1
		end
	end
	
	loaded_entities = ret

	if prev_count - index > 0 then
		ePrint("Filtered entities, remaining entities:"..index..", removed entities:"..(prev_count - index))
	end
end

function registerEntity(entity, entity_name)
	if entity ~= nil then
		if entity_name ~= nil then
			entity_reg[entity_name] = entities[entity_name]
		end
		
		local ai = entities[entity_name].aipath
		
		if ai_reg[ai] == nil then
			ai_reg[ai] = dofile(ai)
			ePrint("Registered AI='"..ai.."'!")
		end
	end
end

function addEntity(entityid, x, y, add)
	
	if entity_reg[entityid] == nil then ePrint("Entity "..entityid.." is not a part of the entity registry.") return nil end
	local entity = deepCopy(entity_reg[entityid])
	if entity ~= nil then
		entity.max_health = entity.health
		baseai:add_ai_basics(entity, x, y)
		ai_reg[entity.aipath]:initializeEnt(entity, x, y)
		if entityid ~= "PLAYER" then
			if add == nil or add == true then
				loaded_entities[cur_ent_id] = entity
				cur_ent_id = cur_ent_id + 1
				ePrint("Added entity "..entity.name.."!")
			end
		end
		
		entity.for_entity_manager_finished = false
		entity.play_identifier = current_scene.play_identifier
		if filter_check == -1 then filter_check = 3 end
		return entity
	end
	
	return nil
end

function insertEntity(entity)
	if entity ~= nil then
		loaded_entities[cur_ent_id] = entity
		cur_ent_id = cur_ent_id + 1
		entity.for_entity_manager_finished = false
		entity.play_identifier = current_scene.play_identifier
	end
end

function updateEntities()
	for i=0,getOrraySize(loaded_entities) do
		local entity = loaded_entities[i]
		updateEntity(entity)
	end
	
	if filter_check > 0 then filter_check = filter_check - 1 elseif filter_check ~= -1 then filterEntities() filter_check = -1 end
	--updateEntity(last_entity)
end

function isEntityInRange(entity, target, radius)
	local es = math.sqrt(entity.xpos * entity.xpos + entity.ypos * entity.ypos)
	local es1 = math.sqrt(target.xpos * target.xpos + target.ypos * target.ypos)
	es = math.abs(es)
	es1 = math.abs(es1)
	if es - es1 < radius then return true else return false end
end

function getDistanceToPoint(entity, x, y)
	return math.sqrt((entity.xpos - entity.col_width / 2 - x)*(entity.xpos - entity.col_width / 2 - x) + (entity.ypos - entity.col_height / 2 - y)*(entity.ypos - entity.col_height / 2 - y))
end

function getEntitiesInRange(entity, radius)
	local ret = {}
	local ind = 0
	local es = math.sqrt(entity.col_width * entity.col_width + entity.col_height * entity.col_height)
	for i=0, getOrraySize(loaded_entities) do
		local ent = loaded_entities[i]
		
		if ent ~= nil then
			local es1 = math.sqrt(ent.col_width * ent.col_width + ent.col_height * ent.col_height)
			
			if es1 < es then
				ret[ind] = ent
				ind = ind + 1
			end
		end
	end
	
	return ret
end

function getClosestEntityTo(entity, entities)
	local ret = nil
	
	for i=0, getOrraySize(entities) do
		local ent = entities[i]
		
		if ent ~= nil then
			local dist = getDistance(entity, ent)
			
			if ret == nil or getDistance(entity, ret) > dist and ent.name ~= "Bullet" and ent.inactive == nil then
				ret = ent
			end
		end
	end
	
	return ret
end

function updateEntity(entity)
	if entity ~= nil then
		entity.age = entity.age + 1
		
		if ai_reg[entity.aipath] == nil then
			ai_reg[entity.aipath] = dofile(entity.aipath)
			ePrint("Registered AI='"..entity.aipath.."'!")
		end
		
		if entity ~= getPlayer() then
			if entity.health <= 0 then
				if entity.for_entity_manager_finished == false then
					if ai_reg[entity.aipath].onEntityDeath ~= nil then
						ai_reg[entity.aipath]:onEntityDeath(entity)
					end
					
					if entity.drops_chance ~= nil and entity.drops_chance >= 0 then
						local chance = math.random()
						
						if chance <= entity.drops_chance then
							local drop = addEntity("PICKUPS", entity.xpos + entity.col_width / 2, entity.ypos + entity.eye_height)
							drop.pickup_type = 0
							insertEntity(drop)
						end
					end
				end
				
				entity.for_entity_manager_finished = true
				entity.inactive = true
			end
		end
		
		if entity.inactive == nil or entity.inactive == false then
		
			if baseai:tile_check_collision(getPlayer(), entity) and entity ~= getPlayer() then
				if ai_reg[entity.aipath].onCollideWithPlayer ~= nil then
					ai_reg[entity.aipath]:onCollideWithPlayer(entity)
				end
			end
		
		
			ai_reg[entity.aipath]:executeAI(entity)
			
			if entity.wall == nil then
			baseai:update_entity_basics(entity)
			end
		end
		
		if entity.inactive == true or entity.health <= 0 then filterEntities() end
	end
end

function getDistance(ent, ent2)
	return getDistanceToPoint(ent, ent2.xpos - ent.col_width / 2, ent2.ypos - ent2.col_height / 2)
end

function renderEntities()
	for i=0,getOrraySize(loaded_entities) do
		local entity = loaded_entities[i]
		renderEntity(entity)
	end
	
	--renderEntity(last_entity)
end

function renderEntity(entity)
	if entity ~= nil and entity.inactive == nil then
		if ai_reg[entity.aipath] == nil then
			ai_reg[entity.aipath] = dofile(entity.aipath)
			ePrint("Registered AI='"..entity.aipath.."'!")
		end
		
		if ai_reg[entity.aipath]:renderEnt(entity) == false then
			ePrint("Rendering entity "..entity.name.." with id "..entity.ent_id" not working!? Animation path is '"..entity.animpath.."'")
		end
	end
end