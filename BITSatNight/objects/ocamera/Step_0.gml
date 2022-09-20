//set up camera
cam = view_camera[0];
follow = oPlayer; //returns id of first insatnce of oplayer
//view_w_half = camera_get_view_width(cam)*0.5;
//view_h_half = camera_get_view_height(cam)*0.5;
xTo = xstart;
yTo = ystart;


//check whatever object it is stalking
if (instance_exists(follow))
{
	
	xTo = follow.x;
	yTo = follow.y;
	xOld = follow.x
	yOld = follow.y;
	

}
else
{
	xTo = xOld;
	yTo = yOld;
	
}
	//update object position with smooooooothness
	if(instance_exists(oPlayer))
	{
	x += (xTo-x)/6;
	y += (yTo-y)/6
	}
	else
	{
	x += (xTo-x)/40;
	y += (yTo-y)/40
	}
	




//clamps
x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half);


//screenshake
 x+= random_range(-shake_remain,shake_remain)
  y+= random_range(-shake_remain,shake_remain)
shake_remain = max(0,shake_remain-(shake_magnitude/shake_length))



//setting the camera to this objects x and y
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

//if ghost dont play music
if(oPlayer.body == "G"){
	audio_stop_sound(themeMusic);
}

//if you are a P and theres a G very close by transition to jumpscare
if(oPlayer.body == "P"){
	var closestGhost = noone;
	var closestGhostDistance = 100000;
	with(oEnemy){
		if(body == "G"){
			if( distance_to_object(oPlayer) < closestGhostDistance  )
			{
				closestGhostDistance = distance_to_object(oPlayer) ;
				closestGhost = id;
			}
		}
	}
	var ghostNearby = false;
	if(closestGhost != noone){
		if(point_distance(oPlayer.x , oPlayer.y , closestGhost.x,closestGhost.y) < 100){
			ghostNearby = true;
		}
	
		if(ghostNearby and ! audio_is_playing(TransitionToJumpscare)){
			audio_play_sound(TransitionToJumpscare , 2 , true);
		
		}
		  
	}
	if(!ghostNearby) {
		audio_stop_sound(TransitionToJumpscare);
	}
}else{
	audio_stop_sound(TransitionToJumpscare);
}

audio_listener_position(x,y,0)
var players = instance_number(oEnemy)
if players<2 players =2;
global.falloff_factor = players*3
global.half_sound = 100/(ln(players))
