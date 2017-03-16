-----------------------------------------------------------------------------------------
--
-- display_recipes.lua
-- Cara Pekson, Aman Bhayani, Julius Villamayor
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local widget = require("widget")
local dropdown = require('dropdown')
local dropdown2 = require('dropdown_cuisine')
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

    local search = native.newTextField(160, 350, 220, 20)
    search.inputType = "search"
    search.placeholder = "Search Ingredients"
    search.y = 50
    search.x = 160
    sceneGroup:insert(search)

    local myDropdown_az
      local dropdown_azOpts = {
        {
          title = 'Alphabetical A-Z',
          action = function()
          end
        },
        {
          title = 'Alphabetical Z-A',
          action = function()
          end
        },
        {
          title = 'Popularity',
          action = function()
          end
        },
        {
          title = 'User Rating',
          action = function()
          end
        }
      }

      local button_az = widget.newButton{
        width       = 50,
        height      = 50,
        defaultFile = 'assets/az.png',
        overFile    = 'assets/az.png',
        onEvent     = function( event )
          local target = event.target
          local phase  = event.phase
          if phase == 'began' then
            target.alpha = .5
          else
            target.alpha = 1
          if phase ==  'ended' then
              myDropdown_az:toggle()
          end
        end
      end
      }
      button_az.alpha = 10
      button_az.x = 280
      button_az.y = 45
      sceneGroup:insert(button_az)

      myDropdown_az     = dropdown2.new{
        x            = 280,
        y            = 40,
        toggleButton = button_az,
        width        = 160,
        marginTop    = 12,
        padding      = 10,
        options      = dropdown_azOpts
      }
      sceneGroup:insert(myDropdown_az)


    local function handleBack( event )
      composer.gotoScene("recipes")
    end

    local function handleSoup (event)
      composer.gotoScene("favourites") 
    end

     local back = widget.newButton(
    {
        width = 50,
        height = 50,
        left = 120,
        right = 200,
        defaultFile = 'assets/backbutton.png',
        overFile = 'assets/backbutton.png',
        onEvent = handleBack
    }
    )
    back.y = 490
    back.x = 40
    sceneGroup:insert(back)


    local thaisoup_pic = display.newImage("assets/thaisoupcircle.png")
    thaisoup_pic.x = 35
    thaisoup_pic.y = 70
    thaisoup_pic:scale(0.25,0.25)

    local soup = widget.newButton( {
        left = 142,
        right = 200,
        id = "soup",
        font = "Avenir",
        fontSize = 18,
        label = "Easy Thai Soup",
        onEvent = handleSoup,
        width =200,
        height = 40
            
    } )
    soup.x = 142
    soup.y = 70
    sceneGroup:insert(soup)
    


    local Terriyaki_pic = display.newImage("assets/terriyaki.png")
    Terriyaki_pic.x = 35
    Terriyaki_pic.y = 140
    Terriyaki_pic:scale(0.25,0.25)
    local Terriyaki = display.newText("Chicken Terriyaki Bowl", 160, 240, "Avenir",18)
    Terriyaki:setFillColor(0,0,0)
    Terriyaki.x = 169
    Terriyaki.y = 140


    local friedrice_pic = display.newImage("assets/friedrice.png")
    friedrice_pic.x = 35
    friedrice_pic.y = 210
    friedrice_pic:scale(0.25,0.25)
    local friedrice = display.newText("Chicken Fried Rice", 160, 240, "Avenir",18)
    friedrice:setFillColor(0,0,0)
    friedrice.x = 154
    friedrice.y = 210


    local beef_pic = display.newImage("assets/beef.png")
    beef_pic.x = 37
    beef_pic.y = 280
    beef_pic:scale(0.25,0.25)
    local beef = display.newText("Beef Bulgogi", 160, 240, "Avenir",18)
    beef:setFillColor(0,0,0)
    beef.x = 132
    beef.y = 280


    local miso_pic = display.newImage("assets/miso.png")
    miso_pic.x = 35
    miso_pic.y = 350
    miso_pic:scale(0.25,0.25)
    local miso = display.newText("Miso Soup", 160, 240, "Avenir",18)
    miso:setFillColor(0,0,0)
    miso.x = 123
    miso.y = 350

    local tuna_pic = display.newImage("assets/tuna.png")
    tuna_pic.x = 35
    tuna_pic.y = 420
    tuna_pic:scale(0.25,0.25)
    local tuna = display.newText("Sesame Seared Ahi Tuna", 160, 240, "Avenir",17.5)
    tuna:setFillColor(0,0,0)
    tuna.x = 176
    tuna.y = 420


     

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
            delayedSceneRemoval() 
            composer.gotoScene("favourites")
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
            delayedSceneRemoval()
            composer.gotoScene("health_tracker")
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
            delayedSceneRemoval()
            composer.gotoScene("logout.lua")
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
    -- Create the widget
    local scrollView = widget.newScrollView(
        {
            y = 270,
            x = 160,
            width = 500,
            height = 390,  
            scrollWidth = 500,
            scrollHeight = 100,
            hideBackground = false,
            listener = scrollListener,
            horizontalScrollDisabled = true,
        }
    )

    scrollView:scrollToPosition {
      x = 100
    }
     
    -- Create a image and insert it into the scroll view
    scrollView:insert(beef)
    scrollView:insert(beef_pic)
    scrollView:insert(friedrice)
    scrollView:insert(friedrice_pic)
    scrollView:insert(Terriyaki)
    scrollView:insert(Terriyaki_pic)
    scrollView:insert(soup)
    scrollView:insert(thaisoup_pic)
    scrollView:insert(miso)
    scrollView:insert(miso_pic)
    scrollView:insert(tuna)
    scrollView:insert(tuna_pic)
    sceneGroup:insert(scrollView)
     

    local function reveal()
        if (navReveal == true) then
            scrollView.isVisible = false
            search.isVisible = false
            back.isVisible = false
            navReveal = false
        else
            scrollView.isVisible = true
            search.isVisible = true
            back.isVisible = true
            navReveal = true
        end
    end

    navReveal = true
    button:addEventListener("tap", reveal)
    button_az:addEventListener("tap", reveal)


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

