-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


local widget = require("widget")

local logo = display.newImage("logo.png")
logo.x = 160; logo.y = 220

local myTextObject = display.newText("Recipe Finder", 160, 240, "Avenir",45)
print("Hello World!")
myTextObject:setFillColor(0,0,0)
display.setDefault( "background", 1, 1, 1 )
myTextObject.y = 50


local username = native.newTextField(150, 370, 220, 36)

--[[	top = 150,
	left = 20,
	width = 220,
	height = 36,
	cornerRadius = 8,
	strokeWidth = 3, 
	strokeColor = {0,0,0},
	font = "Avenir",
	fontSize = 20
}

)
]]--


	---(150, 370, 220, 36)

username.inputType = "username"
username.placeholder = "username"
local password = native.newTextField(150, 430, 220, 36)
password.inputType = "password"
password.placeholder = "password"


local signin = widget.newButton(
{
	left = 120,
	right = 200,
	id = "signin",
	label = "Default",
	onEvent = handleButtonEvent,
	shape = "roundedRect",
	width =200,
	height = 40,
	cornerRadius = 2,
	fillColor = { default = {165,198,209,0}, over= {165,198,209,0} },
	strokeColor = { default = {1,1,1,1}, over= {1, 0.1,0.7,0.4} },
	strokeWidth = 4




}
	)

signin.y = 480
signin.x = 160
--[[local mytextfield = widget.newTextField (
	{
	top = 10,
	left = 20,
	width = 200,
	height = 30,
	cornerRadius = 8,
	strokeWidth = 3,
	strokeColor = {0,0,0},
	}
	)
--]]
