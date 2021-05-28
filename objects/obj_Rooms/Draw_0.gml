/// @desc 
draw_set_color($FFC0EEE3);
draw_set_font(fnt_overall);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

switch(room){
	case rm_StartMenu:
		draw_set_halign(fa_left);
		draw_text_transformed(room_width/30, room_height/10,"Save the Forest", 1.6, 1.6, 0);
		draw_set_halign(fa_center);
	break;
	
	case rm_Game:
	
	break;
	
	case rm_Gameover:
		if(global.gameType == "Normal" && gameWon){
			draw_text_transformed(room_width/2, room_height/4, "Help Has arrived!", 2, 2, 0);
			draw_text(room_width/2, room_height/3, "You were able to save " + string(treesLeft) + " tree plots!");
		} else {
			draw_text_transformed(room_width/2, room_height/4, "The forest has suffered too much damage.", 1, 1, 0);
			if (global.gameType != "Normal"){ 
				ini_open("STFinfo");
				var oldHighscore = ini_read_real("highscore", "highscore",0);
				ini_close();
				if (global.Score > oldHighscore){
					draw_text(room_width/2, room_height/3, "You have a new Highscore! "+string(round(global.Score)));
				} else {
					draw_text(room_width/2, room_height/3, "Your score was: "+string(round(global.Score))+"\nYour Highscore is: " + string(round(oldHighscore)));
				}
			}
		}
		
	break;
	
	case rm_HowToPlay:
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(room_width/25, room_height/20, "You operate a fire fighting helicopter, \n\nUse Arrows or WASD to move.\nYou can refill your water at the river with Space.\n\nFires spread to nearby trees when the tree chunk \nis completly burned.\nLuckly your water affects nearby tree chunks too.\n\nIf the forest only has 20 tree chunks left \nbefore help arrives\nthe forest will have suffered too much damage.");
		draw_set_valign(fa_center);
		draw_text_transformed(obj_Button.x+(2*sprite_get_xoffset(obj_Button)), obj_Button.y, "Space: Continue\nEsc: Go To start\nM: Toggle music\nH: Toggle Health Bars", 0.8, 0.8, 0);
		draw_set_halign(fa_center);
	break;
	
	case rm_Credits:
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(room_width/4.5, room_height/1.25, "Game design and development    Music by:\nby Mohammed Abushawarib        5pr1n6");
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		draw_text(room_width/(4/3), room_height/(13/3), "Fullscreen/Windowed")
		draw_text(room_width/(4), room_height/(13/3), "Window Size")
	break;
}