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
			frame_rate = 7,
			frames = {
				frame0={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -16, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame1={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -16.25, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame2={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -16.5, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame3={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -16.75, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame4={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -17, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame5={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -17.25, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame6={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -17.5, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame7={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -17.75, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame8={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -18, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame9={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -18.25, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame10={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -18.15, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame11={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -18, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame12={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -17.75, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame13={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -17.5, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame14={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -17.25, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame15={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -17.0, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame16={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -16.75, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame17={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -16.5, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame18={image="INGAME_HUD",quad=love.graphics.newQuad(0,0,32,32,256,256), xpos = -16, ypos = -16.25, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
	}
}