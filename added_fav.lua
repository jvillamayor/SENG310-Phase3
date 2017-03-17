-----------------------------------------------------------------------------------------
--
-- profile.lua
-- Cara Pekson, Aman Bhayani, Julius Villamayor
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local widget = require("widget")
local dropdown = require('dropdown')
local screen = require('screen')
local scene = composer.newScene()


-- local function changeScenes()
--     composer.gotoScene("display_recipes")
-- end

-- local function delayedSceneRemoval()
--     local function removeSceneListener(event)
--         composer.removeScene("recipes")
--     end
--     timer.performWithDelay(500, removeSceneListener)
-- end


local function delayedSceneRemoval()
    local function removeSceneListener(event)
        composer.removeScene("display_recipes")
    end
    timer.performWithDelay(500, removeSceneListener)
end
   

function scene:create( event )
    local sceneGroup = self.view

    local added = display.newImage("assets/added_fav.png")
    added.x = 160
    added.y = 250
    sceneGroup:insert(added)

      local myDropdown

      local dropdownOptions = {
        {
          title     = 'User Profile',
          action    = function() 
          composer.gotoScene("profile")
          end 
        },
        {
          title     = 'Recipes',
          action    = function() 
            delayedSceneRemoval() 
            composer.gotoScene("recipes")
          end 
        },
        {
          title     = 'Saved Recipes',
          action    = function() 
            delayedSceneRemoval() 
            composer.gotoScene("favourites")
          end 
        },
        {
          title     = '7 Day Planner',
          action    = function() 
            delayedSceneRemoval() 
            composer.gotoScene("7DayPlanner")
          end 
        },
        {
          title     = 'Health Tracker',
          action    = function() 
            delayedSceneRemoval()
            composer.gotoScene("health_tracker")
          end 
        },
        {
          title     = 'Help and Support',
          action    = function() 
            delayedSceneRemoval() 
            composer.gotoScene("help_support")
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

      local button = widget.newButton{
        width       = 30,
        height      = 30,
        defaultFile = 'assets/burger.png',
        overFile    = 'assets/burger.png',
        onEvent     = function( event )
          local target = event.target
          local phase  = event.phase
          if phase == 'began' then
            target.alpha = .5
          else
            target.alpha = 1
          if phase ==  'ended' then
              myDropdown:toggle()
          end
        end
      end
      }
      button.alpha = 10
      sceneGroup:insert(button)

      myDropdown     = dropdown.new{
        x            = screen.rightSide - 50,
        y            = screen.topSide + 50,
        toggleButton = button,
        width        = 280,
        marginTop    = 12,
        padding      = 20,
        options      = dropdownOptions
      }
      sceneGroup:insert(myDropdown)



    local function reveal()
        if (navReveal == true) then
            added.isVisible = false
            navReveal = false
        else
            added.isVisible = true
            navReveal = true
        end
    end

    navReveal = true
    button:addEventListener("tap", reveal)




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

