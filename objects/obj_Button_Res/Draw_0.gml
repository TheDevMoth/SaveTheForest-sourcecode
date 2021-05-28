draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(txtFont);

if (mouse_check_button(mb_left) && isMouseOver){
	draw_sprite_ext(sprite, 1, x, y, 2, 2, 0, c_white, 1);
} else if (isMouseOver) {
	draw_sprite_ext(sprite, 2, x, y, 2, 2, 0, c_white, 1);
} else {
	draw_sprite_ext(sprite, 0, x, y, 2, 2, 0, c_white, 1);
}

switch (global.resSetting){
	case 0:
		var txt = "Small";
	break;
	
	case 1:
		var txt = "Medium";
	break;
	
	case 2:
		var txt = "Large";
	break;
}

draw_set_color(txtColor);
if (fontSize == "Big"){
	draw_text_transformed(x, y, txt, 1.5, 1.5, 0);
} else if (fontSize == "Small"){
	draw_text_transformed(x, y, txt, 0.8, 0.8, 0);
} else if (fontSize == "Med") {
	draw_text_transformed(x, y, txt, 1, 1, 0);
}

/*
if (mouse_check_button(mb_left) && isMouseOver){
	draw_sprite_ext(Sprite, 0, x, y, 1, 1, 0, $FFD7F7FD, 1);
} else {
	draw_self();
}
*/