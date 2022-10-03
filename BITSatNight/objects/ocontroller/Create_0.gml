//GML Create event 
effect_create_above(ef_firework , 0 , 0 ,2 ,c_red)
socket = network_create_socket(network_socket_ws);
network_connect_raw_async(socket , "localhost" ,3000 );

global.clientId = 0;

global.messages = []

whoKilledMe = "";
effectCreator = [0,0 , false]

