/// @desc 
#region Normal
if (state == "Normal"){
	hp = Approach(hp, 100, (100/(180))/room_speed);
#endregion

#region On Fire
} else if(state == "On Fire"){
	if (!fireAnimaionPlaying){
		fireID = instance_create_layer(x, y, "Fire", obj_Fire);
		fireID.plotID = id;
		fireAnimaionPlaying = true
	}
	if (global.gameType = "Normal" && global.gameover = true){
	} else {
		hp = Approach(hp, 0, fireID.multiplier/room_speed);
	}
}
#endregion

if (hp <= 0){
	#region chance stuff
	chance = irandom(99);
	if (chance > 98){
		BurnEastTree(id);
		BurnNorthTree(id);
		BurnSouthTree(id);
		BurnWestTree(id);
	} else if (chance > 85){
		var burnedTrees = NumberOfRandomNumbers(3, 3);
		if (ds_list_find_index(burnedTrees, 0) != -1){
			BurnEastTree(id);
		}
		if (ds_list_find_index(burnedTrees, 1) != -1){
			BurnNorthTree(id);
		}
		if (ds_list_find_index(burnedTrees, 2) != -1){
			BurnSouthTree(id);
		}
		if (ds_list_find_index(burnedTrees, 3) != -1){
			BurnWestTree(id);
		}
	} else if (chance > 49){
		var burnedTrees = NumberOfRandomNumbers(2, 3);
		if (ds_list_find_index(burnedTrees, 0) != -1){
			BurnEastTree(id);
		}
		if (ds_list_find_index(burnedTrees, 1) != -1){
			BurnNorthTree(id);
		}
		if (ds_list_find_index(burnedTrees, 2) != -1){
			BurnSouthTree(id);
		}
		if (ds_list_find_index(burnedTrees, 3) != -1){
			BurnWestTree(id);
		}
	} else {
		var burnedTrees = NumberOfRandomNumbers(1, 3)
		if (ds_list_find_index(burnedTrees, 0) != -1){
			BurnEastTree(id);
		}
		if (ds_list_find_index(burnedTrees, 1) != -1){
			BurnNorthTree(id);
		}
		if (ds_list_find_index(burnedTrees, 2) != -1){
			BurnSouthTree(id);
		}
		if (ds_list_find_index(burnedTrees, 3) != -1){
			BurnWestTree(id);
		}
	}
	//I should make it so if chance gives num_of_Nums then insert in the function but lazy, supa lazy
	
	#endregion
	instance_destroy(fireID);
	instance_destroy();
	ds_list_add(obj_GameControl.burntTreePlots,id)
}

//image_alpha = hp/100;

if (keyboard_check(ord("K")) && keyboard_check(ord("I")) && keyboard_check(ord("L")) && state != "On Fire"){
	state = "On Fire"
}