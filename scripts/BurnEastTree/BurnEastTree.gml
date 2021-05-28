function BurnEastTree() {
	with(argument[0]){
		var nearbyTreeID = instance_position(argument[0].x+34, argument[0].y, obj_TreePlot);
		if (nearbyTreeID != noone){
			nearbyTreeID.state = "On Fire";
		}
	}


}
