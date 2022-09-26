/// @description Insert description here
// You can write your code in this editor

leaderboard = [];
with(oEnemy){
	array_push(leaderboard , [enemyUsername,kills] );

}
array_push(leaderboard , [global.username,score] );

//now sort this array - bubble sort
for (var i = 0 ; i<array_length(leaderboard) -1; i++){
	
	if(leaderboard[i][1] < leaderboard[i+1][1]){
		var next = leaderboard[i+1][1]
		leaderboard[i+1] = leaderboard[i]
		leaderboard[i] = next;
	
	}
}
//now its sorted. 