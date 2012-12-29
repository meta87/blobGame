local M = {}

local remote = require("remote")-- Load Corona Remote
local utilFuncs = require("utilFuncs")

remote.startServer( "8080" )-- Start The Remote On Port 8080
local physicsData = (require "shapedefs").physicsData() -- This is physicseditor
yGravity = remote.yGravity

--create hero function
function M:controlsCreate()


		local leftArrow = display.newRect(20, screenH-120, 100, 100)
		leftArrow:setFillColor(155,155,0)
		-- leftArrow:addEventListener("touch", moveLeft)
		
		local rightArrow = display.newRect(screenW-120, screenH-120, 100, 100)
		rightArrow:setFillColor(155,155,0)
		-- rightArrow:addEventListener("touch", moveRight)
		
		-- local function moveLeft()
		-- char:applyForce(-2600)
		-- end
	    -- local function moveRight()
		-- char:applyForce(2600)
		-- end

		return char
	
    -- function hero:ballShoot(event,gamex,gamey)
		
    -- end
	

end 



return M