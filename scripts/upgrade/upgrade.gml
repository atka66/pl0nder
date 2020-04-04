if (argument1 < ds_grid_width(argument0) - 1) {
	var upgradeCost = argument0[# argument1 + 1, 1];
	if (global.player_credit >= upgradeCost) {
		global.player_credit -= upgradeCost;
		argument1 += 1;
	}
}
return argument1;