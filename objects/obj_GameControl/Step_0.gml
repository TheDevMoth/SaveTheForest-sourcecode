/// @desc 
if (instance_number(obj_TreePlot) < 20 && !global.gameover){
	global.gameover = true;
	alarm[1] = 3*room_speed;
	alarm[0] = -1;
	if (global.gameType = "Normal"){
		obj_Rooms.gameWon = false;
		losingTime = current_time;
	}
	audio_play_sound(snd_lose, 1, false);
}

//if (global.gameType == "Normal" && current_time >= endTime && !global.gameover){
//	
//}