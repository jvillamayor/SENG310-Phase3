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
    email.y = 205


    local emailinput = native.newTextField(160, 240, 220, 30)
    emailinput.inputType = "user@gmail.com"
    emailinput.placeholder = "user@gmail.com"
    emailinput.font = native.newFont("Avenir")
    emailinput.x = 200
    emailinput.y = 205
    sceneGroup:insert(emailinput)


    local age = display.newText("Age", 160, 240, "Avenir", 20)
    age:setFillColor(0,0,0)
    age.x = 45
    age.y = 240

    local ageinput = native.newTextField(160, 240, 220, 30)
    ageinput.inputType = "11/10/1994"
    ageinput.placeholder = "11/10/1994"
    ageinput.font = native.newFont("Avenir")
    ageinput.x = 200
    ageinput.y = 240

    local gender = display.newText("Gender", 160, 240, "Avenir", 20)
    gender:setFillColor(0,0,0)
    gender.x = 58
    gender.y = 275

    local genderinput = native.newTextField(160, 240, 220, 30)
    genderinput.inputType = "Male"
    genderinput.placeholder = "Male"
    genderinput.font = native.newFont("Avenir")
    genderinput.x = 220
    genderinput.y = 275

    local weight = display.newText("Weight", 160, 240, "Avenir", 20)
    weight:setFillColor(0,0,0)
    weight.x = 58
    weight.y = 310

    local weightinput = native.newTextField(160, 240, 220, 30)
    weightinput.inputType = "87kg"
    weightinput.placeholder = "87kg"
    weightinput.font = native.newFont("Avenir")
    weightinput.x = 220
    weightinput.y = 310

    local height = display.newText("Height", 160, 240, "Avenir", 20)
    height:setFillColor(0,0,0)
    height.x = 55
    height.y = 345

    local heightinput = native.newTextField(160, 240, 220, 30)
    heightinput.inputType = "178cm"
    heightinput.placeholder = "178cm"
    heightinput.font = native.newFont("Avenir")
    heightinput.x = 220
    heightinput.y = 345

    local diet = display.newText("Dietary Restrictions", 160, 240, "Avenir", 20)
    diet:setFillColor(0,0,0)
    diet.x = 110
    diet.y = 380

    local update = display.newText("Update", 160, 240, "Avenir", 18)
    update:setFillColor(0,0,0)
    update.x = 270
    update.y = 490


    local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
    end
     
    local peanut = display.newText("Peanut", 160, 240, "Avenir", 15)
    peanut:setFillColor(0,0,0)
    peanut.x = 108
    peanut.y = 408

    local peanutButton = widget.newSwitch(
        {
            left = 250,
            top = 200,
            style = "checkbox",
            id = "Checkbox",
            onPress = onSwitchPress
        }
    )
    peanutButton:scale(0.5,0.5)
    peanutButton.x = 60
    peanutButton.y = 408

    local milk = display.newText("Milk", 160, 240, "Avenir", 15)
    milk:setFillColor(0,0,0)
    milk.x = 100
    milk.y = 428

    local milkButton = widget.newSwitch(
        {
            left = 250,
            top = 200,
            style = "checkbox",
            id = "Checkbox",
            onPress = onSwitchPress
        }
    )
    milkButton:scale(0.5,0.5)
    milkButton.x = 60
    milkButton.y = 428

    local egg = display.newText("Egg", 160, 240, "Avenir", 15)
    egg:setFillColor(0,0,0)
    egg.x = 100
    egg.y = 448

    local eggButton = widget.newSwitch(
        {
            left = 250,
            top = 200,
            style = "checkbox",
            id = "Checkbox",
            onPress = onSwitchPress
        }
    )
    eggButton:scale(0.5,0.5)
    eggButton.x = 60
    eggButton.y = 448

        
    local vegan = display.newText("Vegan", 160, 240, "Avenir", 15)
    vegan:setFillColor(0,0,0)
    vegan.x = 108
    vegan.y = 468

    local veganButton = widget.newSwitch(
        {
            left = 250,
            top = 200,
            style = "checkbox",
            id = "Checkbox",
            onPress = onSwitchPress
        }
    )
    veganButton:scale(0.5,0.5)
    veganButton.x = 60
    veganButton.y = 468










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

