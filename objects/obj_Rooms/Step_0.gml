/// @desc 
switch(room){
	case rm_StartMenu:
		if(keyboard_check_released(vk_space)){
			room_goto(rm_Game);
		}
	break;
	
	case rm_Game:
		if(keyboard_check_released(vk_escape)){
			game_restart();
		} else if (keyboard_check_released(ord("H"))){
			if (global.showHP){
				global.showHP = false;
			} else {
				global.showHP = true;
			}
		}
	break;
	
	case rm_Gameover:
		if(keyboard_check_released(vk_space)){
			room_goto(rm_Game);
		} else if(keyboard_check_released(vk_escape)){
			game_restart();
		} 
	break;
	
	case rm_HowToPlay:
		if(keyboard_check_released(vk_escape)){
			room_goto(rm_StartMenu);
		}
	break;
}

