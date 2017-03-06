-----------------------------------------------------------------------------------------
--
-- menu.lua
-- Cara Pekson, Aman Bhayani, Julius Villamayor
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require("widget")

local logo = display.newImage("assets/logo.png")
logo.x = 160; logo.y = 220

local myTextObject = display.newText("Recipe Finder", 160, 240, "Avenir",45)
print("Hello World!")
myTextObject:setFillColor(0,0,0)
display.setDefault( "background", 1, 1, 1 )
myTextObject.y = 50

local username = native.newTextField(150, 370, 220, 36)

username.inputType = "username"
username.placeholder = "username"
local password = native.newTextField(150, 430, 220, 36)
password.inputType = "password"
password.placeholder = "password"

-- Function to handle button events
local function handleButtonEvent( event )
 
    if ( "ended" == event.phase ) then
        --print( "Button was pressed and released" )
        composer.gotoScene( "menu2" )
    end
end

local signin = widget.newButton(
{
	left = 120,
	right = 200,
	id = "signin",
	label = "Default",
	onEvent = handleButtonEvent,
	shape = "roundedRect",
	width =200,
	height = 40,
	cornerRadius = 2,
	fillColor = { default = {165,198,209,0}, over= {165,198,209,0} },
	strokeColor = { default = {1,1,1,1}, over= {1, 0.1,0.7,0.4} },
	strokeWidth = 4
}
	)

signin.y = 480
signin.x = 160

-------------------------------------------<><><><<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function gotoGame()
    composer.gotoScene( "game" )
end

local function gotoHighScores()
    composer.gotoScene( "highscores" )
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --[[local background = display.newImageRect( sceneGroup, "assets/icon-167.png", 800, 1400 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY]]

--    local title = display.newImageRect( sceneGroup, "title.png", 500, 80 )
--    title.x = display.contentCenterX
--    title.y = 200

    local playButton = display.newText( sceneGroup, "Play", display.contentCenterX, 700, native.systemFont, 44 )
    playButton:setFillColor( 0.82, 0.86, 1 )

    local highScoresButton = display.newText( sceneGroup, "High Scores", display.contentCenterX, 810, native.systemFont, 44 )
    highScoresButton:setFillColor( 0.75, 0.78, 1 )

    playButton:addEventListener( "tap", gotoGame )
    highScoresButton:addEventListener( "tap", gotoHighScores )
end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
--function scene:destroy( event )

  --  local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

--end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
