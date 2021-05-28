/// @desc 
global.showHP = false;
global.gameType = "";
gameWon = false;

ini_open("STFinfo");
var fs = ini_read_real("options","fullscreen", false);
global.resSetting = ini_read_real("options","resSetting", 0);
ini_close();
if (fs){
	window_set_fullscreen(true);
} else {
	window_set_fullscreen(false);
}
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