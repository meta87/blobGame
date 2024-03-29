level1 = {}
level1.new = function()

local director = require( "director" )
local controls = require("controls")

local hero = require("hero")
local enemy1 = require("enemy1")

local utilFuncs = require("utilFuncs")
local remote = require("remote")-- Load Corona Remote
remote.startServer( "8080" )-- Start The Remote On Port 8080
local yGravity = remote.yGravity

local localGroup = display.newGroup()

local physics = require "physics"
physics.start();
physics.setGravity(0,10)


local physicsData = (require "shapedefs").physicsData() -- This is physicseditor


local game = display.newGroup(); -- Creating Local Groups. Game group is used by the moveCamera function
localGroup:insert(game)
game.x = 0

local background = display.newImage("images/background.png")
game:insert(background)
background:toBack()

-- map
local leftwall = display.newRect( 0 , -1000, 50, 1000 + screenH )
physics.addBody (leftwall, "static", { friction =0.3,})
game:insert( leftwall )

local floor = display.newRect( 0, screenH -20 , 5000, 50 )
physics.addBody (floor, "static", { friction =0.3,})
floor.myName = "floor"
floor.jumpable = "yes"
game:insert( floor )

-- Hero Object
local hero1 = hero:heroCreate(600,400,'hero1')
game:insert(hero1)
local function hero1Funcs() 
  hero1:limitSpeed(event)
  hero1:move(event)
end
local function hero1Touch(event)
  if event.phase == "began" and hero1selfTouch ~= true then
    -- local ball = hero1:ballShoot(event,game.x,game.y)
	-- game:insert(ball)
  end
end
local function hero1SelfTouch(event)
  hero1:jump(event)
end
local function hero1Collisions(event)
  print ("jumpTest")
  hero1:jumpTest(event)
end
local function onBallCollision(event)
    if event.phase == "ended" then
	utilFuncs:onBallCollision(event)
	end
end

-- enemy object
local enemy1 = enemy1:enemy1Create(800,400,'enemy1')
game:insert(enemy1)

--CAMERA FUNCTION
local function moveCamera()
game.x = -hero1.x + screenW /2
--enemy1:move()
end

--controls and reset level
local controls1 = controls:controlsCreate('hero1')


local resetButton = display.newRect(0, 0, 200, 50)
resetButton:setFillColor(255,0,0)
resetButton.scene = "menu"
resetButton:addEventListener("touch", changeScene)

-- Runtimes ETC
hero1:addEventListener ( "touch", hero1SelfTouch)
hero1:addEventListener ( "collision", hero1Collisions)
Runtime:addEventListener("collision", onBallCollision)
Runtime:addEventListener("enterFrame", moveCamera )
Runtime:addEventListener ( "enterFrame", hero1Funcs)
Runtime:addEventListener ( "touch", hero1Touch)

return localGroup

end

return level1