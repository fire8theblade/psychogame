mouse_x = 0
mouse_y = 0
mouse_right = false
mouse_left = false
mouse_center = false
keys_down = {}

function love.keypressed(key, scancode, isrepeat)
	if keys_down[key] == nil then
		keys_down[key] = 0
	end

	if keys_down[key] == 1 then
		keys_down[key] = -1
	elseif keys_down[key] == 0 then
		keys_down[key] = 1
	end
	
	if isKeyPressed("r") then 
		setGameScene("assets/scenes/scene_forest_tut.lua")
	end
end

function love.keyreleased(key, scancode, isrepeat)
	keys_down[key] = 0
end

function isKeyPressed(key)
	return keys_down[key] == 1
end

function love.mousemoved( x, y, dx, dy )
	mouse_x = x
	mouse_y = y
end

function love.mousepressed( x, y, button, istouch )
	if istouch == false then
		mouse_x = x
		mouse_y = y
		if button == 0 then mouse_left = true elseif
		button == 1 then mouse_right = true elseif
		button == 2 then mouse_center = true else end
		
		if getPlayer() ~= nil then getPlayer():mouseClicked(getPlayer()) end
	end
end

function love.mousereleased( x, y, button, istouch )
	if istouch == false then
		mouse_x = x
		mouse_y = y
		if button == 0 then mouse_left = false elseif
		button == 1 then mouse_right = false elseif
		button == 2 then mouse_center = false else end
	end
end