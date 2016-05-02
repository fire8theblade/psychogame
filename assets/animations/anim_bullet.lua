require "love.graphics"
serialization_version = 1.0

return
{
	anim_width = 16,
	anim_height = 16,
	
	animations = 
	{
		alive =
		{
			frame_rate = 5,
			frames = {
				frame0={image="ENEMY_BULLET",quad=love.graphics.newQuad(0,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				},
		},
		alive_player =
		{
			frame_rate = 5,
			frames = {
				frame0={image="PLAYER_BULLET",quad=love.graphics.newQuad(0,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
		death =
		{
			frame_rate = 5,
			frames = {
				frame0={image="ENEMY_BULLET",quad=love.graphics.newQuad(32,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame1={image="ENEMY_BULLET",quad=love.graphics.newQuad(48,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame2={image="ENEMY_BULLET",quad=love.graphics.newQuad(32,16,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame3={image="ENEMY_BULLET",quad=love.graphics.newQuad(48,16,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame4={image="ENEMY_BULLET",quad=love.graphics.newQuad(64,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame5={image="ENEMY_BULLET",quad=love.graphics.newQuad(64,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame6={image="ENEMY_BULLET",quad=love.graphics.newQuad(64,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame7={image="ENEMY_BULLET",quad=love.graphics.newQuad(64,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame8={image="ENEMY_BULLET",quad=love.graphics.newQuad(64,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
		death_player =
		{
			frame_rate = 5,
			frames = {
				frame0={image="PLAYER_BULLET",quad=love.graphics.newQuad(32,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame1={image="PLAYER_BULLET",quad=love.graphics.newQuad(48,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame2={image="PLAYER_BULLET",quad=love.graphics.newQuad(32,16,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame3={image="PLAYER_BULLET",quad=love.graphics.newQuad(48,16,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame4={image="PLAYER_BULLET",quad=love.graphics.newQuad(64,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame5={image="PLAYER_BULLET",quad=love.graphics.newQuad(64,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame6={image="PLAYER_BULLET",quad=love.graphics.newQuad(64,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame7={image="PLAYER_BULLET",quad=love.graphics.newQuad(64,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame8={image="PLAYER_BULLET",quad=love.graphics.newQuad(64,0,16,16,64,32), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
	}
}