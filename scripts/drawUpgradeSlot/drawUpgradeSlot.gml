draw_sprite(spr_menu_upg_slot, 0, 224, argument0);
drawText(104, argument0 - 8, argument1[# argument2, 0], 1, c_white, 1.0);
drawText(104, argument0 + 4, argument3 + ": " + string(argument1[# argument2, 2]), 1, c_white, 1.0);
if (argument2 < ds_grid_height(argument1) - 1) {
	drawText(240, argument0 - 8, argument1[# argument2 + 1, 0], 1, c_white, 1.0);
	drawText(240, argument0 + 4, argument3 + ": " + string(argument1[# argument2 + 1, 2]), 1, c_lime, 1.0);
} else {
	drawText(264, argument0 - 12, "FULLY", 2, c_white, 1.0);
	drawText(248, argument0 + 4, "UPGRADED", 2, c_white, 1.0);
}
var upgradeCost = argument1[# argument2 + 1, 1];
var upgradeColor = c_white;
if (upgradeSelection == argument4) {
	if (global.player_credit >= upgradeCost) {
		upgradeColor = c_lime;
		drawText(8, argument0 - 4, "E - BUY", 2, c_white, 1.0);
	} else {
		upgradeColor = c_red;
	}
}
drawText(356, argument0 - 12, "UPGRADE:", 2, upgradeColor, 1.0);
drawText(356, argument0 + 4, string(upgradeCost) + "C", 2, upgradeColor, 1.0);