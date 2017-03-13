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

    local myTextObject = display.newText("Profile", 160, 240, "Avenir", 20)
    myTextObject:setFillColor(0,0,0)
    myTextObject.y = 5


    local profilepic = display.newImage("assets/pp.png")
    profilepic.x = 160; profilepic.y = 90
    sceneGroup:insert(profilepic)
    profilepic:scale( 0.4, 0.4 )

    local name = display.newText("Alan Cooper", 160, 240, "Avenir", 20)
    name:setFillColor(0,0,0)
    name.y = 163

    local email = display.newText("Email", 160, 240, "Avenir", 20)
    email:setFillColor(0,0,0)
    email.x = 50
    email.y = 210


    local emailinput = native.newTextField(160, 240, 220, 30)
    emailinput.inputType = "user@gmail.com"
    emailinput.placeholder = "user@gmail.com"
    emailinput.font = native.newFont("Avenir")
    emailinput.x = 200
    emailinput.y = 210
    sceneGroup:insert(emailinput)


    local age = display.newText("Age", 160, 240, "Avenir", 20)
    age:setFillColor(0,0,0)
    age.x = 45
    age.y = 245

    local ageinput = native.newTextField(160, 240, 220, 30)
    ageinput.inputType = "11/10/1994"
    ageinput.placeholder = "11/10/1994"
    ageinput.font = native.newFont("Avenir")
    ageinput.x = 200
    ageinput.y = 245

    local gender = display.newText("Gender", 160, 240, "Avenir", 20)
    gender:setFillColor(0,0,0)
    gender.x = 58
    gender.y = 280

    local genderinput = native.newTextField(160, 240, 220, 30)
    genderinput.inputType = "Male"
    genderinput.placeholder = "Male"
    genderinput.font = native.newFont("Avenir")
    genderinput.x = 220
    genderinput.y = 280

    local weight = display.newText("Weight", 160, 240, "Avenir", 20)
    weight:setFillColor(0,0,0)
    weight.x = 58
    weight.y = 315

    local weightinput = native.newTextField(160, 240, 220, 30)
    weightinput.inputType = "87kg"
    weightinput.placeholder = "87kg"
    weightinput.font = native.newFont("Avenir")
    weightinput.x = 220
    weightinput.y = 315

    local height = display.newText("Height", 160, 240, "Avenir", 20)
    height:setFillColor(0,0,0)
    height.x = 58
    height.y = 350

    local heightinput = native.newTextField(160, 240, 220, 30)
    heightinput.inputType = "178cm"
    heightinput.placeholder = "178cm"
    heightinput.font = native.newFont("Avenir")
    heightinput.x = 220
    heightinput.y = 350











  local myDropdown

  local dropdownOptions = {
    {
      title     = 'User Profile',
      action    = function() 
        native.showAlert('Dropdown', 'Dropdown', {'Ok'})
      end 
    },
    {
      title     = 'Recipes',
      action    = function() 
        native.showAlert('Dropdown', 'Dropdown', {'Ok'})
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
    width       = 50,
    height      = 50,
    defaultFile = 'assets/backbutton.png',
    overFile    = 'assets/backbutton.png',
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

