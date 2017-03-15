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

print("In Scene 'health_tracker'")

--Function to delay the removal of the scene, smoothing out the transition between scenes
local function delayedSceneRemoval()
    local function removeSceneListener(event)
        composer.removeScene("profile")
    end
    timer.performWithDelay(500, removeSceneListener)
end

function scene:create( event )
    local sceneGroup = self.view

    local function onSwitchPress( event )
        local switch = event.target
        print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
    end
     
    local myTextObject = display.newText("Health Tracker", 160, 240, "Avenir", 20)
    myTextObject:setFillColor(0,0,0)
    myTextObject.y = 5
    sceneGroup:insert(myTextObject)

    local myDropdown

    local xAxis = display.newLine( 20, 50, 20, 225 )
    xAxis:append( 305,225)
    xAxis:setStrokeColor( 0, 0, 0, 1 )
    xAxis.strokeWidth = 3
    sceneGroup:insert(xAxis)

    local dropdownOptions = {
    {
    title     = 'User Profile',
    action    = function() 
      -- delayedSceneRemoval()
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
    width       = 50,
    height      = 50,
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

  myDropdown     = dropdown.new {
    x            = screen.rightSide - 50,
    y            = screen.topSide + 50,
    toggleButton = button,
    width        = 280,
    marginTop    = 12,
    padding      = 20,
    options      = dropdownOptions
  }

local function reveal()
        if (navReveal == true) then

        else
        end
        -- body
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

-- -----------------------------------------------------------------------------------

return scene