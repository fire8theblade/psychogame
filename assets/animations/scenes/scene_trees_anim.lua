require "love.graphics"
serialization_version = 1.0

return
{
	anim_width = 1000,
	anim_height = 200,
	
	animations = 
	{
		scene_floor = 
		{
			frame_rate = 8,
			frames = {
				frame0={image="SCENE_TREES",quad=love.graphics.newQuad(0,200,1000,200,1000,2000), xpos = 0, ypos = -25, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame1={image="SCENE_TREES",quad=love.graphics.newQuad(0,200,1000,200,1000,2000), xpos = 0, ypos = -25, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
		layer0 = 
		{
			frame_rate = 20,
			frames = {
				frame0={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 0, ypos = -22, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame1={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 0, ypos = -22, rot = 0, xscale = 1.0, yscale = 1.001, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame2={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 0, ypos = -22, rot = 0, xscale = 1.0, yscale = 1.002, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame3={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 0, ypos = -22, rot = 0, xscale = 1.0, yscale = 1.003, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame4={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 0, ypos = -22, rot = 0, xscale = 1.0, yscale = 1.002, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame5={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 0, ypos = -22, rot = 0, xscale = 1.0, yscale = 1.001, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
		layer1 = 
		{
			frame_rate = 8,
			frames = {
				frame0={image="SCENE_TREES",quad=love.graphics.newQuad(0,400,1000,200,1000,2000), xpos = -500, ypos = 6, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame1={image="SCENE_TREES",quad=love.graphics.newQuad(0,400,1000,200,1000,2000), xpos = -500, ypos = 6, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
		layer3 = 
		{
			frame_rate = 8,
			frames = {
				frame0={image="SCENE_TREES",quad=love.graphics.newQuad(0,400,1000,200,1000,2000), xpos = 0, ypos = -22, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=100,g=100,b=100},
				frame1={image="SCENE_TREES",quad=love.graphics.newQuad(0,400,1000,200,1000,2000), xpos = 0, ypos = -22, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=100,g=100,b=100},
			},
		},
		layer2 = 
		{
			frame_rate = 60,
			frames = {
				frame0={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 50, ypos = -26, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=100,g=100,b=100},
				frame1={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 50, ypos = -26, rot = 0, xscale = 1.0, yscale = 1.001, xpivot = 8, ypivot = 8, r=100,g=100,b=100},
				frame2={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 50, ypos = -26, rot = 0, xscale = 1.0, yscale = 1.002, xpivot = 8, ypivot = 8, r=100,g=100,b=100},
				frame3={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 50, ypos = -26, rot = 0, xscale = 1.0, yscale = 1.003, xpivot = 8, ypivot = 8, r=100,g=100,b=100},
				frame4={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 50, ypos = -26, rot = 0, xscale = 1.0, yscale = 1.002, xpivot = 8, ypivot = 8, r=100,g=100,b=100},
				frame5={image="SCENE_TREES",quad=love.graphics.newQuad(0,0,1000,200,1000,2000), xpos = 50, ypos = -26, rot = 0, xscale = 1.0, yscale = 1.001, xpivot = 8, ypivot = 8, r=100,g=100,b=100},
			},
		},
		layer4 = 
		{
			frame_rate = 5,
			frames = {
				frame0={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 0, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame1={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 0.5, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame2={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 1.1, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame3={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 1.8, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame4={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 2.6, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame5={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 3.4, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame6={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 3.7, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame7={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 3.4, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame8={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 2.6, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame9={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 1.8, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame10={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 1.1, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame11={image="SCENE_TREES",quad=love.graphics.newQuad(0,600,1000,200,1000,2000), xpos = 0, ypos = 0.5, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
		layer5 = 
		{
			frame_rate = 8,
			frames = {
				frame0={image="SCENE_TREES",quad=love.graphics.newQuad(0,800,1000,200,1000,2000), xpos = 0, ypos = 0, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
				frame1={image="SCENE_TREES",quad=love.graphics.newQuad(0,800,1000,200,1000,2000), xpos = 0, ypos = 0, rot = 0, xscale = 1.0, yscale = 1, xpivot = 8, ypivot = 8, r=255,g=255,b=255},
			},
		},
	}
}