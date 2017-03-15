-----------------------------------------------------------------------------------------
--
-- display_recipes.lua
-- Cara Pekson, Aman Bhayani, Julius Villamayor
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local widget = require("widget")
local dropdown = require('dropdown')
local screen = require('screen')
local scene = composer.newScene()

local function delayedSceneRemoval()
    local function removeSceneListener(event)
        composer.removeScene("recipes")
    end
    timer.performWithDelay(500, removeSceneListener)
end
   

function scene:create( event )
    local sceneGroup = self.view

    local myTextObject = display.newText("Recipes", 160, 240, "Avenir", 20)
    myTextObject:setFillColor(0,0,0)
    myTextObject.y = 5
    sceneGroup:insert(myTextObject)

    local title = display.newText("Chicken Soup", 160, 240, "Avenir", 18)
    title:setFillColor(0,0,0)
    title.x = 160
    title.y = 70
    sceneGroup:insert(title)

    local ethnicity = display.newText("Tomato Soup", 160, 240, "Avenir", 18)
    ethnicity:setFillColor(0,0,0)
    ethnicity.x = 160
    ethnicity.y = 100
    sceneGroup:insert(ethnicity)

    local ethnicity_ex = display.newText("Eggs and Toast", 160, 240, "Avenir", 18)
    ethnicity_ex:setFillColor(0,0,0)
    ethnicity_ex.x = 160
    ethnicity_ex.y = 150
    sceneGroup:insert(ethnicity_ex)


    local calories = display.newText("Grilled Cheese", 160, 240, "Avenir", 18)
    calories:setFillColor(0,0,0)
    calories.x = 160
    calories.y = 200
    sceneGroup:insert(calories)

    local calories_ex = display.newText("Miso Soup", 160, 240, "Avenir", 18)
    calories_ex:setFillColor(0,0,0)
    calories_ex.x = 160
    calories_ex.y = 240
    sceneGroup:insert(calories_ex)


     

    --- DROPDOWN MENU
      local myDropdown

      local dropdownOptions = {
        {
          title     = 'User Profile',
          action    = function() 
          composer.gotoScene("profile")
          end 
        },
        {
          title     = 'Saved Recipes',
          action    = function() 
            native.showAlert('Dropdown', 'Dropdown', {'Ok'})
          end 
        },
        {
          title     = '7 Day Planner',
          action    = function() 
            native.showAlert('Dropdown', 'Dropdown', {'Ok'})
          end 
        },
        {
          title     = 'Health Tracker',
          action    = function() 
            native.showAlert('Dropdown', 'Dropdown', {'Ok'})
          end 
        },
        {
          title     = 'Group Meal Planner',
          action    = function() 
            native.showAlert('Dropdown', 'Dropdown', {'Ok'})
          end 
        },
        {
          title     = 'Help and Support',
          action    = function() 
            native.showAlert('Dropdown', 'Dropdown', {'Ok'})
          end 
        },
        {
          title     = 'Log Out',
          action    = function() 
            native.showAlert('Dropdown', 'Dropdown', {'Ok'})
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

