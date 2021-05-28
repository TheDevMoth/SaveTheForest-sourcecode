isMouseOver = mouse_over();

//Set of functions
if (isMouseOver && mouse_check_button_released(mb_left)){
	if (window_get_fullscreen()){
		window_set_fullscreen(false);
		alarm[0] = 1;
		ini_open("STFinfo");
		ini_write_real("options","fullscreen", false);
		ini_close();
		switch (global.resSetting){
			case 0:
				window_set_size(768,432);
			break;
	
			case 1:
				window_set_size(1152,648);
			break;
	
			case 2:
				window_set_size(1920,1080);
			break;
		}
	} else {
		window_set_fullscreen(true);
		ini_open("STFinfo");
		ini_write_real("options","fullscreen", true);
		ini_close();
	}
	audio_play_sound(snd_Click, 0, false);
	
}
