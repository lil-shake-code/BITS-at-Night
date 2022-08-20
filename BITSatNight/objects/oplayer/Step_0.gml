
var move = keyboard_check(ord("W")) - keyboard_check(ord("S"))
speed = 3*move


if(point_distance(x,y, mouse_x , mouse_y) > 30){
	direction = point_direction(x,y, mouse_x , mouse_y);
	
}


if(position_meeting(x + lengthdir_x(speed , direction),y +  lengthdir_y(speed , direction),oWall)){
	//colliding with a wall - no freedom in image angle , only in direction
	speed =0
	
	
}else{
	//not colliding with a wall
	image_angle = direction;

}