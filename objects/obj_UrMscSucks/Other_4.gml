/// @desc
var audioWasOn = false;
if (audio_is_playing(music)){
	audio_stop_sound(music);
	audioWasOn = true;
}

if (room == rm_StartMenu){
	music = snd_birbs;
} else if (room == rm_Game){
	music = snd_msc;
} else if (room == rm_Gameover){
	if (obj_Rooms.gameWon){
		music = snd_birbs;
	} else {
		music = snd_nosnd;
	}
}

if (audioWasOn){
	audio_play_sound(music,0,true);
}