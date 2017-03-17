local composer = require( "composer" )
local dropdown = require("dropdown")
local dropdown2 = require("dropdown_cuisine")
local scene = composer.newScene()
local screen = require("screen")
local widget = require("widget")
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local function changeScenes()
    composer.gotoScene("menu2", {effect="slideLeft", time=500})
end

local function delayedSceneRemoval()
    local function removeSceneListener(event)
        composer.removeScene("favourites")
    end
    timer.performWithDelay(500, removeSceneListener)
end

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
    local group = display.newGroup()

    local bg = display.newRect(display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
    bg:setFillColor(1, 1, 1)
    sceneGroup:insert(bg)

    local search = native.newTextField(200, 0, 180, 20)
    sceneGroup:insert(search)
    search.inputType = "default"
    search.placeholder = "Search..."
    search.y = 50
    search.x = 160


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
      button_az.x = 260
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


    local myDropdown_order
      local dropdown_orderOpts = {
        {
          title = 'Most Commonly Selected',
          action = function()
          end
        },
        {
          title = 'Least Commonly Selected',
          action = function()
          end
        }
      }

      local button_order = widget.newButton{
        width       = 50,
        height      = 50,
        defaultFile = 'assets/order.png',
        overFile    = 'assets/order.png',
        onEvent     = function( event )
          local target = event.target
          local phase  = event.phase
          if phase == 'began' then
            target.alpha = .5
          else
            target.alpha = 1
          if phase ==  'ended' then
              myDropdown_order:toggle()
          end
        end
      end
      }
      button_order.alpha = 10
      button_order.x = 290
      button_order.y = 45
      sceneGroup:insert(button_order)

      myDropdown_order     = dropdown2.new{
        x            = 300,
        y            = 40,
        toggleButton = button_order,
        width        = 160,
        marginTop    = 12,
        padding      = 10,
        options      = dropdown_orderOpts
      }
      sceneGroup:insert(myDropdown_order)


      




    -- local navBar = display.newRect( 52, 250, 450, 590 )
    -- navBar.strokeWidth = 3
    -- navBar:setFillColor( 1 )
    -- navBar:setStrokeColor( 0, 0, 0 )
    -- -- Originally this is not visible
    -- navBar.isVisible = false


    -- local banner = display.newImage("assets/favourites_banner.jpg")
    -- banner.x = 80 
    -- banner.y = 0
    -- banner.alpha = 0.5
    -- banner:scale(.7, .4)

    -- sceneGroup:insert(banner)

    -- local menuBarBackdrop = display.newRect( 69, 0, 40, 36 )
    -- menuBarBackdrop.strokeWidth = 0
    -- menuBarBackdrop:setFillColor( 1 )
    -- menuBarBackdrop:setStrokeColor( 0, 0, 0 )
    
    -- sceneGroup:insert(menuBarBackdrop)


    -- local menu_icon = display.newImage("assets/burger.png")
    -- menu_icon.x = 68 
    -- menu_icon.y = 0
    -- menu_icon.alpha = 0.5
    -- menu_icon:scale(.2, .2)
    -- menu_icon:setFillColor(1, 1, 1)
    
    -- sceneGroup:insert(menu_icon)

    -- local myTextObject = display.newText("Favourites", 102, 242, "Arial", 40)
    -- myTextObject:setFillColor(1, 1, 1)
    -- myTextObject.y = 40

    -- sceneGroup:insert(myTextObject)

    -- local myTextObject = display.newText("Favourites", 100, 240, "Arial", 40)
    -- myTextObject:setFillColor(0,0,0)
    -- myTextObject.y = 40

    -- sceneGroup:insert(myTextObject)

    local myTextObject = display.newText("Saved Recipes", 160, 240, "Avenir", 20)
    myTextObject:setFillColor(0,0,0)
    myTextObject.y = 5
    sceneGroup:insert(myTextObject)

    local tile = display.newRect( 80, 180, 150, 200 )
    tile.strokeWidth = 0
    tile:setFillColor( 156/255, 168/255, 188/255 )
    tile:setStrokeColor( 0, 0, 0 )

    local tile2 = display.newRect(240, 180, 150, 200 )
    tile2.strokeWidth = 0
    tile2:setFillColor( 156/255, 168/255, 188/255 )
    tile2:setStrokeColor( 0, 0, 0 )

    local maccheese = display.newImage("assets/mac&cheese.jpg")
    maccheese.x = 80 
    maccheese.y = 148
    maccheese:scale(.188, .3)

    local thaiSoup = display.newImage("assets/thaiSoup.jpg")
    thaiSoup.x = 240 
    thaiSoup.y = 148
    thaiSoup:scale(.235, .28)

    local maccheese_text = display.newText("Mac & Cheese", 102, 242, "Arial", 20)
    maccheese_text:setFillColor(0, 0, 0)
    maccheese_text.x = 80
    maccheese_text.y = 250

    local thaiSoup_text = display.newText("Thai Soup", 102, 242, "Arial", 20)
    thaiSoup_text:setFillColor(0, 0, 0)
    thaiSoup_text.x = 240
    thaiSoup_text.y = 250


    -- local panel = widget.newPanel{
    --     location = "left",
    --     onComplete = panelTransDone,
    --     width = display.contentWidth * 0.8,
    --     height = 900,
    --     speed = 250,
    --     inEasing = easing.outBack,
    --     outEasing = easing.outCubic
    -- }

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

   -- local scrollView = widget.newScrollView



    -- panel.background = display.newRect( 0, 0, panel.width, panel.height )
    -- panel.background:setFillColor( 0, 0.25, 0.5 )
    -- panel:insert( panel.background )

    -- panel.menuButton = display.newRect( 0, -80, panel.width, 60  )
    -- panel.menuButton:setFillColor( 0.9, 0.9, 0.9 )
    -- panel:insert( panel.menuButton )

    -- panel.menuItem = display.newText("User Profile", 0, -80, "Arial", 20)
    -- panel.menuItem:setFillColor(0,0,0)
    -- panel:insert( panel.menuItem )

    -- panel.menuButton = display.newRect( 0, -10, panel.width, 60  )
    -- panel.menuButton:setFillColor( 0.9, 0.9, 0.9 )
    -- panel:insert( panel.menuButton )

    -- panel.menuItem = display.newText("Recipes", 0, -10, "Arial", 20)
    -- panel.menuItem:setFillColor(0,0,0)
    -- panel:insert( panel.menuItem )

    -- panel.menuButton = display.newRect( 0, 60, panel.width, 60  )
    -- panel.menuButton:setFillColor( 0.9, 0.9, 0.9 )
    -- panel:insert( panel.menuButton )

    -- panel.menuItem = display.newText("Favourites", 0, 60, "Arial", 20)
    -- panel.menuItem:setFillColor(0,0,0)
    -- panel:insert( panel.menuItem )

    -- panel.menuButton = display.newRect( 0, 130, panel.width, 60  )
    -- panel.menuButton:setFillColor( 0.9, 0.9, 0.9 )
    -- panel:insert( panel.menuButton )

    -- panel.menuItem = display.newText("7 Day Planner", 0, 130, "Arial", 20)
    -- panel.menuItem:setFillColor(0,0,0)
    -- panel:insert( panel.menuItem )


    -- panel.backdrop = display.newImage("assets/backdrop.jpg")
    -- panel.backdrop.x = 0
    -- panel.backdrop.y = -200
    -- panel.backdrop:scale(.2, .2)
    -- panel:insert( panel.backdrop )

    -- panel.logo = display.newImage("assets/logo.png")
    -- panel.logo.x = 10
    -- panel.logo.y = -190
    -- panel.logo:scale(.6, .6)
    -- panel:insert( panel.logo )

    -- sceneGroup:insert(panel)


    -- local function navBarReveal (event) 
    --     if (navReveal == true) then
    --         panel:toFront()
    --         search.isVisible = false
            
    --         panel:show()
    --         navReveal = false
    --     else
    --         panel:hide()
    --         search.isVisible = true
    --         navReveal = true
    --     end
    -- end

    -- navReveal = true
 ---   menu_icon:addEventListener("tap", navBarReveal)
    ----------------------------------
    --- DROPDOWN MENU ----------------
    ----------------------------------

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
                        end 
        },
        {
            title     = 'Log Out',
            action    = function() 
                            composer.gotoScene("logout.lua")
                        end 
        }
    }

    local button = widget.newButton {
        width         =   30,
        height        =   30,
        defaultFile   =   'assets/burger.png',
        overFile      =   'assets/burger.png',
        onEvent       = function(event)
                            local target = event.target
                            local phase  = event.phase
                            if phase == 'began' then
                                target.alpha = .5
                            else
                                target.alpha = 1
                            end
                            if phase ==  'ended' then
                                myDropdown:toggle()
                            end
                        end                
    }
    button.alpha = 10
    sceneGroup:insert(button)

    myDropdown = dropdown.new {
        x            = screen.rightSide - 50,
        y            = screen.topSide + 50,
        toggleButton = button,
        width        = 280,
        marginTop    = 12,
        padding      = 20,
        options      = dropdownOptions
    }
    sceneGroup:insert(myDropdown)
    -- button:addEventListener("tap", navBarReveal)


    local function reveal()
        if (navReveal == true) then
            maccheese.isVisible = false
            thaiSoup.isVisible = false
            thaiSoup_text.isVisible = false
            maccheese_text.isVisible = false
            bg.isVisible = false
            tile.isVisible = false
            tile2.isVisible = false
            search.isVisible = false
            navReveal = false
        else
            maccheese.isVisible = true
            thaiSoup.isVisible = true
            maccheese_text.isVisible = true
            thaiSoup_text.isVisible = true
            bg.isVisible = true
            tile.isVisible = true
            tile2.isVisible = true
            search.isVisible = true
            navReveal = true
        end
    end

    navReveal = true
    button:addEventListener("tap", reveal)
    button_az:addEventListener("tap", reveal)
    button_order:addEventListener("tap", reveal)


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