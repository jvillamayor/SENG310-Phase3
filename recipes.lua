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
    sceneGroup:insert(myTextObject)

    local title = display.newText("Choose Category", 160, 240, "Avenir", 18)
    title:setFillColor(0,0,0)
    title.x = 100
    title.y = 70
    sceneGroup:insert(title)

    local ethnicity = display.newText("Ethnicity", 160, 240, "Avenir", 18)
    ethnicity:setFillColor(0,0,0)
    ethnicity.x = 77
    ethnicity.y = 120
    sceneGroup:insert(ethnicity)

    local ethnicity_ex = display.newText("Asian", 160, 240, "Avenir", 15)
    ethnicity_ex:setFillColor(0,0,0)
    ethnicity_ex.x = 200
    ethnicity_ex.y = 120
    sceneGroup:insert(ethnicity_ex)


    local calories = display.newText("Calories", 160, 240, "Avenir", 18)
    calories:setFillColor(0,0,0)
    calories.x = 75
    calories.y = 200
    sceneGroup:insert(calories)


    local calories_ex = display.newText("210kCal", 160, 240, "Avenir", 15)
    calories_ex:setFillColor(0,0,0)
    calories_ex.x = 200
    calories_ex.y = 200
    sceneGroup:insert(calories_ex)

    local budget = display.newText("Budget", 160, 240, "Avenir", 18)
    budget:setFillColor(0,0,0)
    budget.x = 75
    budget.y = 280
    sceneGroup:insert(budget)


    local budget_ex = display.newText("<= $50", 160, 240, "Avenir", 15)
    budget_ex:setFillColor(0,0,0)
    budget_ex.x = 200
    budget_ex.y = 280
    sceneGroup:insert(budget_ex)

    local time = display.newText("Time", 160, 240, "Avenir", 18)
    time:setFillColor(0,0,0)
    time.x = 67
    time.y = 360
    sceneGroup:insert(time)


    local time_ex = display.newText("15 mins", 160, 240, "Avenir", 15)
    time_ex:setFillColor(0,0,0)
    time_ex.x = 200
    time_ex.y = 360
    sceneGroup:insert(time_ex)



    local update = display.newText("Search Recipes", 160, 240, "Avenir", 18)
    update:setFillColor(0,0,0)
    update.x = 230
    update.y = 450
    sceneGroup:insert(update)
 

-- ScrollView listener
    local function scrollListener( event )
     
        local phase = event.phas
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
            y = 238,
            x = 170,
            width = 230,
            height = 25,
            scrollWidth = 250,
            scrollHeight = 25,
            listener = scrollListener,
            hideBackground = true,
            verticalScrollDisabled = true,
        }
    )
    sceneGroup:insert(scrollView)

    scrollView:scrollToPosition {
      x = 100
    }
     
    -- Create a image and insert it into the scroll view
    local background = display.newImageRect( "assets/scroll_button.png", 30, 30 )
    background.y = 10
    background.x = 8
    scrollView:insert( background )

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

