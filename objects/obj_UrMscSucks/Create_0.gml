music = snd_birbs;
ini_open("STFinfo");
var turnMusicOn = ini_read_real("options", "music", true);
ini_close();
if (turnMusicOn){
	audio_play_sound(music, 0, true);
}