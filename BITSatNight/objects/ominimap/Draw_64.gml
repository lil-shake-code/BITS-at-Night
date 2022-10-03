if(instance_exists(oPlayer))
{
	
	
	var bh = camera_get_view_height(view_current)
	var bw = camera_get_view_width(view_current)
	var scale = .4*bw/1300;  //if we want to scale up the font
	var sc = scale*1.5

	
	var x_pos =bw-480*sc-10*sc
	var y_pos = bh-260*sc-5-10*sc

	var mouse__x = device_mouse_x_to_gui(0);
	var mouse__y = device_mouse_y_to_gui(0)
	var alp =0.2
	if((mouse__x>x_pos)and(mouse__y>y_pos))
	{
		alp =0.7;
	}

	if(!mouse_check_button(mb_right))
	{
		draw_sprite_ext(sBITS3,0,x_pos,y_pos,0.1*sc,0.1*sc,0,c_white,alp);
		//draw_sprite_ext(sCavesAndInteriors,0,x_pos,y_pos,0.1*sc,0.1*sc,0,c_white,alp);
		draw_sprite_ext(oPlayer.sprite_index,oPlayer.image_index,
		x_pos+sc*(oPlayer.x)/10,
		y_pos+sc*(oPlayer.y)/10,
		0.6*sc,0.6*sc,oPlayer.image_angle,c_white,1);
		
		with(oEnemy){
		if(body=="P"){
			draw_sprite_ext(sprite_index,image_index,
			x_pos+sc*(x)/10,
			y_pos+sc*(y)/10,
			0.5*sc,0.5*sc,image_angle,c_white,1);
		
		}
		
		}
	}
}