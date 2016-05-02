serial_version = 1.0

return 
{
	scenery_animation = "assets/animations/scenes/scene_trees_anim.lua",
	scenery_layers = 6,
	sun_layer = 5,
	scene_width = 1000,
	scene_height = 300,
	start_x = 50,
	start_y = 50,
	red = 100,
	green = 150,
	blue = 100,
	scene_brightness = -1.0,
	scenery_floor = "assets/sprites/scenes/scene_trees_floor",
	fill_scene = function(self)
		--addEntity("STUMP", 256, 300 - 64)
		addEntity("SPIDER_BOSS", 500, 256)
	end,
	update_scene = function(self)
	
	end
}