local composer = require( "composer" )
local widget = require("widget")
local dropdown = require("dropdown")
local screen = require('screen')
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local function changeScenes()
    composer.gotoScene("menu2", {effect="slideLeft", time=500})
end

local function delayedSceneRemoval()
    local function removeSceneListener(event)
        composer.removeScene("7DayPlanner")
    end
    timer.performWithDelay(500, removeSceneListener)
end
 
local function scrollListener ( event )
-- Scroll view listener
    local phase = event.phase
    local direct = event.direction
    -- If the scrollView has reached it's scroll limit
    if event.limitReached then 
        if "up" == direction then
            print("Reached Top Limit")
        elseif "down" == direction then
            print ("Reached Bottom Limit")
        end

        return true
    end
end

local scrollView = widget.newScrollView
{
    left = 0,
    top = 0,
    width = display.contentWidth,
    height = display.contenttHeight,
    topPadding = 0,
    bottomPadding = 50,
    horizontalScrollDisabled = true,
    verticalScrollDisabled = false,
    listener = scrollListener,
    hideBackground = true,
}



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------


-- create()
function scene:create( event )
    local sceneGroup = self.view


    local bg = display.newRect(display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    bg:setFillColor(239/255, 240/255, 240/255)
    sceneGroup:insert( bg )

    local function createCardWithShadow(text, recipe1, recipe2, recipe3, x, y, shadowOffset)
        local box = display.newRect(x+shadowOffset,y+shadowOffset, 250, 300) 
        box:setFillColor(189/255,191/255,191/255,128) 
        scrollView:insert(box)

        local box2 = display.newRect(x, y, 250, 300)
        box2:setFillColor(1,1,1)
        scrollView:insert(box2)

        local myTextObject = display.newText(text, 102, 242, "Arial", 25)
        myTextObject:setFillColor(0, 0, 0)
        myTextObject.x = x
        myTextObject.y = y-100
        myTextObject:toFront() 
        scrollView:insert( myTextObject )

        local divider = display.newLine( 50, y-70, 275, y-70 )
        divider:setStrokeColor( 189/255,191/255,191/255,128 )
        divider.strokeWidth = 2
        scrollView:insert( divider )

        local recipe1_obj = display.newText(recipe1, 102, 242, "Arial", 19)
        recipe1_obj:setFillColor(0, 0, 0)
        recipe1_obj.anchorX = 0
        recipe1_obj.x = x-100
        recipe1_obj.y = y-40
        recipe1_obj:toFront()   
        scrollView:insert( recipe1_obj )

        local x_button1 = display.newImage("assets/x_button.png")
        x_button1.anchorX =1
        x_button1.x = x+100
        x_button1.y = y-40
        x_button1:scale(0.05, 0.05)
        scrollView:insert( x_button1 )   


        local divider = display.newLine( 50, y-15, 275, y-15 )
        divider:setStrokeColor( 189/255,191/255,191/255,128 )
        divider.strokeWidth = 2
        scrollView:insert( divider )

        local recipe2_obj = display.newText(recipe2, 102, 242, "Arial", 19)
        recipe2_obj:setFillColor(0, 0, 0)
        recipe2_obj.anchorX = 0
        recipe2_obj.x = x-100
        recipe2_obj.y = y+20
        scrollView:insert( recipe2_obj )
  

        local x_button2 = display.newImage("assets/x_button.png")
        x_button2.anchorX=1
        x_button2.x = x+100
        x_button2.y = y+20
        x_button2:scale(0.05, 0.05)
        scrollView:insert( x_button2 )    
        

        local divider = display.newLine( 50, y+45, 275, y+45 ) --add 25
        divider:setStrokeColor( 189/255,191/255,191/255,128 )
        divider.strokeWidth = 2
        scrollView:insert( divider )    

        local recipe3_obj = display.newText(recipe3, 0, 0, "Arial", 19)
        recipe3_obj:setFillColor(0, 0, 0)
        recipe3_obj.anchorX = 0
        recipe3_obj.x = x-100
        recipe3_obj.y = y+80
        recipe3_obj:toFront()
        scrollView:insert( recipe3_obj )

        local x_button3 = display.newImage("assets/x_button.png")
        x_button3.anchorX=1
        x_button3.x = x+100
        x_button3.y = y+80
        x_button3:scale(0.05, 0.05)
        scrollView:insert( x_button3 )         

        local divider = display.newLine( 50, y+105, 275, y+105 )
        divider:setStrokeColor( 189/255,191/255,191/255,128 )
        divider.strokeWidth = 2
        scrollView:insert( divider )    

        local add_button = display.newImage("assets/add_button.png")
        add_button.x = x
        add_button.y = y+130
        add_button:scale(0.05, 0.05)
        scrollView:insert( add_button )
        
        sceneGroup:insert(scrollView)
        function addRecipe()   
          delayedSceneRemoval()
          composer.gotoScene("display_recipes", {effect="slideLeft", time=500})        
        end



        function addButtonInteractive (y)
          local add_button = display.newImage("assets/add_button.png")
          add_button.x = x
          add_button.y = y-40
          add_button:scale(0.05, 0.05)

          scrollView:insert( add_button )
        --  sceneGroup:insert( add_button )  

          add_button:addEventListener( "touch", addRecipe )
        end


        function b1 ( event )
          if event.phase == "began" then
            transition.fadeOut(recipe1_obj, {time=300})
            transition.fadeOut(x_button1, {time=300})
            addButtonInteractive( display.contentCenterY-60 )
          end
        end



 
      x_button1:addEventListener( "touch", b1 )
      x_button2:addEventListener( "touch", b1 )
      x_button3:addEventListener( "touch", b1 )
    end

    local card1 = createCardWithShadow("Monday March 20", "Easy Thai Soup", "Mac & Cheese", "Oven \nRoasted Chicken", display.contentCenterX, display.contentCenterY-60, 3)
    local card2 = createCardWithShadow("Tuesday March 21", "Chicken Alfredo", "Beef Pot Roast", "Squash Soup", display.contentCenterX, display.contentCenterY+300, 3)
    local card3 = createCardWithShadow("Wednesday March 22", "Chicken Alfredo", "Beef Pot Roast", "Squash Soup", display.contentCenterX, display.contentCenterY+660, 3)
    local card4 = createCardWithShadow("Thursday March 23", "Chicken Alfredo", "Beef Pot Roast", "Squash Soup", display.contentCenterX, display.contentCenterY+1020, 3)
    local card5 = createCardWithShadow("Friday March 22", "Chicken Alfredo", "Beef Pot Roast", "Squash Soup", display.contentCenterX, display.contentCenterY+1380, 3)
    local card6 = createCardWithShadow("Saturday March 22", "Chicken Alfredo", "Beef Pot Roast", "Squash Soup", display.contentCenterX, display.contentCenterY+1740, 3)
    local card7 = createCardWithShadow("Sunday March 22", "Chicken Alfredo", "Beef Pot Roast", "Squash Soup", display.contentCenterX, display.contentCenterY+2100, 3)


    

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
      },
      {
        title     = 'Saved Recipes',
        action    = function() 
          delayedSceneRemoval()
          composer.gotoScene("favourites")
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

  --  local headline = display.newRect(display.contentCenterX, display.contentCenterY-228, display.actualContentWidth, 50)


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
    scrollView:insert(button)


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