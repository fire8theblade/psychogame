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
	scenery_floor = "assets/sprites/scenes/scene_trees_floor",
	fill_scene = function(self)
		for i=0, 64 do
			--addEntity("DRY_BABY", 200 + i % 10 * 48 - 240, 200 + i / 10 * 48 - 240)
		end
		addEntity("STUMP", 256, 300 - 64)
		addEntity("TREE_WALL", 0, 16)
		addEntity("TREE_WALL", 1000, 16)
	end,
	update_scene = function(self)
	
	end
}