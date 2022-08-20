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
		
				var new_enemy = instance_create_layer(0,0,"Instances" , oEnemy)
				new_enemy.clientId = real(realData[?"id"])
				new_enemy.x = real(realData[?"x"])
				new_enemy.y = real(realData[?"y"])
				new_enemy.enemyUsername = (realData[?"name"])
				break;
		
		
		}
		
		ds_map_destroy(realData);
		buffer_delete(buffer_raw)
	break;




}