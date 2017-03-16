-----------------------------------------------------------------------------------------
--
-- help_support.lua
-- Cara Pekson, Aman Bhayani, Julius Villamayor
--
-----------------------------------------------------------------------------------------

-- Variable declarations
local composer = require("composer")
local widget = require("widget")
local dropdown = require('dropdown')
local screen = require('screen')
local scene = composer.newScene()

print("In Scene: help_support.lua")

-- Function to delay the removal of the scene, smoothing out the transition between scenes
local function delayedSceneRemoval()
    local function removeSceneListener(event)
        composer.removeScene("profile")
    end
    timer.performWithDelay(500, removeSceneListener)
end

-- The 'body' of the scene
function scene:create( event )
    local sceneGroup = self.view

    local myTextObject = display.newText("Help and Support", 160, 240, "Avenir", 20)
    myTextObject:setFillColor(0,0,0)
    myTextObject.y = 5
    sceneGroup:insert(myTextObject)

    local profilepic = display.newImage("assets/logo.png")
    profilepic.x = 160; profilepic.y = 90
    profilepic:scale( 0.4, 0.4 )
    sceneGroup:insert(profilepic)

    local myDropdown

    local dropdownOptions = {
        {
            title     = 'Recipes',
            action    = function()
                            delayedSceneRemoval()
                            composer.gotoScene("recipes")
                            composer.gotoScene("recipes")
                        end 
        }, {
            title     = 'Saved Recipes',
            action    = function() 
                            native.showAlert('Dropdown', 'Dropdown', {'Ok'})
                        end 
        }, {
            title     = '7 Day Planner',
            action    = function() 
                            native.showAlert('Dropdown', 'Dropdown', {'Ok'})
                        end 
        }, {
            title     = 'Health Tracker',
            action    = function() 
                            delayedSceneRemoval()
                            composer.gotoScene("health_tracker")
                        end 
        }, {
            title     = 'Group Meal Planner',
            action    = function() 
                            native.showAlert('Dropdown', 'Dropdown', {'Ok'})
                        end 
        }, {
            title     = 'Help and Support',
            action    = function() 
                            native.showAlert('Dropdown', 'Dropdown', {'Ok'})
                        end 
        }, {
            title     = 'Log Out',
            action    = function() 
                            delayedSceneRemoval()
                            composer.gotoScene("login")
                        end 
        }
    }

    local button = widget.newButton {
        width         = 30,
        height        = 30,
        defaultFile   = 'assets/burger.png',
        overFile      = 'assets/burger.png',
        onEvent       = function (event)
                            local target = event.target
                            local phase  = event.phase
                            if phase == 'began' then
                                target.alpha = .5
                            else
                                target.alpha = 1
                            end
                            if phase ==  'ended' then
                                myDropdown:toggle()
                            end
                        end
    }
    button.alpha = 10
    sceneGroup:insert(button)

    myDropdown = dropdown.new {
        x            = screen.rightSide - 50,
        y            = screen.topSide + 50,
        toggleButton = button,
        width        = 280,
        marginTop    = 12,
        padding      = 20,
        options      = dropdownOptions
    }
    sceneGroup:insert(myDropdown)

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