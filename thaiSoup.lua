local composer = require( "composer" )
local widget = require("widget")
local dropdown = require("dropdown")
local screen = require('screen')
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


local function delayedSceneRemoval()
    local function removeSceneListener(event)
        composer.removeScene("thaiSoup")
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
    height = display.contentHeight,
    topPadding = 50,
    bottomPadding = 50,
    horizontalScrollDisabled = true,
    verticalScrollDisabled = false,
    listener = scrollListener,
    hideBackground = true

}
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

function widget.newPanel( options )
    local customOptions = options or {}
    local opt = {}
 
    opt.location = customOptions.location or "top"
 
    local default_width, default_height
    if ( opt.location == "top" or opt.location == "bottom" ) then
        default_width = display.contentWidth
        default_height = display.contentHeight * 0.33
    else
        default_width = display.contentWidth * 0.33
        default_height = display.contentHeight
    end
 
    opt.width = customOptions.width or default_width
    opt.height = customOptions.height or default_height
 
    opt.speed = customOptions.speed or 500
    opt.inEasing = customOptions.inEasing or easing.linear
    opt.outEasing = customOptions.outEasing or easing.linear
 
    if ( customOptions.onComplete and type(customOptions.onComplete) == "function" ) then
        opt.listener = customOptions.onComplete
    else 
        opt.listener = nil
    end
 
    local container = display.newContainer( opt.width, opt.height )
 
    if ( opt.location == "left" ) then
        container.anchorX = 1.0
        container.x = display.screenOriginX
        container.anchorY = 0.5
        container.y = display.contentCenterY
    elseif ( opt.location == "right" ) then
        container.anchorX = 0.0
        container.x = display.actualContentWidth
        container.anchorY = 0.5
        container.y = display.contentCenterY
    elseif ( opt.location == "top" ) then
        container.anchorX = 0.5
        container.x = display.contentCenterX
        container.anchorY = 1.0
        container.y = display.screenOriginY
    else
        container.anchorX = 0.5
        container.x = display.contentCenterX
        container.anchorY = 0.0
        container.y = display.actualContentHeight
    end
 
    function container:show()
        local options = {
            time = opt.speed,
            transition = opt.inEasing
        }
        if ( opt.listener ) then
            options.onComplete = opt.listener
            self.completeState = "shown"
        end
        if ( opt.location == "top" ) then
            options.y = display.screenOriginY + opt.height
        elseif ( opt.location == "bottom" ) then
            options.y = display.actualContentHeight - opt.height
        elseif ( opt.location == "left" ) then
            options.x = display.screenOriginX + opt.width
        else
            options.x = display.actualContentWidth - opt.width
        end 
        transition.to( self, options )
    end
 
    function container:hide()
        local options = {
            time = opt.speed,
            transition = opt.outEasing
        }
        if ( opt.listener ) then
            options.onComplete = opt.listener
            self.completeState = "hidden"
        end
        if ( opt.location == "top" ) then
            options.y = display.screenOriginY
        elseif ( opt.location == "bottom" ) then
            options.y = display.actualContentHeight
        elseif ( opt.location == "left" ) then
            options.x = display.screenOriginX
        else
            options.x = display.actualContentWidth
        end 
        transition.to( self, options )
    end
 
    return container
end



