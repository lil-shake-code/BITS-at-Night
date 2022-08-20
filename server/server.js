//Server.js
// Importing the required modules
const WebSocketServer = require('ws');

// Creating a new websocket server
const wss = new WebSocketServer.Server({ port: 3000 })



var players = [];
var clientId = 0;



wss.on("connection", ws => {
    //code that should execute just after the player connects


    //when the client sends us a message
    ws.on("message", data => {
            console.log(`Client has sent us: ${data}`);


            var realData = JSON.parse(data);
            var eventName = realData.eventName;
            switch (eventName) {
                case "create_me":
                    clientId++
                    var player = {
                        id: clientId,
                        name: realData.username,
                        socket: ws,
                        x: 2600, //we cam chang this later
                        y: 1850, // we can change this later
                        A: 0, //THE ANGLE
                        T: false, // if torch is on or off
                    }
                    players.push(player);

                    //TELL THIS GUY , yes we created u
                    var sendThis = {
                        eventName: "created_you",
                        id: player.id,
                        x: player.x,
                        y: player.y
                    }
                    ws.send(JSON.stringify(sendThis));





                    //TELL EVERYONE A NEW PLAYER JOINED
                    for (let i in players) {
                        var sendThis = {
                                eventName: "create_player",
                                id: player.id,
                                name: player.name,
                                x: player.x,
                                y: player.y
                            }
                            //send this to everyoen except the guy who joined
                        if (players[i].id != clientId) {
                            players[i].socket.send(JSON.stringify(sendThis));
                            ws.send(JSON.stringify(sendThis)) //TELL THE NEW GUY ABOUT OTHERS
                        }


                    }

                    break;






                case "state_update":
                    for (let i in players) {
                        if (players[i].id == realData.id) {
                            players[i].x = realData.x;
                            players[i].y = realData.y;
                            players[i].A = realData.A;
                            players[i].T = realData.T;


                        }
                        console.log(players);
                    }
                    break;
            }
        })
        // handling what to do when clients disconnects from server
    ws.on("close", () => {
        console.log(`Someone disconnected`);
    })

    // handling client connection error
    ws.onerror = function() {
        console.log("Some Error occurred");
    }
});
console.log("The WebSocket server is running");