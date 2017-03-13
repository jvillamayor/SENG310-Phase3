-----------------------------------------------------------------------------------------
--
-- menu.lua
-- Cara Pekson, Aman Bhayani, Julius Villamayor
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require("widget")
local scene = composer.newScene()


local logo = display.newImage("assets/logo.png")
logo.x = 160; logo.y = 200

local myTextObject = display.newText("Recipe Finder", 160, 240, "Avenir", 45)
local myTextObject = display.newText("Recipe Finder", 160, 240, "Avenir",45)
myTextObject:setFillColor(0,0,0)
display.setDefault( "background", 1, 1, 1 )
myTextObject.y = 30

local username = native.newTextField(150, 340, 220, 30)

username.inputType = "username"
username.placeholder = "username"
local password = native.newTextField(150, 380, 220, 30)
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
	label = "Sign in",
	onEvent = handleButtonEvent,
	shape = "roundedRect",
	width =200,
	height = 30,
	cornerRadius = 2,
	fillColor = { default = {165,198,209,0}, over= {165,198,209,0} },
	strokeColor = { default = {1,1,1,1}, over= {1, 0.1,0.7,0.4} },
	strokeWidth = 4
}
	)

signin.y = 480
signin.x = 160


local create = widget.newButton(
{
    left = 120,
    right = 200,
    id = "createaccount",
    label = "Create new account",
    onEvent = handleButtonEvent,
    shape = "roundedRect",
    width =200,
    height = 30,
    cornerRadius = 2,
    fillColor = { default = {165,198,209,0}, over= {165,198,209,0} },
    strokeColor = { default = {1,1,1,1}, over= {1, 0.1,0.7,0.4} },
    strokeWidth = 4
}
    )

create.y = 460
create.x = 160


local forgot = widget.newButton(
{
    left = 120,
    right = 200,
    id = "forgotpass",
    label = "Forgot password?",
    onEvent = handleButtonEvent,
    shape = "roundedRect",
    width =200,
    height = 30,
    cornerRadius = 2,
    fillColor = { default = {165,198,209,0}, over= {165,198,209,0} },
    strokeColor = { default = {1,1,1,1}, over= {1, 0.1,0.7,0.4} },
    strokeWidth = 4
}
    )

forgot.y = 495
forgot.x = 160







-------------------------------------------<><><><<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view

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

    signin:removeSelf()
    --myTextObject:removeSelf()

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

  --  local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene

