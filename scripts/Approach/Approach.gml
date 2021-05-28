/// Approach(a, b, amount)
function Approach() {
	// Moves "a" towards "b" by "amount" and returns the result
	// Nice bcause it will not overshoot "b", and works in both directions
	// Examples:
	//      speed = Approach(speed, max_speed, acceleration);
	//      hp = Approach(hp, 0, damage_amount);
	//      hp = Approach(hp, max_hp, heal_amount);
	//      x = Approach(x, target_x, move_speed);
	//      y = Approach(y, target_y, move_speed);

	if (argument[0] < argument[1])
	{
	    argument[0] += argument[2];
	    if (argument[0] > argument[1])
	        return argument[1];
	}
	else
	{
	    argument[0] -= argument[2];
	    if (argument[0] < argument[1])
	        return argument[1];
	}
	return argument[0];


}
