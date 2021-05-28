/// @desc 
if (fireGoing){
	image_xscale = Approach(image_xscale, 1, (1/30)/(room_speed));
	image_yscale = Approach(image_yscale, 1, (1/30)/(room_speed));
	multiplier = Approach(multiplier, 3, (3/30)/(room_speed));
} else {
	if (sprite_index != spr_Vapor){
		sprite_index = spr_Vapor;
		plotID.state = "Normal";
		plotID.fireAnimaionPlaying = false;
		global.Score += (100/3)*multiplier;
		multiplier = 0;
		//image_alpha = 1;
	}
	if (Animation_end()){
		instance_destroy();
	}
}
if (multiplier < 0 && fireGoing == true){
	fireGoing = false;
}

if !(fireGoing){
	if (global.showHP == true){
		image_alpha = 1;
	} else {
		image_alpha = 0.7;
	}
} else {
		if (global.showHP == true){
		image_alpha = 1;
	} else {
		image_alpha = 0.9;
	}

}