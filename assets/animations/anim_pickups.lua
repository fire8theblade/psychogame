require "love.graphics"
serialization_version = 1.0

return
{
	anim_width = 32,
	anim_height = 32,
	
	animations = 
	{
		heart =
		{
			frame_rate = 5,
			frames = {
				frame0={image="PICKUPS",quad=love.graphics.newQuad(0,0,32,32,64,64), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="PICKUPS",quad=love.graphics.newQuad(0,0,32,32,64,64), xpos = 0, ypos = -8.01, rot = 0, xscale = 0.98, yscale = 1.02, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame2={image="PICKUPS",quad=love.graphics.newQuad(0,0,32,32,64,64), xpos = 0, ypos = -8.02, rot = 0, xscale = 0.96, yscale = 1.04, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame3={image="PICKUPS",quad=love.graphics.newQuad(0,0,32,32,64,64), xpos = 0, ypos = -8.03, rot = 0, xscale = 0.94, yscale = 1.06, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame4={image="PICKUPS",quad=love.graphics.newQuad(0,0,32,32,64,64), xpos = 0, ypos = -8.02, rot = 0, xscale = 0.96, yscale = 1.04, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame5={image="PICKUPS",quad=love.graphics.newQuad(0,0,32,32,64,64), xpos = 0, ypos = -8.01, rot = 0, xscale = 0.98, yscale = 1.02, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			},
		},
	}
}