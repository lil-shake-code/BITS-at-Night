//GML Create event 
effect_create_above(ef_firework , 0 , 0 ,2 ,c_red)
socket = network_create_socket(network_socket_ws);
var serverAddress = get_string("Enter Server Address" , "localhost")
var serverPort = get_integer("Enter Server Port" , 3000)
network_connect_raw_async(socket , serverAddress ,serverPort );


global.clientId = 0;

global.messages = []

whoKilledMe = "";
effectCreator = [0,0 , false]

