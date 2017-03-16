local composer = require( "composer" )
 
local scene = composer.newScene()
 
local widget = require("widget")
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local function changeScenes()
    composer.gotoScene("menu2", {effect="slideLeft", time=500})
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

    local search = native.newTextField(200, 0, 220, 36)
    sceneGroup:insert(search)
    search.inputType = "default"
    search.placeholder = "Search..."


    local navBar = display.newRect( 52, 250, 450, 590 )
    navBar.strokeWidth = 3
    navBar:setFillColor( 1 )
    navBar:setStrokeColor( 0, 0, 0 )
    -- Originally this is not visible
    navBar.isVisible = false


    local banner = display.newImage("assets/favourites_banner.jpg")
    banner.x = 80 
    banner.y = 0
    banner.alpha = 0.5
    banner:scale(.7, .4)

    sceneGroup:insert(banner)

    local menuBarBackdrop = display.newRect( 69, 0, 40, 36 )
    menuBarBackdrop.strokeWidth = 0
    menuBarBackdrop:setFillColor( 1 )
    menuBarBackdrop:setStrokeColor( 0, 0, 0 )
    
    sceneGroup:insert(menuBarBackdrop)


    local menu_icon = display.newImage("assets/burger.png")
    menu_icon.x = 68 
    menu_icon.y = 0
    menu_icon.alpha = 0.5
    menu_icon:scale(.2, .2)
    menu_icon:setFillColor(1, 1, 1)
    
    sceneGroup:insert(menu_icon)

    local myTextObject = display.newText("Favourites", 102, 242, "Arial", 40)
    myTextObject:setFillColor(1, 1, 1)
    myTextObject.y = 40

    sceneGroup:insert(myTextObject)

    local myTextObject = display.newText("Favourites", 100, 240, "Arial", 40)
    myTextObject:setFillColor(0,0,0)
    myTextObject.y = 40

    sceneGroup:insert(myTextObject)

    local tile = display.newRect( 75, 180, 150, 200 )
    tile.strokeWidth = 0
    tile:setFillColor( 156/255, 168/255, 188/255 )
    tile:setStrokeColor( 0, 0, 0 )

    local tile = display.newRect(240, 180, 150, 200 )
    tile.strokeWidth = 0
    tile:setFillColor( 156/255, 168/255, 188/255 )
    tile:setStrokeColor( 0, 0, 0 )

    local maccheese = display.newImage("assets/mac&cheese.jpg")
    maccheese.x = 75 
    maccheese.y = 148
    maccheese:scale(.188, .3)

    local thaiSoup = display.newImage("assets/thaiSoup.jpg")
    thaiSoup.x = 240 
    thaiSoup.y = 150
    thaiSoup:scale(.235, .28)

    local myTextObject = display.newText("Mac & Cheese", 102, 242, "Arial", 20)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.x = 75
    myTextObject.y = 250

    local myTextObject = display.newText("Thai Soup", 102, 242, "Arial", 20)
    myTextObject:setFillColor(0, 0, 0)
    myTextObject.x = 240
    myTextObject.y = 250


    local panel = widget.newPanel{
        location = "left",
        onComplete = panelTransDone,
        width = display.contentWidth * 0.8,
        height = 900,
        speed = 250,
        inEasing = easing.outBack,
        outEasing = easing.outCubic
    }

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