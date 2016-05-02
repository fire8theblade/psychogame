require "love.graphics"
serialization_version = 1.0

return
{
	anim_width = 32,
	anim_height = 32,
	
	animations = 
	{
		head = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER",quad=love.graphics.newQuad(0,0,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER",quad=love.graphics.newQuad(0,0,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER",quad=love.graphics.newQuad(0,0,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		head_side =
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER",quad=love.graphics.newQuad(32,0,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER",quad=love.graphics.newQuad(32,0,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER",quad=love.graphics.newQuad(32,0,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		head_left =
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER",quad=love.graphics.newQuad(32,0,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER",quad=love.graphics.newQuad(32,0,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER",quad=love.graphics.newQuad(32,0,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		body =
		{
			frame_rate = 5,
			frames = {
				frame0={image="PLAYER",quad=love.graphics.newQuad(0,32,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		player_map =
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER",quad=love.graphics.newQuad(32,32,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="PLAYER",quad=love.graphics.newQuad(0,32,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame2={image="PLAYER",quad=love.graphics.newQuad(64,32,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame3={image="PLAYER",quad=love.graphics.newQuad(0,32,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		body_side =
		{
			frame_rate = 3,
			frames = {
				frame0={image="PLAYER",quad=love.graphics.newQuad(0,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER",quad=love.graphics.newQuad(32,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER",quad=love.graphics.newQuad(64,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame3={image="PLAYER",quad=love.graphics.newQuad(96,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame4={image="PLAYER",quad=love.graphics.newQuad(128,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame5={image="PLAYER",quad=love.graphics.newQuad(160,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame6={image="PLAYER",quad=love.graphics.newQuad(192,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame7={image="PLAYER",quad=love.graphics.newQuad(224,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame8={image="PLAYER",quad=love.graphics.newQuad(0,96,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame9={image="PLAYER",quad=love.graphics.newQuad(32,96,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		body_left =
		{
			frame_rate = 3,
			frames = {
				frame0={image="PLAYER",quad=love.graphics.newQuad(0,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER",quad=love.graphics.newQuad(32,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER",quad=love.graphics.newQuad(64,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame3={image="PLAYER",quad=love.graphics.newQuad(96,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame4={image="PLAYER",quad=love.graphics.newQuad(128,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame5={image="PLAYER",quad=love.graphics.newQuad(160,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame6={image="PLAYER",quad=love.graphics.newQuad(192,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame7={image="PLAYER",quad=love.graphics.newQuad(224,64,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame8={image="PLAYER",quad=love.graphics.newQuad(0,96,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame9={image="PLAYER",quad=love.graphics.newQuad(32,96,32,32,256,128), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		hair0 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER_HAIR",quad=love.graphics.newQuad(0,0,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER_HAIR",quad=love.graphics.newQuad(0,0,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER_HAIR",quad=love.graphics.newQuad(0,0,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		hair0_side =
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,0,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,0,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,0,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		hair0_left =
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,0,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,0,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,0,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		hair1 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER_HAIR",quad=love.graphics.newQuad(0,32,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER_HAIR",quad=love.graphics.newQuad(0,32,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER_HAIR",quad=love.graphics.newQuad(0,32,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		hair1_side =
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,32,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,32,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,32,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		hair1_left =
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,32,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,32,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,32,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		hair2 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER_HAIR",quad=love.graphics.newQuad(0,64,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER_HAIR",quad=love.graphics.newQuad(0,64,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER_HAIR",quad=love.graphics.newQuad(0,64,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		hair2_side =
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,64,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,64,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,64,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
		hair2_left =
		{
			frame_rate = 10,
			frames = {
				frame0={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,64,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame1={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,64,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
				frame2={image="PLAYER_HAIR",quad=love.graphics.newQuad(32,64,32,32,64,256), xpos = 0, ypos = 0, rot = 0, xscale = -1, yscale = 1, xpivot = 16, ypivot =16, r=255,g=255,b=255},
			}
		},
	}
}