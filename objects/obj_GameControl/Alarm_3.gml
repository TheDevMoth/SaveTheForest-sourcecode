/// @desc Time over
global.gameover = true;
alarm[1] = 3*room_speed;
obj_Rooms.gameWon = true;
obj_Rooms.treesLeft = instance_number(obj_TreePlot)-19;
audio_play_sound(snd_win, 1, false);
alarm[0] = -1;