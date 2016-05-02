require "love.graphics"
serialization_version = 1.0

return
{
	anim_width = 32,
	anim_height = 32,
	
	animations = 
	{
		walk =
		{
			frame_rate = 5,
			frames = {
				frame0={image="TURTLE",quad=love.graphics.newQuad(0,0,32,32,96,96), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="TURTLE",quad=love.graphics.newQuad(32,0,32,32,96,96), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame2={image="TURTLE",quad=love.graphics.newQuad(64,0,32,32,96,96), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame3={image="TURTLE",quad=love.graphics.newQuad(0,32,32,32,96,96), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			},
		},
		drop =
		{
			frame_rate = 5,
			frames = {
				frame0={image="TURTLE",quad=love.graphics.newQuad(32,32,32,32,96,96), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="TURTLE",quad=love.graphics.newQuad(64,32,32,32,96,96), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame2={image="TURTLE",quad=love.graphics.newQuad(0,64,32,32,96,96), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			},
		},
		roll =
		{
			frame_rate = 5,
			frames = {
				frame0={image="TURTLE",quad=love.graphics.newQuad(0,64,32,64,96,96), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			},
		},
	}
}