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

    local chickensoup = display.newText("Chicken Soup", 160, 240, "Avenir", 18)
    chickensoup:setFillColor(0,0,0)
    chickensoup.x = 160
    chickensoup.y = 70
    sceneGroup:insert(chickensoup)

    local tomato = display.newText("Tomato Soup", 160, 240, "Avenir", 18)
    tomato:setFillColor(0,0,0)
    tomato.x = 160
    tomato.y = 110
    sceneGroup:insert(tomato)

    local eggstoast = display.newText("Eggs and Toast", 160, 240, "Avenir", 18)
    eggstoast:setFillColor(0,0,0)
    eggstoast.x = 160
    eggstoast.y = 150
    sceneGroup:insert(eggstoast)


    local grilledcheese = display.newText("Grilled Cheese", 160, 240, "Avenir", 18)
    grilledcheese:setFillColor(0,0,0)
    grilledcheese.x = 160
    grilledcheese.y = 190
    sceneGroup:insert(grilledcheese)

    local miso = display.newText("Miso Soup", 160, 240, "Avenir", 18)
    miso:setFillColor(0,0,0)
    miso.x = 160
    miso.y = 230
    sceneGroup:insert(miso)


     

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
            y = 238,
            x = 160,
            width = 500,
            height = 300,  
            scrollWidth = 500,
            scrollHeight = 300,
            hideBackground = false,
            listener = scrollListener,
            horizontalScrollDisabled = true,
        }
    )

    scrollView:scrollToPosition {
      x = 100
    }
     
    -- Create a image and insert it into the scroll view
    local background = display.newImageRect( "assets/scroll_button.png", 30, 30 )
    background.y = 300
    background.x = 160
    scrollView:insert( background )

    sceneGroup:insert(scrollView)
     
    scrollView:insert(grilledcheese)
    scrollView:insert(eggstoast)
    scrollView:insert(tomato)
    scrollView:insert(chickensoup)
    scrollView:insert(miso)
    sceneGroup:insert(scrollView)


    local function reveal()
        if (navReveal == true) then
            scrollView.isVisible = false
            background.isVisible = false
            navReveal = false
        else
            scrollView.isVisible = true
            background.isVisible = true
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

