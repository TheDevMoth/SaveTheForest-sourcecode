canClick = mouse_over();

if (room == rm_StartMenu){
	music = snd_birbs;
} else if (room == rm_Game){
	music = snd_msc;
} else if (room == rm_Gameover){
	music = snd_nosnd
}

if (canClick == true) {
	if (mouse_check_button_released(mb_any)){
		ini_open("STFinfo");
		if (audio_is_playing(music)){
			audio_stop_sound(music);
			ini_write_real("options", "music", false);
		} else {
			ini_write_real("options", "music", true);
			audio_play_sound(music, 0, true);
		}
		ini_close();
	}	
}

if (keyboard_check_released(ord("M"))) {
	ini_open("STFinfo");
	if (audio_is_playing(music)){
		audio_stop_sound(music);
		ini_write_real("options", "music", false);
	} else {
		audio_play_sound(music, 0, true);
		ini_write_real("options", "music", true);
	}
	ini_close();
}
if (audio_is_playing(music)){
	image_index = 0;
} else {
	image_index = 1;
}
