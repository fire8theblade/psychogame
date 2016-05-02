sprite_reg = {}
image_reg = {}
imagedata_reg = {}
imageid_reg = {}
anim_reg = {}
global_animation_time = 0
animation_paused = false

function loadAnimationFromLocation(anim_path)
    if anim_path == nil then return nil end
    local definition_file = dofile(anim_path)
	
    if definition_file == nil then
        ePrint("Attempt to load an invalid file (inexistent or syntax errors?): "..anim_path)
        return nil
    end
	
	local old_sprite = anim_reg [anim_path]
    anim_reg [anim_path] = definition_file
    
    if anim_reg[anim_path].serialization_version ~= SerialVersion then
        ePrint("Attempt to load file with incompatible versions: "..anim_path)
        ePrint("Expected version "..SerialVersion..", got version "..anim_reg[anim_path].serialization_version.." .")
        anim_reg[anim_path] = old_sprite
        return anim_reg[anim_path]
    else
		return anim_reg[anim_path]
	end
end

function updateGlobalAnimTime()
	if animation_paused == false then
		global_animation_time = global_animation_time + 1
	end
end

function renderAnimation (anim_path, curanim, x, y, r, sx, sy, offset, cur_frame)
	local anim = anim_reg[anim_path]
	local off = offset
	r = math.rad(r)
	
	if off == nil then off = 0 end
	if anim == nil then 
		loadAnimationFromLocation(anim_path)
		anim = anim_reg[anim_path]
		if anim == nil then ePrint("Invalid Animation") return false end
	end
	
	if anim.animations[curanim] ~= nil then
		local max_frames = getOrraySize(anim.animations[curanim].frames)
		local maxi = (anim.animations[curanim].frame_rate * max_frames)
		local curframe = math.floor(((global_animation_time - off) % maxi) / anim.animations[curanim].frame_rate)
		
		if cur_frame ~= nil then curframe = math.floor(cur_frame) end
		
		local frame = anim.animations[curanim].frames["frame"..curframe]
		if curframe <= 0 then curframe = 0 end
		if curframe >= max_frames - 1 then curframe = max_frames - 1 end
		
		if frame ~= nil then
			local xcord = frame.xpos + x - ((anim.anim_width * frame.xscale * sx) - anim.anim_width / (anim.anim_width / frame.xpivot))
			local ycord = frame.ypos + y - ((anim.anim_height * frame.yscale * sy) - anim.anim_height / (anim.anim_height / frame.ypivot))
			love.graphics.setColor(frame.r, frame.g, frame.b)
			love.graphics.draw(image_reg[frame.image], frame.quad, xcord, ycord, frame.rot + r, frame.xscale * sx, frame.yscale * sy, frame.xpivot, frame.ypivot)
			love.graphics.setColor(255,255,255)
		else
			ePrint("Invalid frame for animation '"..anim_path.."'. CurFrame="..curframe..". AnimationFile="..anim_path..",Animation="..curanim)
		end
	end
	
	return true
end
