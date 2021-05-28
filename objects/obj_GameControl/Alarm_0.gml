/// @desc Burn a tree
var chance = random(99);
//if (instance_number(obj_TreePlot)> 29){
	if (chance > 90){ 
		var reTimes = 2;
	} else if (chance > 97){
		var reTimes = 3;
	} else {
		var reTimes = 1;
	}
//} else {
//	if (chance > 70){ 
//		var reTimes = 2;
//	} else if (chance > 85){
//		var reTimes = 3;
//	} else {
//		var reTimes = 1;
//	}
//}
repeat(reTimes){
	var treeBurnt = false;
	var burnTrys = 10;
	while(!treeBurnt){
		var randomNum = irandom(43);
		var alreadyDead = ds_list_find_index(burntTreePlots,treePlots[|randomNum]);
		if (alreadyDead != -1){
			treeBurnt = false;
		} else if (treePlots[|randomNum].state == "On Fire"){
			treeBurnt = false;
			burnTrys -= 1;
		} else {
			with(treePlots[|randomNum]){
				state = "On Fire";
			}
			treeBurnt = true;
		}
		if (burnTrys <= 0){
			treeBurnt = true;
		}
	}
}
var decrese = irandom_range(2.6, 2.8);
//if (instance_number(obj_TreePlot)> 29){
	if (alarmTime > 1.5*room_speed){
		alarmTime -= decrese;
	}
//} else {
//	if (alarmTime > 2*room_speed){
//		alarmTime -= decrese;
//	}
//}
alarm[0] = alarmTime;