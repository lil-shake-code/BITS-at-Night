switch(async_load[?"type"]){
	case network_type_non_blocking_connect:
	//code that executes once we have confirmed a connection with the server
	show_message("we have connected to server")
	break;
	
	
	case network_type_data:
	
		//how we read data from the server
		var buffer_raw = async_load[? "buffer"];
		var buffer_processed = buffer_read(buffer_raw , buffer_text);
		var realData = json_decode(buffer_processed);
		var eventName = realData[?"eventName"];
		
		switch(eventName){
			case "some_event":
				//what to do with this event?
				break;
				
			case "created_you":
				global.clientId = real(realData[?"id"])
				oPlayer.x = real(realData[?"x"])
				oPlayer.y = real(realData[?"y"])
				break;
				
			case "create_player":  //create an enemy
		
				if(real(realData[?"id"])  !=  global.clientId){
					var new_enemy = instance_create_layer(0,0,"Instances" , oEnemy)
					new_enemy.clientId = real(realData[?"id"])
					new_enemy.x = real(realData[?"x"])
					new_enemy.y = real(realData[?"y"])
					new_enemy.enemyUsername = (realData[?"name"])
				}
				break;
				
			case "state_update":
				
				with(oEnemy){
					if(clientId == (realData[?"id"]) ){
					//we found the right enemy to update pos of
					x = x*0.5 + 0.5* real(realData[?"x"]);
					y = y*0.5 + 0.5* real(realData[?"y"]);
					image_angle = real(realData[?"A"]);
					torch = realData[?"T"]
					enemyHealth = real(realData[?"H"]);
					body = realData[?"body"]
					
					}
				}
				if(global.clientId == (realData[?"id"])){
					health  = real(realData[?"H"]);
					oPlayer.body = realData[?"body"]
				
				}
			break;
			
			
			case "destroy_player":
				
				with(oEnemy){
					if(clientId == real(realData[?"id"]) ){
						instance_destroy(id);
					
					}
				}
			break;
			
			case "bullet_shot":
				
				with(oEnemy){
					if(clientId == real(realData[?"shooter"]) ){
						//creating a bullet
						var bullet = instance_create_layer(x +lengthdir_x(13 ,id.image_angle -85) ,y+lengthdir_y(13 ,id.image_angle-85)  ,"Instances",oBullet);
						bullet.speed = 10;
						bullet.direction = id.image_angle;
						bullet.image_angle = bullet.direction;
						
	
				
					}
				}
			break;
			
			case "jumpscare":
				//show_message("You got jumpscared")
				instance_create_layer(10000,10000,"Jumpscare",oJumpscare)
				audio_play_sound(SoundJumpscare , 3 , false);
			break;
		
		
		}
		
		ds_map_destroy(realData);
		buffer_delete(buffer_raw)
	break;




}