current_worldmap = dofile("assets/world/forest_world.lua")
local cur_path_point = 1
local curx = 0
local cury = 0
local mx = 0
local my = 0

local function isValidLevel()
	return current_worldmap:getPathPoints()[cur_path_point].level ~= nil and current_worldmap:getPathPoints()[cur_path_point].level ~= "" and current_worldmap:getPathPoints()[cur_path_point].levelname ~= nil and current_worldmap:getPathPoints()[cur_path_point].levelname ~= "" and current_worldmap:getPathPoints()[cur_path_point].levelportrait ~= nil and current_worldmap:getPathPoints()[cur_path_point].levelportrait ~= nil
end

function renderWorldMapAt(offx,offy,scale)
	offx = offx - (mx * (32 * scale))
	offy = offy - (my * (32 * scale))
	love.graphics.setBackgroundColor(0,0,0)
	local width = 0
	if current_worldmap ~= nil then
		local img = current_worldmap.tile_sprite
		local tiles = current_worldmap:getTiles()
		local height = getOrraySize(tiles)
		for i=0, height - 1 do
			local row = tiles[i]
			if row ~= nil then
				if getOrraySize(sSplit(",",row)) - 1 > width then width = getOrraySize(sSplit(",",row)) - 1 end
				for l=0, getOrraySize(sSplit(",",row)) - 1 do
					local x = l * (32 * scale)
					local y = i * (32 * scale)

					local tile = sSplit(",",row)[l]
					local distx = l - mx 
					local disty = i - my 
					if tile ~= nil then
						--ePrint((distx + 6))
						if distx > -1 and distx < 13 and disty > -1 and disty < 11 then
							renderAnimation(current_worldmap.anim_path, "tile"..tonumber(tile), x + offx, y + offy, 0, scale, scale, 0)
						end
					else
						ePrint("Tile at X="..i..",Y="..l.." is invalid?")
					end
				end
			end
		end
		
		local cx = current_worldmap:getPathPoints()[cur_path_point].x
		local cy = current_worldmap:getPathPoints()[cur_path_point].y + 1
		local dx = curx - cx
		local dy = cury - cy
		local maxspeed = 0.8
		if dx > maxspeed then dx = maxspeed elseif dx < -maxspeed then dx = -maxspeed end
		if dy > maxspeed then dy = maxspeed elseif dy < -maxspeed then dy = -maxspeed end
		
		curx = curx - dx * 0.125
		cury = cury - dy * 0.125
		
		if math.abs(dx) < 0.05 then curx = cx end
		if math.abs(dy) < 0.05 then cury = cy end
		
		local px = curx * (32 * scale)
		local py = cury * (32 * scale)
		local level = current_worldmap:getPathPoints()[cur_path_point].level
		renderAnimation(getPlayer().animpath, "player_map", px + offx, py + offy, 0, scale, scale)
		py = py - (9 * scale)
		renderAnimation(getPlayer().animpath, "head", px + offx, py + offy, 0, scale, scale)
		renderAnimation(getPlayer().animpath, "hair"..getPlayer().hair, px + offx, py + offy, 0, scale, scale)
		
		if isKeyPressed("d") and dx == 0 and dy == 0 then moveForwardInPath() end
		if isKeyPressed("a") and dx == 0 and dy == 0 then moveBackwardInPath() end
		if isKeyPressed("s") and dx == 0 and dy == 0 then enterCurrentLevel() end
		
		local mtx = (mx + 6 / scale) - curx
		local mty = (my + 5 / scale) - cury
		mx = (mx - (mtx * 0.1))
		my = (my - (mty * 0.1))
		if mx < 0 then mx = 0 end
		if mx > width - 13 then mx = width - 13 end
		if my < 0 then my = 0 end
		if my > height - 11 then my = height - 11 end
		--ePrint(mtx..","..mty)
	end
	
	function moveForwardInPath()
		cur_path_point = cur_path_point + 1
		if cur_path_point >= getOrraySize(current_worldmap:getPathPoints()) then
			cur_path_point = getOrraySize(current_worldmap:getPathPoints())
		end
	end

	function moveBackwardInPath()
		cur_path_point = cur_path_point - 1
		if cur_path_point < 1 then
			cur_path_point = 1
		end
	end
	
	function enterCurrentLevel()
		if isValidLevel() then
			setGameScene(current_worldmap:getPathPoints()[cur_path_point].level)
			is_in_world_map = false
			curhud = dofile("assets/hud/ingame.lua")
		end
	end
	
	function grabLevel()
		if isValidLevel() then
			return current_worldmap:getPathPoints()[cur_path_point]
		else
			return nil
		end
	end
end