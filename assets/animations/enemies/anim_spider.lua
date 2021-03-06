require "love.graphics"
serialization_version = 1.0

return
{
	anim_width = 32,
	anim_height = 32,
	
	animations = 
	{
		idle =
		{
			frame_rate = 10,
			frames = {
				frame0={image="SPIDER",quad=love.graphics.newQuad(0,0,32,32,96,64), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="SPIDER",quad=love.graphics.newQuad(0,32,32,32,96,64), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			},
		},
		attack =
		{
			frame_rate = 10,
			frames = {
				frame0={image="SPIDER",quad=love.graphics.newQuad(32,0,32,32,96,64), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="SPIDER",quad=love.graphics.newQuad(32,32,32,32,96,64), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			},
		},
		web =
		{
			frame_rate = 10,
			frames = {
				frame0={image="SPIDER",quad=love.graphics.newQuad(64,0,32,64,96,64), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			},
		},
	}
}