-- create()
function scene:create( event )
    local sceneGroup = self.view

    local bg = display.newRect(display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    bg:setFillColor(0, 0, 0)
    sceneGroup:insert(bg)
    scrollView:insert( bg )


 --[[  local menu_icon = display.newImage("assets/burger.png")
    menu_icon.x = 68 
    menu_icon.y = 0
    menu_icon.alpha = 0.5
    menu_icon:scale(.2, .2)
    menu_icon:setFillColor(1, 1, 1)
    scrollView:insert( menu_icon )
   
    sceneGroup:insert(menu_icon)]]


    local tile = display.newRect(display.contentCenterX, display.contentCenterY+110, display.actualContentWidth, 1500 )
    tilestrokeWidth = 0
    tile:setFillColor( 1, 1, 1 )
    tile:setStrokeColor( 0, 0, 0 )
    scrollView:insert( tile )


    local thaiSoup = display.newImage("assets/thaiSoup.jpg")
    thaiSoup.x = display.contentCenterX 
    thaiSoup.y = display.contentCenterY-170
    thaiSoup:scale(1, .60)
    scrollView:insert( thaiSoup )

    local myTextObject = display.newText("Easy Thai Soup", 102, 242, "Arial", 30)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.x = display.contentCenterX
    myTextObject.y = display.contentCenterY
    scrollView:insert( myTextObject )
    
    local stars = display.newImage("assets/stars.png")
    stars.x = display.contentCenterX-90
    stars.y = display.contentCenterY+45
    stars:scale(.1, .1)
    scrollView:insert( stars )

    local thumbsUp = display.newImage("assets/thumbs-up.png")
    thumbsUp.x = display.contentCenterX+70
    thumbsUp.y = display.contentCenterY+45
    thumbsUp:scale(.1, .1)
    scrollView:insert( thumbsUp )

    local thumbsDown = display.newImage("assets/thumbs-down.png")
    thumbsDown.x = display.contentCenterX+120
    thumbsDown.y = display.contentCenterY+45
    thumbsDown:scale(.1, .1)
    scrollView:insert( thumbsDown )

    local myTextObject = display.newText("Total Time", 102, 242, "Arial", 18)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+90
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("15 min", 102, 242, "Arial", 18)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 1
    myTextObject.x = display.contentCenterX+140
    myTextObject.y = display.contentCenterY+90
    scrollView:insert( myTextObject )


    local myTextObject = display.newText("Preparation Time", 102, 242, "Arial", 18)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+120
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("5 Min", 102, 242, "Arial", 18)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 1
    myTextObject.x = display.contentCenterX+140
    myTextObject.y = display.contentCenterY+120
    scrollView:insert( myTextObject )


    local myTextObject = display.newText("Cooking Time", 102, 242, Arial, 18)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+150
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("10 Min", 102, 242, Arial, 18)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 1
    myTextObject.x = display.contentCenterX+140
    myTextObject.y = display.contentCenterY+150
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("Ingredients", 102, 242, native.systemFontBold, 18)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+200
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("2 Tbps of Vegetable Oil", 102, 242, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+225
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("2 Cloves of Garlic, finely chopped", 102, 242, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+245
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("1 Tbsp of Ginger, minced or grated", 102, 242, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+265
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("2 Tbsp of Thai Red Curry Paste", 102, 242, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+285
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("1 14.5oz can of Light Coconut Milk", 102, 242, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+305
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("4 cups of Vegetable Stock", 102, 242, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+325
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("3 Baby Bok Choy, quartered and washed", 102, 242, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+345
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("6oz of Thin Rice Noodles or any other kind of noodle you prefer", 102, 242, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+365
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("About 1/4 cup of Fresh Cilantro", 102, 242, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+385
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("Few Sprigs of Fresh Mint", 102, 242, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+405
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("Green Onions, finely sliced", 102, 242, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+425
    scrollView:insert( myTextObject )

    local myTextObject = display.newText("Directions", 102, 242, native.systemFontBold, 18)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+500
    scrollView:insert( myTextObject )

    local step1 = "1) In a saucepan, add the oil, garlic and ginger and sauté together for a few minutes, add the curry paste, stir it in and allow it to cook for a couple minutes."
    local myTextObject = display.newText(step1, 0, 0, 300, 0, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+550
    scrollView:insert( myTextObject )

    local step2 = "2) Add the vegetable stock and coconut milk and bring to a boil. Allow to simmer for 5 minutes, add the rice noodles and bok choy and cook the mixture for 3 minutes or until the noodles are tender (check the package instructions for cooking time on the noodles but generally, thin rice noodles take between 2 to 4 minutes to cook)"
    local myTextObject = display.newText(step2, 0, 0, 300, 0, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+670
    scrollView:insert( myTextObject )

    local step3 = "3) Serve the soup topped with fresh cilantro, mint and scallions."
    local myTextObject = display.newText(step3, 0, 0, 300, 0, native.systemFont, 14)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.anchorX = 0
    myTextObject.x = display.contentCenterX-140
    myTextObject.y = display.contentCenterY+770
    scrollView:insert( myTextObject )





    local panel = widget.newPanel {
        location = "left",
        onComplete = panelTransDone,
        width = display.contentWidth * 0.8,
        height = 900,
        speed = 250,
        inEasing = easing.outBack,
        outEasing = easing.outCubic
    }



    scrollView:insert( panel )
    sceneGroup:insert(scrollView)



--[[
    panel.background = display.newRect( 0, 0, panel.width, panel.height )
    panel.background:setFillColor( 0, 0.25, 0.5 )
    panel:insert( panel.background )

    panel.menuButton = display.newRect( 0, -80, panel.width, 60  )
    panel.menuButton:setFillColor( 0.9, 0.9, 0.9 )
    panel:insert( panel.menuButton )

    panel.menuItem = display.newText("User Profile", 0, -80, "Arial", 20)
    panel.menuItem:setFillColor(0,0,0)
    panel:insert( panel.menuItem )

    panel.menuButton = display.newRect( 0, -10, panel.width, 60  )
    panel.menuButton:setFillColor( 0.9, 0.9, 0.9 )
    panel:insert( panel.menuButton )

    panel.menuItem = display.newText("Recipes", 0, -10, "Arial", 20)
    panel.menuItem:setFillColor(0,0,0)
    panel:insert( panel.menuItem )

    panel.menuButton = display.newRect( 0, 60, panel.width, 60  )
    panel.menuButton:setFillColor( 0.9, 0.9, 0.9 )
    panel:insert( panel.menuButton )

    panel.menuItem = display.newText("Favourites", 0, 60, "Arial", 20)
    panel.menuItem:setFillColor(0,0,0)
    panel:insert( panel.menuItem )

    panel.menuButton = display.newRect( 0, 130, panel.width, 60  )
    panel.menuButton:setFillColor( 0.9, 0.9, 0.9 )
    panel:insert( panel.menuButton )

    panel.menuItem = display.newText("7 Day Planner", 0, 130, "Arial", 20)
    panel.menuItem:setFillColor(0,0,0)
    panel:insert( panel.menuItem )


    panel.backdrop = display.newImage("assets/backdrop.jpg")
    panel.backdrop.x = 0
    panel.backdrop.y = -200
    panel.backdrop:scale(.2, .2)
    panel:insert( panel.backdrop )

    panel.logo = display.newImage("assets/logo.png")
    panel.logo.x = 10
    panel.logo.y = -190
    panel.logo:scale(.6, .6)
    panel:insert( panel.logo )

    sceneGroup:insert(panel)


    local function navBarReveal (event) 
        if (navReveal == true) then
            panel:toFront()
            search.isVisible = false
            
            panel:show()
            navReveal = false
        else
            panel:hide()
            search.isVisible = true
            navReveal = true
        end
    end

    navReveal = true
    menu_icon:addEventListener("tap", navBarReveal)
]]

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