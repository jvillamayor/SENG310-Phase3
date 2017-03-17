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

print("In Scene: health_tracker.lua")

--Function to delay the removal of the scene, smoothing out the transition between scenes
local function delayedSceneRemoval()
    local function removeSceneListener(event)
        composer.removeScene("health_tracker")
    end
    timer.performWithDelay(500, removeSceneListener)
end

function scene:create( event )
    local sceneGroup = self.view

    local bg = display.newRect(display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    bg:setFillColor(1, 1, 1)
    sceneGroup:insert( bg )

     
    local title_text = display.newText("Health Tracker", 160, 240, "Avenir", 20)
    title_text:setFillColor(0,0,0)
    title_text.y = 5
    sceneGroup:insert(title_text)

    local myDropdown

    local xy_axis = display.newLine( 20, 50, 20, 225 )
    xy_axis:append(305,225)
    xy_axis:setStrokeColor( 0, 0, 0, 1 )
    xy_axis.strokeWidth = 3
    -- sceneGroup:insert(xy_axis)

    local summary_header = display.newText("Summary", 60, 260, "Avenir", 18)
    summary_header:setFillColor(0,0,0)

    local sodium_line = display.newLine( 20,  200,
                                         70,  150,
                                        120,  160,
                                        170,  150,
                                        220,  130,
                                        270,  125
                                        )
    sodium_line:setStrokeColor(0.8, 0.4, 0.35, 1)
    sodium_line.strokeWidth = 2.5

    local sodium_label = display.newText("SODIUM Intake", 160, 240, "Avenir", 15)
    sodium_label:setFillColor(0.8, 0.4, 0.35)
    sodium_label.x = 103
    sodium_label.y = 300

    local sodium_toggle = widget.newSwitch( {
            left = 250,
            top = 200,
            style = "checkbox",
            id = "Checkbox",
            initialSwitchState = true,
            onPress = function()
                            if sodium_line.isVisible == true then
                                sodium_line.isVisible = false
                            else
                                sodium_line.isVisible = true
                            end
                       end 
    } )
    sodium_toggle:scale(0.5,0.5)
    sodium_toggle.x = 30
    sodium_toggle.y = 300

    local sodium_level = display.newText("HIGH", 160, 240, "Avenir", 15)
    sodium_level:setFillColor(1, 0, 0)
    sodium_level.x = 275
    sodium_level.y = 300

    local carb_line = display.newLine( 20,  225,
                                         70,  120,
                                        120,  130,
                                        170,  131,
                                        220,  140,
                                        270,  130
                                        )
    carb_line:setStrokeColor(0.1, 0.1, 1, 1)
    carb_line.strokeWidth = 2.5

    local carb_label = display.newText("CARB Intake", 160, 240, "Avenir", 15)
    carb_label:setFillColor(0.1, 0.1, 1)
    carb_label.x = 92
    carb_label.y = 330

    local carb_toggle = widget.newSwitch( {
            left = 250,
            top = 200,
            style = "checkbox",
            id = "Checkbox",
            initialSwitchState = true,
            onPress = function()
                            if carb_line.isVisible == true then
                                carb_line.isVisible = false
                            else
                                carb_line.isVisible = true
                            end
                       end 
    } )
    carb_toggle:scale(0.5,0.5)
    carb_toggle.x = 30
    carb_toggle.y = 330

    local carb_level = display.newText("MEDIUM", 160, 240, "Avenir", 15)
    carb_level:setFillColor(1, 1, 0)
    carb_level.x = 275
    carb_level.y = 330

    local fat_line = display.newLine( 20,  200,
                                         70,  180,
                                        120,  130,
                                        170,  160,
                                        220,  165,
                                        270,  150
                                        )
    fat_line:setStrokeColor(1, 0.1, 1, 1)
    fat_line.strokeWidth = 2.5

    local fat_label = display.newText("FAT Intake", 160, 240, "Avenir", 15)
    fat_label:setFillColor(1,0.1,1)
    fat_label.x = 87
    fat_label.y = 360

    local fat_toggle = widget.newSwitch( {
            left = 250,
            top = 200,
            style = "checkbox",
            id = "Checkbox",
            initialSwitchState = true,
            onPress = function()
                            if fat_line.isVisible == true then
                                fat_line.isVisible = false
                            else
                                fat_line.isVisible = true
                            end
                       end 
    } )
    fat_toggle:scale(0.5,0.5)
    fat_toggle.x = 30
    fat_toggle.y = 360

    local fat_level = display.newText("LOW", 160, 240, "Avenir", 15)
    fat_level:setFillColor(0, 1, 0)
    fat_level.x = 275
    fat_level.y = 360


-- Scroll functionality ----------------------
    local function scrollListener( event ) 
        local phase = event.phase
        return true
    end

    local scrollBarOpt = {
        width = 20,
        height = 20,
        numFrames = 3,
        sheetContentWidth = 20,
        sheetContentHeight = 60
    }
    -- Create the widget
    local scrollView = widget.newScrollView(
    {
        top = 15,
        left = -100,
        width = 1000,
        height = 1000,
        scrollWidth = 1000,
        scrollHeight = 800,
        listener = scrollListener,
        horizontalScrollDisabled = true
    }
    )

    scrollView:scrollToPosition {
      x = 100
    }
     
    -- Create a image and insert it into the scroll view

        --scrollView:insert(title_text)
        scrollView:insert(xy_axis)
        scrollView:insert(summary_header)
        scrollView:insert(sodium_line)
        scrollView:insert(sodium_label)
        scrollView:insert(sodium_toggle)
        scrollView:insert(carb_line)
        scrollView:insert(carb_label)
        scrollView:insert(carb_toggle)
        scrollView:insert(fat_line)
        scrollView:insert(fat_label)
        scrollView:insert(fat_toggle)
        scrollView:insert(sodium_level)
        scrollView:insert(carb_level)
        scrollView:insert(fat_level)




        sceneGroup:insert(scrollView)

----------------------------------------------

    local dropdownOptions = {
        {
        title     = 'User Profile',
        action    = function() 
          delayedSceneRemoval()
          composer.gotoScene("profile")
        end 
        }, {
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
        }, 
        {
          title     = 'Help and Support',
          action    = function() 
            delayedSceneRemoval()
            composer.gotoScene("help_support")
          end 
        }, {
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

  myDropdown     = dropdown.new {
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