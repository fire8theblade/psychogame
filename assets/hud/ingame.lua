ingame = {}

ingame.xpos = 64
ingame.ypos = 0
ingame.cur_health = 0

ingame.render_hud = function(self, offset)
	if is_in_world_map ~= true then
		local ply = getPlayer().health
		local space = 18 / (ply / 10)
		
		if ply < 10 then space = 18 end
		
		love.graphics.setColor(0,0,0,150)
		love.graphics.rectangle("fill", camera_x / 2 , camera_y / 2 - offset, 600, 88)

		for i=0, ply do
			renderAnimation("assets/animations/hud/anim_ingame_hud.lua", "heart", camera_x / 2 + ingame.xpos + space * i, camera_y / 2 + ingame.ypos + 16, 0, 1.0, 1.0, i * 5)
		end
		
		if boss_entity ~= nil then
			local diff = self.cur_health - boss_entity.health
			self.cur_health = self.cur_health - diff * 0.05	
			if math.abs(diff) < 0.1 then self.cur_health = boss_entity.health end
			local hp = self.cur_health / boss_entity.max_health
			local hp1 = boss_entity.health / boss_entity.max_health
			local xo = camera_x / 2 + ingame.xpos
			local yo = camera_y / 2 + ingame.ypos + 248
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("fill", xo - 2, yo - 2, 260, 12)
			local red = 200
			local green = 0
			
			if self.cur_health < boss_entity.health then 
				red = 0 green = 200 
				if hp1 > hp then 
					hp1 = hp
				end 
				love.graphics.setColor(green, red, 0)
				love.graphics.rectangle("fill", xo, yo, 256 * hp1, 8)
				love.graphics.setColor(red, green, 0)
				love.graphics.rectangle("fill", xo, yo, 256 * hp, 8)
			elseif self.cur_health > boss_entity.health then 
				red = 150 green = 100 
				love.graphics.setColor(red, green, 0)
				love.graphics.rectangle("fill", xo, yo, 256 * hp, 8)
				love.graphics.setColor(200, 0, 0)
				love.graphics.rectangle("fill", xo, yo, 256 * hp1, 8)
			else
				love.graphics.setColor(green, red, 0)
				love.graphics.rectangle("fill", xo, yo, 256 * hp1, 8)
				love.graphics.setColor(red, green, 0)
				love.graphics.rectangle("fill", xo, yo, 256 * hp, 8)
			end
			
			love.graphics.setFont(limit_font)
			love.graphics.setColor(255,150,0)
			love.graphics.print(""..boss_entity.name, xo + 128 - limit_font:getWidth(boss_entity.name) / 2, yo - 16)
			if boss_entity.inactive then
				boss_entity = nil
			end
		end
	else
		local lvl = grabLevel()
		renderAnimation("assets/animations/world/anim_world_frame.lua", "frame", love.graphics.getWidth() / 2 + 16, love.graphics.getHeight() / 2 - 32, 0, 1, 1)
		if lvl ~= nil then
			ePrint("DEST")
			love.graphics.setFont(karma_font)
			love.graphics.setColor(255,255,255)
			love.graphics.print(lvl.levelname, love.graphics.getWidth() / 4 - karma_font:getWidth(lvl.levelname) / 2, love.graphics.getHeight() / 2 - 88)
			love.graphics.setFont(sub_limit_font)
			love.graphics.print(tostring(lvl.leveldesc), love.graphics.getWidth() / 4 - sub_limit_font:getWidth(tostring(lvl.leveldesc)) / 2, love.graphics.getHeight() / 2 - 64)
			love.graphics.setColor(0,0,0)
		end
	end
end

ingame.update_hud = function(self)
end

return ingame