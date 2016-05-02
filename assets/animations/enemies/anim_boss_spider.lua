require "love.graphics"
serialization_version = 1.0

return
{
	anim_width = 64,
	anim_height = 64,
	
	animations = 
	{
		idle =
		{
			frame_rate = 10,
			frames = {
				frame0={image="SPIDER_BOSS",quad=love.graphics.newQuad(0,0,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame1={image="SPIDER_BOSS",quad=love.graphics.newQuad(0,64,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame2={image="SPIDER_BOSS",quad=love.graphics.newQuad(0,0,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame3={image="SPIDER_BOSS",quad=love.graphics.newQuad(0,64,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
			},
		},
		attack =
		{
			frame_rate = 10,
			frames = {
				frame0={image="SPIDER_BOSS",quad=love.graphics.newQuad(64,0,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame1={image="SPIDER_BOSS",quad=love.graphics.newQuad(64,64,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame2={image="SPIDER_BOSS",quad=love.graphics.newQuad(64,0,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame3={image="SPIDER_BOSS",quad=love.graphics.newQuad(64,64,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
			},
		},
		summon =
		{
			frame_rate = 10,
			frames = {
				frame0={image="SPIDER_BOSS",quad=love.graphics.newQuad(128,0,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame1={image="SPIDER_BOSS",quad=love.graphics.newQuad(128,64,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame2={image="SPIDER_BOSS",quad=love.graphics.newQuad(128,0,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame3={image="SPIDER_BOSS",quad=love.graphics.newQuad(128,64,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
			},
		},
		web =
		{
			frame_rate = 10,
			frames = {
				frame0={image="SPIDER_BOSS",quad=love.graphics.newQuad(192,0,32,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="SPIDER_BOSS",quad=love.graphics.newQuad(192,0,32,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame2={image="SPIDER_BOSS",quad=love.graphics.newQuad(192,0,32,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame3={image="SPIDER_BOSS",quad=love.graphics.newQuad(192,0,32,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			},
		},
		idle_reverse =
		{
			frame_rate = 7,
			frames = {
				frame0={image="SPIDER_BOSS",quad=love.graphics.newQuad(0,128,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame1={image="SPIDER_BOSS",quad=love.graphics.newQuad(0,192,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame2={image="SPIDER_BOSS",quad=love.graphics.newQuad(0,128,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame3={image="SPIDER_BOSS",quad=love.graphics.newQuad(0,192,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
			},
		},
		attack_reverse =
		{
			frame_rate = 7,
			frames = {
				frame0={image="SPIDER_BOSS",quad=love.graphics.newQuad(64,128,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame1={image="SPIDER_BOSS",quad=love.graphics.newQuad(64,192,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame2={image="SPIDER_BOSS",quad=love.graphics.newQuad(64,128,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame3={image="SPIDER_BOSS",quad=love.graphics.newQuad(64,192,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
			},
		},
		summon_reverse =
		{
			frame_rate = 7,
			frames = {
				frame0={image="SPIDER_BOSS",quad=love.graphics.newQuad(128,128,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame1={image="SPIDER_BOSS",quad=love.graphics.newQuad(128,192,64,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame2={image="SPIDER_BOSS",quad=love.graphics.newQuad(128,128,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
				frame3={image="SPIDER_BOSS",quad=love.graphics.newQuad(128,192,64,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 32, ypivot = 32, r=255,g=255,b=255},
			},
		},
		web_reverse =
		{
			frame_rate = 7,
			frames = {
				frame0={image="SPIDER_BOSS",quad=love.graphics.newQuad(192,64,32,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="SPIDER_BOSS",quad=love.graphics.newQuad(192,64,32,64,224,256), xpos = 0, ypos = -8, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame2={image="SPIDER_BOSS",quad=love.graphics.newQuad(192,64,32,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame3={image="SPIDER_BOSS",quad=love.graphics.newQuad(192,64,32,64,224,256), xpos = 0, ypos = -9, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			},
		},
	}
}