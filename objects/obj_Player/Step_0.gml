/// @desc 
//checks if over water
if ((x_ == 5 && (y_ == 0 || y_ == 1 || y_ == 2)) || (x_ == 4 && (y_ == 2 || y_ == 3 || y_ == 4))){
	overWater = true;
} else {
	overWater = false;
}

//changes sprite according to over water or not
if (overWater){
	switch(sprite_index){
		case spr_Heli_Empty_Onland: sprite_index = spr_Heli_Empty_Onwater break;
		case spr_Heli_Full_Onland: sprite_index = spr_Heli_Full_Onwater break;
	}
} else {
	switch(sprite_index){
		case spr_Heli_Empty_Onwater: sprite_index = spr_Heli_Empty_Onland break;
		case spr_Heli_Full_Onwater: sprite_index = spr_Heli_Full_Onland break;
	}
}

//controls
if (!global.gameover){
if (!(currentlyEmptying || currentlyFilling)){
	if ((keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left)) && x_ != 0){
		x_ -= 1;
		image_xscale = -1;
		alarm[0] = room_speed/3;
	} else if ((keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)) && x_ != 9){
		x_ += 1;
		image_xscale = 1;
		alarm[0] = room_speed/3;
	}
	if ((keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)) && y_ != 0){
		y_ -= 1;
		alarm[0] = room_speed/3;
	} else if ((keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)) && y_ != 4){
		y_ += 1;
		alarm[0] = room_speed/3;
	}
	
	if (keyboard_check_pressed(vk_space) && !isFilled && overWater && !currentlyFilling){
		currentlyFilling = true;
		sprite_index = anim_Heli_Filling;
	} else if (keyboard_check_pressed(vk_space) && isFilled && !overWater && !currentlyEmptying){
		currentlyEmptying = true;
		audio_play_sound(snd_Water,-1,false)
		sprite_index = spr_Heli_Emptying;
	}
}
}

//Heli filling/emptying animation managment
if (currentlyFilling){
	if(Animation_end()){
		sprite_index = spr_Heli_Full_Onwater;
		isFilled = true;
		currentlyFilling = false;
		if ((keyboard_check(ord("A")) || keyboard_check(vk_left)) && x_ != 0){
			x_ -= 1;
			image_xscale = -1;
			alarm[0] = room_speed/5.5;
		} else if ((keyboard_check(ord("D")) || keyboard_check(vk_right)) && x_ != 9){
			x_ += 1;
			image_xscale = 1;
			alarm[0] = room_speed/5.5;
		}
		if ((keyboard_check(ord("W")) || keyboard_check(vk_up)) && y_ != 0){
			y_ -= 1;
			alarm[0] = room_speed/5.5;
		} else if ((keyboard_check(ord("S")) || keyboard_check(vk_down)) && y_ != 4){
			y_ += 1;
			alarm[0] = room_speed/5.5;
		}
	}
} else if (currentlyEmptying){
	if (Animation_end()){
		sprite_index = spr_Heli_Empty_Onland;
		isFilled = false;
		currentlyEmptying = false;
		var fireQuenched = instance_position(obj_GameControl._x[|x_], obj_GameControl._y[|y_], obj_Fire);
		if (fireQuenched != noone){
			fireQuenched.fireGoing = false;
		}
		var nearbyFires = ds_list_create();
		if (instance_position(x-34, y, obj_Fire) != noone){
			ds_list_add(nearbyFires, instance_position(obj_GameControl._x[|x_-1], obj_GameControl._y[|y_], obj_Fire));
		}
		if (instance_position(x+34, y, obj_Fire) != noone){
			ds_list_add(nearbyFires, instance_position(obj_GameControl._x[|x_+1], obj_GameControl._y[|y_], obj_Fire));
		}
		if (instance_position(x, y-34, obj_Fire) != noone){
			ds_list_add(nearbyFires, instance_position(obj_GameControl._x[|x_], obj_GameControl._y[|y_-1], obj_Fire));
		}
		if (instance_position(x, y+34, obj_Fire) != noone){
			ds_list_add(nearbyFires, instance_position(obj_GameControl._x[|x_], obj_GameControl._y[|y_+1], obj_Fire));
		}
		if (!ds_list_empty(nearbyFires)){
			for(var i = 0; i < ds_list_size(nearbyFires); i++){
				with(nearbyFires[|i]){
					var reduction = random_range(0.5, 0.65);
					var scaleReduction = image_xscale*reduction;
					image_xscale -= scaleReduction;
					image_yscale -= scaleReduction
					var multiplierReduction = 3*reduction;
					//if (multiplierReduction >= (3-(10/6))){
					//	multiplierReduction = 3-(11/6);
					//}
					if (multiplier - multiplierReduction < 0){
						fireGoing = false;
					} else {
						multiplier -= multiplierReduction
					}
				}
			}
		}
		if ((keyboard_check(ord("A")) || keyboard_check(vk_left)) && x_ != 0){
			x_ -= 1;
			image_xscale = -1;
			alarm[0] = room_speed/5.5;
		} else if ((keyboard_check(ord("D")) || keyboard_check(vk_right)) && x_ != 9){
			x_ += 1;
			image_xscale = 1;
			alarm[0] = room_speed/5.5;
		}
		if ((keyboard_check(ord("W")) || keyboard_check(vk_up)) && y_ != 0){
			y_ -= 1;
			alarm[0] = room_speed/5.5;
		} else if ((keyboard_check(ord("S")) || keyboard_check(vk_down)) && y_ != 4){
			y_ += 1;
			alarm[0] = room_speed/5.5;
		}
	}
}

//moves the player over the grid
x = obj_GameControl._x[|x_];
y = obj_GameControl._y[|y_];