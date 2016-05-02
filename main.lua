local SerialVersion = 1.0

require("anim_image")
require("entity_manager")
require("scene_handler")
require("camera")
require("world_map")
require("tools")

global_run_time = 0
local GFR = 1.0/60.0
love.graphics.setDefaultFilter("nearest", "nearest")
local player_obj = nil
local cur_hud = dofile("assets/hud/ingame.lua")
karma_font = love.graphics.newFont("assets/fonts/karma_future.ttf", 16)
sub_karma_font = love.graphics.newFont("assets/fonts/karma_future.ttf", 12)
limit_font = love.graphics.newFont("assets/fonts/8_bit_limit.ttf", 16)
sub_limit_font = love.graphics.newFont("assets/fonts/8_bit_limit.ttf", 12)
shader = love.graphics.newShader[[
	extern number active;
	extern number time;
	extern vec2 resolution;
	extern number vig_enabled;
	extern number vig_strength;
	extern number vig_light;
	extern number bloom_enabled;
	extern number red_tint;
	extern vec2 mouse;
	
	vec4 effect( vec4 color, Image texture, vec2 tc, vec2 screen_coords ){
		vec4 pixel = Texel(texture, tc );//This is the current pixel color
		number dist = cos((sqrt(tc.x * tc.y + tc.x * tc.y) + time) / 15) * 0.125 + 0.1;
		vec2 center = (((gl_FragCoord.xy - mouse.xy) / 2) / resolution.xy) - vec2(0.5);  
		number len = length(center);
		number baseg = pixel.g;
		number baser = pixel.r;
		number baseb = pixel.b;
		
		if(vig_enabled == 1)
		{
			pixel.r = pixel.r * (vig_light - len * vig_strength);
			pixel.g = pixel.g * (vig_light - len * vig_strength);
			pixel.b = pixel.b * (vig_light - len * vig_strength);
		}
			
		if(red_tint > 0)
		{
			pixel.r = pixel.r + red_tint;
		}
			
		if(bloom_enabled == 1)
		{
			int samples = 2;
			int quality = 1;
			vec4 sum = vec4(0);
			int diff = (samples - 1) / 2;
			vec2 sizeFactor = vec2(1) / resolution * quality;
			  
			for (int x = -diff; x <= diff; x++)
			{
				for (int y = -diff; y <= diff; y++)
				{
					vec2 offset = vec2(x, y) * sizeFactor;
					sum += Texel(texture, tc + offset);
				}
			}
			
			pixel = ((sum / (samples * samples)) + pixel) * color;
		}
		
		if(active > 0)
		{
			number average = (pixel.r+pixel.b+pixel.g)/3.0;
			pixel.b = pixel.r * 1.25 + pixel.g * 1.25 + 3 * (average * average) + dist;
			
			if(average < 0.1)
			{
				pixel.b = pixel.b * 0.125;
			}
			
			if(average > 0.9)
			{
				pixel.b = pixel.b + 0.5;
			}
			
			pixel.g = 0;
			pixel.r = 0;
			
			if(baseg > 0.55)
			{
				pixel.g = baseg * 3;
				pixel.b = pixel.b * 0.05;
			}
			
			if(baser > 0.75)
			{
					pixel.r = baser * 3;
					pixel.b = pixel.b * 0.05;
			}
		}
			
		return pixel;
	}
]]

reverse_world = false
is_in_world_map = true

function deepCopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

function ripairs(t)
    -- Try not to use break when using this function;
    -- it may cause the array to be left with empty slots
    local ci = 0
    local remove = function()
        t[ci] = nil
    end
    return function(t, i)
        --print("I", table.concat(array, ','))
        i = i+1
        ci = i
        local v = t[i]
        if v == nil then
            local rj = 0
            for ri = 1, i-1 do
                if t[ri] ~= nil then
                    rj = rj+1
                    t[rj] = t[ri]
                    --print("R", table.concat(array, ','))
                end
            end
            for ri = rj+1, i do
                t[ri] = nil
            end
            return
        end
        return i, v, remove
    end, t, ci
end

function ePrint(str)
	io.stdout:write("[Main]"..str.."\n")
end

function getArraySize(a)
	return table.getn(a)
end

function getOrraySize(T)
  local count = 0
  for l in pairs(T) do count = count + 1 end
  return count
end

function sSplit(seperator,str)
	if str == nil then
		ePrint("[Main.lua] sSplit string argument is nil!")
		return nil
	elseif seperator == nil then
		ePrint("[Main.lua] sSplit seperator argument is nil!")
		return nil
	else
		ret = {}
		count = 0
		splitter = "([^"..seperator.."]+)"
		for word in string.gmatch(str, splitter) do
			ret[count] = word
			count = count + 1
		end
		
		return ret
	end
end

