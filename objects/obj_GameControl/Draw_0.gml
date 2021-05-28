/// @desc 
draw_set_color($FFC0EEE3);
draw_set_font(fnt_overall);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

if (global.gameType == "Normal"){
	timeLeft = (endTime-current_time)/1000;
	if (losingTime > 0){
		timeLeft = (endTime-losingTime)/1000;
	} else if (timeLeft < 0){
		timeLeft = 0;
	}
	draw_text_transformed(room_width/20, room_height/15,"Time left: "+ string(ceil(timeLeft)), 1, 1, 0);
} else {
	draw_text_transformed(room_width/20, room_height/15,"Score: "+ string(round(global.Score)), 1, 1, 0);
}
draw_text_transformed(room_width*14/20, room_height/15,"Trees left: "+ string(instance_number(obj_TreePlot)-19), 1, 1, 0);
