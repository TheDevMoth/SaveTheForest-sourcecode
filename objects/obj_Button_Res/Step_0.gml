isMouseOver = mouse_over();

//Set of functions
if (isMouseOver && mouse_check_button_released(mb_left)){
	ini_open("STFinfo")
	if !(global.resSetting >=2){
		global.resSetting += 1;
	} else {
		global.resSetting = 0;
	}
	ini_write_real("options","resSetting", global.resSetting);
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
	alarm[0] = 1;
	audio_play_sound(snd_Click, 0, false);
}