function love.load()
	ePrint("Engine initialization started...")
	local image_list = loadfile("assets/images.lua")
	local images = image_list()
	local count = 0
	
	for image in pairs(images) do 
		imageid_reg[count] = image
		count = count + 1
	end
	
	for i=0,#imageid_reg do
		local imagedata = images[imageid_reg[i]] 
		
		if imagedata ~= nil then
			image_reg[imageid_reg[i]] = love.graphics.newImage(imagedata.imagepath)
			imagedata_reg[imageid_reg[i]] = imagedata
			
			if imagedata.animpath ~= nil then
				loadAnimationFromLocation(imagedata.animpath)
			end
		else
			ePrint("[Animations] Image table is nil. Index is "..i..", Name="..images["image_names"][i])
		end
	end

	ePrint("[Images.data] After registry, ImageRegistry size is "..getOrraySize(image_reg)..".")
	math.randomseed(os.time()) 
	love.graphics.setNewFont(24)
	love.graphics.setColor(255,255,255)
	love.graphics.setBackgroundColor(0,0,0)
	love.graphics.setLineStyle( 'rough' )
	love.window.setTitle("PsychoEngine")
	loadEntityList()
	registerEntity(player_obj, "PLAYER")
	play_identifier = math.random()
	player_obj = addEntity("PLAYER", 0, 0)
	shader:send("active", 1)
	shader:send("vig_enabled", 1)
	shader:send("vig_strength", 3.0)
	shader:send("vig_light", 1.35)
	shader:send("bloom_enabled", 1)
	shader:send("red_tint", 0)
	shader:send("time", global_run_time)--math.sqrt(mouse_x * mouse_x + mouse_y * mouse_y) / 2)
	shader:send("resolution", {love.graphics.getWidth(), love.graphics.getHeight()})
	shader:send("mouse", {mouse_x, mouse_y})
	setGameScene("assets/scenes/scene_forest_tut.lua")
	ePrint("Finished initialization!")
end

function setGameScene(scene)
	setCurrentScene(scene)
	play_identifier = math.random()
	player_obj = addEntity("PLAYER", 0, 0)
	player_obj.xpos = current_scene.start_x
	player_obj.ypos = current_scene.start_y
	love.graphics.setBackgroundColor(current_scene.red,current_scene.green,current_scene.blue)
	boss_entity = nil
	wipeEntities()
	filterEntities()
	fillCurrentScene()
	shader:send("active", 0)
	shader:send("vig_enabled", 1)
	shader:send("vig_strength", 3.0)
	shader:send("bloom_enabled", 1)
	shader:send("red_tint", 0)
	reverse_world = false
end

function getPlayer()
	return player_obj
end

delta_total = 0  
local cur_vst = 0.0
local gol_vst = 3.0
function love.update(dt)
	
	delta_total = delta_total + dt   -- we add the time passed since the last update, probably a very small number like 0.01
	if delta_total >= GFR then
		delta_total = delta_total - GFR   -- reduce our timer by a second, but don't discard the change... what if our framerate is 2/3 of a second?
		global_run_time = global_run_time + 1
		local fps = 1 / GFR
		updateGlobalAnimTime()
		
		if is_in_world_map ~= true then
			updateEntities()
			updateCurrentScene()
			update_camera()
			updateEntity(player_obj)
		else
			
		end
		
		if cur_hud ~= nil then cur_hud:update_hud() end
		shader:send("time", global_run_time)
		shader:send("resolution", {love.graphics.getWidth(), love.graphics.getHeight()})
		shader:send("mouse", {mouse_x - love.graphics.getWidth(), -mouse_y})
		local vs_c = (gol_vst - cur_vst) * 0.0125
		cur_vst = cur_vst + vs_c
		
		if reverse_world and is_in_world_map ~= true then
			shader:send("active",1)
			if current_scene ~= nil then shader:send("vig_light", math.cos(global_run_time / 15) * 0.1 + 0.95 + current_scene.scene_brightness * 0.5) end
			gol_vst = 5.0
		else
			if is_in_world_map == true then
				shader:send("active",0)
				shader:send("vig_light", 1.5)
				gol_vst = 4.0
			else
				shader:send("active",0)
				if current_scene ~= nil then shader:send("vig_light", 1.35 + current_scene.scene_brightness * 0.5) end
				gol_vst = 3.5
			end
		end
		
		if current_scene ~= nil then shader:send("vig_strength", cur_vst - current_scene.scene_brightness) end
		if(global_run_time % fps == 0) then
			ePrint(" Frame updated! Total run time = "..(global_run_time)..", in seconds "..(global_run_time/fps)..".")
		end
   end
end

function love.draw()
	local width_scale = 800 / love.graphics.getWidth()
	local height_scale = 600 / love.graphics.getHeight()
	local camshake_x = math.sin(math.cos(global_run_time / 15)) * (camera_shake * 10.0)
	local camshake_y = math.cos(math.sin(global_run_time / 15)) * (camera_shake * 10.0)
	local emps = 0
	
	if current_scene ~= nil then emps = (love.graphics.getHeight() / 2) - current_scene.scene_height / 2 end
	love.graphics.translate(camera_x + camshake_x, camera_y + camshake_y - emps / 2)
	love.graphics.scale(2.0 * width_scale,2.0 * height_scale)
	love.graphics.setShader(shader)
	if is_in_world_map ~= true then
		renderCurrentScene()
		renderEntities()
		renderEntity(player_obj)
	else
		renderWorldMapAt(32,32,1.0)
	end
	love.graphics.translate(-camera_x - camshake_x, -camera_y - camshake_y + emps / 2)
	love.graphics.setShader()
	if cur_hud ~= nil then cur_hud:render_hud(emps) end
	love.graphics.scale(0.5 * width_scale,0.5 * height_scale)
end