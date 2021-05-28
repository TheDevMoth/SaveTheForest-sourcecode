/// @desc 
if (!(currentlyEmptying || currentlyFilling)){
	if ((keyboard_check(ord("A")) || keyboard_check(vk_left)) && !(keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left)) && x_ != 0){
		x_ -= 1;
		image_xscale = -1;
		alarm[0] = room_speed/5.5;
	} else if ((keyboard_check(ord("D")) || keyboard_check(vk_right)) && !(keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)) && x_ != 9){
		x_ += 1;
		image_xscale = 1;
		alarm[0] = room_speed/5.5;
	}
	if ((keyboard_check(ord("W")) || keyboard_check(vk_up)) && !(keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)) && y_ != 0){
		y_ -= 1;
		alarm[0] = room_speed/5.5;
	} else if ((keyboard_check(ord("S")) || keyboard_check(vk_down)) && !(keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)) && y_ != 4){
		y_ += 1;
		alarm[0] = room_speed/5.5;
	}
}