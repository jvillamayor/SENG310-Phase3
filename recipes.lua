-----------------------------------------------------------------------------------------
--
-- profile.lua
-- Cara Pekson, Aman Bhayani, Julius Villamayor
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require("widget")
local dropdown = require('dropdown')
local screen = require('screen')
local scene = composer.newScene()
   

function scene:create( event )
    local sceneGroup = self.view

    local myTextObject = display.newText("Recipes", 160, 240, "Avenir", 20)
    myTextObject:setFillColor(0,0,0)
    myTextObject.y = 5

    local title = display.newText("Choose Category", 160, 240, "Avenir", 18)
    title:setFillColor(0,0,0)
    title.x = 100
    title.y = 70







--- DROPDOWN MENU
  local myDropdown

  local dropdownOptions = {
    {
      title     = 'User Profile',
      action    = function() 
      end 
    },
    {
      title     = 'Recipes',
      action    = function() 
        native.showAlert('Dropdown', 'Dropdown', {'Ok'})
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

  myDropdown     = dropdown.new{
    x            = screen.rightSide - 50,
    y            = screen.topSide + 50,
    toggleButton = button,
    width        = 280,
    marginTop    = 12,
    padding      = 20,
    options      = dropdownOptions
  }



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

