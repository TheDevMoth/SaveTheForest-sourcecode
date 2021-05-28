function BurnSouthTree() {
	with(argument[0]){
		var nearbyTreeID = instance_position(argument[0].x, argument[0].y+34, obj_TreePlot);
		if (nearbyTreeID != noone){
			nearbyTreeID.state = "On Fire";
		}
	}


}
