/// @desc 
randomize();
global.gameover = false;
global.Score = 0;
burntTreePlots = ds_list_create();
losingTime = 0;
//Setting up positions
_x = ds_list_create();
_y = ds_list_create();

for(var i = 0; i < 10; i++){
	ds_list_add(_x, 39+(i*34));
}
for(var i = 0; i < 5; i++){
	ds_list_add(_y, 50+(i*34));
}

//placing Tree plots
treePlots = ds_list_create();
for(var i = 0; i < 5; i++){
	y_ = i;
	for(var i2 = 0; i2 < 10; i2++){
		x_ = i2;
		if !((x_ == 5 && (y_ == 0 || y_ == 1 || y_ == 2)) || (x_ == 4 && (y_ == 2 || y_ == 3 || y_ == 4))){
			var tree = instance_create_layer(_x[|x_], _y[|y_], "TreePlots", obj_TreePlot);
			tree.image_index = irandom(7);
			tree.x_ = x_;
			tree.y_ = y_;
			ds_list_add(treePlots, tree); 
		}
	}
}
repeat(4){
	var randomNum = irandom(43);
	with(treePlots[|randomNum]){
		state = "On Fire";
	}
}
alarmTime = 3*room_speed;
alarm[0] = alarmTime;
alarm[2] = room_speed;

if (global.gameType == "Normal"){
	alarm[3] = room_speed*4*60; //4 minutes
	endTime = current_time + 1000*4*60;
}