var selected = upgradeSelection == argument4;
draw_sprite(spr_menu_upg_slot, selected ? 1 : 0, argument0 + 128, argument1);
drawText(argument0, argument1 - 22, argument5, 1, c_white, 1.0);
drawText(argument0 + 8, argument1 - 8, argument2[# argument3, 0], 1, c_white, 1.0);
drawText(argument0 + 8, argument1 + 4, argument6 + ": " + string(argument2[# argument3, 2]), 1, c_white, 1.0);
if (argument3 + 1 < ds_grid_width(argument2)) {
	drawText(argument0 + 144, argument1 - 8, argument2[# argument3 + 1, 0], 1, c_lime, 1.0);
	drawText(argument0 + 144, argument1 + 4, argument6 + ": " + string(argument2[# argument3 + 1, 2]), 1, c_lime, 1.0);
	var upgradeCost = argument2[# argument3 + 1, 1];
	var upgradeColor = c_white;
	if (selected) {
		if (global.player_credit >= upgradeCost) {
			upgradeColor = c_lime;
			drawText(argument0 - 100, argument1 - 4, "E - BUY", 2, c_white, 1.0);
		} else {
			upgradeColor = c_red;
		}
	}
	drawText(argument0 + 276, argument1 - 12, "UPGRADE:", 2, upgradeColor, 1.0);
	drawText(argument0 + 276, argument1 + 4, string(upgradeCost) + "C", 2, upgradeColor, 1.0);
} else {
	drawText(argument0 + 168, argument1 - 12, "FULLY", 2, c_white, 1.0);
	drawText(argument0 + 152, argument1 + 4, "UPGRADED", 2, c_white, 1.0);
}