//adjust global.darkness here
var standardDarkness = 0.93
var ghostDarkness = 0.5
global.darkness = global.darkness*0.7+0.3*(standardDarkness)
if(instance_exists(oPlayer)){
	if(oPlayer.body == "G"){

		global.darkness = global.darkness*0.7+0.3*(ghostDarkness)
	}
}
jay++;
if(jay mod 5 ==0){
	streetlights = random(1)
}