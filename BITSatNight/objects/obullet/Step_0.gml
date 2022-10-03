image_alpha-= 0.01
if(place_meeting(x,y,oWall)){
	instance_destroy(id)
}
if(place_meeting(x,y,oPlayer)){
	if(whoFiredMe != global.clientId){
		instance_destroy(id);
	}
}
var enemy_col = instance_place(x,y,oEnemy)
if(enemy_col  != noone){
	if(enemy_col.clientId != whoFiredMe){
		instance_destroy(id);
	}
}
