serialization_version = 1.0

return {
	SCENE_TREES={
		name="SCENE_TREES",
		imagepath="assets/sprites/scenes/scene_trees.png",
		image_width = 1000,
		image_height = 1000,
		animpath="assets/animations/scenes/scene_trees_anim.lua"
	},
	PLAYER={
		name="PLAYER",
		imagepath="assets/sprites/player.png",
		image_width = 256,
		image_height = 128,
		animpath="assets/animations/anim_player.lua"
	},
	PLAYER_HAIR={
		name="PLAYER_HAIR",
		imagepath="assets/sprites/player_hair.png",
		image_width = 64,
		image_height = 256,
		animpath="assets/animations/anim_player.lua"
	},
	
	--
	--	ENEMIES START
	--
	
	FOREST_BAT={
		name="FOREST_BAT",
		imagepath="assets/sprites/enemies/forest/bat.png",
		image_width = 96,
		image_height = 64,
		animpath="assets/animations/enemies/anim_forest_bat.lua"
	},
	ENEMY_BULLET={
		name="ENEMY_BULLET",
		imagepath="assets/sprites/enemy_bullet.png",
		image_width = 64,
		image_height = 32,
		animpath="assets/animations/anim_bullet.lua"
	},
	PLAYER_BULLET={
		name="PLAYER_BULLET",
		imagepath="assets/sprites/player_bullet.png",
		image_width = 64,
		image_height = 32
	},
	PICKUPS={
		name="PICKUPS",
		imagepath="assets/sprites/drops.png",
		image_width = 64,
		image_height = 64,
		animpath="assets/animations/anim_pickups.lua"
	},
	SPIDER={
		name="SPIDER",
		imagepath="assets/sprites/enemies/forest/spider.png",
		image_width = 96,
		image_height = 64,
		animpath="assets/animations/enemies/anim_spider.lua"
	},
	TURTLE={
		name="TURTLE",
		imagepath="assets/sprites/enemies/forest/turtle.png",
		image_width = 96,
		image_height = 96,
		animpath="assets/animations/enemies/anim_turtle.lua"
	},
	SPIDER_BOSS={
		name="SPIDER_BOSS",
		imagepath="assets/sprites/enemies/forest/boss.png",
		image_width = 224,
		image_height = 196,
		animpath="assets/animations/enemies/anim_boss_spider.lua"
	},
	
	--
	--	TILES START
	--
	
	STUMP={
		name="STUMP",
		imagepath="assets/sprites/stump.png",
		image_width = 160,
		image_height = 80,
		animpath="assets/animations/anim_stump.lua"
	},
	TREE_WALL={
		name="TREE_WALL",
		imagepath="assets/sprites/tree_wall.png",
		image_width = 160,
		image_height = 300,
		animpath="assets/animations/anim_tree_wall.lua"
	},
	
	--
	--	HUD START
	--
	
	INGAME_HUD={
		name="INGAME_HUD",
		imagepath="assets/sprites/hud/ingame.png",
		image_width = 64,
		image_height = 64,
		animpath="assets/animations/hud/anim_ingame_hud.lua"
	},
	WORLD_FOREST={
		name="WORLD_FOREST",
		imagepath="assets/sprites/world_tileset.png",
		image_width = 512,
		image_height = 384,
		animpath="assets/animations/world/anim_forest_world.lua"
	},
	WORLD_FRAME={
		name="WORLD_FRAME",
		imagepath="assets/sprites/world_frame.png",
		image_width = 512,
		image_height = 384,
		animpath="assets/animations/world/anim_world_frame.lua"
	},
}