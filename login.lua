-----------------------------------------------------------------------------------------
--
-- login.lua
-- Cara Pekson, Aman Bhayani, Julius Villamayor
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 
local widget = require("widget")

local function changeScenes()
    composer.gotoScene("blank_menu", {effect="slideLeft", time=500})
end
 
-- create()
function scene:create( event )
    local sceneGroup = self.view

    local logo = display.newImage("assets/logo.png")
    logo.x = 160; logo.y = 200
    sceneGroup:insert(logo)

    local myTextObject = display.newText("Recipe Finder", 160, 240, "Avenir",45)
    print("In scene 'login'.")
    myTextObject:setFillColor(0,0,0)
    display.setDefault( "background", 1, 1, 1 )
    myTextObject.y = 45
    sceneGroup:insert(myTextObject)

    local username = native.newTextField(150, 350, 220, 36)
    sceneGroup:insert(username)

    username.inputType = "username"
    username.placeholder = "username"
    local password = native.newTextField(150, 395, 220, 36)
    password.inputType = "password"
    password.placeholder = "password"

    sceneGroup:insert(password)

    local signin = widget.newButton( {
            left = 120,
            right = 200,
            id = "signin",
            label = "Sign In",
            onEvent = handleButtonEvent,
            width =200,
            height = 40,
            fillColor = { default = {165,198,209,0}, over= {165,198,209,0} }
            
    } )

    signin.y = 435
    signin.x = 160

    local create = widget.newButton( {
            left = 120,
            right = 200,
            id = "createaccount",
            label = "Create new account",
            onEvent = handleButtonEvent,
            width =200,
            height = 30,
            fillColor = { default = {165,198,209,0}, over= {165,198,209,0} }
            
    } )

    create.y = 465
    create.x = 160
    
    local forgot = widget.newButton( {
            left = 120,
            right = 200,
            id = "forgotpass",
            label = "Forgot password?",
            onEvent = handleButtonEvent,
            width =200,
            height = 20,
            fillColor = { default = {165,198,209,0}, over= {165,198,209,0} }
            
    } )

    forgot.y = 495
    forgot.x = 160

    sceneGroup:insert(signin)
    sceneGroup:insert(create)
    sceneGroup:insert(forgot)
    signin:addEventListener("tap", changeScenes)
    
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
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
return scene