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
        composer.removeScene("help_support")
    end
    timer.performWithDelay(500, removeSceneListener)
end

-- The 'body' of the scene
function scene:create( event )
    local sceneGroup = self.view

    local header = display.newText("Help and Support", 160, 5, "Avenir", 20)
    header:setFillColor(0,0,0)
    sceneGroup:insert(header)

    local box = display.newLine( 20,  50, 300,  50, 300, 300, 20, 300, 20, 50 )
    box:setStrokeColor(0, 0, 0, 1)
    box.strokeWidth = 2
    sceneGroup:insert(box)

    local logo = display.newImage("assets/logo.png")
    logo.x = 160
    logo.y = 410
    logo:scale( 0.4, 0.4 )
    sceneGroup:insert(logo)

    local question = display.newImage("assets/question.png")
    question.x = 50
    question.y = 80
    question:scale( 0.15, 0.15 )
    sceneGroup:insert(question)

    local faq = display.newText("For FAQ using the app, click", 150, 80, "Avenir", 12)
    faq:setFillColor(0,0,0)
    sceneGroup:insert(faq) 

    local faq_link = display.newText("here", 240, 80, "Avenir", 12)
    faq_link:setFillColor(0,0,1)
    sceneGroup:insert(faq_link)

    local line_1 = display.newLine( 30,  110, 290,  110 )
    line_1:setStrokeColor(0, 0, 0, 1)
    line_1.strokeWidth = 1
    sceneGroup:insert(line_1)

    local pencil = display.newImage("assets/pencil.png")
    pencil.x = 50
    pencil.y = 140
    pencil:scale( 0.13, 0.13 )
    sceneGroup:insert(pencil)

    local contact = display.newText("Contact us at", 110, 140, "Avenir", 12)
    contact:setFillColor(0,0,0)
    sceneGroup:insert(contact) 

    local contact_link = display.newText("contact@foodtracker.ca", 212, 140, "Avenir", 12)
    contact_link:setFillColor(0,0,1)
    sceneGroup:insert(contact_link)

    local line_2 = display.newLine( 30,  170, 290,  170 )
    line_2:setStrokeColor(0, 0, 0, 1)
    line_2.strokeWidth = 1
    sceneGroup:insert(line_2)

    local social_media = display.newText("If you enjoyed using our app, please", 135, 190, "Avenir", 12)
    social_media:setFillColor(0,0,0)
    sceneGroup:insert(social_media)

    local social_media_2 = display.newText("consider liking us on...", 98, 209, "Avenir", 12)
    social_media_2:setFillColor(0,0,0)
    sceneGroup:insert(social_media_2)

    local sm_icon_1 = display.newImage("assets/tumblr.png")
    sm_icon_1.x = 210
    sm_icon_1.y = 270
    sm_icon_1:scale( 0.05, 0.05 )
    sceneGroup:insert(sm_icon_1)

    local sm_icon_2 = display.newImage("assets/facebook.png")
    sm_icon_2.x = 240
    sm_icon_2.y = 270
    sm_icon_2:scale( 0.18, 0.18 )
    sceneGroup:insert(sm_icon_2)

    local sm_icon_3 = display.newImage("assets/twitter.png")
    sm_icon_3.x = 270
    sm_icon_3.y = 270
    sm_icon_3:scale( 0.18, 0.18 )
    sceneGroup:insert(sm_icon_3)

    local halfline_1 = display.newLine( 30,  410, 122,  410 )
    halfline_1:setStrokeColor(0, 0, 0, 1)
    halfline_1.strokeWidth = 1
    sceneGroup:insert(halfline_1)

    local halfline_2 = display.newLine( 201,  410, 290,  410 )
    halfline_2:setStrokeColor(0, 0, 0, 1)
    halfline_2.strokeWidth = 1
    sceneGroup:insert(halfline_2)

    local myDropdown

    local dropdownOptions = {
        {
            title     = 'User Profile',
            action    = function()
                            delayedSceneRemoval()
                            composer.gotoScene("profile")
                        end 
        },
        {
            title     = 'Recipes',
            action    = function()
                            delayedSceneRemoval()
                            composer.gotoScene("recipes")
                        end 
        }, {
            title     = 'Saved Recipes',
            action    = function() 
                            delayedSceneRemoval()
      composer.gotoScene("favourites")
                        end 
        }, {
            title     = '7 Day Planner',
            action    = function() 
                            delayedSceneRemoval()
      composer.gotoScene("7DayPlanner")
                        end 
        }, {
            title     = 'Health Tracker',
            action    = function() 
                            delayedSceneRemoval()
                            composer.gotoScene("health_tracker")
                        end 
        }, 
        {
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