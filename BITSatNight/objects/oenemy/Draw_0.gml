if(body == "P")
{
	if(blink >0){
		shader_set(shWhite);
		draw_self();
		shader_reset();
		blink--;
	}else{

		draw_self();
	}
}else{
	draw_self();
}



//health change
if(enemyHealth != oldHealth and body=="P"){
	oldHealth = enemyHealth;
	blink = 6;

}


//draw healthbar
if(body == "P") draw_healthbar(x-10 , y-10-2 , x+10 , y-10+2 , enemyHealth , c_black , c_red ,c_green , 1 , true ,true)


//ghosts sprite
if(body=="G"){
	sprite_index = sGhost
	if(speed==0){
		image_speed = 0;
	}else{
		image_speed = 1;
	}
	
}

if(body=="G" and !isGhost){
	isGhost = true;
	effect_create_above(ef_firework,x,y,0,c_red);
}