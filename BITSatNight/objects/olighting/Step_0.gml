//adjust global.darkness here
var standardDarkness = 0.9
var ghostDarkness = 0.5
global.darkness = global.darkness*0.7+0.3*(standardDarkness)
if(oPlayer.body == "G"){

	global.darkness = global.darkness*0.7+0.3*(ghostDarkness)
}