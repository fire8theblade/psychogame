require "love.graphics"
serialization_version = 1.0

return
{
	anim_width = 64,
	anim_height = 64,
	
	animations = 
	{
		idle0 =
		{
			frame_rate = 5,
			frames = {
				frame0={image="TREE_WALL",quad=love.graphics.newQuad(0,0,80,300,160,300), xpos = -8, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
		idle2 =
		{
			frame_rate = 5,
			frames = {
				frame0={image="TREE_WALL",quad=love.graphics.newQuad(0,0,80,300,160,300), xpos = -8, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
		idle1 =
		{
			frame_rate = 5,
			frames = {
				frame0={image="TREE_WALL",quad=love.graphics.newQuad(80,0,80,300,160,300), xpos = -8, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
	}
}