/// @description Insert description here
// You can write your code in this editor
jay++
if(jay mod 30 ==1)
{
	global.leaderboard = [];
	with(oEnemy){
		array_push(global.leaderboard , [enemyUsername,kills , clientId] );

	}
	array_push(global.leaderboard , [global.username,score , global.clientId] );

	//now sort this array - bubble sort
repeat(array_length(global.leaderboard))
{
		for (var i = 0 ; i<array_length(global.leaderboard)  ; i++){
			if(array_length(global.leaderboard)>1  and i< array_length(global.leaderboard)-1)
			{
				if(global.leaderboard[i][1] < global.leaderboard[i+1][1]){
			
					var next = global.leaderboard[i+1]
					global.leaderboard[i+1] = global.leaderboard[i]
					global.leaderboard[i] = next;
	
				}
			}
		}

		//now its sorted. 
		for (var i = 0 ; i<array_length(global.leaderboard) ; i++){
	
			if(global.leaderboard[i][2]==global.clientId){
				ourPos = i
			}
		}
}
}