var bh = camera_get_view_height(view_current)
var bw = camera_get_view_width(view_current)
var scale = .4*bw/1300;  //if we want to scale up the font

draw_set_halign(fa_left);
draw_set_color(c_yellow)
draw_text_transformed(bw*0.01 , bh*0.05 , "FPS : " + string(fps) , 0.3*scale, 0.3*scale ,0 )
if(instance_exists(oPlayer)){
	draw_text_transformed(bw*0.01 , bh*0.1 , "Kills : " + string(score) , 0.3*scale, 0.3*scale ,0 )
	draw_set_color(c_lime)
	var ghosts = 0;
	var players = 0;
	if(instance_exists(oPlayer))
	{
		if(oPlayer.body == "G"){
			ghosts++;
		}
		if(oPlayer.body == "P"){
			players++;
		}
	}
	with(oEnemy){
		if(body=="G") ghosts++;
		if(body=="P") players++
	}
	draw_text_transformed(bw*0.01 , bh*0.15 , "Ghosts left : " + string(ghosts) , 0.3*scale, 0.3*scale ,0 );
	draw_text_transformed(bw*0.01 , bh*0.2 , "Players left : " + string(players) , 0.3*scale, 0.3*scale ,0 )
}

//messages or alerts
if(array_length(global.messages) > 0){
	draw_set_halign(fa_center);
	draw_set_color(c_red);
	draw_set_alpha(global.messages[0][1])
	draw_text_transformed(bw*0.5 , bh*0.1 , global.messages[0][0] , 0.5*scale, 0.5*scale ,0 )
	draw_set_alpha(1);
	global.messages[0][1]  -= 0.5/60 ; //slowly fade away
	
	if(global.messages[0][1] < 0.5){
		array_delete(global.messages , 0,1); //delete the message
	}
	


}


//stats screen
if(alarm[0]==-1 and !instance_exists(oPlayer) and room==rGame){
	draw_set_halign(fa_center)
	draw_set_color(c_white)
	draw_roundrect_ext(bw*0.25 , bh*0.3 , bw*0.75 , bh*0.8 ,70,70, false );
	
	draw_set_color(c_black);
	draw_text_transformed(bw*0.5 , bh*0.4 , "Player Stats" , 1*scale, 1*scale ,0 );
	
	draw_text_transformed(bw*0.5 , bh*0.6 , "You were taken down by "+whoKilledMe , 0.5*scale, 0.5*scale ,0 )
	draw_set_color(c_black);
	draw_text_transformed(bw*0.5 , bh*0.5 , "Kills : "+string(score) , 1*scale, 1*scale ,0 );
	draw_set_color(c_red);
	draw_text_transformed(bw*0.5 , bh*0.7 , "Press F5 to Exit " , 0.7*scale, 0.7*scale ,0 );
	if(keyboard_check(ord("R"))){
		game_restart();
		
	}
}