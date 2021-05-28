/// @func NumberOfRandomNumbers(num_of_nums, max, *min, *list)
/// @param {integer} num_of_nums how many numbers to return
/// @param {real} max
/// @param {real} *min
/// @param {boolean} *list whether to return a list. true by default
function NumberOfRandomNumbers() {
	var numbers = argument[0];
	var maxi = argument[1];
	if (argument_count > 2){ 
		var mini = argument[2];
	} else {
		var mini = 0;
	}
	//if (argument_count > 3){
	//	var inAList = argument[3];
	//} else {
		var inAList = true;
	//}

	//In cas you a dumb cunt
	if (numbers >= (maxi - mini)+1){
		show_debug_message("Yo a dumb cunt")
		return "YA DUMB CUNT";
	}

	if (inAList){
		var scrList = ds_list_create();
		repeat(numbers){
			var redoLoop = true;
			while(redoLoop){
				var stepNumber = irandom_range(mini, maxi);
				var stepNumExists = ds_list_find_index(scrList, stepNumber);
				if (stepNumExists == -1){
					ds_list_add(scrList, stepNumber);
					redoLoop = false;
				}
			}
		}
		return scrList;
	} else {
	
	}


}
