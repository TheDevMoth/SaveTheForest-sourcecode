isMouseOver = mouse_over();


//Requirments for the button to be Clickable
if (needsVariablesSet){
	if (setOfVariablesNeeded == ""){
		
	} 
}

//Set of functions
if (buttonClickable){
	if (buttonFunction == "Go To Room"){
		if (isMouseOver && mouse_check_button_released(mb_left)){
			room_goto(roomToGo);
			audio_play_sound(snd_Click, 0, false);
			if (room == rm_Gameover){
				ini_open("STFinfo");
				var oldHighscore = ini_read_real("highscore", "highscore",0);
				ini_close();
				if (global.Score > oldHighscore){
					ini_open("STFinfo");
					ini_write_real("highscore", "highscore", global.Score);
					ini_close();
				}
			}
		}
	} else if (buttonFunction == "Restart Game"){
		if (isMouseOver && mouse_check_button_released(mb_left)){
			audio_play_sound(snd_Click, 0, false);
			if (room == rm_Gameover){
				ini_open("STFinfo");
				var oldHighscore = ini_read_real("highscore", "highscore",0);
				ini_close();
				if (global.Score > oldHighscore){
					ini_open("STFinfo");
					ini_write_real("highscore", "highscore", global.Score);
					ini_close();
				}
			}
			game_restart();
		}
	} else if (buttonFunction == "Quit Game"){
		if (isMouseOver && mouse_check_button_released(mb_left)){
			audio_play_sound(snd_Click, 0, false);
			game_end();
		}
	} else if (buttonFunction == "Normal Mode"){
		if (isMouseOver && mouse_check_button_released(mb_left)){
			global.gameType = "Normal";
			room_goto(roomToGo);
			audio_play_sound(snd_Click, 0, false);
		}
	} else if (buttonFunction == "Arcade Mode"){
		if (isMouseOver && mouse_check_button_released(mb_left)){
			global.gameType = "Arcade";
			room_goto(roomToGo);
			audio_play_sound(snd_Click, 0, false);
		}
	}
}
