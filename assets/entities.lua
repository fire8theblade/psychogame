serialization_version = 1.0

return {
	PLAYER={
		id="PLAYER",
		name="Player",
		aipath="assets/ai/player_ai.lua",
		animpath="assets/animations/anim_player.lua",
		col_width = 32,
		col_height = 32,
		health = 10,
		friction = 1.0,
		eye_height = 26,
	},
	PICKUPS={
		id="PICKUPS",
		name="Pickup",
		aipath="assets/ai/pickup_ai.lua",
		animpath="assets/animations/anim_pickups.lua",
		col_width = 32,
		col_height = 32,
		health = 10,
		friction = 1.0,
		eye_height = 26,
		anti_projectile = true,
	},
	STUMP={
		id="STUMP",
		name="Tree Stump",
		aipath="assets/ai/tiles/ai_tile.lua",
		animpath="assets/animations/anim_stump.lua",
		col_width = 60,
		col_height = 64,
		health = 20,
		friction = 1.0,
		eye_height = 32,
		max_anims = 3,
		tile = true,
		anti_projectile = true,
	},
	TREE_WALL={
		id="TREE_WALL",
		name="Tree",
		aipath="assets/ai/tiles/ai_empty.lua",
		animpath="assets/animations/anim_tree_wall.lua",
		col_width = 64,
		col_height = 300,
		health = 20,
		friction = 1.0,
		eye_height = 150,
		max_anims = 3,
		tile = true,
		wall = true,
		anti_projectile = true,
	},
	FOREST_BAT={
		id="FOREST_BAT",
		name="Forest Bat",
		aipath="assets/ai/enemies/forest_bat_ai.lua",
		animpath="assets/animations/enemies/anim_forest_bat.lua",
		col_width = 32,
		col_height = 32,
		health = 3,
		friction = 1.0,
		eye_height = 26,
		drops_chance = 0.1
	},
	BULLET={
		id="BULLET",
		name="Bullet",
		aipath="assets/ai/bullet_ai.lua",
		animpath="assets/animations/anim_bullet.lua",
		col_width = 16,
		col_height = 16,
		health = 1,
		friction = 1.0,
		eye_height = 8,
		projectile=true,
		handlesownmovement=true
	},
	SPIDER={
		id="SPIDER",
		name="Spider",
		aipath="assets/ai/enemies/spider_ai.lua",
		animpath="assets/animations/enemies/anim_spider.lua",
		col_width = 32,
		col_height = 32,
		health = 7.5,
		friction = 1.0,
		eye_height = 14,
		drops_chance = 0.4
	},
	SPIDER_BOSS={
		id="SPIDER_BOSS",
		name="Colospider",
		aipath="assets/ai/enemies/boss_spider_ai.lua",
		animpath="assets/animations/enemies/anim_boss_spider.lua",
		col_width = 64,
		col_height = 64,
		health = 30,
		friction = 1.0,
		eye_height = 14,
		drops_chance = 1.0,
		is_boss = true,
	},
	TURTLE={
		id="TURTLE",
		name="Turtle",
		aipath="assets/ai/enemies/turtle_ai.lua",
		animpath="assets/animations/enemies/anim_turtle.lua",
		col_width = 32,
		col_height = 32,
		health = 10,
		friction = 1.0,
		eye_height = 14,
		drops_chance = 0.5
	},
}