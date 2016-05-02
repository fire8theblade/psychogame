require "love.graphics"
serialization_version = 1.0

return
{
	anim_width = 32,
	anim_height = 32,
	
	animations = 
	{
		tile0 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(0,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(0,64,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},	
		tile1 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(32,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(32,64,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile2 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(64,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(64,64,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile3 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(96,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(96,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},		
		tile4 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(128,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(128,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},			
		tile5 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(160,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(160,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile6 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(192,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(192,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile7 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(224,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(224,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile8 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(256,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(256,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile9 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(288,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(288,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},		
		tile10 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(320,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(320,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile11 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(352,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(352,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile12 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(384,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(384,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile13 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(416,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(416,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},		
		tile14 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(448,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(448,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile15 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(480,0,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(480,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile16 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(0,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(0,96,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},
		tile17 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(32,32,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(32,96,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},	
		tile18 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(96,64,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(128,64,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame2={image="WORLD_FOREST",quad=love.graphics.newQuad(160,64,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame3={image="WORLD_FOREST",quad=love.graphics.newQuad(192,64,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},	
		tile19 = 
		{
			frame_rate = 10,
			frames = {
				frame0={image="WORLD_FOREST",quad=love.graphics.newQuad(224,64,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
				frame1={image="WORLD_FOREST",quad=love.graphics.newQuad(256,64,32,32,512,384), xpos = 0, ypos = 0, rot = 0, xscale = 1, yscale = 1, xpivot = 16, ypivot = 16, r=255,g=255,b=255},
			}
		},	
	}
}