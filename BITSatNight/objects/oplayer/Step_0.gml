
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

		//telling the server our latest coordinates and angle
		var Buffer = buffer_create(1, buffer_grow ,1);
		var data = ds_map_create();
		data[? "eventName"] = "state_update"
		data[?"x"] =  floor(x);
		data[?"y"] =  floor(y);
		data[?"A"] = floor(direction);
		data[?"T"] = global.torch;
	
		data[?"id"] =  global.clientId;
		
	
		buffer_write(Buffer , buffer_text  , json_encode(data));
		network_send_raw(oController.socket , Buffer , buffer_tell(Buffer));
		ds_map_destroy(data);
		buffer_delete(Buffer)
		
//torch
if(mouse_check_button_pressed(mb_right)){
	global.torch = !global.torch;
}



//shooting
if(mouse_check_button_pressed(mb_left) and reloading <0){
	var bullet = instance_create_layer(x +lengthdir_x(13 ,direction -85) ,y+lengthdir_y(13 ,direction-85)  ,"Instances",oBullet);
	bullet.speed = 10;
	bullet.direction = direction;
	bullet.image_angle = bullet.direction;
	reloading = 20;
	
	//recoil animation
	if(position_meeting(x - lengthdir_x(10 , direction),y -  lengthdir_y(10, direction),oWall)){
	//colliding with a wall 
	speed =0
	
	
	}else{
		//not colliding with a wall
		x -= lengthdir_x(10 , direction)
		y -= lengthdir_y(10 , direction)
	}
	
	
	
	
	//telling the server we shot a bullet
		var Buffer = buffer_create(1, buffer_grow ,1);
		var data = ds_map_create();
		data[? "eventName"] = "bullet_shot"
		data[?"id"] =  global.clientId;
		
	
		buffer_write(Buffer , buffer_text  , json_encode(data));
		network_send_raw(oController.socket , Buffer , buffer_tell(Buffer));
		ds_map_destroy(data);
		buffer_delete(Buffer)
}

reloading--;

