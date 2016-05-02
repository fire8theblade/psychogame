require "love.graphics"
serialization_version = 1.0

return
{
	anim_width = 512,
	anim_height = 384,
	
	animations = 
	{
		frame = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FRAME",quad=love.graphics.newQuad(0,0,512,384,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},	
	}
}