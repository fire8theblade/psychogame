current_scene = {}

function setCurrentScene(scene)
	current_scene = dofile(scene)
end

function fillCurrentScene() current_scene:fill_scene() end
function updateCurrentScene() current_scene:update_scene() end
function renderCurrentScene()
	local i = current_scene.scenery_layers
	local aw = anim_reg[current_scene.scenery_animation].anim_width
	local width = current_scene.scene_width / aw
	while true do
		for l=0, width do
			if getPlayer().xpos > aw * l - love.graphics.getWidth() * 2 then
				renderSceneLayer(i - 1, aw * l, 0)
				renderAnimation (current_scene.scenery_animation, "scene_floor", aw * l, current_scene.scene_height + 160, 0, 1, 1, 0)
			end
		end
		
		if getPlayer().xpos < love.graphics.getWidth() then
			renderSceneLayer(i - 1, 0, 0)
			
			if i == 1 then 
				renderAnimation (current_scene.scenery_animation, "scene_floor", 0, current_scene.scene_height + 160, 0, 1, 1, 0)
			end
		end
		if getPlayer().xpos > current_scene.scene_width - love.graphics.getWidth() then
			renderSceneLayer(i - 1, current_scene.scene_width + aw, 0)
			
			if i == 1 then 
				renderAnimation (current_scene.scenery_animation, "scene_floor", current_scene.scene_width + aw, current_scene.scene_height + 160, 0, 1, 1, 0)
			end
		end
		i = i - 1
		if i <= 0 then break end
	end
end

function renderSceneLayer(layer, xoff, yoff)
	local move_offset = layer / current_scene.scenery_layers
	local move = (camera_x - camera_target_x) * move_offset * 0.325
	local ymove = (getPlayer().ypos - 100) * move_offset / 5.0
	
	if layer == 0 then move = move * 0.125 end
	
	if current_scene.sun_layer ~= nil then
		if current_scene.sun_layer == layer then move = move * 0.125 ymove = 0.0 end
		if current_scene.sun_layer - 1 == layer then move = move * 0.3 ymove = ymove * 0.125 end
	end
	
	renderAnimation (current_scene.scenery_animation, "layer"..layer, xoff - move, yoff + current_scene.scene_height - layer * 16 - ymove, 0, 1, 1, 0)
end