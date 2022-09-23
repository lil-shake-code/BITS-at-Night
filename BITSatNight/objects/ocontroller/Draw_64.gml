var bh = camera_get_view_height(view_current)
var bw = camera_get_view_width(view_current)
var scale = .4*bw/1300;  //if we want to scale up the font

draw_set_halign(fa_left);
draw_set_color(c_yellow)
draw_text_transformed(bw*0.01 , bh*0.05 , "FPS : " + string(fps) , 0.3*scale, 0.3*scale ,0 )
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


//messages or alerts
if(array_length(global.messages > 0)){
	draw_set_halign(fa_center);
	draw_text_transformed(bw*0.05 , bh*0.1 , global.messages[0][0] , 0.3*scale, 0.3*scale ,global.messages[0][1] )
	global.messages[0][1]  -= 0.5/60 ; //slowly fade away
	
	if(global.messages[0][1] < 0.5){
		array_delete(global.messages , 0,1); //delete the message
	}
	


}