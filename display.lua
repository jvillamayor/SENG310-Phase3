display.setDefault('background', 1, 0 , 0  )
local widget = require('widget')
local dropdown = require('dropdown')
local screen = require('screen')
local composer = require('composer')
local scene = composer.newScene()


function scene:create( event )

     local sceneGroup = self.view
local myDropdown

local dropdownOptions = {
  {
    title     = 'Go to Home',
    action    = function() 
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end 
  },
  {
    rightIcon = display.newImageRect('rightIcon.png', 32, 32),
    title     = 'Test',
    action    = function() 
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end 
  },
  {
    leftIcon  = display.newImageRect('star.png', 32, 32),
    rightIcon = display.newImageRect('rightIcon.png', 32, 32),
    title     = 'My favorite component',
    action    = function() 
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end 
  },
}

local button = widget.newButton{
  width       = 32,
  height      = 32,
  defaultFile = 'arrow.png',
  overFile    = 'arrow.png',
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
button.alpha = .5

myDropdown     = dropdown.new{
  x            = screen.rightSide - 20,
  y            = screen.topSide + 100,
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


