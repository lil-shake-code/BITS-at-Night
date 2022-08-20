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

