if(blink >0){
	shader_set(shWhite);
	draw_self();
	shader_reset();
	blink--;
}else{

	draw_self();
}


//draw healthbar
//if(body == "P") 
draw_healthbar(x-10 , y-10-2 , x+10 , y-10+2 , health , c_black , c_red ,c_green , 1 , true ,true)