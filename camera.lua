camera_x = 0
camera_y = 0
camera_shake = 0
camera_target_x = 0
camera_target_y = 0


function update_camera()
	camera_shake = camera_shake * 0.95
	
	if math.abs(camera_shake) < 0.1 then
		camera_shake = 0
	end
	
	local c_x = (camera_target_x - camera_x) * 0.05
	local c_y = (camera_target_y - camera_y) * 0.05
	
	if c_x > 50.0 then c_x = 50.0 end
	if c_x < -50.0 then c_x = -50.0 end
	if c_y > 50.0 then c_y = 50.0 end
	if c_y < -50.0 then c_y = -50.0 end
	
	camera_x = camera_x + c_x
	camera_y = camera_y + c_y
end

function getCamX() return camera_x end
function getCamY() return camera_y end
function shakeCamera(val)
	if camera_shake == 0 then camera_shake = val end
end