//Server.js
// Importing the required modules
const WebSocketServer = require('ws');

// Creating a new websocket server
const wss = new WebSocketServer.Server({ port: 3000 })



var players = [];
var clientId = 0;



function stateUpdate() {
    for (let i in players) {
        var sendThis = {
            eventName: "state_update", //grabbing this player's info
            id: players[i].id,
            x: players[i].x,
            y: players[i].y,
            A: players[i].A,
            T: players[i].T,
            H: players[i].H,
            body: players[i].body,
        }

        for (let j in players) {
            players[j].socket.send(JSON.stringify(sendThis)); //sending it to every other player
        }
    }

    setTimeout(stateUpdate, 16);
}

stateUpdate();





function shootBullet(shootersId) {

    var frame = 0

    var init_x = 0;
    var init_y = 0;
    var angle = 0;

    for (let i in players) {
        if (players[i].id == shootersId) {
            init_x = players[i].x;
            init_y = players[i].y;
            angle = players[i].A;
        }
    }



    //trace the trajectory of the bullet
    while (frame < 400) {
        var current_x = init_x + frame * Math.cos(3.1415 / 180 * angle);
        var current_y = init_y - frame * Math.sin(3.1415 / 180 * angle);

        //we have the current coordinates of the bullet. Now check if it is colliding with someone
        for (let i in players) {
            var distance = Math.sqrt((current_x - players[i].x) ** 2 + (current_y - players[i].y) ** 2);
            // console.log(distance)
            if (distance < 16 && players[i].body == "P") {
                if (players[i].id != shootersId) { //make sure friendly fire doesnt exist
                    return players[i].id; //id of the guy who got shot
                }


            }
        }
        frame++;
    }

    return -1; ///-1 means the bullet hasnt hit anyone yet
}


function point_inside_trigon(s, a, b, c) {
    var as_x = s[0] - a[0];
    var as_y = s[1] - a[1];

    var s_ab = (b[0] - a[0]) * as_y - (b[1] - a[1]) * as_x > 0;

    if ((c[0] - a[0]) * as_y - (c[1] - a[1]) * as_x > 0 == s_ab) return false;

    if ((c[0] - b[0]) * (s[1] - b[1]) - (c[1] - b[1]) * (s[0] - b[0]) > 0 != s_ab) return false;

    return true;
}



function isGhostInTorchLight(ghostX, ghostY, torchX, torchY, direction) {
    var ghostRelPosVector = [ghostX - torchX, ghostY - torchY]; //relative position vector of the ghsot wrt player
    var torchRadius = 110;
    var P1 = [
        torchRadius * Math.cos((direction + 40) * 3.14159 / 180), -torchRadius * Math.sin((direction + 40) * 3.14159 / 180),
    ];
    var P2 = [
        torchRadius * Math.cos((direction - 40) * 3.14159 / 180), -torchRadius * Math.sin((direction - 40) * 3.14159 / 180),
    ];

    console.log("ghost in torchlight" + point_inside_trigon(ghostRelPosVector, P1, P2, [0, 0]))

    return point_inside_trigon(ghostRelPosVector, P1, P2, [0, 0]);


}





function ghostHealthReducer() {

    for (let i in players) {
        if (players[i].body == "G") {
            //if this player is a ghost what to do?
            var thisGhostX = players[i].x;
            var thisGhostY = players[i].y;
            //we have the coordinates of the ghost. Now look at real players 
            //Remember that THE MUST HAVE TORCH ON!
            for (let j in players) {
                //now checking for real players
                if (players[j].body == "P" && players[j].T) {
                    //we found a player with torch on 
                    var thisTorchX = players[j].x;
                    var thisTorchY = players[j].y;
                    var thisTorchAngle = players[j].A;

                    //run the other function
                    if (isGhostInTorchLight(thisGhostX, thisGhostY, thisTorchX, thisTorchY, thisTorchAngle)) {
                        players[i].H -= 1; //reduce health by 1 every frame

                        //what if the ghost is dead?
                        //for now just kill the socket
                        if (players[i].H < 0) {
                            players[i].socket.close();
                        }

                    }
                }
            }

        }
    }

    setTimeout(ghostHealthReducer, 1000 / 60)
}
ghostHealthReducer()







wss.on("connection", ws => {
    //code that should execute just after the player connects


    //when the client sends us a message
    ws.on("message", data => {



            var realData = JSON.parse(data);
            var eventName = realData.eventName;
            switch (eventName) {
                case "create_me":
                    console.log(`Client has sent us: ${data}`);
                    clientId++
                    var player = {
                            id: clientId,
                            name: realData.username,
                            socket: ws,
                            x: 2600, //we cam chang this later
                            y: 1850, // we can change this later
                            A: 0, //THE ANGLE
                            T: false, // if torch is on or off
                            H: 100, //health
                            body: "P", //P G or D
                        }
                        //cross ref the id to ws
                    ws.clientId = clientId;

                    players.push(player);

                    //TELL THIS GUY , yes we created u
                    var sendThis = {
                        eventName: "created_you",
                        id: player.id,
                        x: player.x,
                        y: player.y
                    }
                    ws.send(JSON.stringify(sendThis));




                    sendThis = {
                            eventName: "create_player",
                            id: player.id,
                            x: player.x,
                            y: player.y
                        }
                        //tell others about new guy
                    for (let i in players) {

                        players[i].socket.send(JSON.stringify(sendThis));
                    }



                    //TELL new guy about everyobne
                    for (let i in players) {
                        sendThis = {
                            eventName: "create_player",
                            id: players[i].id,
                            name: players[i].name,
                            x: players[i].x,
                            y: players[i].y
                        }



                        ws.send(JSON.stringify(sendThis)) //TELL THE NEW GUY ABOUT OTHERS



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

                    }
                    break;

                case "bullet_shot":
                    console.log(`Client has sent us: ${data}`);
                    //tell others this guy shot a bullet
                    var sendThis = {
                        eventName: "bullet_shot",
                        shooter: realData.id
                    }
                    for (let i in players) {
                        if (i != sendThis.shooter) {
                            players[i].socket.send(JSON.stringify(sendThis));
                        }
                    }
                    var victim = shootBullet(realData.id);
                    if (victim != -1) {


                        console.log("victim is ");
                        console.log(victim)
                            //tell everyone the victim died. Do this by closing that guys websocket
                        for (let i in players) {
                            if (players[i].id == victim) {
                                players[i].H -= 30;

                                if (players[i].H < 0 && players[i].body == "P") {
                                    //Turn him into a ghost
                                    players[i].body = "G";
                                    players[i].H = 100; //reset ghost health to 100
                                }

                            }
                        }
                    }
                    break;
            }
        })
        // handling what to do when clients disconnects from server
    ws.on("close", () => {
        console.log(`Someone disconnected`);
        var sendThis = {
            eventName: "destroy_player",
            id: ws.clientId,
        }


        var deadIndex = 0
        for (let i in players) {
            if (players[i].id == ws.clientId) {
                deadIndex = i;
            }
            players[i].socket.send(JSON.stringify(sendThis));
        }
        players.splice(deadIndex, 1)


    })

    // handling client connection error
    ws.onerror = function() {
        console.log("Some Error occurred");
    }
});
console.log("The WebSocket server is running");