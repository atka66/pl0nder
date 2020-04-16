/// @description Insert description here
// You can write your code in this editor

// dock name
drawText(32, 16, "WELCOME TO", 2, c_white, 1.0);
drawText(48, 32, global.currentDockName, 4, c_white, 1.0);
// credit
drawText(384, 16, "CREDITS:", 2, c_white, 1.0);
drawText(384, 32, string(global.player_credit) + "C", 4, c_white, 1.0);
// tabs
var tabY = 88;
if (selectedTab == 0) {
	draw_sprite(spr_menu_tab, 0, 122, tabY);
}
drawText(128, tabY, "STATUS", 2, c_white, 1.0);
if (selectedTab == 1) {
	draw_sprite(spr_menu_tab, 0, 250, tabY);
}
drawText(256, tabY, "CARGO", 2, c_white, 1.0);
if (selectedTab == 2) {
	draw_sprite(spr_menu_tab, 0, 378, tabY);
}
drawText(384, tabY, "UPGRADE", 2, c_white, 1.0);
if (selectedTab == 3) {
	draw_sprite(spr_menu_tab, 0, 506, tabY);
}
drawText(512, tabY, "QUESTS", 2, c_white, 1.0);

// status
if (selectedTab == 0) {
	draw_sprite_ext(spr_menu_box_slot, 0, 256, 192, 6.0, 6.0, 0, c_white, 1.0);
	draw_sprite_ext(spr_ships, global.player_skin, 256, 192, 3.0, 3.0, statusShipRotation, c_white, 1.0);
	draw_sprite_ext(spr_ships_color, global.player_skin, 256, 192, 3.0, 3.0, statusShipRotation, global.ship_colors[global.player_skinColor], 1.0);
	drawText(192, 266, "Q - CHANGE COLOR", 1, c_white, 1.0);
	
	drawText(192, 288, "HULL", 2, c_white, 1.0);
	draw_sprite(spr_menu_bar, 0, 192, 300);
	var maxHp = global.upg_shipHp[# global.player_equipped_shipHp, 2]
	var hpRate = global.player_hp / maxHp;
	draw_sprite_part(spr_menu_bar, 1, 0, 0, hpRate * sprite_get_width(spr_menu_bar), sprite_get_height(spr_menu_bar), 192, 300);
	drawText(192, 310, string(round(global.player_hp)) + "/" + string(maxHp), 1, c_white, 1.0);
	if (global.player_hp < maxHp) {
		var repairCost = round(global.upg_shipHp[# global.player_equipped_shipHp, 2] - global.player_hp);
		drawText(256, 294, "E - REPAIR (" + string(repairCost) + "C)", 1, c_white, 1.0);
	}
	drawText(192, 324, "FUEL", 2, c_white, 1.0);
	draw_sprite(spr_menu_bar, 0, 192, 336);
	var maxFuel = global.upg_shipFuel[# global.player_equipped_shipFuel, 2];
	var fuelRate = global.player_fuel / maxFuel;
	draw_sprite_part(spr_menu_bar, 2, 0, 0, fuelRate * sprite_get_width(spr_menu_bar), sprite_get_height(spr_menu_bar), 192, 336);
	drawText(192, 346, string(round(global.player_fuel)) + "/" + string(maxFuel), 1, c_white, 1.0);
	if (global.player_fuel < maxFuel) {
		var refuelCost = round((global.upg_shipFuel[# global.player_equipped_shipFuel, 2] - global.player_fuel) / 10);
		drawText(256, 330, "F - REFUEL (" + string(refuelCost) + "C)", 1, c_white, 1.0);
	}
	
	drawText(356, 128, "GENERAL", 2, c_white, 1.0);
	drawText(388, 144, "HULL:", 1, c_white, 0.8);
	drawText(404, 152, global.upg_shipHp[# global.player_equipped_shipHp, 0], 1, c_white, 1.0);
	drawText(388, 164, "TANK:", 1, c_white, 0.8);
	drawText(404, 172, global.upg_shipFuel[# global.player_equipped_shipFuel, 0], 1, c_white, 1.0);
	drawText(388, 184, "CARGO:", 1, c_white, 0.8);
	drawText(404, 192, global.upg_shipCargo[# global.player_equipped_shipCargo, 0], 1, c_white, 1.0);
	
	drawText(356, 208, "ARMAMENT", 2, c_white, 1.0);
	drawText(388, 224, "TURRET TYPE:", 1, c_white, 0.8);
	drawText(404, 232, global.upg_laserDmg[# global.player_equipped_laserDmg, 0], 1, c_white, 1.0);
	drawText(388, 244, "FIRING RATE:", 1, c_white, 0.8);
	drawText(404, 252, global.upg_laserReload[# global.player_equipped_laserReload, 0], 1, c_white, 1.0);
	drawText(388, 264, "NUMBER OF TURRETS:", 1, c_white, 0.8);
	drawText(404, 272, global.upg_laserCount[# global.player_equipped_laserCount, 0], 1, c_white, 1.0);
}

// cargo
if (selectedTab == 1) {
	drawText(192, 128, "CONTENT (" + string(ds_list_size(global.player_cargo)) + "/" + string(global.upg_shipCargo[# global.player_equipped_shipCargo, 2]) + ")", 2, c_white, 1.0);
	var empty = ds_list_empty(global.player_cargo);
	var cargoSize = global.upg_shipCargo[# global.player_equipped_shipCargo, 2];
	for (var i = 0; i < cargoSize; i++) {
		var xPos = 192 + ((i mod 10) * 28);
		var yPos = 160 + ((i div 10) * 28);
		draw_sprite(spr_menu_box_slot, 0, xPos, yPos);
		if (i < ds_list_size(global.player_cargo)) {
			draw_sprite(spr_minerals, global.player_cargo[|i], xPos, yPos);
		}
	}
	drawText(192, 180 + (((cargoSize - 1) div 10) * 28), "E - SELL ALL", 2, empty ? c_white : c_lime, empty ? 0.5 : 1.0);
}

// upgrade
if (selectedTab == 2) {
	drawUpgradeSlot(192, 136, global.upg_shipHp, global.player_equipped_shipHp, 0, "HULL STRENGTH", "HP");
	drawUpgradeSlot(192, 180, global.upg_shipFuel, global.player_equipped_shipFuel, 1, "FUEL CAPACITY", "UNIT");
	drawUpgradeSlot(192, 224, global.upg_shipCargo, global.player_equipped_shipCargo, 2, "CARGO CAPACITY", "SPACE");
	drawUpgradeSlot(192, 268, global.upg_laserDmg, global.player_equipped_laserDmg, 3, "LASER DAMAGE", "DAMAGE");
	drawUpgradeSlot(192, 312, global.upg_laserReload, global.player_equipped_laserReload, 4, "LASER FIRING RATE", "SHOT/SEC");
	drawUpgradeSlot(192, 356, global.upg_laserCount, global.player_equipped_laserCount, 5, "LASER TURRETS", "TURRETS");
}

// quests
if (selectedTab == 3) {
	drawText(64, 192, "QUESTS ARE YET TO BE IMPLEMENTED!", 3, c_white, 1.0);
}