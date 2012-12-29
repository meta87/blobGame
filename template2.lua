local M = {}

local remote = require("remote")-- Load Corona Remote
local level1 = require("level1")-- Load Corona Remote
local utilFuncs = require("utilFuncs")

remote.startServer( "8080" )-- Start The Remote On Port 8080
local physicsData = (require "shapedefs").physicsData() -- This is physicseditor
yGravity = remote.yGravity

--create hero function
function M:heroCreate(x,y, name)

	local function ballShootPauser()

	end
	
    function hero:ballShoot(event,gamex,gamey)
	
    end
	
	return hero
end 



return M