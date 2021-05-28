/// @desc 
draw_self();

if (global.showHP == true && hp < 93){
	xx = 18*(hp/100);
	draw_line_width_color(x-9,y+14, (x-9)+xx, y+14, 2, $FFC0EEE3, $FFC0EEE3);
	image_alpha = 1
} else {
	image_alpha = hp/100;
}